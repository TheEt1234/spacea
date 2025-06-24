# LogLevel


---

# LuaLS


---

# Proto


---

# Set

## add


```lua
(method) Set:add(element: any)
```

## add_all


```lua
(method) Set:add_all(elements: any[])
```

## contains


```lua
(method) Set:contains(element: any)
  -> boolean|nil
```

## new


```lua
function Set.new(t: any[], set_mt?: boolean)
  -> Set|table<any, boolean>
```

## remove


```lua
(method) Set:remove(element: any)
```

## remove_all


```lua
(method) Set:remove_all(elements: any[])
```


---

# Spacea

## Set


```lua
Set
```

## f


```lua
table
```

## foreach


```lua
function s.foreach(t: table<integer, any>, f: fun(v: any, i: integer))
```

 equivalent to an *ipairs* loop

@*param* `t` — array

## foreachp


```lua
function s.foreachp(t: table<any, any>, f: fun(v: any, k: any))
```

 equivalent to a *pairs* loop
 Ordering is randomized

@*param* `t` — any table

## load_file


```lua
function s.load_file(path: string)
```

 Loads the path of <mod dir>/<path>.lua

@*param* `path` — Without .lua file extension

## load_files


```lua
function s.load_files(paths: string[])
```

## player


```lua
table
```

## strict


```lua
table
```

## version


```lua
table
```

 An attempt to follow https://semver.org/
 I mean like, dont be super sweaty about it, but the numbers should mean something


---

# Trace


---

# _G


```lua
_G
```


---

# _G


---

# _VERSION


```lua
string
```


---

# any


---

# arg


```lua
string[]
```


---

# assert


```lua
function assert(v?: <T>, message?: any, ...any)
  -> <T>
  2. ...any
```


---

# bit


```lua
bitlib
```


---

# bit.arshift


```lua
function bit.arshift(x: integer, n: integer)
  -> y: integer
```


---

# bit.band


```lua
function bit.band(x: integer, ...integer)
  -> y: integer
```


---

# bit.bnot


```lua
function bit.bnot(x: integer)
  -> y: integer
```


---

# bit.bor


```lua
function bit.bor(x: integer, ...integer)
  -> y: integer
```


---

# bit.bswap


```lua
function bit.bswap(x: integer)
  -> y: integer
```


---

# bit.bxor


```lua
function bit.bxor(x: integer, ...integer)
  -> y: integer
```


---

# bit.lshift


```lua
function bit.lshift(x: integer, n: integer)
  -> y: integer
```


---

# bit.rol


```lua
function bit.rol(x: integer, n: integer)
  -> y: integer
```


---

# bit.ror


```lua
function bit.ror(x: integer, n: integer)
  -> y: integer
```


---

# bit.rshift


```lua
function bit.rshift(x: integer, n: integer)
  -> y: integer
```


---

# bit.tobit


```lua
function bit.tobit(x: integer)
  -> y: integer
```


---

# bit.tohex


```lua
function bit.tohex(x: integer, n?: integer)
  -> y: string
```


---

# bitlib

## arshift


```lua
function bit.arshift(x: integer, n: integer)
  -> y: integer
```

## band


```lua
function bit.band(x: integer, ...integer)
  -> y: integer
```

## bnot


```lua
function bit.bnot(x: integer)
  -> y: integer
```

## bor


```lua
function bit.bor(x: integer, ...integer)
  -> y: integer
```

## bswap


```lua
function bit.bswap(x: integer)
  -> y: integer
```

## bxor


```lua
function bit.bxor(x: integer, ...integer)
  -> y: integer
```

## lshift


```lua
function bit.lshift(x: integer, n: integer)
  -> y: integer
```

## rol


```lua
function bit.rol(x: integer, n: integer)
  -> y: integer
```

## ror


```lua
function bit.ror(x: integer, n: integer)
  -> y: integer
```

## rshift


```lua
function bit.rshift(x: integer, n: integer)
  -> y: integer
```

## tobit


```lua
function bit.tobit(x: integer)
  -> y: integer
```

## tohex


```lua
function bit.tohex(x: integer, n?: integer)
  -> y: string
```


---

# boolean


---

# collectgarbage


```lua
function collectgarbage(opt?: "collect"|"count"|"isrunning"|"restart"|"setpause"...(+3), arg?: integer)
  -> any
```


---

# core

## after


```lua
function core.after(time: number, func: fun(...any), ...any)
  -> core.Job
```

## chat_send_all


```lua
function core.chat_send_all(text: string)
```

## chat_send_player


```lua
function core.chat_send_player(name: string, text: string)
```

 * `name`: Name of the player

## check_player_privs


```lua
function core.check_player_privs(player_or_name: string|core.Player, ...string)
  -> boolean
  2. { [string]: boolean }
```

@*return* — Result, missing privileges

## debug


```lua
function core.debug(...any)
```

## format_chat_message


```lua
function core.format_chat_message(name: string, message: string)
  -> string
```

 * Used by the server to format a chat message, based on the setting `chat_message_format`.
   Refer to the documentation of the setting for a list of valid placeholders.
 * Takes player name and message, and returns the formatted string to be sent to players.
 * Can be redefined by mods if required, for things like colored names or messages.
 * **Only** the first occurrence of each placeholder will be replaced.

## get_current_modname


```lua
function core.get_current_modname()
  -> string
```

returns the currently loading mod's name, when loading a mod.

## get_meta


```lua
function core.get_meta(pos: vector.Vector)
  -> core.MetaDataRef
```

## get_modpath


```lua
function core.get_modpath(modname: string)
  -> string?
```

## get_node


```lua
function core.get_node(pos: vector.Vector)
  -> { name: string, param1: integer, param2: integer }
```

 * Returns the node at the given position as table in the same format as `set_node`.
 * This function never returns `nil` and instead returns
   `{name="ignore", param1=0, param2=0}` for unloaded areas.

## get_translator


```lua
function core.get_translator(textdomain?: string)
  -> function
```

@*return* — (str : string, ... : string) : string

## is_yes


```lua
function core.is_yes(arg: any)
  -> boolean
```

 * returns true if passed 'y', 'yes', 'true' or a number that isn't zero.

## log


```lua
function core.log(level: "action"|"error"|"info"|"none"|"verbose"...(+1), str: string)
```

```lua
level:
    | "none"
    | "verbose"
    | "action"
    | "info"
    | "warning"
    | "error"
```

## luaentities


```lua
{ [integer]: core.LuaEntity }
```

## object_refs


```lua
{ [integer]: core.ObjectRef }
```

## privs_to_string


```lua
function core.privs_to_string(privs: { [string]: boolean })
  -> string
```

 * Returns the string representation of `privs`
 * `delim`: String to delimit privs. Defaults to `","`.

## register_globalstep


```lua
function core.register_globalstep(f: fun(dtime: number))
```

## register_on_joinplayer


```lua
function core.register_on_joinplayer(f: fun(player_ref: core.Player, last_login?: integer))
```

 Called when a player joins the game
 last_login: The timestamp of the previous login, or nil if player is new

## register_on_leaveplayer


```lua
function core.register_on_leaveplayer(f: fun(player_ref: core.Player, timed_out: boolean))
```

 Called when a player leaves the game
 Does not get executed for connected players on shutdown.
 timed_out: True for timeout, false for other reasons.

## register_on_mods_loaded


```lua
function core.register_on_mods_loaded(f: fun())
```

## register_on_player_receive_fields


```lua
function core.register_on_player_receive_fields(on_player_receive_fields: fun(player: core.Player, formname: string, fields: { [string]: string }):boolean?)
```

 * Called when the server received input from `player`.
   Specifically, this is called on any of the
   following events:
       * a button was pressed,
       * Enter was pressed while the focus was on a text field
       * a checkbox was toggled,
       * something was selected in a dropdown list,
       * a different tab was selected,
       * selection was changed in a textlist or table,
       * an entry was double-clicked in a textlist or table,
       * a scrollbar was moved, or
       * the form was actively closed by the player.
 * `formname` is the name passed to `core.show_formspec`.
   Special case: The empty string refers to the player inventory
   (the formspec set by the `set_inventory_formspec` player method).
 * Fields are sent for formspec elements which define a field. `fields`
   is a table containing each formspecs element value (as string), with
   the `name` parameter as index for each. The value depends on the
   formspec element type:
     * `animated_image`: Returns the index of the current frame.
     * `button` and variants: If pressed, contains the user-facing button
       text as value. If not pressed, is `nil`
     * `field`, `textarea` and variants: Text in the field
     * `dropdown`: Either the index or value, depending on the `index event`
       dropdown argument.
     * `tabheader`: Tab index, starting with `"1"` (only if tab changed)
     * `checkbox`: `"true"` if checked, `"false"` if unchecked
     * `textlist`: See `core.explode_textlist_event`
     * `table`: See `core.explode_table_event`
     * `scrollbar`: See `core.explode_scrollbar_event`
     * Special case: `["quit"]="true"` is sent when the user actively
       closed the form by mouse click, keypress or through a button_exit[]
       element.
     * Special case: `["key_enter"]="true"` is sent when the user pressed
       the Enter key and the focus was either nowhere (causing the formspec
       to be closed) or on a button. If the focus was on a text field,
       additionally, the index `key_enter_field` contains the name of the
       text field. See also: `field_close_on_enter`.
 * Newest functions are called first
 * If function returns `true`, remaining functions are not called

## register_privilege


```lua
function core.register_privilege(name: string, definition: string|core.PrivilegeDef|nil)
```

 * `definition` can be a description or a definition table (see [Privilege
   definition]).
 * If it is a description, the priv will be granted to singleplayer and admin
   by default.
 * To allow players with `basic_privs` to grant, see the `basic_privs`
   minetest.conf setting.

## register_tool


```lua
function core.register_tool(name: string, definition: core.ItemDef)
```

## registered_abms


```lua
core.ABMDef[]
```

## registered_aliases


```lua
{ [string]: string }
```

## registered_biomes


```lua
{ [string|integer]: core.BiomeDef }
```

## registered_chatcommands


```lua
{ [string]: core.ChatcommandDef }
```

## registered_craftitems


```lua
{ [string]: core.ItemDef }
```

## registered_decorations


```lua
{ [string|integer]: core.DecorationDef }
```

## registered_entities


```lua
{ [string]: core.EntityDef }
```

## registered_globalsteps


```lua
{ [any]: fun(dtime: number) }
```


## registered_items


```lua
{ [string]: core.ItemDef }
```


TODO verify whether all these are actually indexed by strings (or is there any difference?)

## registered_lbms


```lua
core.LBMDef[]
```

## registered_nodes


```lua
{ [string]: core.NodeDef }
```

## registered_on_mods_loaded


```lua
{ [any]: fun() }
```

## registered_ores


```lua
{ [string|integer]: core.OreDef }
```

## registered_privileges


```lua
{ [string]: core.PrivilegeDef }
```

## registered_schematics


```lua
{ [string|integer]: string|core.RawSchematicDef }
```

## registered_tools


```lua
{ [string]: core.ItemDef }
```

## remove_node


```lua
function core.remove_node(pos: vector.Vector)
```

 * Equivalent to `core.set_node(pos, {name="air"})`, but a bit faster.

## set_node


```lua
function core.set_node(pos: vector.Vector, node: { name: string, param1: integer, param2: integer })
```

 * Set node at position `pos`.
 * Any existing metadata is deleted.
 * `node`: table `{name=string, param1=number, param2=number}`
   If param1 or param2 is omitted, it's set to `0`.
 * e.g. `core.set_node({x=0, y=10, z=0}, {name="default:wood"})`

## set_timeofday


```lua
function core.set_timeofday(val: number)
```

## show_formspec


```lua
function core.show_formspec(playername: string, formname: string, formspec: string)
```

 * `playername`: name of player to show formspec
 * `formname`: name passed to `on_player_receive_fields` callbacks.
   It should follow the `"modname:<whatever>"` naming convention.
 * `formname` must not be empty, unless you want to reshow
   the inventory formspec without updating it for future opens.
 * `formspec`: formspec to display

## translate


```lua
function core.translate(textdomain: string, str: string, ...string)
  -> string
```


---

