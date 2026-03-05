import { languages, CompletionItem, CompletionItemKind, TextDocument, Position, SymbolKind, DocumentSymbol, Uri, commands, MarkdownString, CompletionList } from "vscode";
import { builtInSymbols, output } from "./extension"
import * as PATTERNS from "./patterns";
import { currentDocSymbols, getDocsForLine } from "./symbols";
import { getRegionsInsideRange, positionIsInsideAspRegion, replaceCharacter } from "./region";
import { should } from "chai";
import completions from "./definitions";
import { AspSymbol } from "./types";


function getObjectMembers(doc: TextDocument, objectName: string): AspSymbol[] {
  const allSymbols = [...currentDocSymbols(doc.fileName), ...builtInSymbols];

  let objectSymbol = allSymbols.find(e => e?.symbol?.name?.toLowerCase() == objectName.toLowerCase());

  if (objectSymbol.set) {
    objectSymbol = allSymbols.find(e => e?.symbol?.name?.toLowerCase() == objectSymbol?.set.toLowerCase())
  }

  //TODO: Replace with children.
  return allSymbols.filter(e => e?.parentName?.toLowerCase() == objectSymbol?.symbol?.name?.toLowerCase() && e.sourceFilePath == objectSymbol.sourceFilePath);
}

function getDocumentationForSymbol(doc: TextDocument, symbol: DocumentSymbol, parentName: string): string {
  for(const aspSymbol of [...currentDocSymbols(doc.fileName), ...builtInSymbols]) {
    if(aspSymbol.symbol.name !== symbol.name || aspSymbol.parentName?.toLowerCase() !== parentName.toLowerCase()) {
      continue;
    }

    return aspSymbol.documentation?.summary;
  }
}

function getCompletionFromSymbol(aspSymbol: AspSymbol): CompletionItem {
  const symbol = aspSymbol.symbol;
  let kind: CompletionItemKind = CompletionItemKind.Variable;

  if(symbol.kind === SymbolKind.Variable) kind = CompletionItemKind.Variable;
  if(symbol.kind === SymbolKind.Property) kind = CompletionItemKind.Property;
  if(symbol.kind === SymbolKind.Function) kind = CompletionItemKind.Function;
  if(symbol.kind === SymbolKind.Class) kind = CompletionItemKind.Class;

  let completionSymbol = new CompletionItem(symbol.name, kind);
  completionSymbol.detail = aspSymbol.definition;

  return completionSymbol;
}

function provideCompletionItems(doc: TextDocument, position: Position): CompletionList {

  const regionTest = positionIsInsideAspRegion(doc, position);

  // We're not in ASP, exit
  if(!regionTest.isInsideRegion) {
    return new CompletionList([], false);
  }

  const line = doc.lineAt(position);
  let lineText = line.text;

  // Remove completion offerings from commented lines
  if (line.text.charAt(line.firstNonWhitespaceCharacterIndex) === "'") {
    return new CompletionList([], false);
  }

  const interiorRegions = getRegionsInsideRange(regionTest.regions, line.range);

  if(interiorRegions.length > 0) {

    for (let index = 0; index < lineText.length; index++) {
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
        lineText = replaceCharacter(lineText, " ", index);
      }
    }
  }

  // TODO: sanitize non-ASP code
  const codeAtPosition = lineText.substring(0, position.character);

  // No completion during writing a definition, still buggy
  if (PATTERNS.VAR_COMPLS.test(codeAtPosition)) {
    return new CompletionList([], false);
  }

  // No completion within open string
  let quoteCount = 0;

  for (const char of codeAtPosition) {
    if (char === '"') quoteCount++;
  }

  // No completion inside a quote block
  if (quoteCount % 2 === 1) {
    return new CompletionList([], false);
  }

  const results: CompletionItem[] = [];

  /**
   * Matches when the last character typed is a dot
   *
   * 1. The word preceding the dot.
  */
  const dotTypedMatch = /.*\b(\w+)\.\w*$/.exec(codeAtPosition);

  // DOT typed, only show members!
  if (dotTypedMatch && dotTypedMatch.length > 0) {

    const objectName = dotTypedMatch[1];

    output.appendLine(`Dot typed for object: ${objectName}`);

    const classAspSymbols: AspSymbol[] = getObjectMembers(doc, objectName);

    if (classAspSymbols.length <= 0)
      return new CompletionList([], false);

    return new CompletionList(classAspSymbols.map(e => getCompletionFromSymbol(e), false));
  }
  else {

    // TODO: get context (what class or function are we in?)
    const scope = getScope();

		// TODO: don't factor out this and above as it's copy/paste
		// No DOT, use all available symbols
    for(const symbol of [...currentDocSymbols(doc.fileName), ...builtInSymbols]) {

			const completion = getCompletionFromSymbol(symbol);

      // if the symbol is not top level or does not live in this context, skip it
      if(!symbol.isTopLevel && symbol.parentName.toLowerCase() !== scope?.toLowerCase()) {
        continue;
      }

      if(symbol.documentation && symbol.documentation.summary) {
        completion.documentation = new MarkdownString(symbol.documentation.summary);
      }

      // Do we already have this completion in our results? Skip.
			if(results.some(i => i.label === completion.label && i.kind == completion.kind )) continue;

      results.push(completion);
    }
  }

  results.push(...completions)

  return new CompletionList(results, true);

  function getScope(): string {

    let shouldSearchFunctionScope = true;

    for (let index = position.line - 1; index >= 0; index--) {
      const currentLine = doc.lineAt(index);

      if(currentLine.isEmptyOrWhitespace) {
        continue;
      }

      if(currentLine.text[currentLine.firstNonWhitespaceCharacterIndex] === "'") {
        continue;
      }

      // We're outside of a class, hence in the global scope
      if(currentLine.text.toLowerCase().indexOf("end class") > -1) {
        return null;
      }

      if(currentLine.text.toLowerCase().indexOf("end function") > -1) {
        shouldSearchFunctionScope = false;
      }

      if(shouldSearchFunctionScope) {
        var functionMatch = PATTERNS.FUNCTION.exec(currentLine.text);

        if(functionMatch && functionMatch[5]) {
          const name = functionMatch[5];

          output.appendLine(`Scope found: ${name}`);

          return name;
        }
      }

      var classMatch = PATTERNS.CLASS.exec(currentLine.text);

      if(classMatch && classMatch[3]) {
        const name = classMatch[3];

        output.appendLine(`Scope found: ${name}`);

        return name;
      }

    }

    // Didn't find anything -- global scope
    return null;
  }
}

export default languages.registerCompletionItemProvider(
  { scheme: "file", language: "asp" },
  { provideCompletionItems }, "."
);
