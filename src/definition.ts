import { languages, Location, TextDocument, Position, Uri, Range, Definition, LocationLink } from "vscode";
import { getSymbolAtPosition } from "./symbols";
import { HTML_COMMENT_INCLUDE_FILE } from "./patterns";
import * as pathns from 'path';

function provideDefinition(doc: TextDocument, position: Position): LocationLink[] | Location {

	const item = getSymbolAtPosition(doc, position);

	// We ain't got nothing, return
	if(!item) {
		const line = doc.lineAt(position);
		const text = line.text;

		const matches: RegExpExecArray = HTML_COMMENT_INCLUDE_FILE.exec(text);

		const filePathStart = line.range.start.translate(0, matches[1].length);
		const filePathEnd = filePathStart.translate(0, matches[2].length);

		if (matches && position.isAfter(filePathStart) && position.isBefore(filePathEnd)) {
			const range = new Range(
				filePathStart,
				filePathEnd
			);

			const currentDirectory = pathns.dirname(doc.fileName);
			
			const path = Uri.file(pathns.resolve(currentDirectory, matches[2]));

			return [{
				originSelectionRange: range,
				targetRange: new Range(0, 0, 0, 0),
				targetUri: path
			} as LocationLink]
		}

		return;
	}

	const uri = Uri.file(item.sourceFilePath);
	return new Location(uri, item.symbol.range.start);
}

export default languages.registerDefinitionProvider({ scheme: "file", language: "asp" }, { provideDefinition });