# core


```lua
core
```


```lua
core
```


---

# core.ABMDef


---

# core.BiomeDef


---

# core.ChatcommandDef


---

# core.DecorationDef


---

# core.EntityDef


---

# core.InvRef

## get_stack


```lua
fun(self: core.InvRef, listname: string, i: integer):core.ItemStack
```

## set_stack


```lua
fun(self: core.InvRef, listname: string, i: integer, stack: core.ItemStack)
```


---

# core.ItemDef

## after_use


```lua
any
```

TODO

## color


```lua
string?
```

## description


```lua
string?
```

## groups


```lua
{ [string]: number }?
```

## inventory_image


```lua
string?
```

## inventory_overlay


```lua
string?
```

## light_source


```lua
integer?
```

## liquids_pointable


```lua
boolean?
```

## node_dig_prediction


```lua
string?
```

## node_placement_prediction


```lua
string?
```

## on_drop


```lua
any
```

TODO

## on_pickup


```lua
any
```

TODO

## on_place


```lua
any
```

TODO

## on_secondary_use


```lua
any
```

TODO

## on_use


```lua
any
```

TODO

## palette


```lua
string?
```

## range


```lua
number?
```

## short_description


```lua
string?
```

## sound


```lua
(core.ItemSound)?
```

## stack_max


```lua
integer?
```

## tool_capabilities


```lua
any
```

TODO

## wield_image


```lua
string?
```

## wield_overlay


```lua
string?
```

## wield_scale


```lua
(vector.Vector)?
```


---

# core.ItemSound

## breaks


```lua
(core.SimpleSoundSpec)?
```

## eat


```lua
(core.SimpleSoundSpec)?
```

## punch_use


```lua
(core.SimpleSoundSpec)?
```

## punch_use_air


```lua
(core.SimpleSoundSpec)?
```


---

# core.ItemStack

## get_meta


```lua
fun(self: core.ItemStack):core.ItemStackMetaRef
```

## get_name


```lua
fun(self: core.ItemStack):string
```

## is_empty


```lua
fun(self: core.ItemStack):boolean
```


---

# core.ItemStackMetaRef

## get


```lua
fun(self: core.MetaDataRef, key: string):string?
```

## get_int


```lua
fun(self: core.MetaDataRef, key: string):integer
```

## get_string


```lua
fun(self: core.MetaDataRef, key: string):string
```

## set_int


```lua
fun(self: core.MetaDataRef, key: string, value: integer)
```

## set_string


```lua
fun(self: core.MetaDataRef, key: string, value: string)
```


---

# core.Job

## cancel


```lua
fun(self: any)
```


---

# core.LBMDef


---

# core.LuaEntity


---

# core.MetaDataRef

## get


```lua
fun(self: core.MetaDataRef, key: string):string?
```

## get_int


```lua
fun(self: core.MetaDataRef, key: string):integer
```

## get_string


```lua
fun(self: core.MetaDataRef, key: string):string
```

## set_int


```lua
fun(self: core.MetaDataRef, key: string, value: integer)
```

## set_string


```lua
fun(self: core.MetaDataRef, key: string, value: string)
```


---

# core.Node


---

# core.NodeDef


---

# core.NodeName


---

# core.NodeOpt


---

# core.ObjectHandle


---

# core.ObjectId


---

# core.ObjectRef


---

# core.OreDef


---

# core.Player

## get_inventory


```lua
fun(self: core.Player):core.InvRef
```

 Actually an ObjectRef method, but returns nil on anything other than a player,
 so let's put it here and avoid the nil

## get_player_name


```lua
fun(self: core.Player):string
```

## get_wield_index


```lua
fun(self: core.Player):integer
```


---

# core.PrivilegeDef

## description


```lua
string?
```

## give_to_admin


```lua
boolean?
```

## give_to_singleplayer


```lua
boolean?
```

## on_grant


```lua
fun(name: string, granter_name?: string)
```

## on_revoke


```lua
fun(name: string, revoker_name?: string)
```


---

# core.Privs


---

# core.RawSchematicDef


---

# core.SchematicDef


---

# core.SimpleSoundSpec


---

# core.after


```lua
function core.after(time: number, func: fun(...any), ...any)
  -> core.Job
```


---

# core.chat_send_all


```lua
function core.chat_send_all(text: string)
```


```lua
function core.chat_send_all(text: string)
```


---

# core.chat_send_player


```lua
function core.chat_send_player(name: string, text: string)
```


```lua
function core.chat_send_player(name: string, text: string)
```


---

# core.check_player_privs


```lua
function core.check_player_privs(player_or_name: string|core.Player, ...string)
  -> boolean
  2. { [string]: boolean }
```


```lua
function core.check_player_privs(player_or_name: string|core.Player, ...string)
  -> boolean
  2. { [string]: boolean }
```


---

# core.debug


```lua
function core.debug(...any)
```


---

# core.format_chat_message


```lua
function core.format_chat_message(name: string, message: string)
  -> string
```


```lua
function core.format_chat_message(name: string, message: string)
  -> string
```


---

# core.get_current_modname


```lua
function core.get_current_modname()
  -> string
```


---

# core.get_meta


```lua
function core.get_meta(pos: vector.Vector)
  -> core.MetaDataRef
```


---

# core.get_modpath


```lua
function core.get_modpath(modname: string)
  -> string?
```


```lua
function core.get_modpath(modname: string)
  -> string?
```


---

# core.get_node


```lua
function core.get_node(pos: vector.Vector)
  -> { name: string, param1: integer, param2: integer }
```


```lua
function core.get_node(pos: vector.Vector)
  -> { name: string, param1: integer, param2: integer }
```


---

# core.get_translator


```lua
function core.get_translator(textdomain?: string)
  -> function
```


```lua
function core.get_translator(textdomain?: string)
  -> function
```


---

# core.is_yes


```lua
function core.is_yes(arg: any)
  -> boolean
```


```lua
function core.is_yes(arg: any)
  -> boolean
```


---

# core.log


```lua
function core.log(level: "action"|"error"|"info"|"none"|"verbose"...(+1), str: string)
```


---

# core.privs_to_string


```lua
function core.privs_to_string(privs: { [string]: boolean })
  -> string
```


```lua
function core.privs_to_string(privs: { [string]: boolean })
  -> string
```


---

# core.register_globalstep


```lua
function core.register_globalstep(f: fun(dtime: number))
```


---

# core.register_on_joinplayer


```lua
function core.register_on_joinplayer(f: fun(player_ref: core.Player, last_login?: integer))
```


---

# core.register_on_leaveplayer


```lua
function core.register_on_leaveplayer(f: fun(player_ref: core.Player, timed_out: boolean))
```


---

# core.register_on_mods_loaded


```lua
function core.register_on_mods_loaded(f: fun())
```


---

# core.register_on_player_receive_fields


```lua
function core.register_on_player_receive_fields(on_player_receive_fields: fun(player: core.Player, formname: string, fields: { [string]: string }):boolean?)
```


```lua
function core.register_on_player_receive_fields(on_player_receive_fields: fun(player: core.Player, formname: string, fields: { [string]: string }):boolean?)
```


---

# core.register_privilege


```lua
function core.register_privilege(name: string, definition: string|core.PrivilegeDef|nil)
```


```lua
function core.register_privilege(name: string, definition: string|core.PrivilegeDef|nil)
```


---

# core.register_tool


```lua
function core.register_tool(name: string, definition: core.ItemDef)
```


```lua
function core.register_tool(name: string, definition: core.ItemDef)
```


---

# core.remove_node


```lua
function core.remove_node(pos: vector.Vector)
```


```lua
function core.remove_node(pos: vector.Vector)
```


---

# core.set_node


```lua
function core.set_node(pos: vector.Vector, node: { name: string, param1: integer, param2: integer })
```


```lua
function core.set_node(pos: vector.Vector, node: { name: string, param1: integer, param2: integer })
```


---

# core.set_timeofday


```lua
function core.set_timeofday(val: number)
```


---

# core.show_formspec


```lua
function core.show_formspec(playername: string, formname: string, formspec: string)
```


```lua
function core.show_formspec(playername: string, formname: string, formspec: string)
```


---

# core.translate


```lua
function core.translate(textdomain: string, str: string, ...string)
  -> string
```


```lua
function core.translate(textdomain: string, str: string, ...string)
  -> string
```


---

# coroutine


```lua
coroutinelib
```


---

# coroutine.close


```lua
function coroutine.close(co: thread)
  -> noerror: boolean
  2. errorobject: any
```


---

# coroutine.create


```lua
function coroutine.create(f: fun(...any):...unknown)
  -> thread
```


---

# coroutine.isyieldable


```lua
function coroutine.isyieldable()
  -> boolean
```


---

# coroutine.resume


```lua
function coroutine.resume(co: thread, val1?: any, ...any)
  -> success: boolean
  2. ...any
```


---

# coroutine.running


```lua
function coroutine.running()
  -> running: thread
  2. ismain: boolean
```


---

# coroutine.status


```lua
function coroutine.status(co: thread)
  -> "dead"|"normal"|"running"|"suspended"
```


---

# coroutine.wrap


```lua
function coroutine.wrap(f: fun(...any):...unknown)
  -> fun(...any):...unknown
```


---

# coroutine.yield


```lua
(async) function coroutine.yield(...any)
  -> ...any
```


---

# coroutinelib

## close


```lua
function coroutine.close(co: thread)
  -> noerror: boolean
  2. errorobject: any
```


Closes coroutine `co` , closing all its pending to-be-closed variables and putting the coroutine in a dead state.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-coroutine.close"])

## create


```lua
function coroutine.create(f: fun(...any):...unknown)
  -> thread
```


Creates a new coroutine, with body `f`. `f` must be a function. Returns this new coroutine, an object with type `"thread"`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-coroutine.create"])

## isyieldable


```lua
function coroutine.isyieldable()
  -> boolean
```


Returns true when the running coroutine can yield.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-coroutine.isyieldable"])

## resume


```lua
function coroutine.resume(co: thread, val1?: any, ...any)
  -> success: boolean
  2. ...any
```


Starts or continues the execution of coroutine `co`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-coroutine.resume"])

## running


```lua
function coroutine.running()
  -> running: thread
  2. ismain: boolean
```


Returns the running coroutine plus a boolean, true when the running coroutine is the main one.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-coroutine.running"])

## status


```lua
function coroutine.status(co: thread)
  -> "dead"|"normal"|"running"|"suspended"
```


Returns the status of coroutine `co`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-coroutine.status"])


```lua
return #1:
    | "running" -- Is running.
    | "suspended" -- Is suspended or not started.
    | "normal" -- Is active but not running.
    | "dead" -- Has finished or stopped with an error.
```

## wrap


```lua
function coroutine.wrap(f: fun(...any):...unknown)
  -> fun(...any):...unknown
```


Creates a new coroutine, with body `f`; `f` must be a function. Returns a function that resumes the coroutine each time it is called.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-coroutine.wrap"])

## yield


```lua
(async) function coroutine.yield(...any)
  -> ...any
```


Suspends the execution of the calling coroutine.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-coroutine.yield"])


---

# debug


```lua
debuglib
```


---

# debug.debug


```lua
function debug.debug()
```


---

# debug.getfenv


```lua
function debug.getfenv(o: any)
  -> table
```


---

# debug.gethook


```lua
function debug.gethook(co?: thread)
  -> hook: function
  2. mask: string
  3. count: integer
```


---

# debug.getinfo


```lua
function debug.getinfo(thread: thread, f: integer|fun(...any):...unknown, what?: string|"L"|"S"|"f"|"l"...(+3))
  -> debuginfo
```


---

# debug.getlocal


```lua
function debug.getlocal(thread: thread, f: integer|fun(...any):...unknown, index: integer)
  -> name: string
  2. value: any
```


---

# debug.getmetatable


```lua
function debug.getmetatable(object: any)
  -> metatable: table
```


---

# debug.getregistry


```lua
function debug.getregistry()
  -> table
```


---

# debug.getupvalue


```lua
function debug.getupvalue(f: fun(...any):...unknown, up: integer)
  -> name: string
  2. value: any
```


---

# debug.getuservalue


