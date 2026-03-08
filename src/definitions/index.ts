import { AspSymbol } from "../types";
import keywords from "./keywords.json";
import operators from "./operators.json";

import { CompletionItem, CompletionItemKind, DocumentSymbol, SymbolKind } from "vscode";

const syntaxSymbols = new Array<AspSymbol>();

for (const entry in keywords) {
  const itm = {
    isTopLevel: true,
    symbol: {
      name: entry,
      kind: SymbolKind.Key
    },
    documentation: {
      rawSummary: "",
      summary: operators[entry]?.documentation
    },
    isBuiltIn: true
  } as AspSymbol;
  syntaxSymbols.push(itm);
}

for (const entry in operators) {
  const itm = {
    isTopLevel: true,
    symbol: {
      name: entry,
      kind: SymbolKind.Operator
    },
    documentation: {
      rawSummary: "",
      summary: operators[entry]?.documentation
    },
    isBuiltIn: true
  } as AspSymbol;
  syntaxSymbols.push(itm);
}

export default syntaxSymbols;
