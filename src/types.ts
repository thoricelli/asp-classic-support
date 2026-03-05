import { DocumentSymbol, Range } from "vscode";

export interface AspSymbol {
	symbol?: DocumentSymbol;
  isTopLevel: boolean;
	sourceFile: string;

	/** The full path of the source file this symbol originates from. */
	sourceFilePath: string;

	/** The definition of the symbol, e.g. `Dim someVariable` or `Class MyClass` */
	definition?: string;
	/** Declaration set. */
	set?: string;

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

export interface ComGetMembers {
	Name: string;
	MemberType: PSMemberType,
	Definition: string;
}

export enum PSMemberType {
	AliasProperty = 1,
	CodePropery = 2,
	Property = 4,
	NoteProperty = 8,
	ScriptProperty = 16,
	PropertySet = 32,
	Method = 64,
	CodeMethod = 128,
	ScriptMethod = 256,
	Methods = 448,
	ParameterizedProperty = 512,
	MemberSet = 1024,
	Event = 2048,
	Dynamic = 4096,
	InferredProperty = 8192,
	Properties = 8223,
	All = 16383
}