```lua
function debug.getuservalue(u: userdata)
  -> any
```


---

# debug.setcstacklimit


```lua
function debug.setcstacklimit(limit: integer)
  -> boolean|integer
```


---

# debug.setfenv


```lua
function debug.setfenv(object: <T>, env: table)
  -> object: <T>
```


---

# debug.sethook


```lua
function debug.sethook(thread: thread, hook: fun(...any):...unknown, mask: string|"c"|"l"|"r", count?: integer)
```


---

# debug.setlocal


```lua
function debug.setlocal(thread: thread, level: integer, index: integer, value: any)
  -> name: string
```


---

# debug.setmetatable


```lua
function debug.setmetatable(value: <T>, meta?: table)
  -> value: <T>
```


---

# debug.setupvalue


```lua
function debug.setupvalue(f: fun(...any):...unknown, up: integer, value: any)
  -> name: string
```


---

# debug.setuservalue


```lua
function debug.setuservalue(udata: userdata, value: any)
  -> udata: userdata
```


---

# debug.traceback


```lua
function debug.traceback(thread: thread, message?: any, level?: integer)
  -> message: string
```


---

# debug.upvalueid


```lua
function debug.upvalueid(f: fun(...any):...unknown, n: integer)
  -> id: lightuserdata
```


---

# debug.upvaluejoin


```lua
function debug.upvaluejoin(f1: fun(...any):...unknown, n1: integer, f2: fun(...any):...unknown, n2: integer)
```


---

# debuginfo

## activelines


```lua
table
```

## currentline


```lua
integer
```

## func


```lua
function
```

## istailcall


```lua
boolean
```

## isvararg


```lua
boolean
```

## lastlinedefined


```lua
integer
```

## linedefined


```lua
integer
```

## name


```lua
string
```

## namewhat


```lua
string
```

## nparams


```lua
integer
```

## nups


```lua
integer
```

## short_src


```lua
string
```

## source


```lua
string
```

## what


```lua
string
```


---

# debuglib

## debug


```lua
function debug.debug()
```


Enters an interactive mode with the user, running each string that the user enters.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-debug.debug"])

## getfenv


```lua
function debug.getfenv(o: any)
  -> table
```


Returns the environment of object `o` .

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-debug.getfenv"])

## gethook


```lua
function debug.gethook(co?: thread)
  -> hook: function
  2. mask: string
  3. count: integer
```


Returns the current hook settings of the thread.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-debug.gethook"])

## getinfo


```lua
function debug.getinfo(thread: thread, f: integer|fun(...any):...unknown, what?: string|"L"|"S"|"f"|"l"...(+3))
  -> debuginfo
```


Returns a table with information about a function.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-debug.getinfo"])


---

```lua
what:
   +> "n" -- `name` and `namewhat`
   +> "S" -- `source`, `short_src`, `linedefined`, `lastlinedefined`, and `what`
   +> "l" -- `currentline`
   +> "t" -- `istailcall`
   +> "u" -- `nups`, `nparams`, and `isvararg`
   +> "f" -- `func`
   +> "L" -- `activelines`
```

## getlocal


```lua
function debug.getlocal(thread: thread, f: integer|fun(...any):...unknown, index: integer)
  -> name: string
  2. value: any
```


Returns the name and the value of the local variable with index `local` of the function at level `f` of the stack.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-debug.getlocal"])

## getmetatable


```lua
function debug.getmetatable(object: any)
  -> metatable: table
```


Returns the metatable of the given value.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-debug.getmetatable"])

## getregistry


```lua
function debug.getregistry()
  -> table
```


Returns the registry table.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-debug.getregistry"])

## getupvalue


```lua
function debug.getupvalue(f: fun(...any):...unknown, up: integer)
  -> name: string
  2. value: any
```


Returns the name and the value of the upvalue with index `up` of the function.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-debug.getupvalue"])

## getuservalue


```lua
function debug.getuservalue(u: userdata)
  -> any
```


Returns the Lua value associated to u.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-debug.getuservalue"])

## setcstacklimit


```lua
function debug.setcstacklimit(limit: integer)
  -> boolean|integer
```


### **Deprecated in `Lua 5.4.2`**

Sets a new limit for the C stack. This limit controls how deeply nested calls can go in Lua, with the intent of avoiding a stack overflow.

In case of success, this function returns the old limit. In case of error, it returns `false`.


