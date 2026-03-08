# ASP Classic Support

An edit to the original ASP Classic Support extension with added features for IIS / COM autocompletion + general fixes.

Original repository: https://github.com/zbecknell/asp-classic-support.  
Then forked from https://github.com/NafisAli/asp-classic-support.

This repository adds:
- virtual / file import support (merged from NafisAli)
- IIS classes such as: `Server`, `Session`, `Request`, `Response`
- Object completion, eg: `Server.`...
- COM mapping to objects, eg: `Server.CreateObject("ADODB.Connection")` is mapped to Connection class.
- Return type documentation and return type infer with autocompletion.
- General bugfixes and TextMate highlight changes.

TODO:
- Performance fixes (this code was written quickly, just to get it to a point where it works).
- Refactor.
- Buggy, testing for bugs.