/* eslint-disable complexity */
/* eslint-disable max-statements */
import * as path from "path";
import { CompletionItem, DocumentSymbol, languages, Position, Range, SnippetString, SymbolKind, TextDocument, TextLine, workspace } from "vscode";
import syntaxSymbols from "./definitions";
import comMappings from "./definitions/com_mappings.json";
import { builtInSymbols, output } from "./extension";
import { getImportedFiles, includes } from "./includes";
import * as PATTERNS from "./patterns";
import { getAspRegions, getRegionsInsideRange, positionIsInsideAspRegion, regionIsInsideAspRegion, replaceCharacter } from "./region";
import { AspDocumentation, AspSymbol } from "./types";

const showVariableSymbols: boolean = workspace.getConfiguration("asp").get<boolean>("showVariableSymbols");
const showParameterSymbols: boolean = workspace.getConfiguration("asp").get<boolean>("showParameterSymbols");

export const INCLUDE_SYMBOL = {
	name: "#include",
	label: "include"
} as CompletionItem

export const INCLUDE_TYPES = [
	{
		label: "file",
		insertText: new SnippetString("file=\"$0\"")
	} as CompletionItem,
	{
		label: "virtual",
		insertText: new SnippetString("virtual=\"$0\"")
	} as CompletionItem
] as CompletionItem[]

/**
 * Matches a Function
 *
 * 1. Comment
 * 2. Definition
 * 3. Function/Sub
 * 4. Signature def
 * 5. Name
 * 6. Params
 *
 * [Link](https://regex101.com/r/vQ4rYJ/1)
 */
const FUNCTION = RegExp(PATTERNS.FUNCTION.source, "i");

/**
 * Matches a Class
 *
 * 1. Comment
 * 2. Definition
 * 3. Name
 *
 * [Link](https://regex101.com/r/j2BtJ6/1)
 */
const CLASS = RegExp(PATTERNS.CLASS.source, "i");

/**
 * Matches a Property
 *
 * 1. Comment
 * 2. Definition
 * 3. Get/Let/Set
 * 4. Name
 * 5. Params
 */
const PROP = RegExp(PATTERNS.PROP.source, "i");

const docSymbols = new Map <string, Set<AspSymbol>>();
export const currentDocSymbols = (docFileName: string) => docSymbols.has(docFileName) ?
	docSymbols.get(docFileName) :
	new Set<AspSymbol>();

