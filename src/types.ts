import { DocumentSymbol, Range } from "vscode";

export interface AspSymbol {
	symbol?: DocumentSymbol;
  isTopLevel: boolean;
	sourceFile: string;

	/** The full path of the source file this symbol originates from. */
	sourceFilePath: string;

	/** The definition of the symbol, e.g. `Dim someVariable` or `Class MyClass` */
	definition?: string;

	/** When a variable, the type of the variable. */
	type?: AspSymbol;
	/** When a variable, the string containing the assignment to that variable. */
	assign?: string;

	parentName?: string;

	regionStartLine?: number;
	regionEndLine?: number;

	/** A list of parameters, if they exist. */
	parameters?: DocumentSymbol[];

	documentation?: AspDocumentation;

	isBuiltIn: boolean;
}

export interface AspDocumentation {
	rawSummary: string;
	summary?: string;
	parameters?: AspParameterDocumentation[];
	returnSummary?: string;
	returnType?: string;
}

export interface AspParameterDocumentation {
	name: string,
	summary: string;
}

export interface AspRegion {
	openingBracket: Range;
	codeBlock: Range;
	closingBracket: Range;
}

export interface VirtualPath {
	virtualPath: string;
	physicalPath: string;
}

export enum VariableType {
	Native,
	COM
}