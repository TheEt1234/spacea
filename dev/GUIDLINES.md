# Coding guidelines (Try to not break these)

- You can swear in comments, if contentDB permits swearing in the code (it is a really vague and seemingly poorly thought out rule, great..)
- Don't swear in function names, try not swearing in documentation (comments above functions)
- Attempt to do lua_ls annotations when relevant
- Use submodules if importing another mod - `If you don't know how to install submodules i say skill issue`
- Assume newest luanti versions 
- **Design API in a way where every function can be overriden if needed**
    - Localize other API calls rarely, unless it matters for performance somehow
- **Do not confuse lua_ls** unless it gets in the way of performance
    - Have each "s.whatever = {}" be a ---@class
    - NEVER localize in function definitions
    - Try to always do `function f() end` syntax instead of `f = function() end`, this doesn't confuse lua_ls but it makes it so there are 2 definitions i think
    - **Do not do whatever modlib does with getfenv/setfenv** - getfenv/setfenv should only be used for sandboxing, using it in any other way can trip up the lsp really badly
- **Any game logic should be written in lua** 
    - Don't write me code files with luau, or typescript - **THIS GAME SHOULD HAVE NO BUILD STEP FOR CODE that would need to get executed often**
        - Unless it's needed for a 
    - Or a weird preprocessor like what i3 is doing (UNLESS lua_ls allows/understands what you are doing somehow, and you configure it in .luarc.json, **and it doesn't meaningfully impact boot times**)
        - If you can make a weird preprocessor like that work out (idk if luals allows supporting += -= *= stuff like that): You may use it (create an api like `s.load_file_processed` `s.load_files_processed` and document what the pre-processor is doing)
    - **BUT** you are permitted to have a preprocessor for things like defining quests (see sbz markdown quests, they are horrible to do with lua)
- Run lua_ls and stylua (If you are on vscode, there are extensions for this)
- Try to not get warnings with lua_ls, use the `---@diagnostic` comments
- Do not use a large amount/non-trivial amount of AI generated code, [please see contentDB copyright guide before using an AI to assist with code](https://content.luanti.org/help/copyright)
- When sacrificing "code quality" for optimization, **FIRST VERIFY IF THAT OPTIMIZATION IS ACTUALLY NEEDED PLEASE, NO YOUR "INTUITION" IS PROBABLY WRONG**
- Any/all particle-emitting nodes must respect the particle spawner limiting system (specifying `_limiting_pos` and `_limiting_priority = s.particle_spawner_priorities.<whatever, usually lowest>`) and check if they are neighbors to air (Only if in ABM)
- Never hardcode an `node_name == 'air'` check, instead use `s.is_air(node_name)`

# Art guidelines (can be broken if needed)

- **1 node usually 16 pixels**, meaning if you had an entity who was a 2x2x2 cube, its texture would be 32x32, **You can break this guideline in particles**
- no ai generated art (cannot be broken)

# "Do this sometimes"

- Run optipng
- Try compressing sounds maybe?
- When noticing lag, run [jitprofiler](https://content.luanti.org/packages/jwmhjwmh/jitprofiler/), or a superior alternative, or use `jit.dump` somehow (not documented but the source is in `/usr/share/luajit-2.1/jit/dump.lua`, on my machine, this can help you)
    - When in a multiplayer server, use local map saving or obtain the map from the server owner, and run jitprofiler on that map

# Sound design

- do those uhh, leitmotifs, idk just pretend to be toby fox for this one i guess, **idk lol have fun** (Side note while i was looking at what leitmotifs were, uhh, [WHY IS THERE A WIKIPEDIA PAGE FOR W.D GASTER?](https://en.wikipedia.org/wiki/W._D._Gaster), oh there is also one for kris, ok why, what)
- **Use properly licensed sound fonts** UNLESS contentDB allows you to do whatever you want with them (aka you cant pretend to be toby fox *fully*), here are some i found:
    - [freepats.zenvoid.org/SoundSets/general-midi.html](https://freepats.zenvoid.org/SoundSets/general-midi.html) - GPL with a [\[\[SPECIAL EXCEPTION\]\]](https://freepats.zenvoid.org/licenses.html#GPL_exception) that makes it basically like CC0 i think xD`, who even licenses soundfonts as GPL wtf???`
    - Possibly - [the soundfont-fluid arch linux package](https://archlinux.org/packages/extra/any/soundfont-fluid/) - i don't know what this is but it might be alright to use who knows
- when making sound effects, **make them mono if they are positional, you HAVE to follow this rule**
- If there is one sound thats like, repeating over and over again (like factory noises), vary the pitch a little, or introduce different variations, unless its intentional for some reason
- no ai generated sounds