[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-debug.setcstacklimit"])

## setfenv


```lua
function debug.setfenv(object: <T>, env: table)
  -> object: <T>
```


Sets the environment of the given `object` to the given `table` .

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-debug.setfenv"])

## sethook


```lua
function debug.sethook(thread: thread, hook: fun(...any):...unknown, mask: string|"c"|"l"|"r", count?: integer)
```


Sets the given function as a hook.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-debug.sethook"])


---

```lua
mask:
   +> "c" -- Calls hook when Lua calls a function.
   +> "r" -- Calls hook when Lua returns from a function.
   +> "l" -- Calls hook when Lua enters a new line of code.
```

## setlocal


```lua
function debug.setlocal(thread: thread, level: integer, index: integer, value: any)
  -> name: string
```


Assigns the `value` to the local variable with index `local` of the function at `level` of the stack.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-debug.setlocal"])

## setmetatable


```lua
function debug.setmetatable(value: <T>, meta?: table)
  -> value: <T>
```


Sets the metatable for the given value to the given table (which can be `nil`).

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-debug.setmetatable"])

## setupvalue


```lua
function debug.setupvalue(f: fun(...any):...unknown, up: integer, value: any)
  -> name: string
```


Assigns the `value` to the upvalue with index `up` of the function.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-debug.setupvalue"])

## setuservalue


```lua
function debug.setuservalue(udata: userdata, value: any)
  -> udata: userdata
```


Sets the given value as the Lua value associated to the given udata.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-debug.setuservalue"])

## traceback


```lua
function debug.traceback(thread: thread, message?: any, level?: integer)
  -> message: string
```


Returns a string with a traceback of the call stack. The optional message string is appended at the beginning of the traceback.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-debug.traceback"])

## upvalueid


```lua
function debug.upvalueid(f: fun(...any):...unknown, n: integer)
  -> id: lightuserdata
```


Returns a unique identifier (as a light userdata) for the upvalue numbered `n` from the given function.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-debug.upvalueid"])

## upvaluejoin


```lua
function debug.upvaluejoin(f1: fun(...any):...unknown, n1: integer, f2: fun(...any):...unknown, n2: integer)
```


Make the `n1`-th upvalue of the Lua closure `f1` refer to the `n2`-th upvalue of the Lua closure `f2`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-debug.upvaluejoin"])


---

# dofile


```lua
function dofile(filename?: string)
  -> ...any
```


---

# error


```lua
function error(message: any, level?: integer)
```


---

# exitcode


---

# false


---

# ffi.VLA*


---

# ffi.VLS*


---

# ffi.cb*

## free


```lua
(method) ffi.cb*:free()
```

## set


```lua
(method) ffi.cb*:set(func: function)
```


---

# ffi.cdata*


---

# ffi.cdecl*

## byte


```lua
function string.byte(s: string|number, i?: integer, j?: integer)
  -> ...integer
```


Returns the internal numeric codes of the characters `s[i], s[i+1], ..., s[j]`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.byte"])

## char


```lua
function string.char(byte: integer, ...integer)
  -> string
```


Returns a string with length equal to the number of arguments, in which each character has the internal numeric code equal to its corresponding argument.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.char"])

## dump


```lua
function string.dump(f: fun(...any):...unknown, strip?: boolean)
  -> string
```


Returns a string containing a binary representation (a *binary chunk*) of the given function.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.dump"])

## find


```lua
function string.find(s: string|number, pattern: string|number, init?: integer, plain?: boolean)
  -> start: integer|nil
  2. end: integer|nil
  3. ...any
```


Miss locale <string.find>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.find"])

@*return* `start`

@*return* `end`

@*return* `...` — captured

## format


```lua
function string.format(s: string|number, ...any)
  -> string
```


Returns a formatted version of its variable number of arguments following the description given in its first argument.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.format"])

## gmatch


```lua
function string.gmatch(s: string|number, pattern: string|number)
  -> fun():string, ...unknown
```


Miss locale <string.gmatch>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.gmatch"])

## gsub


```lua
function string.gsub(s: string|number, pattern: string|number, repl: string|number|function|table, n?: integer)
  -> string
  2. count: integer
```


Miss locale <string.gsub>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.gsub"])

## len


```lua
function string.len(s: string|number)
  -> integer
```


Returns its length.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.len"])

## lower


```lua
function string.lower(s: string|number)
  -> string
```


Returns a copy of this string with all uppercase letters changed to lowercase.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.lower"])

## match


```lua
function string.match(s: string|number, pattern: string|number, init?: integer)
  -> ...any
```


Miss locale <string.match>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.match"])

## pack


```lua
function string.pack(fmt: string, v1: string|number, v2?: string|number, ...string|number)
  -> binary: string
```


Miss locale <string.pack>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.pack"])

## packsize


```lua
function string.packsize(fmt: string)
  -> integer
```


Miss locale <string.packsize>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.packsize"])

## rep


```lua
function string.rep(s: string|number, n: integer, sep?: string|number)
  -> string
```


Returns a string that is the concatenation of `n` copies of the string `s` separated by the string `sep`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.rep"])

## reverse


```lua
function string.reverse(s: string|number)
  -> string
```


Returns a string that is the string `s` reversed.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.reverse"])

## starts_with


```lua
function string.starts_with(str1: string, str2: string)
  -> boolean
```

## sub


```lua
function string.sub(s: string|number, i: integer, j?: integer)
  -> string
```


Returns the substring of the string that starts at `i` and continues until `j`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.sub"])

## unpack


```lua
function string.unpack(fmt: string, s: string, pos?: integer)
  -> ...any
```


Returns the values packed in string according to the format string `fmt` (see [§6.4.2](command:extension.lua.doc?["en-us/51/manual.html/6.4.2"])) .

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.unpack"])

## upper


```lua
function string.upper(s: string|number)
  -> string
```


Returns a copy of this string with all lowercase letters changed to uppercase.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.upper"])


---

# ffi.ct*


---

# ffi.ctype*


---

# ffi.namespace*

## [string]


```lua
function
```


---

# ffilib

## C


```lua
ffi.namespace*
```

## abi


```lua
function ffilib.abi(param: string)
  -> status: boolean
```

## alignof


```lua
function ffilib.alignof(ct: ffi.cdata*|ffi.cdecl*|ffi.ctype*)
  -> align: integer
```

## arch


```lua
string
```

## cast


```lua
function ffilib.cast(ct: ffi.cdata*|ffi.cdecl*|ffi.ctype*, init: any)
  -> cdata: ffi.cdata*
```

## cdef


```lua
function ffilib.cdef(def: string, params?: any, ...any)
```

## copy


```lua
function ffilib.copy(dst: any, src: any, len: integer)
```

## errno


```lua
function ffilib.errno(newerr?: integer)
  -> err: integer
```

## fill


```lua
function ffilib.fill(dst: any, len: integer, c?: any)
```

## gc


```lua
function ffilib.gc(cdata: ffi.cdata*, finalizer?: function)
  -> cdata: ffi.cdata*
```

## istype


```lua
function ffilib.istype(ct: ffi.cdata*|ffi.cdecl*|ffi.ctype*, obj: any)
  -> status: boolean
```

## load


```lua
function ffilib.load(name: string, global?: boolean)
  -> clib: ffi.namespace*
```

## metatype


```lua
function ffilib.metatype(ct: ffi.cdata*|ffi.cdecl*|ffi.ctype*, metatable: table)
  -> ctype: ffi.ctype*
```

## new


```lua
function ffilib.new(ct: ffi.cdata*|ffi.cdecl*|ffi.ctype*, nelem?: integer, init?: any, ...any)
  -> cdata: ffi.cdata*
```

## offsetof


```lua
function ffilib.offsetof(ct: ffi.cdata*|ffi.cdecl*|ffi.ctype*, field: string)
  -> ofs: integer
  2. bpos: integer?
  3. bsize: integer?
```

## os


```lua
string
```

## sizeof


```lua
function ffilib.sizeof(ct: ffi.cdata*|ffi.cdecl*|ffi.ctype*, nelem?: integer)
  -> size: integer|nil
```

## string


```lua
function ffilib.string(ptr: any, len?: integer)
  -> str: string
```

## typeof


```lua
function ffilib.typeof(ct: ffi.cdata*|ffi.cdecl*|ffi.ctype*, params?: any, ...any)
  -> ctype: ffi.ctype*
```


---

# file*

## close


```lua
(method) file*:close()
  -> suc: boolean?
  2. exitcode: ("exit"|"signal")?
  3. code: integer?
```


Close `file`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-file:close"])


```lua
exitcode:
    | "exit"
    | "signal"
```

## flush


```lua
(method) file*:flush()
```


Saves any written data to `file`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-file:flush"])

## lines


```lua
(method) file*:lines(...string|integer|"*L"|"*a"|"*l"...(+1))
  -> fun():any, ...unknown
```


------
```lua
for c in file:lines(...) do
    body
end
```


[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-file:lines"])


```lua
...(param):
    | "*n" -- Reads a numeral and returns it as number.
    | "*a" -- Reads the whole file.
   -> "*l" -- Reads the next line skipping the end of line.
    | "*L" -- Reads the next line keeping the end of line.
```

## read


```lua
(method) file*:read(...string|integer|"*L"|"*a"|"*l"...(+1))
  -> any
  2. ...any
```


Reads the `file`, according to the given formats, which specify what to read.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-file:read"])


```lua
...(param):
    | "*n" -- Reads a numeral and returns it as number.
    | "*a" -- Reads the whole file.
   -> "*l" -- Reads the next line skipping the end of line.
    | "*L" -- Reads the next line keeping the end of line.
```

## seek


```lua
(method) file*:seek(whence?: "cur"|"end"|"set", offset?: integer)
  -> offset: integer
  2. errmsg: string?
```


Sets and gets the file position, measured from the beginning of the file.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-file:seek"])


```lua
whence:
    | "set" -- Base is beginning of the file.
   -> "cur" -- Base is current position.
    | "end" -- Base is end of file.
```

## setvbuf


```lua
(method) file*:setvbuf(mode: "full"|"line"|"no", size?: integer)
```


Sets the buffering mode for an output file.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-file:setvbuf"])


```lua
mode:
    | "no" -- Output operation appears immediately.
    | "full" -- Performed only when the buffer is full.
    | "line" -- Buffered until a newline is output.
```

## write


```lua
(method) file*:write(...string|number)
  -> file*?
  2. errmsg: string?
```


Writes the value of each of its arguments to `file`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-file:write"])


---

# filetype


---

# function


---

# gcoptions


---

# getfenv


```lua
function getfenv(f?: integer|fun(...any):...unknown)
  -> table
```


---

# getmetatable


```lua
function getmetatable(object: any)
  -> metatable: table
```


---

# hookmask


---

# infowhat


---

# integer


---

# io


```lua
iolib
```


---

# io.close


```lua
function io.close(file?: file*)
  -> suc: boolean?
  2. exitcode: ("exit"|"signal")?
  3. code: integer?
```


---

# io.flush


```lua
function io.flush()
```


---

# io.input


```lua
function io.input(file: string|file*)
```


---

# io.lines


```lua
function io.lines(filename?: string, ...string|integer|"*L"|"*a"|"*l"...(+1))
  -> fun():any, ...unknown
```


---

# io.open


```lua
function io.open(filename: string, mode?: "a"|"a+"|"a+b"|"ab"|"r"...(+7))
  -> file*?
  2. errmsg: string?
```


---

# io.output


```lua
function io.output(file: string|file*)
```


---

# io.popen


```lua
function io.popen(prog: string, mode?: "r"|"w")
  -> file*?
  2. errmsg: string?
```


---

# io.read


```lua
function io.read(...string|integer|"*L"|"*a"|"*l"...(+1))
  -> any
  2. ...any
```


---

# io.tmpfile


```lua
function io.tmpfile()
  -> file*
```


---

# io.type


```lua
function io.type(file: file*)
  -> "closed file"|"file"|`nil`
```


---

# io.write


```lua
function io.write(...any)
  -> file*
  2. errmsg: string?
```


---

# iolib

## close


```lua
function io.close(file?: file*)
  -> suc: boolean?
  2. exitcode: ("exit"|"signal")?
  3. code: integer?
```


Close `file` or default output file.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-io.close"])


```lua
exitcode:
    | "exit"
    | "signal"
```

## flush


```lua
function io.flush()
```


Saves any written data to default output file.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-io.flush"])

## input


```lua
function io.input(file: string|file*)
```


Sets `file` as the default input file.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-io.input"])

## lines


```lua
function io.lines(filename?: string, ...string|integer|"*L"|"*a"|"*l"...(+1))
  -> fun():any, ...unknown
```


------
```lua
for c in io.lines(filename, ...) do
    body
end
```


[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-io.lines"])


```lua
...(param):
    | "*n" -- Reads a numeral and returns it as number.
    | "*a" -- Reads the whole file.
   -> "*l" -- Reads the next line skipping the end of line.
    | "*L" -- Reads the next line keeping the end of line.
```

## open


```lua
function io.open(filename: string, mode?: "a"|"a+"|"a+b"|"ab"|"r"...(+7))
  -> file*?
  2. errmsg: string?
```


Opens a file, in the mode specified in the string `mode`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-io.open"])


```lua
mode:
   -> "r" -- Read mode.
    | "w" -- Write mode.
    | "a" -- Append mode.
    | "r+" -- Update mode, all previous data is preserved.
    | "w+" -- Update mode, all previous data is erased.
    | "a+" -- Append update mode, previous data is preserved, writing is only allowed at the end of file.
    | "rb" -- Read mode. (in binary mode.)
    | "wb" -- Write mode. (in binary mode.)
    | "ab" -- Append mode. (in binary mode.)
    | "r+b" -- Update mode, all previous data is preserved. (in binary mode.)
    | "w+b" -- Update mode, all previous data is erased. (in binary mode.)
    | "a+b" -- Append update mode, previous data is preserved, writing is only allowed at the end of file. (in binary mode.)
```

## output


```lua
function io.output(file: string|file*)
```


Sets `file` as the default output file.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-io.output"])

## popen


```lua
function io.popen(prog: string, mode?: "r"|"w")
  -> file*?
  2. errmsg: string?
```


Starts program prog in a separated process.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-io.popen"])


```lua
mode:
    | "r" -- Read data from this program by `file`.
    | "w" -- Write data to this program by `file`.
```

## read


```lua
function io.read(...string|integer|"*L"|"*a"|"*l"...(+1))
  -> any
  2. ...any
```


Reads the `file`, according to the given formats, which specify what to read.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-io.read"])


```lua
...(param):
    | "*n" -- Reads a numeral and returns it as number.
    | "*a" -- Reads the whole file.
   -> "*l" -- Reads the next line skipping the end of line.
    | "*L" -- Reads the next line keeping the end of line.
```

## stderr


```lua
file*
```


standard error.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-io.stderr"])


## stdin


```lua
file*
```


standard input.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-io.stdin"])


## stdout


```lua
file*
```


standard output.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-io.stdout"])


## tmpfile


```lua
function io.tmpfile()
  -> file*
```


In case of success, returns a handle for a temporary file.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-io.tmpfile"])

## type


```lua
function io.type(file: file*)
  -> "closed file"|"file"|`nil`
```


Checks whether `obj` is a valid file handle.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-io.type"])


```lua
return #1:
    | "file" -- Is an open file handle.
    | "closed file" -- Is a closed file handle.
    | `nil` -- Is not a file handle.
```

## write


```lua
function io.write(...any)
  -> file*
  2. errmsg: string?
```


Writes the value of each of its arguments to default output file.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-io.write"])


---

# ipairs


```lua
function ipairs(t: <T:table>)
  -> fun(table: <V>[], i?: integer):integer, <V>
  2. <T:table>
  3. i: integer
```


---

# jit


```lua
jitlib
```


---

# jit.flush


```lua
function jit.flush(func: boolean|function, recursive?: boolean)
```


---

# jit.funcinfo.c

## ffid


```lua
integer|nil
```


---

# jit.funcinfo.lua


---

# jit.off


```lua
function jit.off(func: boolean|function, recursive?: boolean)
```


---

# jit.on


```lua
function jit.on(func: boolean|function, recursive?: boolean)
```


---

# jit.opt


```lua
table
```


---

# jit.opt.start


```lua
function jit.opt.start(...any)
```


---

# jit.snap


---

# jit.status


```lua
function jit.status()
  -> status: boolean
  2. ...string
```


---

# jit.traceinfo


---

# jitlib

## arch


```lua
string|'arm'|'arm64'|'arm64be'|'mips'...(+8)
```

## flush


```lua
function jit.flush(func: boolean|function, recursive?: boolean)
```

## off


```lua
function jit.off(func: boolean|function, recursive?: boolean)
```

## on


```lua
function jit.on(func: boolean|function, recursive?: boolean)
```

## opt


```lua
table
```

## os


```lua
'BSD'|'Linux'|'OSX'|'Other'|'POSIX'...(+1)
```

## status


```lua
function jit.status()
  -> status: boolean
  2. ...string
```

## version


```lua
string
```

## version_num


```lua
number
```


---

# lightuserdata


---

# load


```lua
function load(chunk: string|function, chunkname?: string, mode?: "b"|"bt"|"t", env?: table)
  -> function?
  2. error_message: string?
```


---

# loadfile


```lua
function loadfile(filename?: string, mode?: "b"|"bt"|"t", env?: table)
  -> function?
  2. error_message: string?
```


---

# loadmode


---

# loadstring


```lua
function loadstring(text: string, chunkname?: string)
  -> function?
  2. error_message: string?
```


---

# localecategory


---

# math


```lua
mathlib
```


---

# math.abs


```lua
function math.abs(x: <Number:number>)
  -> <Number:number>
```


---

# math.acos


```lua
function math.acos(x: number)
  -> number
```


---

# math.asin


```lua
function math.asin(x: number)
  -> number
```


---

# math.atan


```lua
function math.atan(y: number)
  -> number
```


---

# math.atan2


```lua
function math.atan2(y: number, x: number)
  -> number
```


---

# math.ceil


```lua
function math.ceil(x: number)
  -> integer
```


---

# math.cos


```lua
function math.cos(x: number)
  -> number
```


---

# math.cosh


```lua
function math.cosh(x: number)
  -> number
```


---

# math.deg


```lua
function math.deg(x: number)
  -> number
```


---

# math.exp


```lua
function math.exp(x: number)
  -> number
```


---

# math.floor


```lua
function math.floor(x: number)
  -> integer
```


---

# math.fmod


```lua
function math.fmod(x: number, y: number)
  -> number
```


---

# math.frexp


```lua
function math.frexp(x: number)
  -> m: number
  2. e: number
```


---

# math.ldexp


```lua
function math.ldexp(m: number, e: number)
  -> number
```


---

# math.log


```lua
function math.log(x: number, base?: integer)
  -> number
```


---

# math.log10


```lua
function math.log10(x: number)
  -> number
```


---

# math.max


```lua
function math.max(x: <Number:number>, ...<Number:number>)
  -> <Number:number>
```


---

# math.min


```lua
function math.min(x: <Number:number>, ...<Number:number>)
  -> <Number:number>
```


---

# math.modf


```lua
function math.modf(x: number)
  -> integer
  2. number
```


---

# math.pow


```lua
function math.pow(x: number, y: number)
  -> number
```


---

# math.rad


```lua
function math.rad(x: number)
  -> number
```


---

# math.random


```lua
function math.random(m: integer, n: integer)
  -> integer
```


---

# math.randomseed


```lua
function math.randomseed(x: integer)
```


---

# math.sin


```lua
function math.sin(x: number)
  -> number
```


---

# math.sinh


```lua
function math.sinh(x: number)
  -> number
```


---

# math.sqrt


```lua
function math.sqrt(x: number)
  -> number
```


---

# math.tan


```lua
function math.tan(x: number)
  -> number
```


---

# math.tanh


```lua
function math.tanh(x: number)
  -> number
```


---

# math.tointeger


```lua
function math.tointeger(x: any)
  -> integer?
```


---

# math.type


```lua
function math.type(x: any)
  -> "float"|"integer"|'nil'
```


---

# math.ult


```lua
function math.ult(m: integer, n: integer)
  -> boolean
```


---

# mathlib

## abs


```lua
function math.abs(x: <Number:number>)
  -> <Number:number>
```


Returns the absolute value of `x`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.abs"])

## acos


```lua
function math.acos(x: number)
  -> number
```


Returns the arc cosine of `x` (in radians).

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.acos"])

## asin


```lua
function math.asin(x: number)
  -> number
```


Returns the arc sine of `x` (in radians).

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.asin"])

## atan


```lua
function math.atan(y: number)
  -> number
```


Returns the arc tangent of `x` (in radians).

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.atan"])

## atan2


```lua
function math.atan2(y: number, x: number)
  -> number
```


Returns the arc tangent of `y/x` (in radians).

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.atan2"])

## ceil


```lua
function math.ceil(x: number)
  -> integer
```


Returns the smallest integral value larger than or equal to `x`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.ceil"])

## cos


```lua
function math.cos(x: number)
  -> number
```


Returns the cosine of `x` (assumed to be in radians).

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.cos"])

## cosh


```lua
function math.cosh(x: number)
  -> number
```


Returns the hyperbolic cosine of `x` (assumed to be in radians).

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.cosh"])

## deg


```lua
function math.deg(x: number)
  -> number
```


Converts the angle `x` from radians to degrees.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.deg"])

## exp


```lua
function math.exp(x: number)
  -> number
```


Returns the value `e^x` (where `e` is the base of natural logarithms).

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.exp"])

## floor


```lua
function math.floor(x: number)
  -> integer
```


Returns the largest integral value smaller than or equal to `x`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.floor"])

## fmod


```lua
function math.fmod(x: number, y: number)
  -> number
```


Returns the remainder of the division of `x` by `y` that rounds the quotient towards zero.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.fmod"])

## frexp


```lua
function math.frexp(x: number)
  -> m: number
  2. e: number
```


Decompose `x` into tails and exponents. Returns `m` and `e` such that `x = m * (2 ^ e)`, `e` is an integer and the absolute value of `m` is in the range [0.5, 1) (or zero when `x` is zero).

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.frexp"])

## huge


```lua
number
```


A value larger than any other numeric value.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.huge"])


## ldexp


```lua
function math.ldexp(m: number, e: number)
  -> number
```


Returns `m * (2 ^ e)` .

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.ldexp"])

## log


```lua
function math.log(x: number, base?: integer)
  -> number
```


Returns the logarithm of `x` in the given base.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.log"])

## log10


```lua
function math.log10(x: number)
  -> number
```


Returns the base-10 logarithm of x.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.log10"])

## max


```lua
function math.max(x: <Number:number>, ...<Number:number>)
  -> <Number:number>
```


Returns the argument with the maximum value, according to the Lua operator `<`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.max"])

## min


```lua
function math.min(x: <Number:number>, ...<Number:number>)
  -> <Number:number>
```


Returns the argument with the minimum value, according to the Lua operator `<`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.min"])

## modf


```lua
function math.modf(x: number)
  -> integer
  2. number
```


Returns the integral part of `x` and the fractional part of `x`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.modf"])

## pi


```lua
number
```


The value of *π*.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.pi"])


## pow


```lua
function math.pow(x: number, y: number)
  -> number
```


Returns `x ^ y` .

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.pow"])

## rad


```lua
function math.rad(x: number)
  -> number
```


Converts the angle `x` from degrees to radians.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.rad"])

## random


```lua
function math.random(m: integer, n: integer)
  -> integer
```


* `math.random()`: Returns a float in the range [0,1).
* `math.random(n)`: Returns a integer in the range [1, n].
* `math.random(m, n)`: Returns a integer in the range [m, n].


[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.random"])

## randomseed


```lua
function math.randomseed(x: integer)
```


Sets `x` as the "seed" for the pseudo-random generator.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.randomseed"])

## sin


```lua
function math.sin(x: number)
  -> number
```


Returns the sine of `x` (assumed to be in radians).

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.sin"])

## sinh


```lua
function math.sinh(x: number)
  -> number
```


Returns the hyperbolic sine of `x` (assumed to be in radians).

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.sinh"])

## sqrt


```lua
function math.sqrt(x: number)
  -> number
```


Returns the square root of `x`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.sqrt"])

## tan


```lua
function math.tan(x: number)
  -> number
```


Returns the tangent of `x` (assumed to be in radians).

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.tan"])

## tanh


```lua
function math.tanh(x: number)
  -> number
```


Returns the hyperbolic tangent of `x` (assumed to be in radians).

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.tanh"])

## tointeger


```lua
function math.tointeger(x: any)
  -> integer?
```


Miss locale <math.tointeger>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.tointeger"])

## type


```lua
function math.type(x: any)
  -> "float"|"integer"|'nil'
```


Miss locale <math.type>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.type"])


```lua
return #1:
    | "integer"
    | "float"
    | 'nil'
```

## ult


```lua
function math.ult(m: integer, n: integer)
  -> boolean
```


Miss locale <math.ult>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-math.ult"])


---

# metatable

## __add


```lua
fun(t1: any, t2: any):any|nil
```

## __call


```lua
fun(t: any, ...any):...unknown|nil
```

## __concat


```lua
fun(t1: any, t2: any):any|nil
```

## __div


```lua
fun(t1: any, t2: any):any|nil
```

## __eq


```lua
fun(t1: any, t2: any):boolean|nil
```

## __gc


```lua
fun(t: any)|nil
```

## __index


```lua
table|fun(t: any, k: any):any|nil
```

## __le


```lua
fun(t1: any, t2: any):boolean|nil
```

## __len


```lua
fun(t: any):integer|nil
```

## __lt


```lua
fun(t1: any, t2: any):boolean|nil
```

## __metatable


```lua
any
```

## __mod


```lua
fun(t1: any, t2: any):any|nil
```

## __mode


```lua
'k'|'kv'|'v'|nil
```

## __mul


```lua
fun(t1: any, t2: any):any|nil
```

## __newindex


```lua
table|fun(t: any, k: any, v: any)|nil
```

## __pow


```lua
fun(t1: any, t2: any):any|nil
```

## __sub


```lua
fun(t1: any, t2: any):any|nil
```

## __tostring


```lua
fun(t: any):string|nil
```

## __unm


```lua
fun(t: any):any|nil
```


---

# minetest


```lua
core
```


```lua
core
```


---

# module


```lua
function module(name: string, ...any)
```


---

# newproxy


```lua
function newproxy(proxy: boolean|table|userdata)
  -> userdata
```


---

# next


```lua
function next(table: table<<K>, <V>>, index?: <K>)
  -> <K>?
  2. <V>?
```


---

# nil


---

# number


---

# openmode


---

# os


```lua
oslib
```


---

# os.clock


```lua
function os.clock()
  -> number
```


---

# os.date


```lua
function os.date(format?: string, time?: integer)
  -> string|osdate
```


---

# os.difftime


```lua
function os.difftime(t2: integer, t1: integer)
  -> integer
```


---

# os.execute


```lua
function os.execute(command?: string)
  -> suc: boolean?
  2. exitcode: ("exit"|"signal")?
  3. code: integer?
```


---

# os.exit


```lua
function os.exit(code?: boolean|integer, close?: boolean)
```


---

# os.getenv


```lua
function os.getenv(varname: string)
  -> string?
```


---

# os.remove


```lua
function os.remove(filename: string)
  -> suc: boolean
  2. errmsg: string?
```


---

# os.rename


```lua
function os.rename(oldname: string, newname: string)
  -> suc: boolean
  2. errmsg: string?
```


---

# os.setlocale


```lua
function os.setlocale(locale: string|nil, category?: "all"|"collate"|"ctype"|"monetary"|"numeric"...(+1))
  -> localecategory: string
```


---

# os.time


```lua
function os.time(date?: osdateparam)
  -> integer
```


---

# os.tmpname


```lua
function os.tmpname()
  -> string
```


---

# osdate

## day


```lua
string|integer
```


1-31

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-osdate.day"])


## hour


```lua
string|integer
```


0-23

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-osdate.hour"])


## isdst


```lua
boolean
```


daylight saving flag, a boolean

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-osdate.isdst"])


## min


```lua
string|integer
```


0-59

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-osdate.min"])


## month


```lua
string|integer
```


1-12

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-osdate.month"])


## sec


```lua
string|integer
```


0-61

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-osdate.sec"])


## wday


```lua
string|integer
```


weekday, 1–7, Sunday is 1

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-osdate.wday"])


## yday


```lua
string|integer
```


day of the year, 1–366

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-osdate.yday"])


## year


```lua
string|integer
```


four digits

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-osdate.year"])



---

# osdateparam

## day


```lua
string|integer
```


1-31

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-osdate.day"])


## hour


```lua
(string|integer)?
```


0-23

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-osdate.hour"])


## isdst


```lua
boolean?
```


daylight saving flag, a boolean

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-osdate.isdst"])


## min


```lua
(string|integer)?
```


0-59

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-osdate.min"])


## month


```lua
string|integer
```


1-12

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-osdate.month"])


## sec


```lua
(string|integer)?
```


0-61

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-osdate.sec"])


## wday


```lua
(string|integer)?
```


weekday, 1–7, Sunday is 1

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-osdate.wday"])


## yday


```lua
(string|integer)?
```


day of the year, 1–366

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-osdate.yday"])


## year


```lua
string|integer
```


four digits

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-osdate.year"])



---

# oslib

## clock


```lua
function os.clock()
  -> number
```


Returns an approximation of the amount in seconds of CPU time used by the program.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-os.clock"])

## date


```lua
function os.date(format?: string, time?: integer)
  -> string|osdate
```


Returns a string or a table containing date and time, formatted according to the given string `format`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-os.date"])

## difftime


```lua
function os.difftime(t2: integer, t1: integer)
  -> integer
```


Returns the difference, in seconds, from time `t1` to time `t2`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-os.difftime"])

## execute


```lua
function os.execute(command?: string)
  -> suc: boolean?
  2. exitcode: ("exit"|"signal")?
  3. code: integer?
```


Passes `command` to be executed by an operating system shell.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-os.execute"])


```lua
exitcode:
    | "exit"
    | "signal"
```

## exit


```lua
function os.exit(code?: boolean|integer, close?: boolean)
```


Calls the ISO C function `exit` to terminate the host program.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-os.exit"])

## getenv


```lua
function os.getenv(varname: string)
  -> string?
```


Returns the value of the process environment variable `varname`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-os.getenv"])

## remove


```lua
function os.remove(filename: string)
  -> suc: boolean
  2. errmsg: string?
```


Deletes the file with the given name.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-os.remove"])

## rename


```lua
function os.rename(oldname: string, newname: string)
  -> suc: boolean
  2. errmsg: string?
```


Renames the file or directory named `oldname` to `newname`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-os.rename"])

## setlocale


```lua
function os.setlocale(locale: string|nil, category?: "all"|"collate"|"ctype"|"monetary"|"numeric"...(+1))
  -> localecategory: string
```


Sets the current locale of the program.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-os.setlocale"])


```lua
category:
   -> "all"
    | "collate"
    | "ctype"
    | "monetary"
    | "numeric"
    | "time"
```

## time


```lua
function os.time(date?: osdateparam)
  -> integer
```


Returns the current time when called without arguments, or a time representing the local date and time specified by the given table.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-os.time"])

## tmpname


```lua
function os.tmpname()
  -> string
```


Returns a string with a file name that can be used for a temporary file.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-os.tmpname"])


---

# package


```lua
packagelib
```


---

# package.config


```lua
string
```


---

# package.loaders


```lua
table
```


---

# package.loadlib


```lua
function package.loadlib(libname: string, funcname: string)
  -> any
```


---

# package.searchers


```lua
table
```


---

# package.searchpath


```lua
function package.searchpath(name: string, path: string, sep?: string, rep?: string)
  -> filename: string?
  2. errmsg: string?
```


---

# package.seeall


```lua
function package.seeall(module: table)
```


---

# packagelib

## config


```lua
string
```


A string describing some compile-time configurations for packages.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-package.config"])


## cpath


```lua
string
```


The path used by `require` to search for a C loader.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-package.cpath"])


## loaded


```lua
table
```


A table used by `require` to control which modules are already loaded.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-package.loaded"])


## loaders


```lua
table
```


A table used by `require` to control how to load modules.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-package.loaders"])


## loadlib


```lua
function package.loadlib(libname: string, funcname: string)
  -> any
```


Dynamically links the host program with the C library `libname`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-package.loadlib"])

## path


```lua
string
```


The path used by `require` to search for a Lua loader.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-package.path"])


## preload


```lua
table
```


A table to store loaders for specific modules.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-package.preload"])


## searchers


```lua
table
```


A table used by `require` to control how to load modules.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-package.searchers"])


## searchpath


```lua
function package.searchpath(name: string, path: string, sep?: string, rep?: string)
  -> filename: string?
  2. errmsg: string?
```


Searches for the given `name` in the given `path`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-package.searchpath"])

## seeall


```lua
function package.seeall(module: table)
```


Sets a metatable for `module` with its `__index` field referring to the global environment, so that this module inherits values from the global environment. To be used as an option to function `module` .

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-package.seeall"])


---

# pairs


```lua
function pairs(t: <T:table>)
  -> fun(table: table<<K>, <V>>, index?: <K>):<K>, <V>
  2. <T:table>
```


---

# pcall


```lua
function pcall(f: fun(...any):...unknown, arg1?: any, ...any)
  -> success: boolean
  2. result: any
  3. ...any
```


---

# popenmode


---

# print


```lua
function print(...any)
```


---

# rawequal


```lua
function rawequal(v1: any, v2: any)
  -> boolean
```


---

# rawget


```lua
function rawget(table: table, index: any)
  -> any
```


---

# rawlen


```lua
function rawlen(v: string|table)
  -> len: integer
```


---

# rawset


```lua
function rawset(table: table, index: any, value: any)
  -> table
```


---

# readmode


---

# require


```lua
function require(modname: string)
  -> unknown
```


---

# s


```lua
Spacea
```


---

# s.Set


```lua
Set
```


---

# s.Set.add


```lua
(method) Set:add(element: any)
```


---

# s.Set.add_all


```lua
(method) Set:add_all(elements: any[])
```


---

# s.Set.contains


```lua
(method) Set:contains(element: any)
  -> boolean|nil
```


---

# s.Set.new


```lua
function Set.new(t: any[], set_mt?: boolean)
  -> Set|table<any, boolean>
```


---

# s.Set.remove


```lua
(method) Set:remove(element: any)
```


---

# s.Set.remove_all


```lua
(method) Set:remove_all(elements: any[])
```


---

# s.f


```lua
table
```


---

# s.f.curry


```lua
function s.f.curry(f: any, ...any)
  -> function
```


---

# s.f.math


```lua
table
```


---

# s.f.math.add


```lua
function s.f.math.add(a: any, b: any)
  -> unknown
```


---

# s.f.math.div


```lua
function s.f.math.div(a: any, b: any)
  -> unknown
```


---

# s.f.math.mul


```lua
function s.f.math.mul(a: any, b: any)
  -> unknown
```


---

# s.f.math.sub


```lua
function s.f.math.sub(a: any, b: any)
  -> unknown
```


---

# s.foreach


```lua
function s.foreach(t: table<integer, any>, f: fun(v: any, i: integer))
```


---

# s.foreachp


```lua
function s.foreachp(t: table<any, any>, f: fun(v: any, k: any))
```


---

# s.load_file


```lua
function s.load_file(path: string)
```


---

# s.load_files


```lua
function s.load_files(paths: string[])
```


---

# s.player


```lua
table
```


---

# s.player.data


```lua
table
```


---

# s.player.get_data


```lua
function s.player.get_data(name: string, key: string)
  -> table?
```


---

# s.player.physics


```lua
table
```


---

# s.player.physics.add_change


```lua
function s.player.physics.add_change(player: core.Player, type: string, id: string, value: any, operation?: fun(a: any, b: any):any, priority?: number)
  -> boolean|nil
```


---

# s.player.physics.apply_change


```lua
function s.player.physics.apply_change(player: any, type: any)
```


---

# s.player.physics.default_gravity


```lua
number
```


---

# s.player.physics.default_jump


```lua
number
```


---

# s.player.physics.del_change


```lua
function s.player.physics.del_change(player: any, type: any, id: any)
```


---

# s.player.physics.get_value


```lua
function s.player.physics.get_value(player: any, type: any)
  -> boolean
```


---

# s.player.physics.register_type


```lua
function s.player.physics.register_type(name: string, action: fun(player: core.Player, value: any), default_value: any)
```


---

# s.player.physics.types


```lua
table
```


---

# s.strict


```lua
table
```


---

# s.strict.special_item_metadata_fields


```lua
unknown
```


---

# s.strict.special_node_metadata_fields


```lua
unknown
```


---

# s.version


```lua
table
```


---

# s.version.get_version


```lua
function s.version.get_version()
  -> string
```


---

# seekwhence


---

# select


```lua
function select(index: integer|"#", ...any)
  -> any
```


---

# serialize


```lua
function serialize(table: { [string]: any })
  -> string
```


```lua
function serialize(table: { [string]: any })
  -> string
```


---

# setfenv


```lua
function setfenv(f: integer|fun(...any):...unknown, table: table)
  -> function
```


---

# setmetatable


```lua
function setmetatable(table: table, metatable?: table|metatable)
  -> table
```


---

# string

## byte


```lua
function string.byte(s: string|number, i?: integer, j?: integer)
  -> ...integer
```


Returns the internal numeric codes of the characters `s[i], s[i+1], ..., s[j]`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.byte"])

## char


```lua
function string.char(byte: integer, ...integer)
  -> string
```


Returns a string with length equal to the number of arguments, in which each character has the internal numeric code equal to its corresponding argument.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.char"])

## dump


```lua
function string.dump(f: fun(...any):...unknown, strip?: boolean)
  -> string
```


Returns a string containing a binary representation (a *binary chunk*) of the given function.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.dump"])

## find


```lua
function string.find(s: string|number, pattern: string|number, init?: integer, plain?: boolean)
  -> start: integer|nil
  2. end: integer|nil
  3. ...any
```


Miss locale <string.find>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.find"])

@*return* `start`

@*return* `end`

@*return* `...` — captured

## format


```lua
function string.format(s: string|number, ...any)
  -> string
```


Returns a formatted version of its variable number of arguments following the description given in its first argument.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.format"])

## gmatch


```lua
function string.gmatch(s: string|number, pattern: string|number)
  -> fun():string, ...unknown
```


Miss locale <string.gmatch>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.gmatch"])

## gsub


```lua
function string.gsub(s: string|number, pattern: string|number, repl: string|number|function|table, n?: integer)
  -> string
  2. count: integer
```


Miss locale <string.gsub>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.gsub"])

## len


```lua
function string.len(s: string|number)
  -> integer
```


Returns its length.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.len"])

## lower


```lua
function string.lower(s: string|number)
  -> string
```


Returns a copy of this string with all uppercase letters changed to lowercase.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.lower"])

## match


```lua
function string.match(s: string|number, pattern: string|number, init?: integer)
  -> ...any
```


Miss locale <string.match>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.match"])

## pack


```lua
function string.pack(fmt: string, v1: string|number, v2?: string|number, ...string|number)
  -> binary: string
```


Miss locale <string.pack>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.pack"])

## packsize


```lua
function string.packsize(fmt: string)
  -> integer
```


Miss locale <string.packsize>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.packsize"])

## rep


```lua
function string.rep(s: string|number, n: integer, sep?: string|number)
  -> string
```


Returns a string that is the concatenation of `n` copies of the string `s` separated by the string `sep`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.rep"])

## reverse


```lua
function string.reverse(s: string|number)
  -> string
```


Returns a string that is the string `s` reversed.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.reverse"])

## starts_with


```lua
function string.starts_with(str1: string, str2: string)
  -> boolean
```

## sub


```lua
function string.sub(s: string|number, i: integer, j?: integer)
  -> string
```


Returns the substring of the string that starts at `i` and continues until `j`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.sub"])

## unpack


```lua
function string.unpack(fmt: string, s: string, pos?: integer)
  -> ...any
```


Returns the values packed in string according to the format string `fmt` (see [§6.4.2](command:extension.lua.doc?["en-us/51/manual.html/6.4.2"])) .

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.unpack"])

## upper


```lua
function string.upper(s: string|number)
  -> string
```


Returns a copy of this string with all lowercase letters changed to uppercase.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.upper"])


---

# string


```lua
stringlib
```


---

# string.buffer

## commit


```lua
(method) string.buffer:commit(used: integer)
  -> string.buffer
```

 Appends the used bytes of the previously returned write space to the buffer data.

## decode


```lua
(method) string.buffer:decode()
  -> obj: string|number|table|nil
```

 De-serializes one object from the buffer.

 The returned object may be any of the supported Lua types — even `nil`.

 This function may throw an error when fed with malformed or incomplete encoded data.

 Leaves any left-over data in the buffer.

 Attempting to de-serialize an FFI type will throw an error, if the FFI library is not built-in or has not been loaded, yet.

## encode


```lua
(method) string.buffer:encode(obj: string|number|table)
  -> string.buffer
```

 Serializes (encodes) the Lua object to the buffer

 This function may throw an error when attempting to serialize unsupported object types, circular references or deeply nested tables.

## free


```lua
(method) string.buffer:free()
```

 The buffer space of the buffer object is freed. The object itself remains intact, empty and may be reused.

 Note: you normally don't need to use this method. The garbage collector automatically frees the buffer space, when the buffer object is collected. Use this method, if you need to free the associated memory immediately.

## get


```lua
(method) string.buffer:get(len?: integer, ...integer|nil)
  -> ...string
```

 Consumes the buffer data and returns one or more strings. If called without arguments, the whole buffer data is consumed. If called with a number, up to `len` bytes are consumed. A `nil` argument consumes the remaining buffer space (this only makes sense as the last argument). Multiple arguments consume the buffer data in the given order.

 Note: a zero length or no remaining buffer data returns an empty string and not `nil`.

## put


```lua
(method) string.buffer:put(data: string|number|table, ...string|number|table)
  -> string.buffer
```

 Appends a string str, a number num or any object obj with a `__tostring` metamethod to the buffer. Multiple arguments are appended in the given order.

 Appending a buffer to a buffer is possible and short-circuited internally. But it still involves a copy. Better combine the buffer writes to use a single buffer.

## putcdata


```lua
(method) string.buffer:putcdata(cdata: ffi.cdata*, len: integer)
  -> string.buffer
```

 Appends the given len number of bytes from the memory pointed to by the FFI cdata object to the buffer. The object needs to be convertible to a (constant) pointer.

## putf


```lua
(method) string.buffer:putf(format: string, ...string|number|table)
  -> string.buffer
```

 Appends the formatted arguments to the buffer. The format string supports the same options as string.format().

## ref


```lua
(method) string.buffer:ref()
  -> ptr: ffi.cdata*
  2. len: integer
```

 Returns an uint8_t * FFI cdata pointer ptr that points to the buffer data. The length of the buffer data in bytes is returned in len.

 The returned pointer can be directly passed to C functions that expect a buffer and a length. You can also do bytewise reads (`local x = ptr[i]`) or writes (`ptr[i] = 0x40`) of the buffer data.

 In conjunction with the `buf:skip()` method, this allows zero-copy use of C write-style APIs:

 ```lua
 repeat
   local ptr, len = buf:ref()
   if len == 0 then break end
   local n = C.write(fd, ptr, len)
   if n < 0 then error("write error") end
   buf:skip(n)
 until n >= len
 ```

 Unlike Lua strings, buffer data is not implicitly zero-terminated. It's not safe to pass ptr to C functions that expect zero-terminated strings. If you're not using len, then you're doing something wrong.

@*return* `ptr` — an uint8_t * FFI cdata pointer that points to the buffer data.

@*return* `len` — length of the buffer data in bytes

## reserve


```lua
(method) string.buffer:reserve(size: integer)
  -> ptr: ffi.cdata*
  2. len: integer
```

 The reserve method reserves at least size bytes of write space in the buffer. It returns an uint8_t * FFI cdata pointer ptr that points to this space.

 The available length in bytes is returned in len. This is at least size bytes, but may be more to facilitate efficient buffer growth. You can either make use of the additional space or ignore len and only use size bytes.

 This, along with `buf:commit()` allow zero-copy use of C read-style APIs:

 ```lua
 local MIN_SIZE = 65536
 repeat
   local ptr, len = buf:reserve(MIN_SIZE)
   local n = C.read(fd, ptr, len)
   if n == 0 then break end -- EOF.
   if n < 0 then error("read error") end
   buf:commit(n)
 until false
 ```

 The reserved write space is not initialized. At least the used bytes must be written to before calling the commit method. There's no need to call the commit method, if nothing is added to the buffer (e.g. on error).

@*return* `ptr` — an uint8_t * FFI cdata pointer that points to this space

@*return* `len` — available length (bytes)

## reset


```lua
(method) string.buffer:reset()
  -> string.buffer
```

 Reset (empty) the buffer. The allocated buffer space is not freed and may be reused.

## set


```lua
(method) string.buffer:set(str: string|number|table)
  -> string.buffer
```

 This method allows zero-copy consumption of a string or an FFI cdata object as a buffer. It stores a reference to the passed string str or the FFI cdata object in the buffer. Any buffer space originally allocated is freed. This is not an append operation, unlike the `buf:put*()` methods.

 After calling this method, the buffer behaves as if `buf:free():put(str)` or `buf:free():put(cdata, len)` had been called. However, the data is only referenced and not copied, as long as the buffer is only consumed.

 In case the buffer is written to later on, the referenced data is copied and the object reference is removed (copy-on-write semantics).

 The stored reference is an anchor for the garbage collector and keeps the originally passed string or FFI cdata object alive.

## skip


```lua
(method) string.buffer:skip(len: integer)
  -> string.buffer
```

 Skips (consumes) len bytes from the buffer up to the current length of the buffer data.

## tostring


```lua
(method) string.buffer:tostring()
  -> string
```

 Creates a string from the buffer data, but doesn't consume it. The buffer remains unchanged.

 Buffer objects also define a `__tostring metamethod`. This means buffers can be passed to the global `tostring()` function and many other functions that accept this in place of strings. The important internal uses in functions like `io.write()` are short-circuited to avoid the creation of an intermediate string object.


---

# string.buffer.data


---

# string.buffer.serialization.opts

## dict


```lua
string[]
```

## metatable


```lua
table[]
```


---

# string.byte


```lua
function string.byte(s: string|number, i?: integer, j?: integer)
  -> ...integer
```


---

# string.char


```lua
function string.char(byte: integer, ...integer)
  -> string
```


---

# string.dump


```lua
function string.dump(f: fun(...any):...unknown, strip?: boolean)
  -> string
```


---

# string.find


```lua
function string.find(s: string|number, pattern: string|number, init?: integer, plain?: boolean)
  -> start: integer|nil
  2. end: integer|nil
  3. ...any
```


---

# string.format


```lua
function string.format(s: string|number, ...any)
  -> string
```


---

# string.gmatch


```lua
function string.gmatch(s: string|number, pattern: string|number)
  -> fun():string, ...unknown
```


---

# string.gsub


```lua
function string.gsub(s: string|number, pattern: string|number, repl: string|number|function|table, n?: integer)
  -> string
  2. count: integer
```


---

# string.len


```lua
function string.len(s: string|number)
  -> integer
```


---

# string.lower


```lua
function string.lower(s: string|number)
  -> string
```


---

# string.match


```lua
function string.match(s: string|number, pattern: string|number, init?: integer)
  -> ...any
```


---

# string.pack


```lua
function string.pack(fmt: string, v1: string|number, v2?: string|number, ...string|number)
  -> binary: string
```


---

# string.packsize


```lua
function string.packsize(fmt: string)
  -> integer
```


---

# string.rep


```lua
function string.rep(s: string|number, n: integer, sep?: string|number)
  -> string
```


---

# string.reverse


```lua
function string.reverse(s: string|number)
  -> string
```


---

# string.starts_with


```lua
function string.starts_with(str1: string, str2: string)
  -> boolean
```


---

# string.sub


```lua
function string.sub(s: string|number, i: integer, j?: integer)
  -> string
```


---

# string.unpack


```lua
function string.unpack(fmt: string, s: string, pos?: integer)
  -> ...any
```


---

# string.upper


```lua
function string.upper(s: string|number)
  -> string
```


---

# stringlib

## byte


```lua
function string.byte(s: string|number, i?: integer, j?: integer)
  -> ...integer
```


Returns the internal numeric codes of the characters `s[i], s[i+1], ..., s[j]`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.byte"])

## char


```lua
function string.char(byte: integer, ...integer)
  -> string
```


Returns a string with length equal to the number of arguments, in which each character has the internal numeric code equal to its corresponding argument.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.char"])

## dump


```lua
function string.dump(f: fun(...any):...unknown, strip?: boolean)
  -> string
```


Returns a string containing a binary representation (a *binary chunk*) of the given function.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.dump"])

## find


```lua
function string.find(s: string|number, pattern: string|number, init?: integer, plain?: boolean)
  -> start: integer|nil
  2. end: integer|nil
  3. ...any
```


Miss locale <string.find>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.find"])

@*return* `start`

@*return* `end`

@*return* `...` — captured

## format


```lua
function string.format(s: string|number, ...any)
  -> string
```


Returns a formatted version of its variable number of arguments following the description given in its first argument.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.format"])

## gmatch


```lua
function string.gmatch(s: string|number, pattern: string|number)
  -> fun():string, ...unknown
```


Miss locale <string.gmatch>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.gmatch"])

## gsub


```lua
function string.gsub(s: string|number, pattern: string|number, repl: string|number|function|table, n?: integer)
  -> string
  2. count: integer
```


Miss locale <string.gsub>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.gsub"])

## len


```lua
function string.len(s: string|number)
  -> integer
```


Returns its length.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.len"])

## lower


```lua
function string.lower(s: string|number)
  -> string
```


Returns a copy of this string with all uppercase letters changed to lowercase.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.lower"])

## match


```lua
function string.match(s: string|number, pattern: string|number, init?: integer)
  -> ...any
```


Miss locale <string.match>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.match"])

## pack


```lua
function string.pack(fmt: string, v1: string|number, v2?: string|number, ...string|number)
  -> binary: string
```


Miss locale <string.pack>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.pack"])

## packsize


```lua
function string.packsize(fmt: string)
  -> integer
```


Miss locale <string.packsize>

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.packsize"])

## rep


```lua
function string.rep(s: string|number, n: integer, sep?: string|number)
  -> string
```


Returns a string that is the concatenation of `n` copies of the string `s` separated by the string `sep`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.rep"])

## reverse


```lua
function string.reverse(s: string|number)
  -> string
```


Returns a string that is the string `s` reversed.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.reverse"])

## starts_with


```lua
function string.starts_with(str1: string, str2: string)
  -> boolean
```

## sub


```lua
function string.sub(s: string|number, i: integer, j?: integer)
  -> string
```


Returns the substring of the string that starts at `i` and continues until `j`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.sub"])

## unpack


```lua
function string.unpack(fmt: string, s: string, pos?: integer)
  -> ...any
```


Returns the values packed in string according to the format string `fmt` (see [§6.4.2](command:extension.lua.doc?["en-us/51/manual.html/6.4.2"])) .

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.unpack"])

## upper


```lua
function string.upper(s: string|number)
  -> string
```


Returns a copy of this string with all lowercase letters changed to uppercase.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.upper"])


---

# table


```lua
tablelib
```


---

# table


---

# table.concat


```lua
function table.concat(list: table, sep?: string, i?: integer, j?: integer)
  -> string
```


---

# table.copy


```lua
function table.copy(table: <T:table>)
  -> <T:table>
```


```lua
function table.copy(table: <T:table>)
  -> <T:table>
```


---

# table.foreach


```lua
function table.foreach(list: any, callback: fun(key: string, value: any):<T>|nil)
  -> <T>|nil
```


---

# table.foreachi


```lua
function table.foreachi(list: any, callback: fun(key: string, value: any):<T>|nil)
  -> <T>|nil
```


---

# table.getn


```lua
function table.getn(list: <T>[])
  -> integer
```


---

# table.indexof


```lua
function table.indexof(list: <V>[], val: <V>)
  -> integer
```


```lua
function table.indexof(list: <V>[], val: <V>)
  -> integer
```


---

# table.insert


```lua
function table.insert(list: table, pos: integer, value: any)
```


---

# table.insert_all


```lua
function table.insert_all(table: table, other_table: table)
```


```lua
function table.insert_all(table: table, other_table: table)
```


---

# table.key_value_swap


```lua
function table.key_value_swap(t: table<<K>, <V>>)
  -> table<<V>, <K>>
```


```lua
function table.key_value_swap(t: table<<K>, <V>>)
  -> table<<V>, <K>>
```


---

# table.keyof


```lua
function table.keyof(table: table<<K>, <V>>, val: <V>)
  -> <K>?
```


```lua
function table.keyof(table: table<<K>, <V>>, val: <V>)
  -> <K>?
```


---

# table.maxn


```lua
function table.maxn(table: table)
  -> integer
```


---

# table.move


```lua
function table.move(a1: table, f: integer, e: integer, t: integer, a2?: table)
  -> a2: table
```


---

# table.pack


```lua
function table.pack(...any)
  -> table
```


---

# table.remove


```lua
function table.remove(list: table, pos?: integer)
  -> any
```


---

# table.shuffle


```lua
function table.shuffle(table: table, from?: integer, to?: integer, random_func?: fun(min: integer, max: integer):integer)
```


```lua
function table.shuffle(table: table, from?: integer, to?: integer, random_func?: fun(min: integer, max: integer):integer)
```


---

# table.sort


```lua
function table.sort(list: <T>[], comp?: fun(a: <T>, b: <T>):boolean)
```


---

# table.unpack


```lua
function table.unpack(list: { [1]: <T1>, [2]: <T2>, [3]: <T3>, [4]: <T4>, [5]: <T5>, [6]: <T6>, [7]: <T7>, [8]: <T8>, [9]: <T9>, [10]: <T10> }, i?: integer, j?: integer)
  -> <T1>
  2. <T2>
  3. <T3>
  4. <T4>
  5. <T5>
  6. <T6>
  7. <T7>
  8. <T8>
  9. <T9>
 10. <T10>
```


---

# tablelib

## concat


```lua
function table.concat(list: table, sep?: string, i?: integer, j?: integer)
  -> string
```


Given a list where all elements are strings or numbers, returns the string `list[i]..sep..list[i+1] ··· sep..list[j]`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-table.concat"])

## copy


```lua
function table.copy(table: <T:table>)
  -> <T:table>
```

 * returns a deep copy of `table`

## foreach


```lua
function table.foreach(list: any, callback: fun(key: string, value: any):<T>|nil)
  -> <T>|nil
```


Executes the given f over all elements of table. For each element, f is called with the index and respective value as arguments. If f returns a non-nil value, then the loop is broken, and this value is returned as the final value of foreach.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-table.foreach"])

## foreachi


```lua
function table.foreachi(list: any, callback: fun(key: string, value: any):<T>|nil)
  -> <T>|nil
```


Executes the given f over the numerical indices of table. For each index, f is called with the index and respective value as arguments. Indices are visited in sequential order, from 1 to n, where n is the size of the table. If f returns a non-nil value, then the loop is broken and this value is returned as the result of foreachi.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-table.foreachi"])

## getn


```lua
function table.getn(list: <T>[])
  -> integer
```


Returns the number of elements in the table. This function is equivalent to `#list`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-table.getn"])

## indexof


```lua
function table.indexof(list: <V>[], val: <V>)
  -> integer
```

   the value `val` in the table `list`. Non-numerical indices are ignored.
   If `val` could not be found, `-1` is returned. `list` must not have
   negative indices.

## insert


```lua
function table.insert(list: table, pos: integer, value: any)
```


Inserts element `value` at position `pos` in `list`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-table.insert"])

## insert_all


```lua
function table.insert_all(table: table, other_table: table)
```

 * Appends all values in `other_table` to `table` - uses `#table + 1` to
   find new indices.

## key_value_swap


```lua
function table.key_value_swap(t: table<<K>, <V>>)
  -> table<<V>, <K>>
```

 * If multiple keys in `t` map to the same value, it is unspecified which
   value maps to that key.

## keyof


```lua
function table.keyof(table: table<<K>, <V>>, val: <V>)
  -> <K>?
```

   the value `val` in the table `table`. If multiple keys contain `val`,
   it is unspecified which key will be returned.
   If `val` could not be found, `nil` is returned.

## maxn


```lua
function table.maxn(table: table)
  -> integer
```


Returns the largest positive numerical index of the given table, or zero if the table has no positive numerical indices.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-table.maxn"])

## move


```lua
function table.move(a1: table, f: integer, e: integer, t: integer, a2?: table)
  -> a2: table
```


Moves elements from table `a1` to table `a2`.
```lua
a2[t],··· =
a1[f],···,a1[e]
return a2
```


[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-table.move"])

## pack


```lua
function table.pack(...any)
  -> table
```


Returns a new table with all arguments stored into keys `1`, `2`, etc. and with a field `"n"` with the total number of arguments.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-table.pack"])

## remove


```lua
function table.remove(list: table, pos?: integer)
  -> any
```


Removes from `list` the element at position `pos`, returning the value of the removed element.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-table.remove"])

## shuffle


```lua
function table.shuffle(table: table, from?: integer, to?: integer, random_func?: fun(min: integer, max: integer):integer)
```

 * Shuffles elements `from` to `to` in `table` in place
 * `from` defaults to `1`
 * `to` defaults to `#table`
 * `random_func` defaults to `math.random`. This function receives two
   integers as arguments and should return a random integer inclusively
   between them.

## sort


```lua
function table.sort(list: <T>[], comp?: fun(a: <T>, b: <T>):boolean)
```


Sorts list elements in a given order, *in-place*, from `list[1]` to `list[#list]`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-table.sort"])

## unpack


```lua
function table.unpack(list: { [1]: <T1>, [2]: <T2>, [3]: <T3>, [4]: <T4>, [5]: <T5>, [6]: <T6>, [7]: <T7>, [8]: <T8>, [9]: <T9>, [10]: <T10> }, i?: integer, j?: integer)
  -> <T1>
  2. <T2>
  3. <T3>
  4. <T4>
  5. <T5>
  6. <T6>
  7. <T7>
  8. <T8>
  9. <T9>
 10. <T10>
```


Returns the elements from the given list. This function is equivalent to
```lua
    return list[i], list[i+1], ···, list[j]
```
By default, `i` is `1` and `j` is `#list`.


[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-table.unpack"])


---

# thread


---

# tonumber


```lua
function tonumber(e: any)
  -> number?
```


---

# tostring


```lua
function tostring(v: any)
  -> string
```


---

# true


---

# type


---

# type


```lua
function type(v: any)
  -> type: "boolean"|"function"|"nil"|"number"|"string"...(+3)
```


---

# unknown


---

# unpack


```lua
function unpack(list: { [1]: <T1>, [2]: <T2>, [3]: <T3>, [4]: <T4>, [5]: <T5>, [6]: <T6>, [7]: <T7>, [8]: <T8>, [9]: <T9>, [10]: <T10> }, i?: integer, j?: integer)
  -> <T1>
  2. <T2>
  3. <T3>
  4. <T4>
  5. <T5>
  6. <T6>
  7. <T7>
  8. <T8>
  9. <T9>
 10. <T10>
```


```lua
function unpack(list: { [1]: <T1>, [2]: <T2>, [3]: <T3>, [4]: <T4>, [5]: <T5>, [6]: <T6>, [7]: <T7>, [8]: <T8>, [9]: <T9> })
  -> <T1>
  2. <T2>
  3. <T3>
  4. <T4>
  5. <T5>
  6. <T6>
  7. <T7>
  8. <T8>
  9. <T9>
```


---

# userdata


---

# vbuf


---

# vector


```lua
vector
```


```lua
vector
```


---

# vector

## add


```lua
function vector.add(v: vector.Vector, x: number|vector.Vector)
  -> vector.Vector
```

 * Returns a vector.
 * If `x` is a vector: Returns the sum of `v` and `x`.
 * If `x` is a number: Adds `x` to each component of `v`.

## dir_to_rotation


```lua
function vector.dir_to_rotation(direction: vector.Vector, up?: vector.Vector)
  -> vector.Vector
```

 * Returns a rotation vector for `direction` pointing forward using `up`
   as the up vector.
 * If `up` is omitted, the roll of the returned vector defaults to zero.
 * Otherwise `direction` and `up` need to be vectors in a 90 degree angle to each other.

## direction


```lua
function vector.direction(p1: vector.Vector, p2: vector.Vector)
  -> vector.Vector
```

 * Returns a vector of length 1 with direction `p1` to `p2`.
 * If `p1` and `p2` are identical, returns `(0, 0, 0)`.

## divide


```lua
function vector.divide(v: vector.Vector, s: number)
  -> vector.Vector
```

 * Returns a scaled vector.
 * Deprecated: If `s` is a vector: Returns the Schur quotient.

## from_string


```lua
function vector.from_string(s: string, init?: integer)
  -> vector.Vector|nil
  2. integer
```

@*param* `init` — If given starts looking for the vector at this string index

@*return* — integer = next position in the string after the vector

 * Returns `v, np`, where `v` is a vector read from the given string `s` and
   `np` is the next position in the string after the vector.
 * Returns `nil` on failure.
 * `s`: Has to begin with a substring of the form `"(x, y, z)"`. Additional
        spaces, leaving away commas and adding an additional comma to the end
        is allowed.
 * `init`: If given starts looking for the vector at this string index.

## in_area


```lua
function vector.in_area(pos: vector.Vector, min: vector.Vector, max: vector.Vector)
  -> boolean
```

 * Returns a boolean value indicating if `pos` is inside area formed by `min` and `max`.
 * `min` and `max` are inclusive.
 * If `min` is bigger than `max` on some axis, function always returns false.
 * You can use `vector.sort` if you have two vectors and don't know which are the minimum and the maximum.

## multiply


```lua
function vector.multiply(v: vector.Vector, s: number)
  -> vector.Vector
```

 * Returns a scaled vector.
 * Deprecated: If `s` is a vector: Returns the Schur product.

## new


```lua
function vector.new(x: number, y?: number, z?: number)
  -> vector.Vector
```

 * Returns a new vector `(a, b, c)`.
 * Deprecated: `vector.new()` does the same as `vector.zero()` and
   `vector.new(v)` does the same as `vector.copy(v)`

## random_in_area


```lua
function vector.random_in_area(min: vector.Vector, max: vector.Vector)
  -> vector.Vector
```

 * Returns a random integer position in area formed by `min` and `max`
 * `min` and `max` are inclusive.
 * You can use `vector.sort` if you have two vectors and don't know which are the minimum and the maximum.

## rotate


```lua
function vector.rotate(v: vector.Vector, r: vector.Vector)
  -> vector.Vector
```

 * Applies the rotation `r` to `v` and returns the result.
 * `vector.rotate(vector.new(0, 0, 1), r)` and
   `vector.rotate(vector.new(0, 1, 0), r)` return vectors pointing
   forward and up relative to an entity's rotation `r`.

## rotate_around_axis


```lua
function vector.rotate_around_axis(v1: vector.Vector, v2: vector.Vector, a: number)
  -> vector.Vector
```

 * Returns `v1` rotated around axis `v2` by `a` radians according to
   the right hand rule.

## subtract


```lua
function vector.subtract(v: vector.Vector, x: number|vector.Vector)
  -> vector.Vector
```

 * Returns a vector.
 * If `x` is a vector: Returns the difference of `v` subtracted by `x`.
 * If `x` is a number: Subtracts `x` from each component of `v`.

## to_string


```lua
function vector.to_string(v: vector.Vector)
  -> string
```

 * Returns a string of the form `"(x, y, z)"`.
 *  `tostring(v)` does the same.

## zero


```lua
function vector.zero()
  -> vector.Vector
```


---

# vector.Vector

## x


```lua
number
```


## y


```lua
number
```

## z


```lua
number
```


---

# vector.add


```lua
function vector.add(v: vector.Vector, x: number|vector.Vector)
  -> vector.Vector
```


```lua
function vector.add(v: vector.Vector, x: number|vector.Vector)
  -> vector.Vector
```


---

# vector.dir_to_rotation


```lua
function vector.dir_to_rotation(direction: vector.Vector, up?: vector.Vector)
  -> vector.Vector
```


```lua
function vector.dir_to_rotation(direction: vector.Vector, up?: vector.Vector)
  -> vector.Vector
```


---

# vector.direction


```lua
function vector.direction(p1: vector.Vector, p2: vector.Vector)
  -> vector.Vector
```


```lua
function vector.direction(p1: vector.Vector, p2: vector.Vector)
  -> vector.Vector
```


---

# vector.divide


```lua
function vector.divide(v: vector.Vector, s: number)
  -> vector.Vector
```


```lua
function vector.divide(v: vector.Vector, s: number)
  -> vector.Vector
```


---

# vector.from_string


```lua
function vector.from_string(s: string, init?: integer)
  -> vector.Vector|nil
  2. integer
```


```lua
function vector.from_string(s: string, init?: integer)
  -> vector.Vector|nil
  2. integer
```


---

# vector.in_area


```lua
function vector.in_area(pos: vector.Vector, min: vector.Vector, max: vector.Vector)
  -> boolean
```


```lua
function vector.in_area(pos: vector.Vector, min: vector.Vector, max: vector.Vector)
  -> boolean
```


---

# vector.multiply


```lua
function vector.multiply(v: vector.Vector, s: number)
  -> vector.Vector
```


```lua
function vector.multiply(v: vector.Vector, s: number)
  -> vector.Vector
```


---

# vector.new


```lua
function vector.new(x: number, y?: number, z?: number)
  -> vector.Vector
```


```lua
function vector.new(x: number, y?: number, z?: number)
  -> vector.Vector
```


---

# vector.random_in_area


```lua
function vector.random_in_area(min: vector.Vector, max: vector.Vector)
  -> vector.Vector
```


```lua
function vector.random_in_area(min: vector.Vector, max: vector.Vector)
  -> vector.Vector
```


---

# vector.rotate


```lua
function vector.rotate(v: vector.Vector, r: vector.Vector)
  -> vector.Vector
```


```lua
function vector.rotate(v: vector.Vector, r: vector.Vector)
  -> vector.Vector
```


---

# vector.rotate_around_axis


```lua
function vector.rotate_around_axis(v1: vector.Vector, v2: vector.Vector, a: number)
  -> vector.Vector
```


```lua
function vector.rotate_around_axis(v1: vector.Vector, v2: vector.Vector, a: number)
  -> vector.Vector
```


---

# vector.subtract


```lua
function vector.subtract(v: vector.Vector, x: number|vector.Vector)
  -> vector.Vector
```


```lua
function vector.subtract(v: vector.Vector, x: number|vector.Vector)
  -> vector.Vector
```


```lua
function vector.subtract(v: vector.Vector, x: number|vector.Vector)
  -> vector.Vector
```


```lua
function vector.subtract(v: vector.Vector, x: number|vector.Vector)
  -> vector.Vector
```


---

# vector.to_string


```lua
function vector.to_string(v: vector.Vector)
  -> string
```


```lua
function vector.to_string(v: vector.Vector)
  -> string
```


---

# vector.zero


```lua
function vector.zero()
  -> vector.Vector
```


---

# warn


```lua
function warn(message: string, ...any)
```


---

# xpcall


```lua
function xpcall(f: fun(...any):...unknown, msgh: function, arg1?: any, ...any)
  -> success: boolean
  2. result: any
  3. ...any
```