# Development tools

This shouldn't ship to anyone who downloads the game off of contentDB

Anyway, rules:
If something you want to use isn't in the lsp definitions, add it
In lsp_definitions/luanti_custom


That will be a mess, oh i am sure


**ALSO**, prefer `function x() end` definitions instead of `x = function() end` definitions and *NEVER* localize in it

as in like, do NOT do `local hello = s.hello; function hello.x() ... end`, ALWAYS do `function s.hello.x() ... end` instead, or it will trip up the lsp
you wouldn't want that would you
