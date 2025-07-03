# Hello

So i tried to use luanti-lls-definitions but those were really incomplete, and i didn't feel like contributing back to them.
And i felt like it would be easier to start from scratch than to attempt to complete them.  

My source for all of this API information is [lua_api.md](https://github.com/luanti-org/luanti/blob/5.12.0/doc/lua_api.md), and much of the documentation was taken from it.

### Hey so

Its really difficult for me to make these, like i have to force myself i dont like it

Meh, i still want the end result, of those sweet lsp completions and like not having to mald over a mispelling, and also not having to open up lua_api.md every time.


Also (goes without saying), do not run this in luanti, only your lsp is supposed to interpret these files

### Guidelines
- Attempt to use the original name, or get as close to it as possible 
    - Bad:
        - `vector.Vector`
        - `core.Node`
        - `vector` - meaning the `vector.*` library
        - `string` for colorstrings
    - Good:
        - `vector` - meaning an actual vector
        - `vectorlib` - the `vector.*` library
        - `node` - for the `{node=, param2=, param1=}` structure
        - `node_opt` - for the `{node=?, param2=?, param1=?}` structure
        - `ColorString` for colorstrings (where it is `---@class ColorString: string`)
- Attempt to not have any `any` types
- Annotations can be opinionated (Marking things ---@deprecated to avoid usage) and have notes (Might turn off some people `before they realise that this is like their only mostly-complete option hehe`)
- Do `ObjectRef` instead of `PlayerRef` as much as possible, and when it makes sense
- The only difference between `EntityRef`, `ObjectRef` and `PlayerRef` is that they are *sure* that they can return different things, but still have the same methods, if that makes sense
- Sometimes omit types, like in `handle = core.sound_play(...)`, you don't need to know that the handle is a number (I think? i haven't checked), you just need to know that it's a sound handle, and it's more useful that way
- No discarding of `success` booleans
    - Silent failures are the worst


Oh and also, yeah i can condense these into one file