/** Gets all DocumentSymbols for the given document. */
function getSymbolsForDocument(doc: TextDocument, collection: Set<AspSymbol>): DocumentSymbol[] {

  /** The final list of symbols parsed from this document */
  const result: DocumentSymbol[] = [];

  const varList: string[] = [];

  const blocks: AspSymbol[] = [];

  const aspRegions = getAspRegions(doc);

  if (aspRegions.length === 0) {
    return [];
  }

	/** The file name and extension of the current doc */
	const fileName = path.basename(doc.fileName);

  for (let lineNum = 0; lineNum < doc.lineCount; lineNum++) {

    /** The current line of the document */
    const line = doc.lineAt(lineNum);

    if (line.isEmptyOrWhitespace) {
      continue;
    }

    let originalLineText = line.text;
		let cleanLineText = line.text;

    // Is the line inside a region or are any regions in the line?
    if (!regionIsInsideAspRegion(aspRegions, line.range.start)) {

      const interiorRegions = getRegionsInsideRange(aspRegions, line.range);

      if(interiorRegions.length > 0) {


        for (let index = 0; index < originalLineText.length; index++) {
          const characterPosition = new Position(line.lineNumber, index);

          let isInsideRegion = false;

          // is the character inside the region?
          for(const interiorRegion of interiorRegions) {
            if(interiorRegion.contains(characterPosition)) {
              // This character is inside a region
              isInsideRegion = true;

              break;
            }
          }

          // Blank out the non-ASP stuff in this line
          if(!isInsideRegion) {
            cleanLineText = replaceCharacter(originalLineText, " ", index);
          }
        }
      }
      else {
        continue;
      }
    }

    // Don't provide symbols for blank or commented lines
    if (line.text.charAt(line.firstNonWhitespaceCharacterIndex) === "'") {
      continue;
    }

    const lineTextWithoutComment = (/^([^'\n\r]*).*$/m).exec(cleanLineText);
		const isBuiltIn = fileName === '__objects.asp' || fileName === '__functions.asp';

    for (const lineText of lineTextWithoutComment[1].split(":")) {

      let name: string;
			let aspSymbol: AspSymbol = {
				isTopLevel: false,
				sourceFile: fileName,
				sourceFilePath: doc.fileName,
				documentation: getDocsForLine(doc, line),
				isBuiltIn: isBuiltIn,
			};

			//TODO: Performance
			if (aspSymbol?.documentation?.returnType) {
				let allSymbols = [...builtInSymbols, ...currentDocSymbols(doc.fileName)]
				aspSymbol.type = allSymbols.findLast(e => e?.symbol?.name?.toLowerCase() == aspSymbol.documentation.returnType.toLowerCase());
			} 

			aspSymbol.sourceFile = fileName;

      let matches: RegExpMatchArray | [] = [];
			let hasNoEnd: boolean = false;

      if ((matches = CLASS.exec(lineText)) !== null) {

        name = matches[3];
				aspSymbol.definition = matches[2];
        aspSymbol.symbol = new DocumentSymbol(name, "", SymbolKind.Class, line.range, line.range);
      }
			else if ((matches = PATTERNS.MEMBER.exec(lineText)) !== null) {
				name = matches[1];
				aspSymbol.definition = matches[0];
				aspSymbol.symbol = new DocumentSymbol(name, "", SymbolKind.Property, line.range, line.range);

				hasNoEnd = true;
			}
			else if ((matches = FUNCTION.exec(lineText)) !== null) {

        name = matches[4];
        let symKind = SymbolKind.Function;

        if (matches[3].toLowerCase() === "sub" && (/class_(initialize|terminate)/i).test(name)) {
          symKind = SymbolKind.Constructor;
        }

        // if params are shown extra, def line shouldn't contain it too
        if (showParameterSymbols) {
          name = matches[5];
        }

				aspSymbol.definition = matches[2];
        aspSymbol.symbol = new DocumentSymbol(name, null, symKind, line.range, line.range);

				// PARAMETERS
        if (showParameterSymbols) {
          if (matches[6]) {

						aspSymbol.parameters = [];

            matches[6].split(",").forEach(param => {

							const symbol = new DocumentSymbol(param.trim(), null, SymbolKind.Variable, line.range, line.range);
              aspSymbol.symbol.children.push(symbol);

							let parameterSymbol: AspSymbol = {
								symbol: symbol,
								parentName: aspSymbol.symbol.name,
								isTopLevel: false,
								sourceFile: fileName,
								sourceFilePath: doc.fileName,
								definition: `(parameter) ${symbol.name}`,
								isBuiltIn: isBuiltIn
							};

							aspSymbol.parameters.push(symbol);
							collection.add(parameterSymbol);

            });
          }
        }
      }
      else if ((matches = PROP.exec(lineText)) !== null) {

        name = matches[4];
				aspSymbol.definition = matches[2];
        aspSymbol.symbol = new DocumentSymbol(name, null, SymbolKind.Property, line.range, line.range);
      }
      else if (showVariableSymbols) {

        while ((matches = PATTERNS.VAR.exec(lineText)) !== null) {

					// Split multiple variables from the same line
          const variableNames = matches[2].split(",");

          for (const variableName of variableNames) {

            const cleanVariableName = variableName.replace(PATTERNS.ARRAYBRACKETS, "").trim();

						let variableSymbol: AspSymbol = {
							documentation: aspSymbol.documentation,
							isTopLevel: false,
							sourceFile: fileName,
							sourceFilePath: doc.fileName,
							isBuiltIn: isBuiltIn,
							assign: matches[4]
						};

						if (matches[3]) {
							let allSymbols = [...builtInSymbols, ...currentDocSymbols(doc.fileName)]
							variableSymbol.type = aspSymbol?.type ?? allSymbols.findLast(e => e?.symbol?.name?.toLowerCase() == matches[3].toLowerCase());
						}

						// If we don't have this variable in our list provided yet...
            if (varList.indexOf(cleanVariableName) === -1 || !(/\bSet\b/i).test(matches[0])) {

              // match multiple same Dim, but not an additional set to a dim
              varList.push(cleanVariableName);

              let symKind = SymbolKind.Variable;
							variableSymbol.definition = `Dim ${cleanVariableName}`;

              if ((/\bConst\b/i).test(matches[1])) {
                symKind = SymbolKind.Constant;
								variableSymbol.definition = lineText.trim().replace(/\bconst\b/i, "Const");
              }
              else if ((/\bSet\b/i).test(matches[0])) {
                symKind = SymbolKind.Struct;
								variableSymbol.definition = `Set ${cleanVariableName}`;
              }
              else if ((/\w+[\t ]*\([\t ]*\d*[\t ]*\)/i).test(variableName)) {
                symKind = SymbolKind.Array;
              }

              const r = new Range(line.lineNumber, 0, line.lineNumber, PATTERNS.VAR.lastIndex);

							variableSymbol.symbol = new DocumentSymbol(cleanVariableName, "", symKind, r, r);

							//Infer the type of this variable by what is being assigned into it
							if (!matches[3] && matches[4]) {
								variableSymbol.type = getSymbolFromAssignment(variableSymbol, [...builtInSymbols, ...collection]);
							} else {
								let symbols = [...builtInSymbols, ...collection];
								variableSymbol.type = symbols.findLast(e => e?.symbol?.name?.toLowerCase() == matches[3]?.toLowerCase());
							}

							// If we're not inside a block this is a top-level variable
              if (blocks.length === 0) {
                result.push(variableSymbol.symbol);

								variableSymbol.isTopLevel = true;
              }
              else {
								// We are INSIDE a block like a class or function
								const parent = blocks[blocks.length - 1].symbol;

								variableSymbol.isTopLevel = false;
								variableSymbol.parentName = parent.name;

                parent.children.push(variableSymbol.symbol);
              }
							collection.add(variableSymbol)
            }
          }
        }
      }

			// If we have a symbol, let's add it to our collection
      if (aspSymbol && aspSymbol.symbol) {

				// This is a top-level symbol not contained in a class, function, etc.
        if (blocks.length === 0) {
          result.push(aspSymbol.symbol);

					aspSymbol.isTopLevel = true;
        }
        else {
					// We are INSIDE a block like a class or function
          const parent = blocks[blocks.length - 1].symbol;

					parent.children.push(aspSymbol.symbol);

					aspSymbol.isTopLevel = false;
					aspSymbol.parentName = parent.name;
        }

				collection.add(aspSymbol)

				aspSymbol.regionStartLine = line.lineNumber;

				blocks.push(aspSymbol)
      }

			// We should record the start and ending line of the block... really
      if ((matches = PATTERNS.ENDLINE.exec(lineText)) !== null || hasNoEnd) {
        blocks.pop();
      }
    }
  } // next linenum

  return result;
}

/** Gets all contiguous comment text above a given line */
export function getDocsForLine(doc: TextDocument, line: TextLine): AspDocumentation {

	// If this line itself is a comment, return
	if(line.text[line.firstNonWhitespaceCharacterIndex] === '\'') {
		return;
	}

	let lineNumber = line.lineNumber - 1;

	const commentLines: TextLine[] = [];

	while(lineNumber != -1) {

		const currentLine = doc.lineAt(lineNumber);

		if(currentLine.text[currentLine.firstNonWhitespaceCharacterIndex] !== '\'') {
			break;
		}

		// If we just have a line like '************** don't count it
		if(!PATTERNS.DOC_SEPARATOR.test(currentLine.text)){
			commentLines.push(currentLine);
		}

		lineNumber -= 1;
	}

	// We have no comments, exit
	if(commentLines.length <= 0) {
		return;
	}

	let comment = "";

	for(const sortedLine of commentLines.sort((a, b) => a.lineNumber - b.lineNumber)) {
		// Replace any starting '''
		comment += `${sortedLine.text.replace(/^\s*'+/, '')}  \n`;
	}

	let matches: RegExpMatchArray | [] = [];

	// Initialize documentation with the raw comment text in case we have no "real" matches below (e.g. we have just a plain comment and not ''' summary)
	const documentation: AspDocumentation = { rawSummary: comment };

	PATTERNS.COMMENT_SUMMARY.lastIndex = 0;

	const summaryMatch = PATTERNS.COMMENT_SUMMARY.exec(comment);

	if(summaryMatch && summaryMatch[1]) {
		documentation.summary = summaryMatch[1];
	}

	while((matches = PATTERNS.PARAM_SUMMARIES.exec(comment)) !== null) {
		if(matches[0]) {

			if(!documentation.parameters) {
				documentation.parameters = [];
			}

			documentation.parameters.push({ name: matches[1], summary: matches[2] })
		}
	}

	const returnMatch = PATTERNS.RETURN_SUMMARY.exec(comment);

	if (returnMatch && (returnMatch[2] || returnMatch[1])) {
		documentation.returnSummary = returnMatch[2];
		documentation.returnType = returnMatch[1];
	}

	return documentation;
}

async function provideDocumentSymbols(doc: TextDocument): Promise<DocumentSymbol[]> {
	try {
		// Get built-in symbols only once
		if (builtInSymbols.size <= 0) {

			for(const includedFile of includes) {
				var includedDoc = await workspace.openTextDocument(includedFile[1].Uri);

				// This will place the symbols in builtInSymbols
				getSymbolsForDocument(includedDoc, builtInSymbols);
			}
		}

		// Todo clear out symbols from files which are not longer opened in editor.
		if (!docSymbols.has(doc.fileName)) {
			docSymbols.set(doc.fileName, new Set<AspSymbol>())
		}

		// Clear out the current doc symbols to reload them
		currentDocSymbols(doc.fileName).clear();
		// Get the doc symbols of includes
		await provideDocumentSymbolsForIncludes(doc, currentDocSymbols(doc.fileName));

		// Get the local doc symbols
		const localSymbols = getSymbolsForDocument(doc, currentDocSymbols(doc.fileName));

		// We return the local symbols as they are displayed in the document Outline
		return localSymbols;
	} catch (error) {
		output.appendLine(error);
		return null;
	}
}

async function provideDocumentSymbolsForIncludes(doc: TextDocument, currentDocSymbols: Set<AspSymbol>) {
	const localIncludes = getImportedFiles(doc);

	for(const includedFile of localIncludes) {
		var includedDoc = await workspace.openTextDocument(includedFile[1].Uri);

		if (documentSymbolsAlreadyLoaded(includedDoc, currentDocSymbols)) continue;

		getSymbolsForDocument(includedDoc, currentDocSymbols);

		// Recursive so nested includes are registered as well
		await provideDocumentSymbolsForIncludes(includedDoc, currentDocSymbols);
	}
}

// Just as a fail-safe to prevent an infinite loop in case includes are referencing to each other
function documentSymbolsAlreadyLoaded(doc: TextDocument, currentDocSymbols: Set<AspSymbol>) {
	for(const aspSymbol of currentDocSymbols.values()) {
		if (aspSymbol.sourceFilePath === doc.uri.fsPath) {
			return true;
		}
	}

	return false;
}

export function getSymbolAtPosition(doc: TextDocument, position: Position): AspSymbol {
	// We're not in ASP, exit
	if(!positionIsInsideAspRegion(doc, position).isInsideRegion) {
		return;
	}

  const wordRange = doc.getWordRangeAtPosition(position);

	// Get the parent name, like {parentName}.{hoverWord}
	const parentName = getParentOfMember(doc, position);

  const word: string = wordRange ? doc.getText(wordRange) : "";

	let allSymbols = [...builtInSymbols, ...currentDocSymbols(doc.fileName), ...syntaxSymbols];

	let parentType = null;

	//TODO: Performance
	if (parentName) {
		const parentSymbol = allSymbols.find(e => e?.symbol?.name?.toLowerCase() == parentName?.toLowerCase())

		parentType = parentSymbol?.type?.symbol?.name ?? parentSymbol?.symbol?.name;
	}
	
	//TODO: Hover does not know what it is hovering, a class, a variable, etc.
	//Therefore it will return the wrong symbol (usually the first symbol that matches).

	for(const item of allSymbols) {
		const symbol = item.symbol;

		if(symbol?.name?.toLowerCase() !== word?.toLowerCase()){
			continue;
		}

		// We have a parent but the candidate doesn't
		if(parentName && !item?.parentName) {
			continue;
		}

		// We have a parent name but the candidate doesn't match
		if(parentName && item?.parentName?.toLowerCase() != parentType?.toLowerCase()) {
			continue;
		}

		// We have a parent name but the candidate does not
		if(parentName && !item.parentName) {
			continue;
		}

		return item;
	}

	return;
}

export function getDocumentMarkdown(symbol: AspSymbol): string {

	if(!symbol.documentation) {
		return;
	}

	var text = `---\n${symbol.documentation.summary ?? symbol.documentation.rawSummary}`;

	for(const parameterDoc of symbol.documentation?.parameters ?? []) {
		text += `\n\n _@param_ \`${parameterDoc.name}\` — ${parameterDoc.summary}`;
	}

	if (symbol.documentation?.returnSummary) {
		text += `\n\n _@returns_ \`${symbol?.documentation?.returnType}\` — ${symbol.documentation?.returnSummary}`
	}

	return text;
}

/** Looks behind a word for the preceding word as a parent {parent}.{position} */
export function getParentOfMember(doc: TextDocument, position: Position): string {
  const wordRange = doc.getWordRangeAtPosition(position);

	if(!wordRange) {
		return;
	}

	// If we're at the start of the line, return nothing
	if(wordRange.start.character <= 1) {
		return;
	}

	const precedingCharacterIndex = wordRange.start.character - 1;
	const lineText = doc.lineAt(position.line).text;
	const precedingCharacter = lineText[precedingCharacterIndex];

	if(precedingCharacter !== '.') {
		return;
	}

	const precedingWordRange = doc.getWordRangeAtPosition(new Position(position.line, precedingCharacterIndex - 1));

	return doc.getText(precedingWordRange);
}

export function getSymbolFromAssignment(symbol: AspSymbol, allSymbols: AspSymbol[]): AspSymbol {
	if (!symbol.assign)
		return;

	const matches: RegExpExecArray = PATTERNS.VAR_ASSIGNMENT.exec(symbol.assign);

	if (!matches)
		return;

	let parent = matches[1];
	let func = matches[2];

	//Find the parent, is this parent a class, or a variable?
	//If it's a variable, change the parent to its type.
	let parentSymbol = allSymbols.findLast(e => e?.symbol?.name?.toLowerCase() == parent?.toLowerCase());

	if (parentSymbol?.type)
		parent = parentSymbol?.type?.symbol?.name;
	
	//Get the return type of the func, then find the type of the func in the symbols.
	let funcSymbol = allSymbols.findLast(e => e?.symbol?.name?.toLowerCase() == func?.toLowerCase() && (!parent || e?.parentName?.toLowerCase() == parent?.toLowerCase()));

	let returnType = funcSymbol?.documentation?.returnType;

	if (returnType) {
		if (returnType.toLowerCase() == "com")
			returnType = comMappings.find(e => e.progID.toLowerCase() == matches[3]?.toLowerCase())?.objectName

		return allSymbols.findLast(e => e?.symbol?.name?.toLowerCase() == returnType?.toLowerCase() && e?.symbol?.kind == SymbolKind.Class);
	}

	return funcSymbol?.type;
}

export default languages.registerDocumentSymbolProvider(
  { scheme: "file", language: "asp" },
  { provideDocumentSymbols }
);