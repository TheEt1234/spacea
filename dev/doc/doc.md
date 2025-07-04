# ABMDef

## action


```lua
fun(pos: vector, node: MapNode|{ name: string, param1: number, param2: number }, active_object_count: number, active_object_count_wider: number):nil
```

 Function triggered for each qualifying node.
 `active_object_count` is number of active objects in the node's
 mapblock.
 `active_object_count_wider` is number of active objects in the node's
 mapblock plus all 26 neighboring mapblocks. If any neighboring
 mapblocks are unloaded an estimate is calculated for them based on
 loaded mapblocks.

## catch_up


```lua
boolean?
```

 If true, catch-up behavior is enabled: The `chance` value is
 temporarily reduced when returning to an area to simulate time lost
 by the area being unattended. Note that the `chance` value can often
 be reduced to 1.

## chance


```lua
number?
```

 Probability of triggering `action` per-node per-interval is 1.0 / chance (integers only)

## interval


```lua
number?
```

 Operation interval in seconds

## label


```lua
string?
```

 Descriptive label for profiling purposes (optional).
 Definitions with identical labels will be listed as one.

## max_y


```lua
number?
```

## min_y


```lua
number?
```

## neighbors


```lua
string[]?
```

 Only apply `action` to nodes that have one of, or any
 combination of, these neighbors.
 If left out or empty, any neighbor will do.
 `group:groupname` can also be used here.

## nodenames


```lua
string[]?
```

 Apply `action` function to these nodes.
 `group:groupname` can also be used here.

## without_neighbors


```lua
string[]?
```

 Only apply `action` to nodes that have no one of these neighbors.
 If left out or empty, it has no effect.
 `group:groupname` can also be used here.


---

# AreaStore

## from_file


```lua
(method) AreaStore:from_file(filename: string)
```

 * `from_file(filename)`: Experimental. Like `from_string()`, but reads the data
   from a file.

## from_string


```lua
(method) AreaStore:from_string(str: string)
```

 * `from_string(str)`: Experimental. Deserializes string and loads it into the
   AreaStore.
   Returns success and, optionally, an error message.

## get_area


```lua
(method) AreaStore:get_area(id: number, include_corners: boolean, include_data: boolean)
  -> boolean|{ min: vector?, max: vector?, data: string? }
```

 * `get_area(id, include_corners, include_data)`
     * Returns the area information about the specified ID.
     * Returned values are either of these:
       ```lua
       nil  -- Area not found
       true -- Without `include_corners` and `include_data`
       {
           min = pos, max = pos -- `include_corners == true`
           data = string        -- `include_data == true`
       }
       ```

## get_areas_for_pos


```lua
(method) AreaStore:get_areas_for_pos(pos: vector, include_corners: boolean, include_data: boolean)
  -> boolean|table<integer, { min: vector?, max: vector?, data: string? }>
```

 * `get_areas_for_pos(pos, include_corners, include_data)`
     * Returns all areas as table, indexed by the area ID.
     * Table values: see `get_area`.

## get_areas_in_area


```lua
(method) AreaStore:get_areas_in_area(pos1: vector, pos2: vector, accept_overlap: boolean, include_corners: boolean, include_data: boolean)
  -> boolean|table<integer, { min: vector?, max: vector?, data: string? }>
```

 * `get_areas_in_area(corner1, corner2, accept_overlap, include_corners, include_data)`
     * Returns all areas that contain all nodes inside the area specified by`
       `corner1 and `corner2` (inclusive).
     * `accept_overlap`: if `true`, areas are returned that have nodes in
       common (intersect) with the specified area.
     * Returns the same values as `get_areas_for_pos`.

## insert_area


```lua
(method) AreaStore:insert_area(corner1: vector, corner2: vector, data: string, id?: integer)
  -> integer?
```

 * `insert_area(corner1, corner2, data, [id])`: inserts an area into the store.
     * Returns the new area's ID, or nil if the insertion failed.
     * The (inclusive) positions `corner1` and `corner2` describe the area.
     * `data` is a string stored with the area.
     * `id` (optional): will be used as the internal area ID if it is a unique
       number between 0 and 2^32-2.

## remove_area


```lua
(method) AreaStore:remove_area(id: number)
  -> boolean
```

 * `remove_area(id)`: removes the area with the given id from the store, returns
   success.

## reserve


```lua
(method) AreaStore:reserve(count: integer)
```

 * `reserve(count)`
     * Requires SpatialIndex, no-op function otherwise.
     * Reserves resources for `count` many contained areas to improve
       efficiency when working with many area entries. Additional areas can still
       be inserted afterwards at the usual complexity.

## set_cache_params


```lua
(method) AreaStore:set_cache_params(params: { enabled: boolean, block_radius: integer, limit: integer })
```

 * `set_cache_params(params)`: sets params for the included prefiltering cache.
   Calling invalidates the cache, so that its elements have to be newly
   generated.
     * `params` is a table with the following fields:
       ```lua
       {
           enabled = boolean,   -- Whether to enable, default true
           block_radius = int,  -- The radius (in nodes) of the areas the cache
                                -- generates prefiltered lists for, minimum 16,
                                -- default 64
           limit = int,         -- The cache size, minimum 20, default 1000
       }
       ```

## to_file


```lua
(method) AreaStore:to_file(filename: string)
```

 * `to_file(filename)`: Experimental. Like `to_string()`, but writes the data to
   a file.

## to_string


```lua
(method) AreaStore:to_string()
  -> string
```

 * `to_string()`: Experimental. Returns area store serialized as a (binary)
   string.


---

# AreaStore


```lua
AreaStore
```


```lua
function AreaStore(type: any)
  -> AreaStore
```


---

# AreaStore.from_file


```lua
(method) AreaStore:from_file(filename: string)
```


---

# AreaStore.from_string


```lua
(method) AreaStore:from_string(str: string)
```


---

# AreaStore.get_area


```lua
(method) AreaStore:get_area(id: number, include_corners: boolean, include_data: boolean)
  -> boolean|{ min: vector?, max: vector?, data: string? }
```


---

# AreaStore.get_areas_for_pos


```lua
(method) AreaStore:get_areas_for_pos(pos: vector, include_corners: boolean, include_data: boolean)
  -> boolean|table<integer, { min: vector?, max: vector?, data: string? }>
```


---

# AreaStore.get_areas_in_area


```lua
(method) AreaStore:get_areas_in_area(pos1: vector, pos2: vector, accept_overlap: boolean, include_corners: boolean, include_data: boolean)
  -> boolean|table<integer, { min: vector?, max: vector?, data: string? }>
```


---

# AreaStore.insert_area


```lua
(method) AreaStore:insert_area(corner1: vector, corner2: vector, data: string, id?: integer)
  -> integer?
```


---

# AreaStore.remove_area


```lua
(method) AreaStore:remove_area(id: number)
  -> boolean
```


---

# AreaStore.reserve


```lua
(method) AreaStore:reserve(count: integer)
```


---

# AreaStore.set_cache_params


```lua
(method) AreaStore:set_cache_params(params: { enabled: boolean, block_radius: integer, limit: integer })
```


---

# AreaStore.to_file


```lua
(method) AreaStore:to_file(filename: string)
```


---

# AreaStore.to_string


```lua
(method) AreaStore:to_string()
  -> string
```


---

# BiomeDef

## depth_filler


```lua
integer?
```

 Node forming lower layer of biome and thickness of this layer

## depth_riverbed


```lua
integer?
```

 Node placed under river water and thickness of this layer

## depth_top


```lua
integer?
```

 Node forming surface layer of biome and thickness of this layer

## depth_water_top


```lua
integer?
```

 Node forming a surface layer in seawater with the defined thickness

## heat_point


```lua
number
```

 Characteristic temperature and humidity for the biome.
 These values create 'biome points' on a voronoi diagram with heat and
 humidity as axes. The resulting voronoi cells determine the
 distribution of the biomes.
 Heat and humidity have average values of 50, vary mostly between
 0 and 100 but can exceed these values.

## humidity_point


```lua
number
```

 Characteristic temperature and humidity for the biome.
 These values create 'biome points' on a voronoi diagram with heat and
 humidity as axes. The resulting voronoi cells determine the
 distribution of the biomes.
 Heat and humidity have average values of 50, vary mostly between
 0 and 100 but can exceed these values.

## max_pos


```lua
vector?
```

 xyz limits for biome, an alternative to using 'y_min' and 'y_max'.
 Biome is limited to a cuboid defined by these positions.
 Any x, y or z field left undefined defaults to -31000 in 'min_pos' or
 31000 in 'max_pos'.

## min_pos


```lua
vector?
```

 xyz limits for biome, an alternative to using 'y_min' and 'y_max'.
 Biome is limited to a cuboid defined by these positions.
 Any x, y or z field left undefined defaults to -31000 in 'min_pos' or
 31000 in 'max_pos'.

## name


```lua
string
```

## node_cave_liquid


```lua
(string|string[])?
```

 Nodes placed inside 50% of the medium size caves.
 Multiple nodes can be specified, each cave will use a randomly
 chosen node from the list.
 If this field is left out or 'nil', cave liquids fall back to
 classic behavior of lava and water distributed using 3D noise.
 For no cave liquid, specify "air".

## node_dungeon


```lua
string?
```

 Node used for primary dungeon structure.
 If absent, dungeon nodes fall back to the 'mapgen_cobble' mapgen
 alias, if that is also absent, dungeon nodes fall back to the biome
 'node_stone'.
 If present, the following two nodes are also used.

## node_dungeon_alt


```lua
string?
```

 Node used for randomly-distributed alternative structure nodes.
 If alternative structure nodes are not wanted leave this absent.

## node_dungeon_stair


```lua
string?
```

 Node used for dungeon stairs.
 If absent, stairs fall back to 'node_dungeon'.

## node_dust


```lua
string?
```

 Node dropped onto upper surface after all else is generated

## node_filler


```lua
string?
```

 Node forming lower layer of biome

## node_river_water


```lua
string?
```

 Node that replaces river water in mapgens that use
 default:river_water

## node_riverbed


```lua
string?
```

 Node placed under river water and thickness of this layer

## node_stone


```lua
string?
```

 Node that replaces all stone nodes between roughly y_min and y_max.

## node_top


```lua
string?
```

 Node forming surface layer of biome

## node_water


```lua
string?
```

 Node that replaces all seawater nodes not in the surface layer

## node_water_top


```lua
string?
```

 Node forming a surface layer in seawater with the defined thickness

## vertical_blend


```lua
number?
```

 Vertical distance in nodes above 'y_max' over which the biome will
 blend with the biome above.
 Set to 0 for no vertical blend. Defaults to 0.

## weight


```lua
number?
```

 Relative weight of the biome in the Voronoi diagram.
 A value of 0 (or less) is ignored and equivalent to 1.0.

## y_max


```lua
integer?
```

## y_min


```lua
integer?
```


---

# Box


---

# Box_single


---

# ChatCommandDef

## description


```lua
string
```

## func


```lua
fun(name: string, param: string):boolean, string
```

## params


```lua
string
```

 Note that in params, the conventional use of symbols is as follows:

 * `<>` signifies a placeholder to be replaced when the command is used. For
   example, when a player name is needed: `<name>`
 * `[]` signifies param is optional and not required when the command is used.
   For example, if you require param1 but param2 is optional:
   `<param1> [<param2>]`
 * `|` signifies exclusive or. The command requires one param from the options
   provided. For example: `<param1> | <param2>`
 * `()` signifies grouping. For example, when param1 and param2 are both
   required, or only param3 is required: `(<param1> <param2>) | <param3>`

## privs


```lua
table<string, boolean>
```


---

# ColorSpec


---

# ColorString

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

## split


```lua
function string.split(str: string, separator: string, include_empty?: boolean, max_splits?: integer, sep_is_pattern?: boolean)
  -> string[]
```

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

# CraftRecipe

## additional_wear


```lua
number?
```

 ### Tool repair

 Syntax:

     {
         type = "toolrepair",
         additional_wear = -0.02, -- multiplier of 65536
     }

 Adds a shapeless recipe for *every* tool that doesn't have the `disable_repair=1`
 group. If this recipe is used, repairing is possible with any crafting grid
 with at least 2 slots.
 The player can put 2 equal tools in the craft grid to get one "repaired" tool
 back.
 The wear of the output is determined by the wear of both tools, plus a
 'repair bonus' given by `additional_wear`. To reduce the wear (i.e. 'repair'),
 you want `additional_wear` to be negative.

 The formula used to calculate the resulting wear is:

     65536 * (1 - ( (1 - tool_1_wear) + (1 - tool_2_wear) + additional_wear))

 The result is rounded and can't be lower than 0. If the result is 65536 or higher,
 no crafting is possible.

## cooktime


```lua
number?
```

## output


```lua
(string|table|ItemStack)?
```

## recipe


```lua
(string|table|ItemStack[]|string|table|ItemStack[][])?
```

## replacements


```lua
{ [1]: string|table|ItemStack, [2]: string|table|ItemStack }[]?
```

 * `replacements`: (optional) Allows you to replace input items with some other items
       when something is crafted
     * Provided as a list of item pairs of the form `{ old_item, new_item }` where
       `old_item` is the input item to replace (same syntax as for a regular input
       slot; groups are allowed) and `new_item` is an itemstring for the item stack
       it will become
     * When the output is crafted, Luanti iterates through the list
       of input items if the crafting grid. For each input item stack, it checks if
       it matches with an `old_item` in the item pair list.
         * If it matches, the item will be replaced. Also, this item pair
           will *not* be applied again for the remaining items
         * If it does not match, the item is consumed (reduced by 1) normally
     * The `new_item` will appear in one of 3 places:
         * Crafting grid, if the input stack size was exactly 1
         * Player inventory, if input stack size was larger
         * Drops as item entity, if it fits neither in craft grid or inventory

## type


```lua
"cooking"|"fuel"|"shaped"|"shapeless"|"toolrepair"
```


---

# DecorationDef

## biomes


```lua
(string|string[])?
```

 List of biomes in which this decoration occurs. Occurs in all biomes
 if this is omitted, and ignored if the Mapgen being used does not
 support biomes.
 Can be a list of (or a single) biome names, IDs, or definitions.

## check_offset


```lua
integer?
```

 Specifies the offset that spawn_by should also check
 The default value of -1 is useful to e.g check for water next to the base node.
 0 disables additional checks, valid values: {-1, 0, 1}

## deco_type


```lua
"lsystem"|"schematic"|"simple"
```

 Type. "simple", "schematic" or "lsystem" supported

## decoration


```lua
string?
```

 ### Type: "simple"
 The node name used as the decoration.
 If instead a list of strings, a randomly selected node from the list
 is placed as the decoration.

## fill_ratio


```lua
number?
```

 The value determines 'decorations per surface node'.
 Used only if noise_params is not specified.
 If >= 10.0 complete coverage is enabled and decoration placement uses
 a different and much faster method.

## flags


```lua
string?
```

 Flags for all decoration types.
 "liquid_surface": Find the highest liquid (not solid) surface under
   open air. Search stops and fails on the first solid node.
   Cannot be used with "all_floors" or "all_ceilings" below.
 "force_placement": Nodes other than "air" and "ignore" are replaced
   by the decoration.
 "all_floors", "all_ceilings": Instead of placement on the highest
   surface in a mapchunk the decoration is placed on all floor and/or
   ceiling surfaces, for example in caves and dungeons.
   Ceiling decorations act as an inversion of floor decorations so the
   effect of 'place_offset_y' is inverted.
   Y-slice probabilities do not function correctly for ceiling
   schematic decorations as the behavior is unchanged.
   If a single decoration registration has both flags the floor and
   ceiling decorations will be aligned vertically.
 ### Unofficial note: you can also fit schematic flags here i think

## height


```lua
number?
```

 ### Type: "simple"
 Decoration height in nodes.
 If height_max is not 0, this is the lower limit of a randomly
 selected height.

## height_max


```lua
number?
```

 ### Type: "simple"
 Upper limit of the randomly selected height.
 If absent, the parameter 'height' is used as a constant.

## noise_params


```lua
NoiseParams
```

 NoiseParams structure describing the noise used for decoration
 distribution.
 A noise value is calculated for each square division and determines
 'decorations per surface node' within each division.
 If the noise value >= 10.0 complete coverage is enabled and
 decoration placement uses a different and much faster method.

## num_spawn_by


```lua
integer?
```

 Number of spawn_by nodes that must be surrounding the decoration
 position to occur.
 If absent or -1, decorations occur next to any nodes.

## param2


```lua
integer?
```

 ### Type: "simple"
 Param2 value of decoration nodes.
 If param2_max is not 0, this is the lower limit of a randomly
 selected param2.

## param2_max


```lua
integer?
```

 ### Type: "simple"
 Upper limit of the randomly selected param2.
 If absent, the parameter 'param2' is used as a constant.

## place_offset_y


```lua
number?
```

 ### Type: "simple" and "schematic"
 Y offset of the decoration base node relative to the standard base
 node position.
 Can be positive or negative. Default is 0.
 Effect is inverted for "all_ceilings" decorations.
 Ignored by 'y_min', 'y_max' and 'spawn_by' checks, which always refer
 to the 'place_on' node.

## place_on


```lua
(string|string[])?
```

 Node (or list of nodes) that the decoration can be placed on

## replacements


```lua
table<string, string>?
```

 ### Type: "schematic"
 Map of node names to replace in the schematic after reading it.

## rotation


```lua
string?
```

 ### Type: "schematic"
 Rotation can be "0", "90", "180", "270", or "random"

## schematic


```lua
(string|table)?
```

 ### Type: "schematic"
 If schematic is a string, it is the filepath relative to the current
 working directory of the specified Luanti schematic file.
 Could also be the ID of a previously registered schematic.

## sidelen


```lua
{ x: number, z: number }?
```

 Size of the square (X / Z) divisions of the mapchunk being generated.
 Determines the resolution of noise variation if used.
 If the chunk size is not evenly divisible by sidelen, sidelen is made
 equal to the chunk size.

## spawn_by


```lua
integer?
```

 Node (or list of nodes) that the decoration only spawns next to.
 Checks the 8 neighboring nodes on the same height,
 and also the ones at the height plus the check_offset, excluding both center nodes.

## treedef


```lua
lsystem?
```

-- L-system-type parameters
 Same as for `core.spawn_tree`.
 See section [L-system trees] for more details.

## y_max


```lua
integer?
```

## y_min


```lua
integer?
```


---

# EntityDef

## get_staticdata


```lua
fun(self: luaentity)
```

## initial_properties


```lua
ObjectProps
```

## name


```lua
string
```

## object


```lua
ObjectRef
```

 `ObjectRef`
 -----------

 Moving things in the game are generally these.
 This is basically a reference to a C++ `ServerActiveObject`.

 ### Advice on handling `ObjectRefs`

 When you receive an `ObjectRef` as a callback argument or from another API
 function, it is possible to store the reference somewhere and keep it around.
 It will keep functioning until the object is unloaded or removed.

 However, doing this is **NOT** recommended - `ObjectRefs` should be "let go"
 of as soon as control is returned from Lua back to the engine.

 Doing so is much less error-prone and you will never need to wonder if the
 object you are working with still exists.

 If this is not feasible, you can test whether an `ObjectRef` is still valid
 via `object:is_valid()`.

 Getters may be called for invalid objects and will return nothing then.
 All other methods should not be called on invalid objects.

 ### Attachments

 It is possible to attach objects to other objects (`set_attach` method).

 When an object is attached, it is positioned relative to the parent's position
 and rotation. `get_pos` and `get_rotation` will always return the parent's
 values and changes via their setter counterparts are ignored.

 To change position or rotation call `set_attach` again with the new values.

 **Note**: Just like model dimensions, the relative position in `set_attach`
 must be multiplied by 10 compared to world positions.

 It is also possible to attach to a bone of the parent object. In that case the
 child will follow movement and rotation of that bone.


## on_activate


```lua
fun(self: luaentity, staticdata: string, dtime_s: number)
```

## on_attach_child


```lua
fun(self: luaentity, child: ObjectRef)
```

## on_deactivate


```lua
fun(self: luaentity, removal: boolean)
```

 * `on_deactivate(self, removal)`
     * Called when the object is about to get removed or unloaded.
     * `removal`: boolean indicating whether the object is about to get removed.
       Calling `object:remove()` on an active object will call this with `removal=true`.
       The mapblock the entity resides in being unloaded will call this with `removal=false`.
     * Note that this won't be called if the object hasn't been activated in the first place.
       In particular, `core.clear_objects({mode = "full"})` won't call this,
       whereas `core.clear_objects({mode = "quick"})` might call this.

## on_death


```lua
fun(self: luaentity, killer?: ObjectRef)
```

## on_detach


```lua
fun(self: luaentity, parent: ObjectRef)
```

## on_detach_child


```lua
fun(self: luaentity, child: ObjectRef)
```

## on_punch


```lua
fun(self: luaentity, puncher?: ObjectRef, time_from_last_punch?: number, tool_capabilities?: tool_capabilities, dir: vector, damage: number):boolean
```

## on_rightclick


```lua
fun(self: luaentity, clicker: ObjectRef)
```

## on_step


```lua
fun(self: luaentity, dtime: number, moveresult: moveresult)
```


---

# Functional

## curry


```lua
function Functional.curry(f: any, ...any)
  -> function
```

## math


```lua
table
```


---

# HTTPApiTable

## fetch


```lua
fun(req: HTTPRequest, callback: fun(res: HTTPRequestResult):nil):nil
```

 * `HTTPApiTable.fetch(HTTPRequest req, callback)`
     * Performs given request asynchronously and calls callback upon completion
     * callback: `function(HTTPRequestResult res)`
     * Use this HTTP function if you are unsure, the others are for advanced use

## fetch_async


```lua
fun(req: HTTPRequest):HTTP_async_handle
```

 * `HTTPApiTable.fetch_async(HTTPRequest req)`: returns handle
     * Performs given request asynchronously and returns handle for
       `HTTPApiTable.fetch_async_get`

## fetch_async_get


```lua
fun(handle: HTTP_async_handle):HTTPRequestResult
```


---

# HTTPRequest

## data


```lua
(string|table<string, string>)?
```

 Data for the POST, PUT, PATCH or DELETE request.
 Accepts both a string and a table. If a table is specified, encodes
 table as x-www-form-urlencoded key-value pairs.

## extra_headers


```lua
string[]?
```

 Optional, if specified adds additional headers to the HTTP request.
 You must make sure that the header strings follow HTTP specification
 ("Key: Value").

## method


```lua
("DELETE"|"GET"|"HEAD"|"PATCH"|"POST"...(+1))?
```

 The http method to use. Defaults to "GET".

## multipart


```lua
boolean?
```

 Optional, if true performs a multipart HTTP request.
 Default is false.
 Not allowed for GET or HEAD method and `data` must be a table.

## timeout


```lua
number?
```

 Timeout for request to be completed in seconds. Default depends on engine settings.

## url


```lua
string?
```

## user_agent


```lua
string?
```

 Optional, if specified replaces the default Luanti user agent with
 given string.


---

# HTTPRequestResult

## code


```lua
number?
```

 HTTP status code

## completed


```lua
boolean?
```

 If true, the request has finished (either succeeded, failed or timed
 out)

## data


```lua
string?
```

 Response body

## succeeded


```lua
boolean?
```

 If true, the request was successful

## timeout


```lua
boolean?
```

 If true, the request timed out


---

# HTTP_async_handle


---

# HudDef

## alignment


```lua
{ x: number, y: number }?
```

## direction


```lua
number?
```

## item


```lua
number?
```

peak luanti naming

## name


```lua
string
```

## number


```lua
number?
```

## offset


```lua
{ x: number, y: number }?
```

## position


```lua
{ x: number, y: number }
```

 Top left corner position of element

## scale


```lua
{ x: number, y: number }?
```

## size


```lua
{ x: number, y: number }?
```

## style


```lua
number?
```

## text


```lua
string?
```

## text2


```lua
string?
```

peak luanti naming

## type


```lua
"compass"|"hotbar"|"image"|"image_waypoint"|"inventory"...(+4)
```

 Type of element, can be "compass", "hotbar" (46 ¹), "image", "image_waypoint",
 "inventory", "minimap" (44 ¹), "statbar", "text" or "waypoint"
 ¹: minimal protocol version for client-side support
 If undefined "text" will be used.

## world_pos


```lua
vector?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## z_index


```lua
number
```


---

# HudID


---

# InvList


---

# InvRef

## add_item


```lua
fun(listname: string, stack: string|table|ItemStack)
```

 * `add_item(listname, stack)`: add item somewhere in list, returns leftover
   `ItemStack`.

## contains_item


```lua
fun(listname: string, stack: string|table|ItemStack, match_meta?: boolean)
```

 * `contains_item(listname, stack, [match_meta])`: returns `true` if
   the stack of items can be fully taken from the list.
     * If `match_meta` is `true`, item metadata is also considered when comparing
       items. Otherwise, only the items names are compared. Default: `false`
     * The method ignores wear.

## get_list


```lua
fun(listname: string):ItemStack[]
```

 * `get_list(listname)`: returns full list (list of `ItemStack`s)
                         or `nil` if list doesn't exist (size 0)

## get_lists


```lua
fun():table<string, ItemStack[]>
```

 * `get_lists()`: returns table that maps listnames to inventory lists

## get_location


```lua
fun():inventory_location
```

 * `get_location()`: returns a location compatible to
   `core.get_inventory(location)`.
     * returns `{type="undefined"}` in case location is not known

## get_size


```lua
fun(listname: string):number
```

 * `get_size(listname)`: get size of a list

## get_stack


```lua
fun(listname: string, i: integer)
```

 * `get_stack(listname, i)`: get a copy of stack index `i` in list

## get_width


```lua
fun(listname: string):integer
```

 * `get_width(listname)`: get width of a list

## is_empty


```lua
fun(listname: string):boolean
```

 * `is_empty(listname)`: return `true` if list is empty

## remove_item


```lua
fun(listname: string, stack: string|table|ItemStack, match_meta?: boolean)
```

 * `remove_item(listname, stack, [match_meta])`: take as many items as specified from the
   list, returns the items that were actually removed (as an `ItemStack`).
     * If `match_meta` is `true` (available since feature `remove_item_match_meta`),
       item metadata is also considered when comparing items. Otherwise, only the
       items names are compared. Default: `false`
     * The method ignores wear.

## room_for_item


```lua
fun(listname: string, stack: string|table|ItemStack):boolean
```

 * `room_for_item(listname, stack):` returns `true` if the stack of items
   can be fully added to the list

## set_list


```lua
fun(listname: string, list: ItemStack[])
```

 * `set_list(listname, list)`: set full list (size will not change)

## set_lists


```lua
fun(lists: table<string, ItemStack[]>)
```

 * `set_lists(lists)`: sets inventory lists (size will not change)

## set_size


```lua
fun(listname: string, size: integer):boolean
```

 * `set_size(listname, size)`: set size of a list
     * If `listname` is not known, a new list will be created
     * Setting `size` to 0 deletes a list
     * returns `false` on error (e.g. invalid `listname` or `size`)

## set_stack


```lua
fun(listname: string, i: integer, stack: string|table|ItemStack)
```

 * `set_stack(listname, i, stack)`: copy `stack` to index `i` in list

## set_width


```lua
fun(listname: string, width: integer)
```

 * `set_width(listname, width)`: set width of list; currently used for crafting
     * returns `false` on error (e.g. invalid `listname` or `width`)


---

# InvTable


---

# ItemDef

## after_use


```lua
fun(itemstack: ItemStack, user?: PlayerRef, node: MapNode|{ name: string, param1: number, param2: number }, digparams: table)?
```

 default: nil
 If defined, should return an itemstack and will be called instead of
 wearing out the item (if tool). If returnskk nil, does nothing.
 If after_use doesn't exist, it is the same as:
   function(itemstack, user, node, digparams)
     itemstack:add_wear(digparams.wear)
     return itemstack
   end
 The user may be any ObjectRef or nil.

## color


```lua
ColorSpec?
```

 Color the item is colorized with. The palette overrides this.

## description


```lua
string
```

 Can contain new lines. "\n" has to be used as new line character.
 See also: `get_description` in [`ItemStack`]

## groups


```lua
table<string, integer>
```

 key = name, value = rating; rating = <number>.
 If rating not applicable, use 1.
 e.g. {wool = 1, fluffy = 3}
      {soil = 2, outerspace = 1, crumbly = 1}
      {bendy = 2, snappy = 1},
      {hard = 1, metal = 1, spikes = 1}

## inventory_image


```lua
string?
```

 Texture shown in the inventory GUI
 Defaults to a 3D rendering of the node if left empty.

## inventory_overlay


```lua
string?
```

 An overlay texture which is not affected by colorization

## light_source


```lua
integer?
```

 When used for nodes: Defines amount of light emitted by node.
 Otherwise: Defines texture glow when viewed as a dropped item
 To set the maximum (14), use the value 'core.LIGHT_MAX'.
 A value outside the range 0 to core.LIGHT_MAX causes undefined
 behavior.

## liquids_pointable


```lua
boolean?
```

 If true, item can point to all liquid nodes (`liquidtype ~= "none"`),
 even those for which `pointable = false`

## node_dig_prediction


```lua
string?
```

 if "", no prediction is made.
 if "air", node is removed.
 Otherwise should be name of node which the client immediately places
 upon digging. Server will always update with actual result shortly.

## node_placement_prediction


```lua
string?
```

 If nil and item is node, prediction is made automatically.
 If nil and item is not a node, no prediction is made.
 If "" and item is anything, no prediction is made.
 Otherwise should be name of node which the client immediately places
 on ground when the player places the item. Server will always update
 with actual result shortly.

## on_drop


```lua
fun(itemstack: ItemStack, dropper: PlayerRef, pos: vector)?
```

 Shall drop item and return the leftover itemstack.
 The dropper may be any ObjectRef or nil.
 default: core.item_drop

## on_pickup


```lua
fun(itemstack: ItemStack, picker: PlayerRef, pointed_thing: pointed_thing, time_from_last_punch: number, ...any):ItemStack??
```

 Called when a dropped item is punched by a player.
 Shall pick-up the item and return the leftover itemstack or nil to not
 modify the dropped item.
 Parameters:
 * `itemstack`: The `ItemStack` to be picked up.
 * `picker`: Any `ObjectRef` or `nil`.
 * `pointed_thing` (optional): The dropped item (a `"__builtin:item"`
   luaentity) as `type="object"` `pointed_thing`.
 * `time_from_last_punch, ...` (optional): Other parameters from
   `luaentity:on_punch`.
 default: `core.item_pickup`

## on_place


```lua
fun(itemstack: ItemStack, placer: PlayerRef, pointed_thing: pointed_thing):ItemStack??
```

 When the 'place' key was pressed with the item in hand
 and a node was pointed at.
 Shall place item and return the leftover itemstack
 or nil to not modify the inventory.
 The placer may be any ObjectRef or nil.
 default: core.item_place

## on_secondary_use


```lua
fun(itemstack: ItemStack, user: PlayerRef, pointed_thing: pointed_thing)?
```

 Same as on_place but called when not pointing at a node.
 Function must return either nil if inventory shall not be modified,
 or an itemstack to replace the original itemstack.
 The user may be any ObjectRef or nil.
 default: nil

## on_use


```lua
fun(itemstack: ItemStack, user?: PlayerRef, pointed_thing: pointed_thing)?
```

 default: nil
 When user pressed the 'punch/mine' key with the item in hand.
 Function must return either nil if inventory shall not be modified,
 or an itemstack to replace the original itemstack.
 e.g. itemstack:take_item(); return itemstack
 Otherwise, the function is free to do what it wants.
 The user may be any ObjectRef or nil.
 The default functions handle regular use cases.

## palette


```lua
string?
```

 An image file containing the palette of a node.
 You can set the currently used color as the "palette_index" field of
 the item stack metadata.
 The palette is always stretched to fit indices between 0 and 255, to
 ensure compatibility with "colorfacedir" (and similar) nodes.

## pointabilities


```lua
{ nodes: table<string, boolean|"blocking">, objects: table<string, boolean|"blocking"> }
```

 Contains lists to override the `pointable` property of nodes and objects.
 The index can be a node/entity name or a group with the prefix `"group:"`.
 (For objects `armor_groups` are used and for players the entity name is irrelevant.)
 If multiple fields fit, the following priority order is applied:
 1. value of matching node/entity name
 2. `true` for any group
 3. `false` for any group
 4. `"blocking"` for any group
 5. `liquids_pointable` if it is a liquid node
 6. `pointable` property of the node or object

## range


```lua
number?
```

 Range of node and object pointing that is possible with this item held
 Can be overridden with itemstack meta.

## short_description


```lua
string?
```

 Must not contain new lines.
 Defaults to nil.
 Use an [`ItemStack`] to get the short description, e.g.:
   ItemStack(itemname):get_short_description()

## sound


```lua
{ breaks: SimpleSoundSpec?, eat: SimpleSoundSpec?, punch_use: SimpleSoundSpec?, punch_use_dir: SimpleSoundSpec? }
```

## stack_max


```lua
integer?
```

 Maximum amount of items that can be in a single stack.
 The default can be changed by the setting `default_stack_max`

## tool_capabilities


```lua
tool_capabilities?
```

 See "Tool Capabilities" section for an example including explanation

## touch_interaction


```lua
"long_dig_short_place"|"short_dig_long_place"|"user"|{ pointed_nothing: "long_dig_short_place"|"short_dig_long_place"|"user", pointed_node: "long_dig_short_place"|"short_dig_long_place"|"user", pointed_object: "long_dig_short_place"|"short_dig_long_place"|"user" }
```

 Only affects touchscreen clients.
 Defines the meaning of short and long taps with the item in hand.
 If specified as a table, the field to be used is selected according to
 the current `pointed_thing`.
 There are three possible TouchInteractionMode values:
 * "long_dig_short_place" (long tap  = dig, short tap = place)
 * "short_dig_long_place" (short tap = dig, long tap  = place)
 * "user":
   * For `pointed_object`: Equivalent to "short_dig_long_place" if the
     client-side setting "touch_punch_gesture" is "short_tap" (the
     default value) and the item is able to punch (i.e. has no on_use
     callback defined).
     Equivalent to "long_dig_short_place" otherwise.
   * For `pointed_node` and `pointed_nothing`:
     Equivalent to "long_dig_short_place".
   * The behavior of "user" may change in the future.
 The default value is "user".

## wear_color


```lua
wear_bar_params?
```

 Set wear bar color of the tool by setting color stops and blend mode
 See "Wear Bar Color" section for further explanation including an example

## wield_image


```lua
string?
```

 Texture shown when item is held in hand
 Defaults to a 3D rendering of the node if left empty.

## wield_overlay


```lua
string?
```

 Like inventory_overlay but only used in the same situation as wield_image

## wield_scale


```lua
vector?
```

 Scale for the item when held in hand


---

# ItemStack

## add_item


```lua
fun(item: string|table|ItemStack)
```

 * `add_item(item)`: returns leftover `ItemStack`
     * Put some item or stack onto this stack

## add_wear


```lua
fun(amount: integer)
```

 * `add_wear(amount)`
     * Increases wear by `amount` if the item is a tool, otherwise does nothing
     * Valid `amount` range is [0,65536]
     * `amount`: number, integer

## add_wear_by_uses


```lua
fun(max_uses: integer)
```

 * `add_wear_by_uses(max_uses)`
     * Increases wear in such a way that, if only this function is called,
       the item breaks after `max_uses` times
     * Valid `max_uses` range is [0,65536]
     * Does nothing if item is not a tool or if `max_uses` is 0

## clear


```lua
fun()
```

 * `clear()`: removes all items from the stack, making it empty.

## equals


```lua
fun(other: any):boolean
```

 * `equals(other)`:
 * returns `true` if this stack is identical to `other`.
 * Note: `stack1:to_string() == stack2:to_string()` is not reliable,
   as stack metadata can be serialized in arbitrary order.
 * Note: if `other` is an itemstring or table representation of an
   ItemStack, this will always return false, even if it is
   "equivalent".

## get_count


```lua
fun():integer
```

 * `get_count()`: Returns number of items on the stack.

## get_definition


```lua
fun():ItemDef
```

 * `get_definition()`: returns the item definition table.

## get_description


```lua
fun():string
```

 * `get_description()`: returns the description shown in inventory list tooltips.
     * The engine uses this when showing item descriptions in tooltips.
     * Fields for finding the description, in order:
         * `description` in item metadata (See [Item Metadata].)
         * `description` in item definition
         * item name

## get_free_space


```lua
fun():integer
```

 * `get_free_space()`: returns `get_stack_max() - get_count()`.

## get_meta


```lua
fun():ItemStackMetaRef
```

 * `get_meta()`: returns ItemStackMetaRef. See section for more details

## get_name


```lua
fun():string
```

 * `get_name()`: returns item name (e.g. `"default:stone"`).

## get_short_description


```lua
fun():string
```

 * `get_short_description()`: returns the short description or nil.
     * Unlike the description, this does not include new lines.
     * Fields for finding the short description, in order:
         * `short_description` in item metadata (See [Item Metadata].)
         * `short_description` in item definition
         * first line of the description (From item meta or def, see `get_description()`.)
         * Returns nil if none of the above are set

## get_stack_max


```lua
fun():integer
```

 * `get_stack_max()`: returns the maximum size of the stack (depends on the
   item).

## get_tool_capabilities


```lua
fun():tool_capabilities
```

 * `get_tool_capabilities()`: returns the digging properties of the item,
   or those of the hand if none are defined for this item type

## get_wear


```lua
fun():integer
```

 * `get_wear()`: returns tool wear (`0`-`65535`), `0` for non-tools.

## get_wear_bar_params


```lua
fun():wear_bar_params?
```

 * `get_wear_bar_params()`: returns the wear bar parameters of the item,
   or nil if none are defined for this item type or in the stack's meta

## is_empty


```lua
fun():boolean
```

 * `is_empty()`: returns `true` if stack is empty.

## is_known


```lua
fun():boolean
```

 * `is_known()`: returns `true` if the item name refers to a defined item type.

## item_fits


```lua
fun(item: string|table|ItemStack):boolean
```

 * `item_fits(item)`: returns `true` if item or stack can be fully added to
   this one.

## peek_item


```lua
fun(n: integer):ItemStack
```

 * `peek_item(n)`: returns taken `ItemStack`
     * Copy (don't remove) up to `n` items from this stack
     * `n`: number, default: `1`

## replace


```lua
fun(item: string|table|ItemStack)
```

 * `replace(item)`: replace the contents of this stack.
     * `item` can also be an itemstring or table.

## set_count


```lua
fun(count: integer):boolean
```

 * `set_count(count)`: returns a boolean indicating whether the item was cleared
     * `count`: number, unsigned 16 bit integer

## set_name


```lua
fun(item_name: string):boolean
```

 * `set_name(item_name)`: returns a boolean indicating whether the item was
   cleared.

## set_wear


```lua
fun(wear: integer):boolean
```

 * `set_wear(wear)`: returns boolean indicating whether item was cleared
     * `wear`: number, unsigned 16 bit integer

## take_item


```lua
fun(n: integer):ItemStack
```

 * `take_item(n)`: returns taken `ItemStack`
     * Take (and remove) up to `n` items from this stack
     * `n`: number, default: `1`

## to_string


```lua
fun():string
```

 * `to_string()`: returns the stack in itemstring form.

## to_table


```lua
fun():table
```

 * `to_table()`: returns the stack in Lua table form.


---

# ItemStackAny


---

# ItemStackMetaRef

## contains


```lua
fun(key: string):boolean?
```

 * `contains(key)`: Returns true if key present, otherwise false.
     * Returns `nil` when the MetaData is inexistent.

## get


```lua
fun(key: string):string?
```

 * `get(key)`: Returns `nil` if key not present, else the stored string.

## get_float


```lua
fun(key: string):number
```

## get_int


```lua
fun(key: string):integer
```

 * `get_int(key)`: Returns `0` if key not present.

## get_keys


```lua
fun():string[]
```

## set_float


```lua
fun(key: string, value: number)
```

 * `set_float(key, value)`
     * Store a number (a 64-bit float) exactly.
     * The value will be converted into a string when stored.

## set_int


```lua
fun(key: string, value: integer)
```

 * `set_int(key, value)`
     * The range for the value is system-dependent (usually 32 bits).
       The value will be converted into a string when stored.

## set_string


```lua
fun(key: string, value: string)
```

 * `set_string(key, value)`: Value of `""` will delete the key.

## set_tool_capabilities


```lua
fun(tool_capabilities?: tool_capabilities)
```

## set_wear_bar_params


```lua
fun(wear_bar_params?: wear_bar_params)
```

## to_table


```lua
fun():{ fields: table<string, string>, inventory: InvTable }
```


---

# LBMDef

## action


```lua
fun(pos: vector, node: MapNode|{ name: string, param1: number, param2: number }, dtime_s: number)?
```

 Function triggered for each qualifying node.
 `dtime_s` is the in-game time (in seconds) elapsed since the mapblock
 was last active (available since 5.7.0).

## bulk_action


```lua
fun(pos_list: vector[], dtime_s: number)?
```

 Function triggered with a list of all applicable node positions at once.
 This can be provided as an alternative to `action` (not both).
 Available since `core.features.bulk_lbms` (5.10.0)
 `dtime_s`: as above

## label


```lua
string?
```

 Descriptive label for profiling purposes (optional).
 Definitions with identical labels will be listed as one.

## name


```lua
string?
```

 Identifier of the LBM, should follow the modname:<whatever> convention

## nodenames


```lua
string[]?
```

 List of node names to trigger the LBM on.
 Names of non-registered nodes and groups (as group:groupname)
 will work as well.

## run_at_every_load


```lua
boolean?
```

 If `false`: The LBM only runs on mapblocks the first time they are
 activated after the LBM was introduced.
 It never runs on mapblocks generated after the LBM's introduction.
 See above for details.

 If `true`: The LBM runs every time a mapblock is activated.


---

# LuaEntityRef

## add_player_velocity


```lua
fun(self: any, vel: vector)
```

 Player only
 * `add_player_velocity(vel)`: **DEPRECATED**, use add_velocity(vel) instead.

## add_pos


```lua
fun(self: any, pos: vector)
```

 * `add_pos(pos)`:
     * Changes position by adding to the current position.
     * No-op if object is attached.
     * `pos` is a vector `{x=num, y=num, z=num}`.
     * In comparison to using `set_pos`, `add_pos` will avoid synchronization problems.

## add_velocity


```lua
fun(self: any, vel: vector)
```

 * `add_velocity(vel)`
     * Changes velocity by adding to the current velocity.
     * `vel` is a vector, e.g. `{x=0.0, y=2.3, z=1.0}`
     * In comparison to using `get_velocity`, adding the velocity and then using
       `set_velocity`, `add_velocity` is supposed to avoid synchronization problems.
       Additionally, players also do not support `set_velocity`.
     * If object is a player:
         * Does not apply during `free_move`.
         * Note that since the player speed is normalized at each move step,
           increasing e.g. Y velocity beyond what would usually be achieved
           (see: physics overrides) will cause existing X/Z velocity to be reduced.
         * Example: `add_velocity({x=0, y=6.5, z=0})` is equivalent to
           pressing the jump key (assuming default settings)

## get_acceleration


```lua
fun(self: any):vector?
```

 * `get_acceleration()`: returns the acceleration, a vector

## get_animation


```lua
fun(self: any):{ x: number, y: number }, number, number, boolean
```

 * `get_animation()`: returns current animation parameters set by `set_animation`:
     * `frame_range`, `frame_speed`, `frame_blend`, `frame_loop`.

## get_armor_groups


```lua
fun(self: any):table<string, integer>
```

 * `get_armor_groups()`:
     * returns a table with all of the object's armor group ratings
     * syntax: the table keys are the armor group names,
       the table values are the corresponding group ratings
     * see section '`ObjectRef` armor groups' for details

## get_attach


```lua
fun(self: any):ObjectRef?, string?, vector?, vector?, boolean?
```

 * `get_attach()`:
     * returns current attachment parameters or nil if it isn't attached
     * If attached, returns `parent`, `bone`, `position`, `rotation`, `forced_visible`

## get_attribute


```lua
fun(self: any, attribute: string):string|nil
```

 Player only
 * `get_attribute(attribute)`:  DEPRECATED, use get_meta() instead
     * Returns value (a string) for extra attribute.
     * Returns `nil` if no attribute found.

## get_bone_override


```lua
fun(self: any, bone: string):table
```

 * `get_bone_override(bone)`: returns `override` in the above format
     * **Note:** Unlike `get_bone_position`, the returned rotation is in radians, not degrees.

## get_bone_overrides


```lua
fun(self: any):table<string, table>
```

 * `get_bone_overrides()`: returns all bone overrides as table `{[bonename] = override, ...}`

## get_bone_position


```lua
fun(self: any, bone: string):vector
```

 * `get_bone_position(bone)`: returns the previously set position and rotation of the bone
     * Shorthand for `get_bone_override(bone).position.vec, get_bone_override(bone).rotation.vec:apply(math.deg)`.
     * **Note:** Returned rotation is in degrees, not radians.
     * **Deprecated:** Use `get_bone_override` instead.

## get_breath


```lua
fun(self: any):number?
```

 Player only
 * `get_breath()`: returns player's breath

## get_camera


```lua
fun(self: any):{ mode: "any"|"first"|"third"|"third_front" }?
```

 Player only
 * `get_camera()`: Returns the camera parameters as a table as above.

## get_children


```lua
fun(self: any):ObjectRef[]
```

 * `get_children()`: returns a list of ObjectRefs that are attached to the
     object.

## get_clouds


```lua
fun(self: any):table
```

 Player only
 * `get_clouds()`: returns a table with the current cloud parameters as in
   `set_clouds`.

## get_day_night_ratio


```lua
fun(self: any):number?
```

 Player only
 * `get_day_night_ratio()`: returns the ratio or nil if it isn't overridden

## get_effective_observers


```lua
fun(self: any):table<string, boolean>
```

 * `get_effective_observers()`:
     * Like `get_observers()`, but returns the "effective" observers, taking into account attachments
     * Time complexity: O(nm)
         * n: number of observers of the involved entities
         * m: number of ancestors along the attachment chain

## get_entity_name


```lua
fun(self: any):string?
```

 Luaentity only
 * `get_entity_name()`:
     * **Deprecated**: Will be removed in a future version,
       use `:get_luaentity().name` instead.

## get_eye_offset


```lua
fun(self: any):vector?, vector?, vector?
```

 Player only
 * `get_eye_offset()`: Returns camera offset vectors as set via `set_eye_offset`.

## get_flags


```lua
fun(self: any):{ breathing: boolean, drowning: boolean, node_damage: boolean }?
```

 Player only
 * `get_flags()`: returns a table of player flags (the following boolean fields):
   * `breathing`: Whether breathing (regaining air) is enabled, default `true`.
   * `drowning`: Whether drowning (losing air) is enabled, default `true`.
   * `node_damage`: Whether the player takes damage from nodes, default `true`.

## get_formspec_prepend


```lua
fun(self: any):string?
```

 Player only
 * `get_formspec_prepend()`: returns a formspec string.

## get_fov


```lua
fun(self: any):number?
```

 Player only
 * `get_fov()`: Returns the following:
     * Server-sent FOV value. Returns 0 if an FOV override doesn't exist.
     * Boolean indicating whether the FOV value is a multiplier.
     * Time (in seconds) taken for the FOV transition. Set by `set_fov`.

## get_hp


```lua
fun(self: any):number
```

 * `get_hp()`: returns number of health points

## get_inventory


```lua
fun(self: any):InvRef?
```

 * `get_inventory()`: returns an `InvRef` for players, otherwise returns `nil`

## get_inventory_formspec


```lua
fun(self: any):string?
```

 Player only
 * `get_inventory_formspec()`: returns a formspec string

## get_lighting


```lua
fun(self: any):table?
```

 Player only
 * `get_lighting()`: returns the current state of lighting for the player.
     * Result is a table with the same fields as `light_definition` in `set_lighting`.

## get_local_animation


```lua
fun(self: any):table?, table?, table?, table?, table?
```

 Player only
 * `get_local_animation()`: returns idle, walk, dig, walk_while_dig tables and
   `frame_speed`.
 Unofficial note: Sorry, no types for this one

## get_look_dir


```lua
fun(self: any):vector?
```

 Player only
 * `get_look_dir()`: get camera direction as a unit vector

## get_look_horizontal


```lua
fun(self: any):number?
```

 Player only
 * `get_look_horizontal()`: yaw in radians
     * Angle is counter-clockwise from the +z direction.

## get_look_pitch


```lua
fun(self: any):number?
```

 Player only
 * `get_look_pitch()`: pitch in radians - Deprecated as broken. Use
   `get_look_vertical`.
     * Angle ranges between -pi/2 and pi/2, which are straight down and up
       respectively.

## get_look_vertical


```lua
fun(self: any):number?
```

 Player only
 * `get_look_vertical()`: pitch in radians
     * Angle ranges between -pi/2 and pi/2, which are straight up and down
       respectively.

## get_look_yaw


```lua
fun(self: any):number?
```

 Player only
 * `get_look_yaw()`: yaw in radians - Deprecated as broken. Use
   `get_look_horizontal`.
     * Angle is counter-clockwise from the +x direction.

## get_luaentity


```lua
fun(self: any):luaentity?
```

 * `get_luaentity()`:
     * Returns the object's associated luaentity table, if there is one
     * Otherwise returns `nil` (e.g. for players)

## get_meta


```lua
fun(self: any):PlayerMetaRef
```

 Player only
 * `get_meta()`: Returns metadata associated with the player (a PlayerMetaRef).

## get_moon


```lua
fun(self: any):table?
```

 Player only
 * `get_moon()`: returns a table with the current moon parameters as in
     `set_moon`.

## get_nametag_attributes


```lua
fun(self: any):{ text: string, color: ColorSpec, bgcolor: boolean|ColorSpec }
```

 * `get_nametag_attributes()`
     * returns a table with the attributes of the nametag of an object
     * a nametag is a HUD text rendered above the object
     * ```lua
       {
           text = "",
           color = {a=0..255, r=0..255, g=0..255, b=0..255},
           bgcolor = {a=0..255, r=0..255, g=0..255, b=0..255},
       }
       ```

## get_observers


```lua
fun(self: any):table<string, boolean>?
```

 * `get_observers()`:
     * throws an error if the object is invalid
     * returns `nil` if the observers are unmanaged
     * returns a table with all observer names as keys and `true` values (a "set") otherwise

## get_physics_override


```lua
fun(self: any):table
```

 Player only
 * `get_physics_override()`: returns the table given to `set_physics_override`

## get_player_control


```lua
fun(self: any):{ up: boolean, down: boolean, left: boolean, right: boolean, jump: boolean, aux1: boolean, sneak: boolean, dig: boolean, place: boolean, zoom: boolean, movement_x: number, movement_y: number }
```

 Player only
 * `get_player_control()`: returns table with player input
     * The table contains the following boolean fields representing the pressed
       keys: `up`, `down`, `left`, `right`, `jump`, `aux1`, `sneak`, `dig`,
       `place`, `LMB`, `RMB` and `zoom`.
     * The fields `LMB` and `RMB` are equal to `dig` and `place` respectively,
       and exist only to preserve backwards compatibility.
     * The table also contains the fields `movement_x` and `movement_y`.
         * They represent the movement of the player. Values are numbers in the
           range [-1.0,+1.0].
         * They take both keyboard and joystick input into account.
         * You should prefer them over `up`, `down`, `left` and `right` to
           support different input methods correctly.
     * Returns an empty table `{}` if the object is not a player.

## get_player_control_bits


```lua
fun(self: any):number
```

 Player only
 * `get_player_control_bits()`: returns integer with bit packed player pressed
   keys.
     * Bits:
         * 0 - up
         * 1 - down
         * 2 - left
         * 3 - right
         * 4 - jump
         * 5 - aux1
         * 6 - sneak
         * 7 - dig
         * 8 - place
         * 9 - zoom
     * Returns `0` (no bits set) if the object is not a player.

## get_player_name


```lua
fun(self: any):string?
```

 * `get_player_name()`: Returns player name or `""` if is not a player
 Player only

## get_player_velocity


```lua
fun(self: any):vector?
```

 Player only
 * `get_player_velocity()`: **DEPRECATED**, use get_velocity() instead.
   table {x, y, z} representing the player's instantaneous velocity in nodes/s

## get_pos


```lua
fun(self: any):vector
```

 * `get_pos()`: returns position as vector `{x=num, y=num, z=num}`

## get_properties


```lua
fun(self: any):ObjectProps
```

 * `get_properties()`: returns a table of all object properties

## get_rotation


```lua
fun(self: any):vector?
```

 * `get_rotation()`: returns the rotation, a vector (radians)

## get_sky


```lua
fun(self: any, as_table: boolean):table?
```

 Player only
 * `get_sky(as_table)`:
     * `as_table`: boolean that determines whether the deprecated version of this
     function is being used.
         * `true` returns a table containing sky parameters as defined in `set_sky(sky_parameters)`.
         * Deprecated: `false` or `nil` returns base_color, type, table of textures,
         clouds.

## get_stars


```lua
fun(self: any):table?
```

 Player only
 * `get_stars()`: returns a table with the current stars parameters as in
     `set_stars`.

## get_sun


```lua
fun(self: any):table?
```

 Player only
 * `get_sun()`: returns a table with the current sun parameters as in
     `set_sun`.

## get_texture_mod


```lua
fun(self: any):string?
```

 * `get_texture_mod()` returns current texture modifier

## get_velocity


```lua
fun(self: any):vector
```

 * `get_velocity()`: returns the velocity, a vector.

## get_wield_index


```lua
fun(self: any):integer?
```

 * `get_wield_index()`: returns the wield list index of the wielded item (starting with 1)

## get_wield_list


```lua
fun(self: any):string?
```

 * `get_wield_list()`: returns the name of the inventory list the wielded item
    is in.

## get_wielded_item


```lua
fun(self: any):ItemStack?
```

 * `get_wielded_item()`: returns a copy of the wielded item as an `ItemStack`

## get_yaw


```lua
fun(self: any):number
```

 * `get_yaw()`: returns number in radians

## hud_add


```lua
fun(self: any, hud: HudDef):HudID?
```

 Player only
 * `hud_add(hud definition)`: add a HUD element described by HUD def, returns ID
    number on success

## hud_change


```lua
fun(self: any, id: HudID, stat: string, value: any)
```

 Player only
 * `hud_change(id, stat, value)`: change a value of a previously added HUD
   element.
     * `stat` supports the same keys as in the hud definition table except for
       `"type"` (or the deprecated `"hud_elem_type"`).

## hud_get


```lua
fun(self: any, id: HudID)
```

 Player only
 * `hud_get(id)`: gets the HUD element definition structure of the specified ID

## hud_get_all


```lua
fun(self: any):table<HudID, HudDef>
```

 Player only
 * `hud_get_all()`:
     * Returns a table in the form `{ [id] = HUD definition, [id] = ... }`.
     * A mod should keep track of its introduced IDs and only use this to access foreign elements.
     * It is discouraged to change foreign HUD elements.

## hud_get_flags


```lua
fun(self: any):{ hotbar: boolean?, healthbar: boolean?, crosshair: boolean?, wielditem: boolean?, breathbar: boolean?, minimap: boolean?, minimap_radar: boolean?, basic_debug: boolean? }
```

 Player only
 * `hud_get_flags()`: returns a table of player HUD flags with boolean values.
     * See `hud_set_flags` for a list of flags that can be toggled.

## hud_get_hotbar_image


```lua
fun(self: any):string?
```

 Player only
 * `hud_get_hotbar_image()`: returns texturename

## hud_get_hotbar_itemcount


```lua
fun(self: any):integer?
```

 Player only
 * `hud_get_hotbar_itemcount()`: returns number of visible items
     * This value is also clamped by the `"main"` list size.

## hud_get_hotbar_selected_image


```lua
fun(self: any):string?
```

 Player only
 * `hud_get_hotbar_selected_image()`: returns texturename

## hud_remove


```lua
fun(self: any, id: HudID)
```

 Player only
 * `hud_remove(id)`: remove the HUD element of the specified id

## hud_set_flags


```lua
fun(self: any, flags: { hotbar: boolean?, healthbar: boolean?, crosshair: boolean?, wielditem: boolean?, breathbar: boolean?, minimap: boolean?, minimap_radar: boolean?, basic_debug: boolean? })
```

 Player only
 * `hud_set_flags(flags)`: sets specified HUD flags of player.
     * `flags`: A table with the following fields set to boolean values
         * `hotbar`
         * `healthbar`
         * `crosshair`
         * `wielditem`
         * `breathbar`
         * `minimap`: Modifies the client's permission to view the minimap.
           The client may locally elect to not view the minimap.
         * `minimap_radar`: is only usable when `minimap` is true
         * `basic_debug`: Allow showing basic debug info that might give a gameplay advantage.
           This includes map seed, player position, look direction, the pointed node and block bounds.
           Does not affect players with the `debug` privilege.
         * `chat`: Modifies the client's permission to view chat on the HUD.
           The client may locally elect to not view chat. Does not affect the console.
     * If a flag equals `nil`, the flag is not modified

## hud_set_hotbar_image


```lua
fun(self: any, texturename: string)
```

 Player only
 * `hud_set_hotbar_image(texturename)`
     * sets background image for hotbar

## hud_set_hotbar_itemcount


```lua
fun(self: any, count: integer)
```

 Player only
 * `hud_set_hotbar_itemcount(count)`: sets number of items in builtin hotbar
     * `count`: number of items, must be between `1` and `32`
     * If `count` exceeds the `"main"` list size, the list size will be used instead.

## hud_set_hotbar_selected_image


```lua
fun(self: any, texturename: string)
```

 Player only
 * `hud_set_hotbar_selected_image(texturename)`
     * sets image for selected item of hotbar

## is_player


```lua
fun(self: any):boolean
```

 * `is_player()`: returns true for players, false otherwise

## is_valid


```lua
fun(self: any):boolean
```

 * `is_valid()`: returns whether the object is valid.
    * See "Advice on handling `ObjectRefs`" above.

## move_to


```lua
fun(self: any, pos: vector, continuous?: boolean)
```

 * `move_to(pos, continuous=false)`
     * Does an interpolated move for Lua entities for visually smooth transitions.
     * If `continuous` is true, the Lua entity will not be moved to the current
       position before starting the interpolated move.
     * For players this does the same as `set_pos`,`continuous` is ignored.
     * no-op if object is attached

## override_day_night_ratio


```lua
fun(self: any, number: any)
```

 Player only
 * `override_day_night_ratio(ratio or nil)`
     * `0`...`1`: Overrides day-night ratio, controlling sunlight to a specific
       amount.
     * Passing no arguments disables override, defaulting to sunlight based on day-night cycle
     * See also `core.time_to_day_night_ratio`,

## punch


```lua
fun(self: any, puncher: ObjectRef, time_from_last_punch?: number, tool_capabilities?: tool_capabilities, dir?: vector)
```

 * `punch(puncher, time_from_last_punch, tool_capabilities, dir)`
     * punches the object, triggering all consequences a normal punch would have
     * `puncher`: another `ObjectRef` which punched the object or `nil`
     * `dir`: direction vector of punch
     * Other arguments: See `on_punch` for entities
     * Arguments `time_from_last_punch`, `tool_capabilities`, and `dir`
       will be replaced with a default value when the caller sets them to `nil`.

## remove


```lua
fun(self: any)
```

 * `remove()`: remove object
     * The object is removed after returning from Lua. However the `ObjectRef`
       itself instantly becomes unusable with all further method calls having
       no effect and returning `nil`.

## respawn


```lua
fun(self: any)
```

 Player only
 * `respawn()`: Respawns the player using the same mechanism as the death screen,
   including calling `on_respawnplayer` callbacks.

## right_click


```lua
fun(self: any, clicker: PlayerRef)
```

 * `right_click(clicker)`:
     * simulates using the 'place/use' key on the object
     * triggers all consequences as if a real player had done this
     * `clicker` is another `ObjectRef` which has clicked
     * note: this is called `right_click` for historical reasons only

## send_mapblock


```lua
fun(self: any, blockpos: vector):boolean?
```

 Player only
 * `send_mapblock(blockpos)`:
     * Sends an already loaded mapblock to the player.
     * Returns `false` if nothing was sent (note that this can also mean that
       the client already has the block)
     * Resource intensive - use sparsely

## set_acceleration


```lua
fun(self: any, acc: vector)
```

 * `set_acceleration(acc)`
     * Sets the acceleration
     * `acc` is a vector

## set_animation


```lua
fun(self: any, frame_range?: { x: number, y: number }, frame_speed?: number, frame_blend?: number, frame_loop?: boolean)
```

 * `set_animation(frame_range, frame_speed, frame_blend, frame_loop)`
     * Sets the object animation parameters and (re)starts the animation
     * Animations only work with a `"mesh"` visual
     * `frame_range`: Beginning and end frame (as specified in the mesh file).
        * Syntax: `{x=start_frame, y=end_frame}`
        * Animation interpolates towards the end frame but stops when it is reached
        * If looped, there is no interpolation back to the start frame
        * If looped, the model should look identical at start and end
        * default: `{x=1.0, y=1.0}`
     * `frame_speed`: How fast the animation plays, in frames per second (number)
        * default: `15.0`
     * `frame_blend`: number, default: `0.0`
     * `frame_loop`: If `true`, animation will loop. If false, it will play once
        * default: `true`

## set_animation_frame_speed


```lua
fun(self: any, frame_speed: number)
```

 * `set_animation_frame_speed(frame_speed)`
     * Sets the frame speed of the object's animation
     * Unlike `set_animation`, this will not restart the animation
     * `frame_speed`: See `set_animation`

## set_armor_groups


```lua
fun(self: any, groups: table<string, integer>)
```

 * `set_armor_groups({group1=rating, group2=rating, ...})`
     * sets the object's full list of armor groups
     * same table syntax as for `get_armor_groups`
     * note: all armor groups not in the table will be removed

## set_attach


```lua
fun(self: any, parent: ObjectRef, bone?: string, position?: vector, rotation?: vector, forced_visible?: boolean)
```

 * `set_attach(parent[, bone, position, rotation, forced_visible])`
     * Attaches object to `parent`
     * See 'Attachments' section for details
     * `parent`: `ObjectRef` to attach to
     * `bone`: Bone to attach to. Default is `""` (the root bone)
     * `position`: relative position, default `{x=0, y=0, z=0}`
     * `rotation`: relative rotation in degrees, default `{x=0, y=0, z=0}`
     * `forced_visible`: Boolean to control whether the attached entity
        should appear in first person, default `false`.
     * This command may fail silently (do nothing) when it would result
       in circular attachments.

## set_attribute


```lua
fun(self: any, attribute: string, value: string|number)
```

 Player only
 * `set_attribute(attribute, value)`:  DEPRECATED, use get_meta() instead
     * Sets an extra attribute with value on player.
     * `value` must be a string, or a number which will be converted to a
       string.
     * If `value` is `nil`, remove attribute from player.

## set_bone_override


```lua
fun(self: any, bone: string, override: table)
```

 * `set_bone_override(bone, override)`
     * `bone`: string
     * `override`: `{ position = property, rotation = property, scale = property }` or `nil`
     * `override = nil` (including omission) is shorthand for `override = {}` which clears the override
     * Each `property` is a table of the form
       `{ vec = vector, interpolation = 0, absolute = false }` or `nil`
         * `vec` is in the same coordinate system as the model, and in radians for rotation.
           It defaults to `vector.zero()` for translation and rotation and `vector.new(1, 1, 1)` for scale.
         * `interpolation`: The old and new overrides are interpolated over this timeframe (in seconds).
         * `absolute`: If set to `false` (which is the default),
           the override will be relative to the animated property:
             * Translation in the case of `position`;
             * Composition in the case of `rotation`;
             * Per-axis multiplication in the case of `scale`
     * `property = nil` is equivalent to no override on that property
     * **Note:** Unlike `set_bone_position`, the rotation is in radians, not degrees.
     * Compatibility note: Clients prior to 5.9.0 only support absolute position and rotation.
       All values are treated as absolute and are set immediately (no interpolation).

## set_bone_position


```lua
fun(self: any, bone: string, position: any, rotation: any)
```

 * `set_bone_position([bone, position, rotation])`
     * Sets absolute bone overrides, e.g. it is equivalent to
       ```lua
       obj:set_bone_override(bone, {
           position = {vec = position, absolute = true},
           rotation = {vec = rotation:apply(math.rad), absolute = true}
       })
       ```
     * **Note:** Rotation is in degrees, not radians.
     * **Deprecated:** Use `set_bone_override` instead.

## set_breath


```lua
fun(self: any, value: number)
```

 Player only
 * `set_breath(value)`: sets player's breath
     * values:
         * `0`: player is drowning
         * max: bubbles bar is not shown
         * See [Object properties] for more information
     * Is limited to range 0 ... 65535 (2^16 - 1)

## set_camera


```lua
fun(self: any, params: { mode: "any"|"first"|"third"|"third_front" })
```

 Player only
 * `set_camera(params)`: Sets camera parameters.
     * `mode`: Defines the camera mode used
       - `any`: free choice between all modes (default)
       - `first`: first-person camera
       - `third`: third-person camera
       - `third_front`: third-person camera, looking opposite of movement direction
     * Supported by client since 5.12.0.

## set_clouds


```lua
fun(self: any, cloud_parameters: table)
```

 Player only
 * `set_clouds(cloud_parameters)`: set cloud parameters
     * Passing no arguments resets clouds to their default values.
     * `cloud_parameters` is a table with the following optional fields:
         * `density`: from `0` (no clouds) to `1` (full clouds) (default `0.4`)
         * `color`: basic cloud color with alpha channel, ColorSpec
           (default `#fff0f0e5`).
         * `ambient`: cloud color lower bound, use for a "glow at night" effect.
           ColorSpec (alpha ignored, default `#000000`)
         * `height`: cloud height, i.e. y of cloud base (default per conf,
           usually `120`)
         * `thickness`: cloud thickness in nodes (default `16`).
           if set to zero the clouds are rendered flat.
         * `speed`: 2D cloud speed + direction in nodes per second
           (default `{x=0, z=-2}`).
         * `shadow`: shadow color, applied to the base of the cloud
           (default `#cccccc`).

## set_detach


```lua
fun(self: any)
```

 * `set_detach()`: Detaches object. No-op if object was not attached.

## set_eye_offset


```lua
fun(self: any, firstperson?: vector, thirdperson_back?: vector, thirdperson_front?: vector)
```

 Player only
 * `set_eye_offset([firstperson, thirdperson_back, thirdperson_front])`: Sets camera offset vectors.
     * `firstperson`: Offset in first person view.
       Defaults to `vector.zero()` if unspecified.
     * `thirdperson_back`: Offset in third person back view.
       Clamped between `vector.new(-10, -10, -5)` and `vector.new(10, 15, 5)`.
       Defaults to `vector.zero()` if unspecified.
     * `thirdperson_front`: Offset in third person front view.
       Same limits as for `thirdperson_back` apply.
       Defaults to `thirdperson_back` if unspecified.

## set_flags


```lua
fun(self: any, flags: { breathing: boolean?, drowning: boolean?, node_damage: boolean? })
```

 Player only
 * `set_flags(flags)`: sets flags
   * takes a table in the same format as returned by `get_flags`
   * absent fields are left unchanged

## set_formspec_prepend


```lua
fun(self: any, formspec: string)
```

 Player only
 * `set_formspec_prepend(formspec)`:
     * the formspec string will be added to every formspec shown to the user,
       except for those with a no_prepend[] tag.
     * This should be used to set style elements such as background[] and
       bgcolor[], any non-style elements (eg: label) may result in weird behavior.
     * Only affects formspecs shown after this is called.

## set_fov


```lua
fun(self: any, fov: number, is_multiplier: boolean, transition_time?: number)
```

 Player only
 * `set_fov(fov, is_multiplier, transition_time)`: Sets player's FOV
     * `fov`: Field of View (FOV) value.
     * `is_multiplier`: Set to `true` if the FOV value is a multiplier.
       Defaults to `false`.
     * `transition_time`: If defined, enables smooth FOV transition.
       Interpreted as the time (in seconds) to reach target FOV.
       If set to 0, FOV change is instantaneous. Defaults to 0.
     * Set `fov` to 0 to clear FOV override.

## set_hp


```lua
fun(self: any, hp: integer, reason: PlayerHPChangeReason)
```

 * `set_hp(hp, reason)`: set number of health points
     * See reason in register_on_player_hpchange
     * Is limited to the range of 0 ... 65535 (2^16 - 1)
     * For players: HP are also limited by `hp_max` specified in object properties
 Unofficial note:I *assume* it's a PlayerHPChangeReason, i am not certain

## set_inventory_formspec


```lua
fun(self: any, formspec: string)
```

 Player only
 * `set_inventory_formspec(formspec)`
     * Redefines the player's inventory formspec.
     * Should usually be called at least once in the `on_joinplayer` callback.
     * If `formspec` is `""`, the player's inventory is disabled.
     * If the inventory formspec is currently open on the client, it is
       updated immediately.
     * See also: `core.register_on_player_receive_fields`

## set_lighting


```lua
fun(self: any, light_definition: table)
```

 Player only
 * `set_lighting(light_definition)`: sets lighting for the player
     * Passing no arguments resets lighting to its default values.
     * `light_definition` is a table with the following optional fields:
       * `saturation` sets the saturation (vividness; default: `1.0`).
         * It is applied according to the function `result = b*(1-s) + c*s`, where:
           * `c` is the original color
           * `b` is the greyscale version of the color with the same luma
           * `s` is the saturation set here
         * The resulting color always has the same luma (perceived brightness) as the original.
         * This means that:
           * values > 1 oversaturate
           * values < 1 down to 0 desaturate, 0 being entirely greyscale
           * values < 0 cause an effect similar to inversion,
             but keeping original luma and being symmetrical in terms of saturation
             (eg. -1 and 1 is the same saturation and luma, but different hues)
         * This value has no effect on clients who have shaders or post-processing disabled.
       * `shadows` is a table that controls ambient shadows
         * This has no effect on clients who have the "Dynamic Shadows" effect disabled.
         * `intensity` sets the intensity of the shadows from 0 (no shadows, default) to 1 (blackness)
         * `tint` tints the shadows with the provided color, with RGB values ranging from 0 to 255.
           (default `{r=0, g=0, b=0}`)
       * `exposure` is a table that controls automatic exposure.
         The basic exposure factor equation is `e = 2^exposure_correction / clamp(luminance, 2^luminance_min, 2^luminance_max)`
         * This has no effect on clients who have the "Automatic Exposure" effect disabled.
         * `luminance_min` set the lower luminance boundary to use in the calculation (default: `-3.0`)
         * `luminance_max` set the upper luminance boundary to use in the calculation (default: `-3.0`)
         * `exposure_correction` correct observed exposure by the given EV value (default: `0.0`)
         * `speed_dark_bright` set the speed of adapting to bright light (default: `1000.0`)
         * `speed_bright_dark` set the speed of adapting to dark scene (default: `1000.0`)
         * `center_weight_power` set the power factor for center-weighted luminance measurement (default: `1.0`)
       * `bloom` is a table that controls bloom.
         * This has no effect on clients with protocol version < 46 or clients who
           have the "Bloom" effect disabled.
         * `intensity` defines much bloom is applied to the rendered image.
           * Recommended range: from 0.0 to 1.0, default: 0.05
           * If set to 0, bloom is disabled.
           * The default value is to be changed from 0.05 to 0 in the future.
             If you wish to keep the current default value, you should set it
             explicitly.
         * `strength_factor` defines the magnitude of bloom overexposure.
           * Recommended range: from 0.1 to 10.0, default: 1.0
         * `radius` is a logical value that controls how far the bloom effect
           spreads from the bright objects.
           * Recommended range: from 0.1 to 8.0, default: 1.0
         * The behavior of values outside the recommended range is unspecified.
       * `volumetric_light`: is a table that controls volumetric light (a.k.a. "godrays")
         * This has no effect on clients who have the "Volumetric Lighting" or "Bloom" effects disabled.
         * `strength`: sets the strength of the volumetric light effect from 0 (off, default) to 1 (strongest).
             * `0.2` is a reasonable standard value.
             * Currently, bloom `intensity` and `strength_factor` affect volumetric
               lighting `strength` and vice versa. This behavior is to be changed
               in the future, do not rely on it.


## set_local_animation


```lua
fun(self: any, idle: any, walk: any, dig: any, walk_while_dig: any, frame_speed: any)
```

 Player only
 * `set_local_animation(idle, walk, dig, walk_while_dig, frame_speed)`:
   set animation for player model in third person view.
     * Every animation equals to a `{x=starting frame, y=ending frame}` table.
     * `frame_speed` sets the animations frame speed. Default is 30.
 Unofficial note: Sorry, no types for this one

## set_look_horizontal


```lua
fun(self: any, radians: number)
```

 Player only
 * `set_look_horizontal(radians)`: sets look yaw
     * radians: Angle from the +z direction, where positive is counter-clockwise.

## set_look_pitch


```lua
fun(self: any, radians: number)
```

 Player only
 * `set_look_pitch(radians)`: sets look pitch - Deprecated. Use
   `set_look_vertical`.

## set_look_vertical


```lua
fun(self: any, radians: number)
```

 Player only
 * `set_look_vertical(radians)`: sets look pitch
     * radians: Angle from looking forward, where positive is downwards.

## set_look_yaw


```lua
fun(self: any, radians: number)
```

 Player only
 * `set_look_yaw(radians)`: sets look yaw - Deprecated. Use
   `set_look_horizontal`.

## set_minimap_modes


```lua
fun(self: any, modes: ({ type: "off"|"radar"|"surface"|"texture", label: string?, size: integer, texture: string?, scale: integer? })[], selected_mode: integer)
```

 Player only
 * `set_minimap_modes({mode, mode, ...}, selected_mode)`
     * Overrides the available minimap modes (and toggle order), and changes the
     selected mode.
     * `mode` is a table consisting of up to four fields:
         * `type`: Available type:
             * `off`: Minimap off
             * `surface`: Minimap in surface mode
             * `radar`: Minimap in radar mode
             * `texture`: Texture to be displayed instead of terrain map
               (texture is centered around 0,0 and can be scaled).
               Texture size is limited to 512 x 512 pixel.
         * `label`: Optional label to display on minimap mode toggle
           The translation must be handled within the mod.
         * `size`: Sidelength or diameter, in number of nodes, of the terrain
           displayed in minimap
         * `texture`: Only for texture type, name of the texture to display
         * `scale`: Only for texture type, scale of the texture map in nodes per
           pixel (for example a `scale` of 2 means each pixel represents a 2x2
           nodes square)
     * `selected_mode` is the mode index to be selected after modes have been changed
     (0 is the first mode).

## set_moon


```lua
fun(self: any, moon_parameters: table)
```

 Player only
 * `set_moon(moon_parameters)`:
     * Passing no arguments resets the moon to its default values.
     * `moon_parameters` is a table with the following optional fields:
         * `visible`: Boolean for whether the moon is visible.
             (default: `true`)
         * `texture`: A regular texture for the moon. Setting to `""`
             will re-enable the mesh moon. (default: `"moon.png"`, if it exists)
             The texture appears non-rotated at sunrise / moonset and rotated 180
             degrees (upside down) at sunset / moonrise.
             Note: Relative to the sun, the moon texture is hence rotated by 180°.
             You can use the `^[transformR180` texture modifier to achieve the same orientation.
         * `tonemap`: A 512x1 texture containing the tonemap for the moon
             (default: `"moon_tonemap.png"`)
         * `scale`: Float controlling the overall size of the moon (default: `1`)
             Note: For legacy reasons, the sun is bigger than the moon by a factor
             of about `1.57` for equal `scale` values.

## set_nametag_attributes


```lua
fun(self: any, attributes: { text: string?, color: ColorSpec?, bgcolor: (boolean|ColorSpec)? })
```

 * `set_nametag_attributes(attributes)`
     * sets the attributes of the nametag of an object
     * `attributes`:
       ```lua
       {
           text = "My Nametag",
           color = ColorSpec,
           -- ^ Text color
           bgcolor = ColorSpec or false,
           -- ^ Sets background color of nametag
           -- `false` will cause the background to be set automatically based on user settings
           -- Default: false
       }
       ```

## set_observers


```lua
fun(self: any, observers: table<string, boolean>)
```

 * `set_observers(observers)`: sets observers (players this object is sent to)
     * If `observers` is `nil`, the object's observers are "unmanaged":
       The object is sent to all players as governed by server settings. This is the default.
     * `observers` is a "set" of player names: `{name1 = true, name2 = true, ...}`
         * A set is a table where the keys are the elements of the set
           (in this case, *valid* player names) and the values are all `true`.
     * Attachments: The *effective observers* of an object are made up of
       all players who can observe the object *and* are also effective observers
       of its parent object (if there is one).
     * Players are automatically added to their own observer sets.
       Players **must** effectively observe themselves.
     * Object activation and deactivation are unaffected by observability.
     * Attached sounds do not work correctly and thus should not be used
       on objects with managed observers yet.

## set_physics_override


```lua
fun(self: any, override_table: table)
```

 Player only
 * `set_physics_override(override_table)`
     * Overrides the physics attributes of the player
     * `override_table` is a table with the following fields:
         * `speed`: multiplier to *all* movement speed (`speed_*`) and
                    acceleration (`acceleration_*`) values (default: `1`)
         * `speed_walk`: multiplier to default walk speed value (default: `1`)
             * Note: The actual walk speed is the product of `speed` and `speed_walk`
         * `speed_climb`: multiplier to default climb speed value (default: `1`)
             * Note: The actual climb speed is the product of `speed` and `speed_climb`
         * `speed_crouch`: multiplier to default sneak speed value (default: `1`)
             * Note: The actual sneak speed is the product of `speed` and `speed_crouch`
         * `speed_fast`: multiplier to default speed value in Fast Mode (default: `1`)
             * Note: The actual fast speed is the product of `speed` and `speed_fast`
         * `jump`: multiplier to default jump value (default: `1`)
         * `gravity`: multiplier to default gravity value (default: `1`)
         * `liquid_fluidity`: multiplier to liquid movement resistance value
           (for nodes with `liquid_move_physics`); the higher this value, the lower the
           resistance to movement. At `math.huge`, the resistance is zero and you can
           move through any liquid like air. (default: `1`)
             * Warning: Values below 1 are currently unsupported.
         * `liquid_fluidity_smooth`: multiplier to default maximum liquid resistance value
           (for nodes with `liquid_move_physics`); controls deceleration when entering
           node at high speed. At higher values you come to a halt more quickly
           (default: `1`)
         * `liquid_sink`: multiplier to default liquid sinking speed value;
           (for nodes with `liquid_move_physics`) (default: `1`)
         * `acceleration_default`: multiplier to horizontal and vertical acceleration
           on ground or when climbing (default: `1`)
             * Note: The actual acceleration is the product of `speed` and `acceleration_default`
         * `acceleration_air`: multiplier to acceleration
           when jumping or falling (default: `1`)
             * Note: The actual acceleration is the product of `speed` and `acceleration_air`
         * `acceleration_fast`: multiplier to acceleration in Fast Mode (default: `1`)
             * Note: The actual acceleration is the product of `speed` and `acceleration_fast`
         * `sneak`: whether player can sneak (default: `true`)
         * `sneak_glitch`: whether player can use the new move code replications
           of the old sneak side-effects: sneak ladders and 2 node sneak jump
           (default: `false`)
         * `new_move`: use new move/sneak code. When `false` the exact old code
           is used for the specific old sneak behavior (default: `true`)
     * Note: All numeric fields above modify a corresponding `movement_*` setting.
     * For games, we recommend for simpler code to first modify the `movement_*`
       settings (e.g. via the game's `minetest.conf`) to set a global base value
       for all players and only use `set_physics_override` when you need to change
       from the base value on a per-player basis
     * Note: Some of the fields don't exist in old API versions, see feature
       `physics_overrides_v2`.


## set_pos


```lua
fun(self: any, pos: vector)
```

 * `set_pos(pos)`:
     * Sets the position of the object.
     * No-op if object is attached.
     * `pos` is a vector `{x=num, y=num, z=num}`

## set_properties


```lua
fun(self: any, ObjectProps: ObjectProps)
```

 * `set_properties(object property table)`

## set_rotation


```lua
fun(self: any, rot: vector)
```

 Luaentity only
 * `set_rotation(rot)`
     * Sets the rotation
     * `rot` is a vector (radians). X is pitch (elevation), Y is yaw (heading)
       and Z is roll (bank).
     * Does not reset rotation incurred through `automatic_rotate`.
       Remove & re-add your objects to force a certain rotation.

## set_sky


```lua
fun(self: any, sky_parameters: table)
```

 Player only
 * `set_sky(sky_parameters)`
     * The presence of the function `set_sun`, `set_moon` or `set_stars` indicates
       whether `set_sky` accepts this format. Check the legacy format otherwise.
     * Passing no arguments resets the sky to its default values.
     * `sky_parameters` is a table with the following optional fields:
         * `base_color`: ColorSpec, meaning depends on `type` (default: `#ffffff`)
         * `body_orbit_tilt`: Float, rotation angle of sun/moon orbit in degrees.
            By default, orbit is controlled by a client-side setting, and this field is not set.
            After a value is assigned, it can only be changed to another float value.
            Valid range [-60.0,60.0] (default: not set)
         * `type`: Available types:
             * `"regular"`: Uses 0 textures, `base_color` ignored
             * `"skybox"`: Uses 6 textures, `base_color` used as fog.
             * `"plain"`: Uses 0 textures, `base_color` used as both fog and sky.
             (default: `"regular"`)
         * `textures`: A table containing up to six textures in the following
             order: Y+ (top), Y- (bottom), X+ (east), X- (west), Z- (south), Z+ (north).
             The top and bottom textures are oriented in-line with the east (X+) face (the top edge of the
             bottom texture and the bottom edge of the top texture touch the east face).
             Some top and bottom textures expect to be aligned with the north face and will need to be rotated
             by -90 and 90 degrees, respectively, to fit the eastward orientation.
         * `clouds`: Boolean for whether clouds appear. (default: `true`)
         * `sky_color`: A table used in `"regular"` type only, containing the
           following values (alpha is ignored):
             * `day_sky`: ColorSpec, for the top half of the sky during the day.
               (default: `#61b5f5`)
             * `day_horizon`: ColorSpec, for the bottom half of the sky during the day.
               (default: `#90d3f6`)
             * `dawn_sky`: ColorSpec, for the top half of the sky during dawn/sunset.
               (default: `#b4bafa`)
               The resulting sky color will be a darkened version of the ColorSpec.
               Warning: The darkening of the ColorSpec is subject to change.
             * `dawn_horizon`: ColorSpec, for the bottom half of the sky during dawn/sunset.
               (default: `#bac1f0`)
               The resulting sky color will be a darkened version of the ColorSpec.
               Warning: The darkening of the ColorSpec is subject to change.
             * `night_sky`: ColorSpec, for the top half of the sky during the night.
               (default: `#006bff`)
               The resulting sky color will be a dark version of the ColorSpec.
               Warning: The darkening of the ColorSpec is subject to change.
             * `night_horizon`: ColorSpec, for the bottom half of the sky during the night.
               (default: `#4090ff`)
               The resulting sky color will be a dark version of the ColorSpec.
               Warning: The darkening of the ColorSpec is subject to change.
             * `indoors`: ColorSpec, for when you're either indoors or underground.
               (default: `#646464`)
             * `fog_sun_tint`: ColorSpec, changes the fog tinting for the sun
               at sunrise and sunset. (default: `#f47d1d`)
             * `fog_moon_tint`: ColorSpec, changes the fog tinting for the moon
               at sunrise and sunset. (default: `#7f99cc`)
             * `fog_tint_type`: string, changes which mode the directional fog
                 abides by, `"custom"` uses `sun_tint` and `moon_tint`, while
                 `"default"` uses the classic Luanti sun and moon tinting.
                 Will use tonemaps, if set to `"default"`. (default: `"default"`)
         * `fog`: A table with following optional fields:
             * `fog_distance`: integer, set an upper bound for the client's viewing_range.
                Any value >= 0 sets the desired upper bound for viewing_range,
                disables range_all and prevents disabling fog (F3 key by default).
                Any value < 0 resets the behavior to being client-controlled.
                (default: -1)
             * `fog_start`: float, override the client's fog_start.
                Fraction of the visible distance at which fog starts to be rendered.
                Any value between [0.0, 0.99] set the fog_start as a fraction of the viewing_range.
                Any value < 0, resets the behavior to being client-controlled.
                (default: -1)
             * `fog_color`: ColorSpec, override the color of the fog.
                Unlike `base_color` above this will apply regardless of the skybox type.
                (default: `"#00000000"`, which means no override)

## set_sprite


```lua
fun(self: any, start_frame?: { x: number, y: number }, num_frames?: integer, framelength?: number, select_x_by_camera?: boolean|string[])
```

 Luaentity only
 * `set_sprite(start_frame, num_frames, framelength, select_x_by_camera)`
     * Specifies and starts a sprite animation
     * Only used by `sprite` and `upright_sprite` visuals
     * Animations iterate along the frame `y` position.
     * `start_frame`: {x=column number, y=row number}, the coordinate of the
       first frame, default: `{x=0, y=0}`
     * `num_frames`: Total frames in the texture, default: `1`
     * `framelength`: Time per animated frame in seconds, default: `0.2`
     * `select_x_by_camera`: Only for visual = `sprite`. Changes the frame `x`
       position according to the view direction. default: `false`.
         * First column:  subject facing the camera
         * Second column: subject looking to the left
         * Third column:  subject backing the camera
         * Fourth column: subject looking to the right
         * Fifth column:  subject viewed from above
         * Sixth column:  subject viewed from below

## set_stars


```lua
fun(self: any, star_parameters: table)
```

 Player only
 * `set_stars(star_parameters)`:
     * Passing no arguments resets stars to their default values.
     * `star_parameters` is a table with the following optional fields:
         * `visible`: Boolean for whether the stars are visible.
             (default: `true`)
         * `day_opacity`: Float for maximum opacity of stars at day.
             No effect if `visible` is false.
             (default: 0.0; maximum: 1.0; minimum: 0.0)
         * `count`: Integer number to set the number of stars in
             the skybox. Only applies to `"skybox"` and `"regular"` sky types.
             (default: `1000`)
         * `star_color`: ColorSpec, sets the colors of the stars,
             alpha channel is used to set overall star brightness.
             (default: `#ebebff69`)
         * `scale`: Float controlling the overall size of the stars (default: `1`)

## set_sun


```lua
fun(self: any, sun_parameters: table)
```

 Player only
 * `set_sun(sun_parameters)`:
     * Passing no arguments resets the sun to its default values.
     * `sun_parameters` is a table with the following optional fields:
         * `visible`: Boolean for whether the sun is visible.
             (default: `true`)
         * `texture`: A regular texture for the sun. Setting to `""`
             will re-enable the mesh sun. (default: "sun.png", if it exists)
             The texture appears non-rotated at sunrise and rotated 180 degrees
             (upside down) at sunset.
         * `tonemap`: A 512x1 texture containing the tonemap for the sun
             (default: `"sun_tonemap.png"`)
         * `sunrise`: A regular texture for the sunrise texture.
             (default: `"sunrisebg.png"`)
         * `sunrise_visible`: Boolean for whether the sunrise texture is visible.
             (default: `true`)
         * `scale`: Float controlling the overall size of the sun. (default: `1`)
             Note: For legacy reasons, the sun is bigger than the moon by a factor
             of about `1.57` for equal `scale` values.

## set_texture_mod


```lua
fun(self: any, mod: string)
```

 Luaentity only
 * `set_texture_mod(mod)`
     * Set a texture modifier to the base texture, for sprites and meshes.
     * When calling `set_texture_mod` again, the previous one is discarded.
     * `mod` the texture modifier. See [Texture modifiers].

## set_velocity


```lua
fun(self: any, vel: vector)
```

 * `set_velocity(vel)`
     * Sets the velocity
     * `vel` is a vector, e.g. `{x=0.0, y=2.3, z=1.0}`

## set_wielded_item


```lua
fun(self: any, item: ItemStack):boolean?
```

 * `set_wielded_item(item)`: replaces the wielded item, returns `true` if
   successful.

## set_yaw


```lua
fun(self: any, yaw: number)
```

 Luaentity only
 * `set_yaw(yaw)`: sets the yaw in radians (heading).


---

# LuaLS


---

# MapNode


---

# MapNodeOpt


---

# MetaDataRef

## contains


```lua
fun(key: string):boolean?
```

 * `contains(key)`: Returns true if key present, otherwise false.
     * Returns `nil` when the MetaData is inexistent.

## get


```lua
fun(key: string):string?
```

 * `get(key)`: Returns `nil` if key not present, else the stored string.

## get_float


```lua
fun(key: string):number
```

## get_int


```lua
fun(key: string):integer
```

 * `get_int(key)`: Returns `0` if key not present.

## get_keys


```lua
fun():string[]
```

## set_float


```lua
fun(key: string, value: number)
```

 * `set_float(key, value)`
     * Store a number (a 64-bit float) exactly.
     * The value will be converted into a string when stored.

## set_int


```lua
fun(key: string, value: integer)
```

 * `set_int(key, value)`
     * The range for the value is system-dependent (usually 32 bits).
       The value will be converted into a string when stored.

## set_string


```lua
fun(key: string, value: string)
```

 * `set_string(key, value)`: Value of `""` will delete the key.

## to_table


```lua
fun():{ fields: table<string, string>, inventory: InvTable }
```


---

# ModChannel

## is_writeable


```lua
fun()
```

 * `is_writeable()`: returns true if channel is writeable and mod can send over
   it.

## leave


```lua
fun()
```

 * `leave()`: leave the mod channel.
     * Server leaves channel `channel_name`.
     * No more incoming or outgoing messages can be sent to this channel from
       server mods.
     * This invalidate all future object usage.
     * Ensure you set mod_channel to nil after that to free Lua resources.

## send_all


```lua
fun(message: string)
```

 * `send_all(message)`: Send `message` though the mod channel.
     * If mod channel is not writeable or invalid, message will be dropped.
     * Message size is limited to 65535 characters by protocol.


---

# NodeBox

## connect_back


```lua
number[]|number[][]
```

## connect_front


```lua
number[]|number[][]
```

## connect_right


```lua
number[]|number[][]
```

## connect_top


```lua
number[]|number[][]
```

## disconnected


```lua
number[]|number[][]
```

## disconnected_back


```lua
number[]|number[][]
```

## disconnected_bottom


```lua
number[]|number[][]
```

## disconnected_front


```lua
number[]|number[][]
```

## disconnected_left


```lua
number[]|number[][]
```

## disconnected_right


```lua
number[]|number[][]
```

## disconnected_sides


```lua
number[]|number[][]
```

## disconnected_top


```lua
number[]|number[][]
```

## fixed


```lua
number[]|number[][]
```

## type


```lua
"connected"|"fixed"|"leveled"|"regular"|"wallmounted"
```

 ```lua
 {
     -- A normal cube; the default in most things
     type = "regular"
 }
 {
     -- A fixed box (or boxes) (facedir param2 is used, if applicable)
     type = "fixed",
     fixed = box OR {box1, box2, ...}
 }
 {
     -- A variable height box (or boxes) with the top face position defined
     -- by the node parameter 'leveled = ', or if 'paramtype2 == "leveled"'
     -- by param2.
     -- Other faces are defined by 'fixed = {}' as with 'type = "fixed"'.
     type = "leveled",
     fixed = box OR {box1, box2, ...}
 }
 {
     -- A box like the selection box for torches
     -- (wallmounted param2 is used, if applicable)
     type = "wallmounted",
     wall_top = box,
     wall_bottom = box,
     wall_side = box
 }
 {
     -- A node that has optional boxes depending on neighboring nodes'
     -- presence and type. See also `connects_to`.
     type = "connected",
     fixed = box OR {box1, box2, ...}
     connect_top = box OR {box1, box2, ...}
     connect_bottom = box OR {box1, box2, ...}
     connect_front = box OR {box1, box2, ...}
     connect_left = box OR {box1, box2, ...}
     connect_back = box OR {box1, box2, ...}
     connect_right = box OR {box1, box2, ...}
     -- The following `disconnected_*` boxes are the opposites of the
     -- `connect_*` ones above, i.e. when a node has no suitable neighbor
     -- on the respective side, the corresponding disconnected box is drawn.
     disconnected_top = box OR {box1, box2, ...}
     disconnected_bottom = box OR {box1, box2, ...}
     disconnected_front = box OR {box1, box2, ...}
     disconnected_left = box OR {box1, box2, ...}
     disconnected_back = box OR {box1, box2, ...}
     disconnected_right = box OR {box1, box2, ...}
     disconnected = box OR {box1, box2, ...} -- when there is *no* neighbor
     disconnected_sides = box OR {box1, box2, ...} -- when there are *no*
                                                   -- neighbors to the sides
 }

## wall_bottom


```lua
number[]
```

## wall_side


```lua
number[]
```

## wall_top


```lua
number[]
```


---

# NodeDef

## after_destruct


```lua
(fun(pos: vector, oldnode: MapNode|{ name: string, param1: number, param2: number }):nil)?
```

 after_destruct = function(pos, oldnode),
 Node destructor; called after removing node.
 Not called for bulk node placement.
 default: nil

## after_dig_node


```lua
(fun(pos: vector, oldnode: MapNode|{ name: string, param1: number, param2: number }, oldmetadata: { fields: table<string, string>, inventory: InvTable }, digger: PlayerRef):nil)?
```

 after_dig_node = function(pos, oldnode, oldmetadata, digger),
 Called after destructing the node when node was dug using
 `core.node_dig` / `core.dig_node`.
 * `pos`: node position
 * `oldnode`: node table of node before it was dug
 * `oldmetadata`: metadata of node before it was dug,
                  as a metadata table
 * `digger`: ObjectRef of digger
 default: nil

## after_place_node


```lua
(fun(pos: vector, placer: PlayerRef, itemstack: ItemStack, pointed_thing: pointed_thing):nil)?
```

 after_place_node = function(pos, placer, itemstack, pointed_thing),
 Called after constructing node when node was placed using
 core.item_place_node / core.place_node.
 If return true no item is taken from itemstack.
 `placer` may be any valid ObjectRef or nil.
 default: nil

## after_use


```lua
fun(itemstack: ItemStack, user?: PlayerRef, node: MapNode|{ name: string, param1: number, param2: number }, digparams: table)?
```

 default: nil
 If defined, should return an itemstack and will be called instead of
 wearing out the item (if tool). If returnskk nil, does nothing.
 If after_use doesn't exist, it is the same as:
   function(itemstack, user, node, digparams)
     itemstack:add_wear(digparams.wear)
     return itemstack
   end
 The user may be any ObjectRef or nil.

## air_equivalent


```lua
boolean?
```

 air_equivalent = nil,
 unclear meaning, the engine sets this to true for 'air' and 'ignore'
 deprecated.
 Unofficial note: But what else are you supposed to do? i guess make an is_air function lmao

## allow_metadata_inventory_move


```lua
(fun(pos: vector, from_list: string, from_index: integer, to_list: string, to_index: integer, count: integer, player: PlayerRef):integer)?
```

 allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player),
 Called when a player wants to move items inside the inventory.
 Return value: number of items allowed to move.

## allow_metadata_inventory_put


```lua
(fun(pos: vector, listname: string, index: integer, stack: ItemStack, player: PlayerRef):integer)?
```

 allow_metadata_inventory_put = function(pos, listname, index, stack, player),
 Called when a player wants to put something into the inventory.
 Return value: number of items allowed to put.
 Return value -1: Allow and don't modify item count in inventory.

## allow_metadata_inventory_take


```lua
(fun(pos: vector, listname: string, index: integer, stack: ItemStack, player: PlayerRef):integer)?
```

 allow_metadata_inventory_take = function(pos, listname, index, stack, player),
 Called when a player wants to take something out of the inventory.
 Return value: number of items allowed to take.
 Return value -1: Allow and don't modify item count in inventory.

## buildable_to


```lua
boolean?
```

 buildable_to = false,  -- If true, placed nodes can replace this node

## can_dig


```lua
(fun(pos: vector, player?: PlayerRef):boolean)?
```

 can_dig = function(pos, [player]),
 Returns true if node can be dug, or false if not.
 default: nil

## climbable


```lua
boolean?
```

 climbable = false,  -- If true, can be climbed on like a ladder

## collision_box


```lua
NodeBox?
```

 collision_box = {
 see [Node boxes] for possibilities
 },
 Custom collision box definition. Multiple boxes can be defined.
 If "nodebox" drawtype is used and collision_box is nil, then node_box
 definition is used for the collision box.

## color


```lua
ColorSpec?
```

 color = ColorSpec,
 The node's original color will be multiplied with this color.
 If the node has a palette, then this setting only has an effect in
 the inventory and on the wield item.

## connect_sides


```lua
string[]?
```

 connect_sides = {},
 Tells connected nodebox nodes to connect only to these sides of this
 node. possible: "top", "bottom", "front", "left", "back", "right"

## connects_to


```lua
string[]?
```

 connects_to = {},
 Used for nodebox nodes with the type == "connected".
 Specifies to what neighboring nodes connections will be drawn.
 e.g. `{"group:fence", "default:wood"}` or `"default:stone"`

## damage_per_second


```lua
integer?
```

 damage_per_second = 0,
 If player is inside node, this damage is caused

## description


```lua
string
```

 Can contain new lines. "\n" has to be used as new line character.
 See also: `get_description` in [`ItemStack`]

## diggable


```lua
boolean?
```

 diggable = true,  -- If false, can never be dug

## drawtype


```lua
("airlike"|"allfaces"|"allfaces_optional"|"fencelike"|"firelike"...(+13))?
```

 drawtype = "normal",  -- See "Node drawtypes"
 Node drawtypes
 --------------

 There are a bunch of different looking node types.

 * `normal`
     * A node-sized cube.
 * `airlike`
     * Invisible, uses no texture.
 * `liquid`
     * The cubic source node for a liquid.
     * Faces bordering to the same node are never rendered.
     * Connects to node specified in `liquid_alternative_flowing` if specified.
     * Use `backface_culling = false` for the tiles you want to make
       visible when inside the node.
 * `flowingliquid`
     * The flowing version of a liquid, appears with various heights and slopes.
     * Faces bordering to the same node are never rendered.
     * Connects to node specified in `liquid_alternative_source`.
     * You *must* set `liquid_alternative_flowing` to the node's own name.
     * Node textures are defined with `special_tiles` where the first tile
       is for the top and bottom faces and the second tile is for the side
       faces.
     * `tiles` is used for the item/inventory/wield image rendering.
     * Use `backface_culling = false` for the special tiles you want to make
       visible when inside the node
 * `glasslike`
     * Often used for partially-transparent nodes.
     * Only external sides of textures are visible.
 * `glasslike_framed`
     * All face-connected nodes are drawn as one volume within a surrounding
       frame.
     * The frame appearance is generated from the edges of the first texture
       specified in `tiles`. The width of the edges used are 1/16th of texture
       size: 1 pixel for 16x16, 2 pixels for 32x32 etc.
     * The glass 'shine' (or other desired detail) on each node face is supplied
       by the second texture specified in `tiles`.
 * `glasslike_framed_optional`
     * This switches between the above 2 drawtypes according to the menu setting
       'Connected Glass'.
 * `allfaces`
     * Often used for partially-transparent nodes.
     * External sides of textures, and unlike other drawtypes, the external sides
       of other nodes, are visible from the inside.
 * `allfaces_optional`
     * Often used for leaves nodes.
     * This switches between `normal`, `glasslike` and `allfaces` according to
       the menu setting: Opaque Leaves / Simple Leaves / Fancy Leaves.
     * With 'Simple Leaves' selected, the texture specified in `special_tiles`
       is used instead, if present. This allows a visually thicker texture to be
       used to compensate for how `glasslike` reduces visual thickness.
 * `torchlike`
     * A single vertical texture.
     * If `paramtype2="[color]wallmounted"`:
         * If placed on top of a node, uses the first texture specified in `tiles`.
         * If placed against the underside of a node, uses the second texture
           specified in `tiles`.
         * If placed on the side of a node, uses the third texture specified in
           `tiles` and is perpendicular to that node.
     * If `paramtype2="none"`:
         * Will be rendered as if placed on top of a node (see
           above) and only the first texture is used.
 * `signlike`
     * A single texture parallel to, and mounted against, the top, underside or
       side of a node.
     * If `paramtype2="[color]wallmounted"`, it rotates according to `param2`
     * If `paramtype2="none"`, it will always be on the floor.
 * `plantlike`
     * Two vertical and diagonal textures at right-angles to each other.
     * See `paramtype2 = "meshoptions"` above for other options.
 * `firelike`
     * When above a flat surface, appears as 6 textures, the central 2 as
       `plantlike` plus 4 more surrounding those.
     * If not above a surface the central 2 do not appear, but the texture
       appears against the faces of surrounding nodes if they are present.
 * `fencelike`
     * A 3D model suitable for a wooden fence.
     * One placed node appears as a single vertical post.
     * Adjacently-placed nodes cause horizontal bars to appear between them.
 * `raillike`
     * Often used for tracks for mining carts.
     * Requires 4 textures to be specified in `tiles`, in order: Straight,
       curved, t-junction, crossing.
     * Each placed node automatically switches to a suitable rotated texture
       determined by the adjacent `raillike` nodes, in order to create a
       continuous track network.
     * Becomes a sloping node if placed against stepped nodes.
 * `nodebox`
     * Often used for stairs and slabs.
     * Allows defining nodes consisting of an arbitrary number of boxes.
     * See [Node boxes] below for more information.
 * `mesh`
     * Uses models for nodes.
     * Tiles should hold model materials textures.
     * Only static meshes are implemented.
     * For supported model formats see Irrlicht engine documentation.
 * `plantlike_rooted`
     * Enables underwater `plantlike` without air bubbles around the nodes.
     * Consists of a base cube at the coordinates of the node plus a
       `plantlike` extension above
     * If `paramtype2="leveled", the `plantlike` extension has a height
       of `param2 / 16` nodes, otherwise it's the height of 1 node
     * If `paramtype2="wallmounted"`, the `plantlike` extension
       will be at one of the corresponding 6 sides of the base cube.
       Also, the base cube rotates like a `normal` cube would
     * The `plantlike` extension visually passes through any nodes above the
       base cube without affecting them.
     * The base cube texture tiles are defined as normal, the `plantlike`
       extension uses the defined special tile, for example:
       `special_tiles = {{name = "default_papyrus.png"}},`

 `*_optional` drawtypes need less rendering time if deactivated
 (always client-side).

## drop


```lua
(string|{ max_items: integer?, items: { rarity: integer?, items: string[], tools: table?, inherit_color: boolean? }[] })?
```

 drop = "",
 Name of dropped item when dug.
 Default dropped item is the node itself.
 -----------------
 Using a table allows multiple items, drop chances and item filtering:
 drop = {
     max_items = 1,
     -- Maximum number of item lists to drop.
     -- The entries in 'items' are processed in order. For each:
     -- Item filtering is applied, chance of drop is applied, if both are
     -- successful the entire item list is dropped.
     -- Entry processing continues until the number of dropped item lists
     -- equals 'max_items'.
     -- Therefore, entries should progress from low to high drop chance.
     items = {
         -- Examples:
         {
             -- 1 in 1000 chance of dropping a diamond.
             -- Default rarity is '1'.
             rarity = 1000,
             items = {"default:diamond"},
         },
         {
             -- Only drop if using an item whose name is identical to one
             -- of these.
             tools = {"default:shovel_mese", "default:shovel_diamond"},
             rarity = 5,
             items = {"default:dirt"},
             -- Whether all items in the dropped item list inherit the
             -- hardware coloring palette color from the dug node.
             -- Default is 'false'.
             inherit_color = true,
         },
         {
             -- Only drop if using an item whose name contains
             -- "default:shovel_" (this item filtering by string matching
             -- is deprecated, use tool_groups instead).
             tools = {"~default:shovel_"},
             rarity = 2,
             -- The item list dropped.
             items = {"default:sand", "default:desert_sand"},
         },
         {
             -- Only drop if using an item in the "magicwand" group, or
             -- an item that is in both the "pickaxe" and the "lucky"
             -- groups.
             tool_groups = {
                 "magicwand",
                 {"pickaxe", "lucky"}
             },
             items = {"default:coal_lump"},
         },
     },
 },

## drowning


```lua
integer?
```

 drowning = 0,
 Player will take this amount of damage if no bubbles are left

## floodable


```lua
boolean?
```

 floodable = false,
 If true, liquids flow into and replace this node.
 Warning: making a liquid node 'floodable' will cause problems.

## groups


```lua
table<string, integer>
```

 key = name, value = rating; rating = <number>.
 If rating not applicable, use 1.
 e.g. {wool = 1, fluffy = 3}
      {soil = 2, outerspace = 1, crumbly = 1}
      {bendy = 2, snappy = 1},
      {hard = 1, metal = 1, spikes = 1}

## inventory_image


```lua
string?
```

 Texture shown in the inventory GUI
 Defaults to a 3D rendering of the node if left empty.

## inventory_overlay


```lua
string?
```

 An overlay texture which is not affected by colorization

## is_ground_content


```lua
boolean?
```

 is_ground_content = true,
 If false, the cave generator and dungeon generator will not carve
 through this node.
 Specifically, this stops mod-added nodes being removed by caves and
 dungeons when those generate in a neighbor mapchunk and extend out
 beyond the edge of that mapchunk.

## legacy_facedir_simple


```lua
boolean?
```

 Support maps made in and before January 2012

## legacy_wallmounted


```lua
boolean?
```

 Support maps made in and before January 2012

## leveled


```lua
integer?
```

 leveled = 0,
 Only valid for "nodebox" drawtype with 'type = "leveled"'.
 Allows defining the nodebox height without using param2.
 The nodebox height is 'leveled' / 64 nodes.
 The maximum value of 'leveled' is `leveled_max`.

## leveled_max


```lua
integer?
```

 leveled_max = 127,
 Maximum value for `leveled` (0-127), enforced in
 `core.set_node_level` and `core.add_node_level`.
 Values above 124 might causes collision detection issues.

## light_source


```lua
integer?
```

 When used for nodes: Defines amount of light emitted by node.
 Otherwise: Defines texture glow when viewed as a dropped item
 To set the maximum (14), use the value 'core.LIGHT_MAX'.
 A value outside the range 0 to core.LIGHT_MAX causes undefined
 behavior.

## liquid_alternative_flowing


```lua
string?
```

 liquid_alternative_flowing = "",
 liquid_alternative_source = "",
 These fields may contain node names that represent the
 flowing version (`liquid_alternative_flowing`) and
 source version (`liquid_alternative_source`) of a liquid.

 Specifically, these fields are required if `liquidtype ~= "none"` or
 `drawtype == "flowingliquid"`.

 Liquids consist of up to two nodes: source and flowing.

 There are two ways to define a liquid:
 1) Source node and flowing node. This requires both fields to be
    specified for both nodes.
 2) Standalone source node (cannot flow). `liquid_alternative_source`
    must be specified and `liquid_range` must be set to 0.

 Example:
     liquid_alternative_flowing = "example:water_flowing",
     liquid_alternative_source = "example:water_source",

## liquid_alternative_source


```lua
string?
```

## liquid_move_physics


```lua
boolean?
```

 liquid_move_physics = nil, -- specifies movement physics if inside node
 * false: No liquid movement physics apply.
 * true: Enables liquid movement physics. Enables things like
   ability to "swim" up/down, sinking slowly if not moving,
   smoother speed change when falling into, etc. The `movement_liquid_*`
   settings apply.
 * nil: Will be treated as true if `liquidtype ~= "none"`
   and as false otherwise.

## liquid_range


```lua
integer?
```

 liquid_range = 8,
 Maximum distance that flowing liquid nodes can spread around
 source on flat land;
 maximum = 8; set to 0 to disable liquid flow

## liquid_renewable


```lua
boolean?
```

 liquid_renewable = true,
 If true, a new liquid source can be created by placing two or more
 sources nearby

## liquid_viscosity


```lua
number?
```

 liquid_viscosity = 0,
 Controls speed at which the liquid spreads/flows (max. 7).
 0 is fastest, 7 is slowest.
 By default, this also slows down movement of players inside the node
 (can be overridden using `move_resistance`)

## liquids_pointable


```lua
boolean?
```

 If true, item can point to all liquid nodes (`liquidtype ~= "none"`),
 even those for which `pointable = false`

## liquidtype


```lua
("flowing"|"none"|"source")?
```

 liquidtype = "none",  -- specifies liquid flowing physics
 * "none":    no liquid flowing physics
 * "source":  spawns flowing liquid nodes at all 4 sides and below;
              recommended drawtype: "liquid".
 * "flowing": spawned from source, spawns more flowing liquid nodes
              around it until `liquid_range` is reached;
              will drain out without a source;
              recommended drawtype: "flowingliquid".
 If it's "source" or "flowing", then the
 `liquid_alternative_*` fields _must_ be specified

## mesh


```lua
string?
```

 mesh = "",
 File name of mesh when using "mesh" drawtype
 The center of the node is the model origin.
 For legacy reasons, this uses a different scale depending on the mesh:
 1. For glTF models: 10 units = 1 node (consistent with the scale for entities).
 2. For obj models: 1 unit = 1 node.
 3. For b3d and x models: 1 unit = 1 node if static, otherwise 10 units = 1 node.
 Using static glTF or obj models is recommended.
 You can use the `visual_scale` multiplier to achieve the expected scale.

## mod_origin


```lua
string?
```

 mod_origin = "modname",
 stores which mod actually registered a node
 If the source could not be determined it contains "??"
 Useful for getting which mod truly registered something
 example: if a node is registered as ":othermodname:nodename",
 nodename will show "othermodname", but mod_origin will say "modname"

## move_resistance


```lua
number?
```

 move_resistance = 0,
 Slows down movement of players through this node (max. 7).
 If this is nil, it will be equal to liquid_viscosity.
 Note: If liquid movement physics apply to the node
 (see `liquid_move_physics`), the movement speed will also be
 affected by the `movement_liquid_*` settings.

## node_box


```lua
NodeBox?
```

 node_box = {type = "regular"},  -- See "Node boxes"

## node_dig_prediction


```lua
string?
```

 if "", no prediction is made.
 if "air", node is removed.
 Otherwise should be name of node which the client immediately places
 upon digging. Server will always update with actual result shortly.

## node_placement_prediction


```lua
string?
```

 If nil and item is node, prediction is made automatically.
 If nil and item is not a node, no prediction is made.
 If "" and item is anything, no prediction is made.
 Otherwise should be name of node which the client immediately places
 on ground when the player places the item. Server will always update
 with actual result shortly.

## on_blast


```lua
(fun(pos: vector, intensity?: number):any)?
```

 on_blast = function(pos, intensity),
 intensity: 1.0 = mid range of regular TNT.
 If defined, called when an explosion touches the node, instead of
 removing the node.
 Unofficial note: this is a custom field, just documented in lua_api.md i assume because TNT mods usually don't handle indestructible nodes/whatever very well

## on_construct


```lua
(fun(pos: vector):nil)?
```

 on_construct = function(pos),
 Node constructor; called after adding node.
 Can set up metadata and stuff like that.
 Not called for bulk node placement (i.e. schematics and VoxelManip).
 Note: Within an on_construct callback, core.set_node can cause an
 infinite loop if it invokes the same callback.
  Consider using core.swap_node instead.
 default: nil

## on_destruct


```lua
(fun(pos?: vector):nil)?
```

 on_destruct = function(pos),
 Node destructor; called before removing node.
 Not called for bulk node placement.
 default: nil

## on_dig


```lua
(fun(pos: vector, node: MapNode|{ name: string, param1: number, param2: number }, digger: PlayerRef):boolean)?
```

 on_dig = function(pos, node, digger),
 default: core.node_dig
 By default checks privileges, wears out item (if tool) and removes node.
 return true if the node was dug successfully, false otherwise.
 Deprecated: returning nil is the same as returning true.

## on_drop


```lua
fun(itemstack: ItemStack, dropper: PlayerRef, pos: vector)?
```

 Shall drop item and return the leftover itemstack.
 The dropper may be any ObjectRef or nil.
 default: core.item_drop

## on_flood


```lua
fun(pos: vector, oldnode: MapNode|{ name: string, param1: number, param2: number }, newnode: MapNode|{ name: string, param1: number, param2: number }):boolean??
```

 on_flood = function(pos, oldnode, newnode),
 Called when a liquid (newnode) is about to flood oldnode, if it has
 `floodable = true` in the nodedef. Not called for bulk node placement
 (i.e. schematics and VoxelManip) or air nodes. If return true the
 node is not flooded, but on_flood callback will most likely be called
 over and over again every liquid update interval.
 Default: nil
 Warning: making a liquid node 'floodable' will cause problems.

## on_metadata_inventory_move


```lua
(fun(pos: vector, from_list: string, from_index: integer, to_list: string, to_index: integer, count: integer, player: PlayerRef):nil)?
```

 on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player),
 Called after the actual action has happened, according to what was
 allowed.
 No return value.

## on_metadata_inventory_put


```lua
(fun(pos: vector, listname: string, index: integer, stack: ItemStack, player: PlayerRef):nil)?
```

 on_metadata_inventory_put = function(pos, listname, index, stack, player),
 Called after the actual action has happened, according to what was
 allowed.
 No return value.

## on_metadata_inventory_take


```lua
(fun(pos: vector, listname: string, index: integer, stack: ItemStack, player: PlayerRef):nil)?
```

 on_metadata_inventory_take = function(pos, listname, index, stack, player),
 Called after the actual action has happened, according to what was
 allowed.
 No return value.

## on_pickup


```lua
fun(itemstack: ItemStack, picker: PlayerRef, pointed_thing: pointed_thing, time_from_last_punch: number, ...any):ItemStack??
```

 Called when a dropped item is punched by a player.
 Shall pick-up the item and return the leftover itemstack or nil to not
 modify the dropped item.
 Parameters:
 * `itemstack`: The `ItemStack` to be picked up.
 * `picker`: Any `ObjectRef` or `nil`.
 * `pointed_thing` (optional): The dropped item (a `"__builtin:item"`
   luaentity) as `type="object"` `pointed_thing`.
 * `time_from_last_punch, ...` (optional): Other parameters from
   `luaentity:on_punch`.
 default: `core.item_pickup`

## on_place


```lua
fun(itemstack: ItemStack, placer: PlayerRef, pointed_thing: pointed_thing):ItemStack??
```

 When the 'place' key was pressed with the item in hand
 and a node was pointed at.
 Shall place item and return the leftover itemstack
 or nil to not modify the inventory.
 The placer may be any ObjectRef or nil.
 default: core.item_place

## on_punch


```lua
fun(pos: vector, node: MapNode|{ name: string, param1: number, param2: number }, puncher: PlayerRef, pointed_thing: pointed_thing)?
```

 on_punch = function(pos, node, puncher, pointed_thing),
 default: core.node_punch
 Called when puncher (an ObjectRef) punches the node at pos.
 By default calls core.register_on_punchnode callbacks.

## on_receive_fields


```lua
(fun(pos: vector, _: nil, fields: table<string, string>):nil)?
```

 on_receive_fields = function(pos, formname, fields, sender),
 fields = {name1 = value1, name2 = value2, ...}
 formname should be the empty string; you **must not** use formname.
 Called when an UI form (e.g. sign text input) returns data.
 See core.register_on_player_receive_fields for more info.
 default: nil

## on_rightclick


```lua
(fun(pos: vector, node: MapNode|{ name: string, param1: number, param2: number }, clicker: PlayerRef, itemstack: ItemStack, pointed_thing: pointed_thing):ItemStack)?
```

 on_rightclick = function(pos, node, clicker, itemstack, pointed_thing),
 default: nil
 Called when clicker (an ObjectRef) used the 'place/build' key
 (not necessarily an actual rightclick)
 while pointing at the node at pos with 'node' being the node table.
 itemstack will hold clicker's wielded item.
 Shall return the leftover itemstack.
 Note: pointed_thing can be nil, if a mod calls this function.
 This function does not get triggered by clients <=0.4.16 if the
 "formspec" node metadata field is set.
 Unofficial note: Ah, i love the "Not triggered in these specific old unusable versions you probably cannot support even if you tried, and which servers get penaltied for supporting them"

## on_secondary_use


```lua
fun(itemstack: ItemStack, user: PlayerRef, pointed_thing: pointed_thing)?
```

 Same as on_place but called when not pointing at a node.
 Function must return either nil if inventory shall not be modified,
 or an itemstack to replace the original itemstack.
 The user may be any ObjectRef or nil.
 default: nil

## on_timer


```lua
fun(pos: vector, elapsed: number):boolean??
```

 on_timer = function(pos, elapsed),
 default: nil
 called by NodeTimers, see core.get_node_timer and NodeTimerRef.
 elapsed is the total time passed since the timer was started.
 return true to run the timer for another cycle with the same timeout
 value.

## on_use


```lua
fun(itemstack: ItemStack, user?: PlayerRef, pointed_thing: pointed_thing)?
```

 default: nil
 When user pressed the 'punch/mine' key with the item in hand.
 Function must return either nil if inventory shall not be modified,
 or an itemstack to replace the original itemstack.
 e.g. itemstack:take_item(); return itemstack
 Otherwise, the function is free to do what it wants.
 The user may be any ObjectRef or nil.
 The default functions handle regular use cases.

## overlay_tiles


```lua
string|{ name: string, backface_culling: boolean?, animation: TileAnimation?, align_style: ("node"|"user"|"world")?, scale: integer }[]?
```

 overlay_tiles = {tile definition 1, def2, def3, def4, def5, def6},
 Same as `tiles`, but these textures are drawn on top of the base
 tiles. You can use this to colorize only specific parts of your
 texture. If the texture name is an empty string, that overlay is not
 drawn. Since such tiles are drawn twice, it is not recommended to use
 overlays on very common nodes.

## palette


```lua
string?
```

 palette = "",
 The node's `param2` is used to select a pixel from the image.
 Pixels are arranged from left to right and from top to bottom.
 The node's color will be multiplied with the selected pixel's color.
 Tiles can override this behavior.
 Only when `paramtype2` supports palettes.

## paramtype


```lua
("light"|"none")?
```

 paramtype = "none",  -- See "Nodes"
 ### Unofficial note: you want this to be "light" most of the time, ESPECIALLY for other drawtypes, as some will appear pitch black if you don't have smooth lighting
 The function of `param1` is determined by `paramtype` in node definition.
 `param1` is reserved for the engine when `paramtype != "none"`.

 * `paramtype = "light"`
     * The value stores light with and without sun in its lower and upper 4 bits
       respectively.
     * Required by a light source node to enable spreading its light.
     * Required by the following drawtypes as they determine their visual
       brightness from their internal light value:
         * torchlike
         * signlike
         * firelike
         * fencelike
         * raillike
         * nodebox
         * mesh
         * plantlike
         * plantlike_rooted
 * `paramtype = "none"`
     * `param1` will not be used by the engine and can be used to store
       an arbitrary value

## paramtype2


```lua
("4dir"|"color"|"color4dir"|"colordegrotate"|"colorfacedir"...(+9))?
```

 paramtype2 = "none",  -- See "Nodes"
 The function of `param2` is determined by `paramtype2` in node definition.
 `param2` is reserved for the engine when `paramtype2 != "none"`.

 * `paramtype2 = "flowingliquid"`
     * Used by `drawtype = "flowingliquid"` and `liquidtype = "flowing"`
     * The liquid level and a flag of the liquid are stored in `param2`
     * Bits 0-2: Liquid level (0-7). The higher, the more liquid is in this node;
       see `core.get_node_level`, `core.set_node_level` and `core.add_node_level`
       to access/manipulate the content of this field
     * Bit 3: If set, liquid is flowing downwards (no graphical effect)
 * `paramtype2 = "wallmounted"`
     * Supported drawtypes: "torchlike", "signlike", "plantlike",
       "plantlike_rooted", "normal", "nodebox", "mesh"
     * The rotation of the node is stored in `param2`
     * Node is 'mounted'/facing towards one of 6 directions
     * You can make this value by using `core.dir_to_wallmounted()`
     * Values range 0 - 7
     * The value denotes at which direction the node is "mounted":
       0 = y+,   1 = y-,   2 = x+,   3 = x-,   4 = z+,   5 = z-
       6 = y+, but rotated by  90°
       7 = y-, but rotated by -90°
     * By default, on placement the param2 is automatically set to the
       appropriate rotation (0 to 5), depending on which side was
       pointed at. With the node field `wallmounted_rotate_vertical = true`,
       the param2 values 6 and 7 might additionally be set
 * `paramtype2 = "facedir"`
     * Supported drawtypes: "normal", "nodebox", "mesh"
     * The rotation of the node is stored in `param2`.
     * Node is rotated around face and axis; 24 rotations in total.
     * Can be made by using `core.dir_to_facedir()`.
     * Chests and furnaces can be rotated that way, and also 'flipped'
     * Values range 0 - 23
     * facedir / 4 = axis direction:
       0 = y+,   1 = z+,   2 = z-,   3 = x+,   4 = x-,   5 = y-
     * The node is rotated 90 degrees around the X or Z axis so that its top face
       points in the desired direction. For the y- direction, it's rotated 180
       degrees around the Z axis.
     * facedir modulo 4 = left-handed rotation around the specified axis, in 90° steps.
     * By default, on placement the param2 is automatically set to the
       horizontal direction the player was looking at (values 0-3)
     * Special case: If the node is a connected nodebox, the nodebox
       will NOT rotate, only the textures will.
 * `paramtype2 = "4dir"`
     * Supported drawtypes: "normal", "nodebox", "mesh"
     * The rotation of the node is stored in `param2`.
     * Allows node to be rotated horizontally, 4 rotations in total
     * Can be made by using `core.dir_to_fourdir()`.
     * Chests and furnaces can be rotated that way, but not flipped
     * Values range 0 - 3
     * 4dir modulo 4 = rotation
     * Otherwise, behavior is identical to facedir
 * `paramtype2 = "leveled"`
     * Only valid for "nodebox" with 'type = "leveled"', and "plantlike_rooted".
         * Leveled nodebox:
             * The level of the top face of the nodebox is stored in `param2`.
             * The other faces are defined by 'fixed = {}' like 'type = "fixed"'
               nodeboxes.
             * The nodebox height is (`param2` / 64) nodes.
             * The maximum accepted value of `param2` is 127.
         * Rooted plantlike:
             * The height of the 'plantlike' section is stored in `param2`.
             * The height is (`param2` / 16) nodes.
 * `paramtype2 = "degrotate"`
     * Valid for `plantlike` and `mesh` drawtypes. The rotation of the node is
       stored in `param2`.
     * Values range 0–239. The value stored in `param2` is multiplied by 1.5 to
       get the actual rotation in degrees of the node.
 * `paramtype2 = "meshoptions"`
     * Only valid for "plantlike" drawtype. `param2` encodes the shape and
       optional modifiers of the "plant". `param2` is a bitfield.
     * Bits 0 to 2 select the shape.
       Use only one of the values below:
         * 0 = an "x" shaped plant (ordinary plant)
         * 1 = a "+" shaped plant (just rotated 45 degrees)
         * 2 = a "*" shaped plant with 3 faces instead of 2
         * 3 = a "#" shaped plant with 4 faces instead of 2
         * 4 = a "#" shaped plant with 4 faces that lean outwards
         * 5-7 are unused and reserved for future meshes.
     * Bits 3 to 7 are used to enable any number of optional modifiers.
       Just add the corresponding value(s) below to `param2`:
         * 8  - Makes the plant slightly vary placement horizontally
         * 16 - Makes the plant mesh 1.4x larger
         * 32 - Moves each face randomly a small bit down (1/8 max)
         * values 64 and 128 (bits 6-7) are reserved for future use.
     * Example: `param2 = 0` selects a normal "x" shaped plant
     * Example: `param2 = 17` selects a "+" shaped plant, 1.4x larger (1+16)
 * `paramtype2 = "color"`
     * `param2` tells which color is picked from the palette.
       The palette should have 256 pixels.
 * `paramtype2 = "colorfacedir"`
     * Same as `facedir`, but with colors.
     * The three most significant bits of `param2` tells which color is picked from the
       palette. The palette should have 8 pixels.
     * The five least significant bits contain the `facedir` value.
 * `paramtype2 = "color4dir"`
     * Same as `4dir`, but with colors.
     * The six most significant bits of `param2` tells which color is picked from the
       palette. The palette should have 64 pixels.
     * The two least significant bits contain the `4dir` rotation.
 * `paramtype2 = "colorwallmounted"`
     * Same as `wallmounted`, but with colors.
     * The five most significant bits of `param2` tells which color is picked from the
       palette. The palette should have 32 pixels.
     * The three least significant bits contain the `wallmounted` value.
 * `paramtype2 = "glasslikeliquidlevel"`
     * Only valid for "glasslike_framed" or "glasslike_framed_optional"
       drawtypes. "glasslike_framed_optional" nodes are only affected if the
       "Connected Glass" setting is enabled.
     * Bits 0-5 define 64 levels of internal liquid, 0 being empty and 63 being
       full.
     * Bits 6 and 7 modify the appearance of the frame and node faces. One or
       both of these values may be added to `param2`:
         * 64  - Makes the node not connect with neighbors above or below it.
         * 128 - Makes the node not connect with neighbors to its sides.
     * Liquid texture is defined using `special_tiles = {"modname_tilename.png"}`
 * `paramtype2 = "colordegrotate"`
     * Same as `degrotate`, but with colors.
     * The three most significant bits of `param2` tells which color is picked
       from the palette. The palette should have 8 pixels.
     * The five least significant bits store rotation in range 0–23 (i.e. in 15° steps)
 * `paramtype2 = "none"`
     * `param2` will not be used by the engine and can be used to store
       an arbitrary value

## place_param2


```lua
integer?
```

 place_param2 = 0,
 Value for param2 that is set when player places node

## pointabilities


```lua
{ nodes: table<string, boolean|"blocking">, objects: table<string, boolean|"blocking"> }
```

 Contains lists to override the `pointable` property of nodes and objects.
 The index can be a node/entity name or a group with the prefix `"group:"`.
 (For objects `armor_groups` are used and for players the entity name is irrelevant.)
 If multiple fields fit, the following priority order is applied:
 1. value of matching node/entity name
 2. `true` for any group
 3. `false` for any group
 4. `"blocking"` for any group
 5. `liquids_pointable` if it is a liquid node
 6. `pointable` property of the node or object

## pointable


```lua
boolean?
```

 pointable = true,
 Can be `true` if it is pointable, `false` if it can be pointed through,
 or `"blocking"` if it is pointable but not selectable.
 Clients older than 5.9.0 interpret `pointable = "blocking"` as `pointable = true`.
 Can be overridden by the `pointabilities` of the held item.
 A client may be able to point non-pointable nodes, since it isn't checked server-side.

## post_effect_color


```lua
ColorSpec?
```

 post_effect_color = "#00000000",
 Screen tint if a player is inside this node, see `ColorSpec`.
 Color is alpha-blended over the screen.

## post_effect_color_shaded


```lua
boolean?
```

 post_effect_color_shaded = false,
 Determines whether `post_effect_color` is affected by lighting.

## preserve_metadata


```lua
fun(pos: vector, oldnode: MapNode|{ name: string, param1: number, param2: number }, oldmeta: { fields: table<string, string>, inventory: InvTable })?
```

 preserve_metadata = function(pos, oldnode, oldmeta, drops),
 Called when `oldnode` is about be converted to an item, but before the
 node is deleted from the world or the drops are added. This is
 generally the result of either the node being dug or an attached node
 becoming detached.
 * `pos`: node position
 * `oldnode`: node table of node before it was deleted
 * `oldmeta`: metadata of node before it was deleted, as a metadata table
 * `drops`: a table of `ItemStack`s, so any metadata to be preserved can
   be added directly to one or more of the dropped items. See
   "ItemStackMetaRef".
 default: `nil`

## range


```lua
number?
```

 Range of node and object pointing that is possible with this item held
 Can be overridden with itemstack meta.

## selection_box


```lua
NodeBox?
```

 selection_box = {
 see [Node boxes] for possibilities
 },
 Custom selection box definition. Multiple boxes can be defined.
 If "nodebox" drawtype is used and selection_box is nil, then node_box
 definition is used for the selection box.

## short_description


```lua
string?
```

 Must not contain new lines.
 Defaults to nil.
 Use an [`ItemStack`] to get the short description, e.g.:
   ItemStack(itemname):get_short_description()

## sound


```lua
{ breaks: SimpleSoundSpec?, eat: SimpleSoundSpec?, punch_use: SimpleSoundSpec?, punch_use_dir: SimpleSoundSpec? }
```

## sounds


```lua
{ footstep: SimpleSoundSpec, dig: SimpleSoundSpec, dug: SimpleSoundSpec, place: SimpleSoundSpec, place_failed: SimpleSoundSpec, fall: SimpleSoundSpec }?
```

 sounds = {
 Definition of node sounds to be played at various events.
 All fields in this table are optional.

footstep = <SimpleSoundSpec>,
 If walkable, played when object walks on it. If node is
 climbable or a liquid, played when object moves through it.
 Sound is played at the base of the object's collision-box.
 Gain is multiplied by `0.6`.
 For local player, it's played position-less, with normal gain.

        dig = <SimpleSoundSpec> or "__group",
 While digging node.
 If `"__group"`, then the sound will be
 `{name = "default_dig_<groupname>", gain = 0.5}` , where `<groupname>` is the
 name of the item's digging group with the fastest digging time.
 In case of a tie, one of the sounds will be played (but we
 cannot predict which one)
 Default value: `"__group"`

        dug = <SimpleSoundSpec>,
 Node was dug

        place = <SimpleSoundSpec>,
 Node was placed. Also played after falling

        place_failed = <SimpleSoundSpec>,
 When node placement failed.
 Note: This happens if the _built-in_ node placement failed.
 This sound will still be played if the node is placed in the
 `on_place` callback manually.

        fall = <SimpleSoundSpec>,
 When node starts to fall or is detached
    },

## special_tiles


```lua
string|{ name: string, backface_culling: boolean?, animation: TileAnimation?, align_style: ("node"|"user"|"world")?, scale: integer }[]?
```

 special_tiles = {tile definition 1, Tile definition 2},
 Special textures of node; used rarely.
 List can be shortened to needed length.

## stack_max


```lua
integer?
```

 Maximum amount of items that can be in a single stack.
 The default can be changed by the setting `default_stack_max`

## sunlight_propagates


```lua
boolean?
```

 sunlight_propagates = false,
 If true, sunlight will go infinitely through this node

## tiles


```lua
string|{ name: string, backface_culling: boolean?, animation: TileAnimation?, align_style: ("node"|"user"|"world")?, scale: integer }[]?
```

 tiles = {tile definition 1, def2, def3, def4, def5, def6},
 Textures of node; +Y, -Y, +X, -X, +Z, -Z
 List can be shortened to needed length.

## tool_capabilities


```lua
tool_capabilities?
```

 See "Tool Capabilities" section for an example including explanation

## touch_interaction


```lua
"long_dig_short_place"|"short_dig_long_place"|"user"|{ pointed_nothing: "long_dig_short_place"|"short_dig_long_place"|"user", pointed_node: "long_dig_short_place"|"short_dig_long_place"|"user", pointed_object: "long_dig_short_place"|"short_dig_long_place"|"user" }
```

 Only affects touchscreen clients.
 Defines the meaning of short and long taps with the item in hand.
 If specified as a table, the field to be used is selected according to
 the current `pointed_thing`.
 There are three possible TouchInteractionMode values:
 * "long_dig_short_place" (long tap  = dig, short tap = place)
 * "short_dig_long_place" (short tap = dig, long tap  = place)
 * "user":
   * For `pointed_object`: Equivalent to "short_dig_long_place" if the
     client-side setting "touch_punch_gesture" is "short_tap" (the
     default value) and the item is able to punch (i.e. has no on_use
     callback defined).
     Equivalent to "long_dig_short_place" otherwise.
   * For `pointed_node` and `pointed_nothing`:
     Equivalent to "long_dig_short_place".
   * The behavior of "user" may change in the future.
 The default value is "user".

## use_texture_alpha


```lua
("blend"|"clip"|"opaque")?
```

 use_texture_alpha = ...,
 Specifies how the texture's alpha channel will be used for rendering.
 Possible values:
 * "opaque":
   Node is rendered opaque regardless of alpha channel.
 * "clip":
   A given pixel is either fully see-through or opaque
   depending on the alpha channel being below/above 50% in value.
   Use this for nodes with fully transparent and fully opaque areas.
 * "blend":
   The alpha channel specifies how transparent a given pixel
   of the rendered node is. This comes at a performance cost.
   Only use this when correct rendering
   among semitransparent nodes is necessary.
 The default is "opaque" for drawtypes normal, liquid and flowingliquid,
 mesh and nodebox or "clip" otherwise.
 If set to a boolean value (deprecated): true either sets it to blend
 or clip, false sets it to clip or opaque mode depending on the drawtype.

## visual_scale


```lua
number?
```

 visual_scale = 1.0,
 Supported for drawtypes "plantlike", "signlike", "torchlike",
 "firelike", "mesh", "nodebox", "allfaces".
 For plantlike and firelike, the image will start at the bottom of the
 node. For torchlike, the image will start at the surface to which the
 node "attaches". For the other drawtypes the image will be centered
 on the node.

## walkable


```lua
boolean?
```

 walkable = true,  -- If true, objects collide with node

## wallmounted_rotate_vertical


```lua
boolean?
```

 wallmounted_rotate_vertical = false,
 If true, place_param2 is nil, and this is a wallmounted node,
 this node might use the special 90° rotation when placed
 on the floor or ceiling, depending on the direction.
 See the explanation about wallmounted for details.
 Otherwise, the rotation is always the same on vertical placement.

## waving


```lua
integer?
```

 waving = 0,
 Valid for drawtypes:
 mesh, nodebox, plantlike, allfaces_optional, liquid, flowingliquid.
 1 - wave node like plants (node top moves side-to-side, bottom is fixed)
 2 - wave node like leaves (whole node moves side-to-side)
 3 - wave node like liquids (whole node moves up and down)
 Not all models will properly wave.
 plantlike drawtype can only wave like plants.
 allfaces_optional drawtype can only wave like leaves.
 liquid, flowingliquid drawtypes can only wave like liquids.

## wear_color


```lua
wear_bar_params?
```

 Set wear bar color of the tool by setting color stops and blend mode
 See "Wear Bar Color" section for further explanation including an example

## wield_image


```lua
string?
```

 Texture shown when item is held in hand
 Defaults to a 3D rendering of the node if left empty.

## wield_overlay


```lua
string?
```

 Like inventory_overlay but only used in the same situation as wield_image

## wield_scale


```lua
vector?
```

 Scale for the item when held in hand


---

# NodeMetaRef

## contains


```lua
fun(key: string):boolean?
```

 * `contains(key)`: Returns true if key present, otherwise false.
     * Returns `nil` when the MetaData is inexistent.

## get


```lua
fun(key: string):string?
```

 * `get(key)`: Returns `nil` if key not present, else the stored string.

## get_float


```lua
fun(key: string):number
```

## get_int


```lua
fun(key: string):integer
```

 * `get_int(key)`: Returns `0` if key not present.

## get_inventory


```lua
fun():InvRef
```

## get_keys


```lua
fun():string[]
```

## mark_as_private


```lua
fun(fields: string|string[])
```

 * `mark_as_private(name or {name1, name2, ...})`: Mark specific vars as private
   This will prevent them from being sent to the client. Note that the "private"
   status will only be remembered if an associated key-value pair exists,
   meaning it's best to call this when initializing all other meta (e.g.
   `on_construct`).

## set_float


```lua
fun(key: string, value: number)
```

 * `set_float(key, value)`
     * Store a number (a 64-bit float) exactly.
     * The value will be converted into a string when stored.

## set_int


```lua
fun(key: string, value: integer)
```

 * `set_int(key, value)`
     * The range for the value is system-dependent (usually 32 bits).
       The value will be converted into a string when stored.

## set_string


```lua
fun(key: string, value: string)
```

 * `set_string(key, value)`: Value of `""` will delete the key.

## to_table


```lua
fun():{ fields: table<string, string>, inventory: InvTable }
```


---

# NodeTimerRef

## get_elapsed


```lua
fun():number
```

## get_timeout


```lua
fun():number
```

## is_started


```lua
fun():boolean
```

## set


```lua
fun(timeout: number, elapsed: number)
```

 * `set(timeout,elapsed)`
     * set a timer's state
     * `timeout` is in seconds, and supports fractional values (0.1 etc)
     * `elapsed` is in seconds, and supports fractional values (0.1 etc)
     * will trigger the node's `on_timer` function after `(timeout - elapsed)`
       seconds.

## start


```lua
fun(timeout: number)
```

## stop


```lua
fun()
```


---

# NoiseParams

## flags


```lua
(string|"absvalue"|"defaults"|"eased")?
```

 Leave this field unset for no special handling.
 Currently supported are `defaults`, `eased` and `absvalue`:

## lacunarity


```lua
number
```

 Each additional octave has a 'wavelength' that is the 'wavelength' of the
 previous octave multiplied by 1 / lacunarity, to create finer detail.
 'lacunarity' is often 2.0 so 'wavelength' often halves per octave.

 A positive number no smaller than 1.0.
 Values below 2.0 create higher quality noise at the expense of requiring more
 octaves to cover a particular range of 'wavelengths'.

## octaves


```lua
integer
```

 The number of simple noise generators that are combined.
 A whole number, 1 or more.
 Each additional octave adds finer detail to the noise but also increases the
 noise calculation load.
 3 is a typical minimum for a high quality, complex and natural-looking noise
 variation. 1 octave has a slight 'gridlike' appearance.

 Choose the number of octaves according to the `spread` and `lacunarity`, and the
 size of the finest detail you require. For example:
 if `spread` is 512 nodes, `lacunarity` is 2.0 and finest detail required is 16
 nodes, octaves will be 6 because the 'wavelengths' of the octaves will be
 512, 256, 128, 64, 32, 16 nodes.
 Warning: If the 'wavelength' of any octave falls below 1 an error will occur.

## offset


```lua
number
```

After the multiplication by `scale` this is added to the result and is the final
step in creating the noise value.
Can be positive or negative.


## persistence


```lua
number
```

 Each additional octave has an amplitude that is the amplitude of the previous
 octave multiplied by `persistence`, to reduce the amplitude of finer details,
 as is often helpful and natural to do so.
 Since this controls the balance of fine detail to large-scale detail
 `persistence` can be thought of as the 'roughness' of the noise.

 A positive or negative non-zero number, often between 0.3 and 1.0.
 A common medium value is 0.5, such that each octave has half the amplitude of
 the previous octave.
 This may need to be tuned when altering `lacunarity`; when doing so consider
 that a common medium value is 1 / lacunarity.

 Instead of `persistence`, the key `persist` may be used to the same effect.

## scale


```lua
number
```

Once all octaves have been combined, the result is multiplied by this.
Can be positive or negative.

## seed


```lua
number
```

 This is a whole number that determines the entire pattern of the noise
 variation. Altering it enables different noise patterns to be created.
 With other parameters equal, different seeds produce different noise patterns
 and identical seeds produce identical noise patterns.

 For this parameter you can randomly choose any whole number. Usually it is
 preferable for this to be different from other seeds, but sometimes it is useful
 to be able to create identical noise patterns.

 In some noise APIs the world seed is added to the seed specified in noise
 parameters. This is done to make the resulting noise pattern vary in different
 worlds, and be 'world-specific'.

## spread


```lua
vector
```

 For octave1, this is roughly the change of input value needed for a very large
 variation in the noise value generated by octave1. It is almost like a
 'wavelength' for the wavy noise variation.
 Each additional octave has a 'wavelength' that is smaller than the previous
 octave, to create finer detail. `spread` will therefore roughly be the typical
 size of the largest structures in the final noise variation.

 `spread` is a vector with values for x, y, z to allow the noise variation to be
 stretched or compressed in the desired axes.
 Values are positive numbers.


---

# ObjectProps

## automatic_face_movement_dir


```lua
(boolean|number)?
```

 Automatically set yaw to movement direction, offset in degrees.
 'false' to disable.

## automatic_face_movement_max_rotation_per_sec


```lua
number?
```

 Limit automatic rotation to this value in degrees per second.
 No limit if value <= 0.

## automatic_rotate


```lua
number?
```

 Set constant rotation in radians per second, positive or negative.
 Object rotates along the local Y-axis, and works with set_rotation.
 Set to 0 to disable constant rotation.

## backface_culling


```lua
boolean?
```

 Set to false to disable backface_culling for model
 Note: only used by "mesh" and "cube" visual

## breath_max


```lua
integer?
```

 For players only. Defines the maximum amount of "breath" for the player.
 Defaults to `core.PLAYER_MAX_BREATH_DEFAULT` (10).

## collide_with_objects


```lua
boolean?
```

 Collide with other objects if physical = true

## collisionbox


```lua
table?
```

 If `rotate = true`, it will match the object's rotation and any attachment rotations.
 Raycasts use the selection box and object's rotation, but do *not* obey attachment rotations.
 For server-side raycasts to work correctly,
 the selection box should extend at most 5 units in each direction.

## colors


```lua
table?
```

 Currently unused.

## damage_texture_modifier


```lua
string?
```

 Texture modifier to be applied for a short duration when object is hit

## eye_height


```lua
number?
```

 For players only. Camera height above feet position in nodes.

## glow


```lua
number?
```

 Add this much extra lighting when calculating texture color.
 Value < 0 disables light's effect on texture color.
 For faking self-lighting, UI style entities, or programmatic coloring
 in mods.

## hp_max


```lua
integer?
```

 Defines the maximum and default HP of the object.
 For Lua entities, the maximum is not enforced.
 For players, this defaults to `core.PLAYER_MAX_HP_DEFAULT` (20).
 For Lua entities, the default is 10.

## infotext


```lua
string?
```

 Same as infotext for nodes. Empty by default

## initial_sprite_basepos


```lua
{ x: number, y: number }?
```

 Used with spritesheet textures.
 Defines the {column, row} position of the initially used frame in the
 spritesheet.

## is_visible


```lua
boolean?
```

 If false, object is invisible and can't be pointed.

## makes_footstep_sound


```lua
boolean?
```

 If true, object is able to make footstep sounds of nodes
 (see node sound definition for details).

## mesh


```lua
string?
```

 File name of mesh when using "mesh" visual.
 For legacy reasons, this uses a 10x scale for meshes: 10 units = 1 node.

## nametag


```lua
string?
```

 The name to display on the head of the object. By default empty.
 If the object is a player, a nil or empty nametag is replaced by the player's name.
 For all other objects, a nil or empty string removes the nametag.
 To hide a nametag, set its color alpha to zero. That will disable it entirely.

## nametag_bgcolor


```lua
ColorSpec?
```

 Sets background color of nametag
 `false` will cause the background to be set automatically based on user settings.
 Default: false

## nametag_color


```lua
ColorSpec?
```

 Sets text color of nametag

## node


```lua
(MapNodeOpt|{ name: string, param1: number?, param2: number? })?
```

 Node to show when using the "node" visual

## physical


```lua
boolean?
```

 Collide with `walkable` nodes.

## pointable


```lua
boolean?
```

 Can be `true` if it is pointable, `false` if it can be pointed through,
 or `"blocking"` if it is pointable but not selectable.
 Clients older than 5.9.0 interpret `pointable = "blocking"` as `pointable = true`.
 Can be overridden by the `pointabilities` of the held item.

## selectionbox


```lua
number[]?
```

 { xmin, ymin, zmin, xmax, ymax, zmax } in nodes from object position.
 Collision boxes cannot rotate, setting `rotate = true` on it has no effect.
 If not set, the selection box copies the collision box, and will also not rotate.
 If `rotate = false`, the selection box will not rotate with the object itself, remaining fixed to the axes.

## shaded


```lua
boolean?
```

 Setting this to 'false' disables diffuse lighting of entity
 Note: ignored for "item", "wielditem" and "node" visual

## show_on_minimap


```lua
boolean?
```

 Defaults to true for players, false for other entities.
 If set to true the entity will show as a marker on the minimap.

## spritediv


```lua
{ x: number, y: number }?
```

 Used with spritesheet textures for animation and/or frame selection
 according to position relative to player.
 Defines the number of columns and rows in the spritesheet:
 {columns, rows}.

## static_save


```lua
boolean?
```

 If false, never save this object statically. It will simply be
 deleted when the block gets unloaded.
 The get_staticdata() callback is never called then.
 Defaults to 'true'.

## stepheight


```lua
number?
```

 If positive number, object will climb upwards when it moves
 horizontally against a `walkable` node, if the height difference
 is within `stepheight`.

## textures


```lua
string[]?
```

 Number of required textures depends on visual:
 "cube" uses 6 textures just like a node, but all 6 must be defined.
 "sprite" uses 1 texture.
 "upright_sprite" uses 2 textures: {front, back}.
 "mesh" requires one texture for each mesh buffer/material (in order)
 Deprecated usage of "wielditem" expects 'textures = {itemname}' (see 'visual' above).
 Unofficial note: I *guessed* that it's string[] but i am not sure

## use_texture_alpha


```lua
boolean?
```

 Use texture's alpha channel for transparency blending.
 Note: currently causes visual issues when viewed through other
 semi-transparent materials such as water.
 Note: ignored for "item", "wielditem" and "node" visual.

## visual


```lua
("cube"|"item"|"mesh"|"node"|"sprite"...(+2))?
```

 "cube" is a node-sized cube.
 "sprite" is a flat texture always facing the player.
 "upright_sprite" is a vertical flat texture.
 "mesh" uses the defined mesh model.
 "wielditem" is used for dropped items.
   (see builtin/game/item_entity.lua).
   For this use 'wield_item = itemname'.
   Setting 'textures = {itemname}' has the same effect, but is deprecated.
   If the item has a 'wield_image' the object will be an extrusion of
   that, otherwise:
   If 'itemname' is a cubic node or nodebox the object will appear
   identical to 'itemname'.
   If 'itemname' is a plantlike node the object will be an extrusion
   of its texture.
   Otherwise for non-node items, the object will be an extrusion of
   'inventory_image'.
   If 'itemname' contains a ColorString or palette index (e.g. from
   `core.itemstring_with_palette()`), the entity will inherit the color.
   Wielditems are scaled a bit. If you want a wielditem to appear
   to be as large as a node, use `0.667` in `visual_size`
 "item" is similar to "wielditem" but ignores the 'wield_image' parameter.
 "node" looks exactly like a node in-world (supported since 5.12.0)
   Note that visual effects like waving or liquid reflections will not work.

## visual_size


```lua
vector?
```

 Multipliers for the visual size. If `z` is not specified, `x` will be used
 to scale the entity along both horizontal axes.

## zoom_fov


```lua
number?
```

 For players only. Zoom FOV in degrees.
 Note that zoom loads and/or generates world beyond the server's
 maximum send and generate distances, so acts like a telescope.
 Smaller zoom_fov values increase the distance loaded/generated.
 Defaults to 15 in creative mode, 0 in survival mode.
 zoom_fov = 0 disables zooming for the player.


---

# ObjectRef

## add_player_velocity


```lua
fun(self: any, vel: vector)
```

 Player only
 * `add_player_velocity(vel)`: **DEPRECATED**, use add_velocity(vel) instead.

## add_pos


```lua
fun(self: any, pos: vector)
```

 * `add_pos(pos)`:
     * Changes position by adding to the current position.
     * No-op if object is attached.
     * `pos` is a vector `{x=num, y=num, z=num}`.
     * In comparison to using `set_pos`, `add_pos` will avoid synchronization problems.

## add_velocity


```lua
fun(self: any, vel: vector)
```

 * `add_velocity(vel)`
     * Changes velocity by adding to the current velocity.
     * `vel` is a vector, e.g. `{x=0.0, y=2.3, z=1.0}`
     * In comparison to using `get_velocity`, adding the velocity and then using
       `set_velocity`, `add_velocity` is supposed to avoid synchronization problems.
       Additionally, players also do not support `set_velocity`.
     * If object is a player:
         * Does not apply during `free_move`.
         * Note that since the player speed is normalized at each move step,
           increasing e.g. Y velocity beyond what would usually be achieved
           (see: physics overrides) will cause existing X/Z velocity to be reduced.
         * Example: `add_velocity({x=0, y=6.5, z=0})` is equivalent to
           pressing the jump key (assuming default settings)

## get_acceleration


```lua
fun(self: any):vector?
```

 * `get_acceleration()`: returns the acceleration, a vector

## get_animation


```lua
fun(self: any):{ x: number, y: number }, number, number, boolean
```

 * `get_animation()`: returns current animation parameters set by `set_animation`:
     * `frame_range`, `frame_speed`, `frame_blend`, `frame_loop`.

## get_armor_groups


```lua
fun(self: any):table<string, integer>
```

 * `get_armor_groups()`:
     * returns a table with all of the object's armor group ratings
     * syntax: the table keys are the armor group names,
       the table values are the corresponding group ratings
     * see section '`ObjectRef` armor groups' for details

## get_attach


```lua
fun(self: any):ObjectRef?, string?, vector?, vector?, boolean?
```

 * `get_attach()`:
     * returns current attachment parameters or nil if it isn't attached
     * If attached, returns `parent`, `bone`, `position`, `rotation`, `forced_visible`

## get_attribute


```lua
fun(self: any, attribute: string):string|nil
```

 Player only
 * `get_attribute(attribute)`:  DEPRECATED, use get_meta() instead
     * Returns value (a string) for extra attribute.
     * Returns `nil` if no attribute found.

## get_bone_override


```lua
fun(self: any, bone: string):table
```

 * `get_bone_override(bone)`: returns `override` in the above format
     * **Note:** Unlike `get_bone_position`, the returned rotation is in radians, not degrees.

## get_bone_overrides


```lua
fun(self: any):table<string, table>
```

 * `get_bone_overrides()`: returns all bone overrides as table `{[bonename] = override, ...}`

## get_bone_position


```lua
fun(self: any, bone: string):vector
```

 * `get_bone_position(bone)`: returns the previously set position and rotation of the bone
     * Shorthand for `get_bone_override(bone).position.vec, get_bone_override(bone).rotation.vec:apply(math.deg)`.
     * **Note:** Returned rotation is in degrees, not radians.
     * **Deprecated:** Use `get_bone_override` instead.

## get_breath


```lua
fun(self: any):number?
```

 Player only
 * `get_breath()`: returns player's breath

## get_camera


```lua
fun(self: any):{ mode: "any"|"first"|"third"|"third_front" }?
```

 Player only
 * `get_camera()`: Returns the camera parameters as a table as above.

## get_children


```lua
fun(self: any):ObjectRef[]
```

 * `get_children()`: returns a list of ObjectRefs that are attached to the
     object.

## get_clouds


```lua
fun(self: any):table
```

 Player only
 * `get_clouds()`: returns a table with the current cloud parameters as in
   `set_clouds`.

## get_day_night_ratio


```lua
fun(self: any):number?
```

 Player only
 * `get_day_night_ratio()`: returns the ratio or nil if it isn't overridden

## get_effective_observers


```lua
fun(self: any):table<string, boolean>
```

 * `get_effective_observers()`:
     * Like `get_observers()`, but returns the "effective" observers, taking into account attachments
     * Time complexity: O(nm)
         * n: number of observers of the involved entities
         * m: number of ancestors along the attachment chain

## get_entity_name


```lua
fun(self: any):string?
```

 Luaentity only
 * `get_entity_name()`:
     * **Deprecated**: Will be removed in a future version,
       use `:get_luaentity().name` instead.

## get_eye_offset


```lua
fun(self: any):vector?, vector?, vector?
```

 Player only
 * `get_eye_offset()`: Returns camera offset vectors as set via `set_eye_offset`.

## get_flags


```lua
fun(self: any):{ breathing: boolean, drowning: boolean, node_damage: boolean }?
```

 Player only
 * `get_flags()`: returns a table of player flags (the following boolean fields):
   * `breathing`: Whether breathing (regaining air) is enabled, default `true`.
   * `drowning`: Whether drowning (losing air) is enabled, default `true`.
   * `node_damage`: Whether the player takes damage from nodes, default `true`.

## get_formspec_prepend


```lua
fun(self: any):string?
```

 Player only
 * `get_formspec_prepend()`: returns a formspec string.

## get_fov


```lua
fun(self: any):number?
```

 Player only
 * `get_fov()`: Returns the following:
     * Server-sent FOV value. Returns 0 if an FOV override doesn't exist.
     * Boolean indicating whether the FOV value is a multiplier.
     * Time (in seconds) taken for the FOV transition. Set by `set_fov`.

## get_hp


```lua
fun(self: any):number
```

 * `get_hp()`: returns number of health points

## get_inventory


```lua
fun(self: any):InvRef?
```

 * `get_inventory()`: returns an `InvRef` for players, otherwise returns `nil`

## get_inventory_formspec


```lua
fun(self: any):string?
```

 Player only
 * `get_inventory_formspec()`: returns a formspec string

## get_lighting


```lua
fun(self: any):table?
```

 Player only
 * `get_lighting()`: returns the current state of lighting for the player.
     * Result is a table with the same fields as `light_definition` in `set_lighting`.

## get_local_animation


```lua
fun(self: any):table?, table?, table?, table?, table?
```

 Player only
 * `get_local_animation()`: returns idle, walk, dig, walk_while_dig tables and
   `frame_speed`.
 Unofficial note: Sorry, no types for this one

## get_look_dir


```lua
fun(self: any):vector?
```

 Player only
 * `get_look_dir()`: get camera direction as a unit vector

## get_look_horizontal


```lua
fun(self: any):number?
```

 Player only
 * `get_look_horizontal()`: yaw in radians
     * Angle is counter-clockwise from the +z direction.

## get_look_pitch


```lua
fun(self: any):number?
```

 Player only
 * `get_look_pitch()`: pitch in radians - Deprecated as broken. Use
   `get_look_vertical`.
     * Angle ranges between -pi/2 and pi/2, which are straight down and up
       respectively.

## get_look_vertical


```lua
fun(self: any):number?
```

 Player only
 * `get_look_vertical()`: pitch in radians
     * Angle ranges between -pi/2 and pi/2, which are straight up and down
       respectively.

## get_look_yaw


```lua
fun(self: any):number?
```

 Player only
 * `get_look_yaw()`: yaw in radians - Deprecated as broken. Use
   `get_look_horizontal`.
     * Angle is counter-clockwise from the +x direction.

## get_luaentity


```lua
fun(self: any):luaentity?
```

 * `get_luaentity()`:
     * Returns the object's associated luaentity table, if there is one
     * Otherwise returns `nil` (e.g. for players)

## get_meta


```lua
fun(self: any):PlayerMetaRef
```

 Player only
 * `get_meta()`: Returns metadata associated with the player (a PlayerMetaRef).

## get_moon


```lua
fun(self: any):table?
```

 Player only
 * `get_moon()`: returns a table with the current moon parameters as in
     `set_moon`.

## get_nametag_attributes


```lua
fun(self: any):{ text: string, color: ColorSpec, bgcolor: boolean|ColorSpec }
```

 * `get_nametag_attributes()`
     * returns a table with the attributes of the nametag of an object
     * a nametag is a HUD text rendered above the object
     * ```lua
       {
           text = "",
           color = {a=0..255, r=0..255, g=0..255, b=0..255},
           bgcolor = {a=0..255, r=0..255, g=0..255, b=0..255},
       }
       ```

## get_observers


```lua
fun(self: any):table<string, boolean>?
```

 * `get_observers()`:
     * throws an error if the object is invalid
     * returns `nil` if the observers are unmanaged
     * returns a table with all observer names as keys and `true` values (a "set") otherwise

## get_physics_override


```lua
fun(self: any):table
```

 Player only
 * `get_physics_override()`: returns the table given to `set_physics_override`

## get_player_control


```lua
fun(self: any):{ up: boolean, down: boolean, left: boolean, right: boolean, jump: boolean, aux1: boolean, sneak: boolean, dig: boolean, place: boolean, zoom: boolean, movement_x: number, movement_y: number }
```

 Player only
 * `get_player_control()`: returns table with player input
     * The table contains the following boolean fields representing the pressed
       keys: `up`, `down`, `left`, `right`, `jump`, `aux1`, `sneak`, `dig`,
       `place`, `LMB`, `RMB` and `zoom`.
     * The fields `LMB` and `RMB` are equal to `dig` and `place` respectively,
       and exist only to preserve backwards compatibility.
     * The table also contains the fields `movement_x` and `movement_y`.
         * They represent the movement of the player. Values are numbers in the
           range [-1.0,+1.0].
         * They take both keyboard and joystick input into account.
         * You should prefer them over `up`, `down`, `left` and `right` to
           support different input methods correctly.
     * Returns an empty table `{}` if the object is not a player.

## get_player_control_bits


```lua
fun(self: any):number
```

 Player only
 * `get_player_control_bits()`: returns integer with bit packed player pressed
   keys.
     * Bits:
         * 0 - up
         * 1 - down
         * 2 - left
         * 3 - right
         * 4 - jump
         * 5 - aux1
         * 6 - sneak
         * 7 - dig
         * 8 - place
         * 9 - zoom
     * Returns `0` (no bits set) if the object is not a player.

## get_player_name


```lua
fun(self: any):string?
```

 * `get_player_name()`: Returns player name or `""` if is not a player
 Player only

## get_player_velocity


```lua
fun(self: any):vector?
```

 Player only
 * `get_player_velocity()`: **DEPRECATED**, use get_velocity() instead.
   table {x, y, z} representing the player's instantaneous velocity in nodes/s

## get_pos


```lua
fun(self: any):vector
```

 * `get_pos()`: returns position as vector `{x=num, y=num, z=num}`

## get_properties


```lua
fun(self: any):ObjectProps
```

 * `get_properties()`: returns a table of all object properties

## get_rotation


```lua
fun(self: any):vector?
```

 * `get_rotation()`: returns the rotation, a vector (radians)

## get_sky


```lua
fun(self: any, as_table: boolean):table?
```

 Player only
 * `get_sky(as_table)`:
     * `as_table`: boolean that determines whether the deprecated version of this
     function is being used.
         * `true` returns a table containing sky parameters as defined in `set_sky(sky_parameters)`.
         * Deprecated: `false` or `nil` returns base_color, type, table of textures,
         clouds.

## get_stars


```lua
fun(self: any):table?
```

 Player only
 * `get_stars()`: returns a table with the current stars parameters as in
     `set_stars`.

## get_sun


```lua
fun(self: any):table?
```

 Player only
 * `get_sun()`: returns a table with the current sun parameters as in
     `set_sun`.

## get_texture_mod


```lua
fun(self: any):string?
```

 * `get_texture_mod()` returns current texture modifier

## get_velocity


```lua
fun(self: any):vector
```

 * `get_velocity()`: returns the velocity, a vector.

## get_wield_index


```lua
fun(self: any):integer?
```

 * `get_wield_index()`: returns the wield list index of the wielded item (starting with 1)

## get_wield_list


```lua
fun(self: any):string?
```

 * `get_wield_list()`: returns the name of the inventory list the wielded item
    is in.

## get_wielded_item


```lua
fun(self: any):ItemStack?
```

 * `get_wielded_item()`: returns a copy of the wielded item as an `ItemStack`

## get_yaw


```lua
fun(self: any):number
```

 * `get_yaw()`: returns number in radians

## hud_add


```lua
fun(self: any, hud: HudDef):HudID?
```

 Player only
 * `hud_add(hud definition)`: add a HUD element described by HUD def, returns ID
    number on success

## hud_change


```lua
fun(self: any, id: HudID, stat: string, value: any)
```

 Player only
 * `hud_change(id, stat, value)`: change a value of a previously added HUD
   element.
     * `stat` supports the same keys as in the hud definition table except for
       `"type"` (or the deprecated `"hud_elem_type"`).

## hud_get


```lua
fun(self: any, id: HudID)
```

 Player only
 * `hud_get(id)`: gets the HUD element definition structure of the specified ID

## hud_get_all


```lua
fun(self: any):table<HudID, HudDef>
```

 Player only
 * `hud_get_all()`:
     * Returns a table in the form `{ [id] = HUD definition, [id] = ... }`.
     * A mod should keep track of its introduced IDs and only use this to access foreign elements.
     * It is discouraged to change foreign HUD elements.

## hud_get_flags


```lua
fun(self: any):{ hotbar: boolean?, healthbar: boolean?, crosshair: boolean?, wielditem: boolean?, breathbar: boolean?, minimap: boolean?, minimap_radar: boolean?, basic_debug: boolean? }
```

 Player only
 * `hud_get_flags()`: returns a table of player HUD flags with boolean values.
     * See `hud_set_flags` for a list of flags that can be toggled.

## hud_get_hotbar_image


```lua
fun(self: any):string?
```

 Player only
 * `hud_get_hotbar_image()`: returns texturename

## hud_get_hotbar_itemcount


```lua
fun(self: any):integer?
```

 Player only
 * `hud_get_hotbar_itemcount()`: returns number of visible items
     * This value is also clamped by the `"main"` list size.

## hud_get_hotbar_selected_image


```lua
fun(self: any):string?
```

 Player only
 * `hud_get_hotbar_selected_image()`: returns texturename

## hud_remove


```lua
fun(self: any, id: HudID)
```

 Player only
 * `hud_remove(id)`: remove the HUD element of the specified id

## hud_set_flags


```lua
fun(self: any, flags: { hotbar: boolean?, healthbar: boolean?, crosshair: boolean?, wielditem: boolean?, breathbar: boolean?, minimap: boolean?, minimap_radar: boolean?, basic_debug: boolean? })
```

 Player only
 * `hud_set_flags(flags)`: sets specified HUD flags of player.
     * `flags`: A table with the following fields set to boolean values
         * `hotbar`
         * `healthbar`
         * `crosshair`
         * `wielditem`
         * `breathbar`
         * `minimap`: Modifies the client's permission to view the minimap.
           The client may locally elect to not view the minimap.
         * `minimap_radar`: is only usable when `minimap` is true
         * `basic_debug`: Allow showing basic debug info that might give a gameplay advantage.
           This includes map seed, player position, look direction, the pointed node and block bounds.
           Does not affect players with the `debug` privilege.
         * `chat`: Modifies the client's permission to view chat on the HUD.
           The client may locally elect to not view chat. Does not affect the console.
     * If a flag equals `nil`, the flag is not modified

## hud_set_hotbar_image


```lua
fun(self: any, texturename: string)
```

 Player only
 * `hud_set_hotbar_image(texturename)`
     * sets background image for hotbar

## hud_set_hotbar_itemcount


```lua
fun(self: any, count: integer)
```

 Player only
 * `hud_set_hotbar_itemcount(count)`: sets number of items in builtin hotbar
     * `count`: number of items, must be between `1` and `32`
     * If `count` exceeds the `"main"` list size, the list size will be used instead.

## hud_set_hotbar_selected_image


```lua
fun(self: any, texturename: string)
```

 Player only
 * `hud_set_hotbar_selected_image(texturename)`
     * sets image for selected item of hotbar

## is_player


```lua
fun(self: any):boolean
```

 * `is_player()`: returns true for players, false otherwise

## is_valid


```lua
fun(self: any):boolean
```

 * `is_valid()`: returns whether the object is valid.
    * See "Advice on handling `ObjectRefs`" above.

## move_to


```lua
fun(self: any, pos: vector, continuous?: boolean)
```

 * `move_to(pos, continuous=false)`
     * Does an interpolated move for Lua entities for visually smooth transitions.
     * If `continuous` is true, the Lua entity will not be moved to the current
       position before starting the interpolated move.
     * For players this does the same as `set_pos`,`continuous` is ignored.
     * no-op if object is attached

## override_day_night_ratio


```lua
fun(self: any, number: any)
```

 Player only
 * `override_day_night_ratio(ratio or nil)`
     * `0`...`1`: Overrides day-night ratio, controlling sunlight to a specific
       amount.
     * Passing no arguments disables override, defaulting to sunlight based on day-night cycle
     * See also `core.time_to_day_night_ratio`,

## punch


```lua
fun(self: any, puncher: ObjectRef, time_from_last_punch?: number, tool_capabilities?: tool_capabilities, dir?: vector)
```

 * `punch(puncher, time_from_last_punch, tool_capabilities, dir)`
     * punches the object, triggering all consequences a normal punch would have
     * `puncher`: another `ObjectRef` which punched the object or `nil`
     * `dir`: direction vector of punch
     * Other arguments: See `on_punch` for entities
     * Arguments `time_from_last_punch`, `tool_capabilities`, and `dir`
       will be replaced with a default value when the caller sets them to `nil`.

## remove


```lua
fun(self: any)
```

 * `remove()`: remove object
     * The object is removed after returning from Lua. However the `ObjectRef`
       itself instantly becomes unusable with all further method calls having
       no effect and returning `nil`.

## respawn


```lua
fun(self: any)
```

 Player only
 * `respawn()`: Respawns the player using the same mechanism as the death screen,
   including calling `on_respawnplayer` callbacks.

## right_click


```lua
fun(self: any, clicker: PlayerRef)
```

 * `right_click(clicker)`:
     * simulates using the 'place/use' key on the object
     * triggers all consequences as if a real player had done this
     * `clicker` is another `ObjectRef` which has clicked
     * note: this is called `right_click` for historical reasons only

## send_mapblock


```lua
fun(self: any, blockpos: vector):boolean?
```

 Player only
 * `send_mapblock(blockpos)`:
     * Sends an already loaded mapblock to the player.
     * Returns `false` if nothing was sent (note that this can also mean that
       the client already has the block)
     * Resource intensive - use sparsely

## set_acceleration


```lua
fun(self: any, acc: vector)
```

 * `set_acceleration(acc)`
     * Sets the acceleration
     * `acc` is a vector

## set_animation


```lua
fun(self: any, frame_range?: { x: number, y: number }, frame_speed?: number, frame_blend?: number, frame_loop?: boolean)
```

 * `set_animation(frame_range, frame_speed, frame_blend, frame_loop)`
     * Sets the object animation parameters and (re)starts the animation
     * Animations only work with a `"mesh"` visual
     * `frame_range`: Beginning and end frame (as specified in the mesh file).
        * Syntax: `{x=start_frame, y=end_frame}`
        * Animation interpolates towards the end frame but stops when it is reached
        * If looped, there is no interpolation back to the start frame
        * If looped, the model should look identical at start and end
        * default: `{x=1.0, y=1.0}`
     * `frame_speed`: How fast the animation plays, in frames per second (number)
        * default: `15.0`
     * `frame_blend`: number, default: `0.0`
     * `frame_loop`: If `true`, animation will loop. If false, it will play once
        * default: `true`

## set_animation_frame_speed


```lua
fun(self: any, frame_speed: number)
```

 * `set_animation_frame_speed(frame_speed)`
     * Sets the frame speed of the object's animation
     * Unlike `set_animation`, this will not restart the animation
     * `frame_speed`: See `set_animation`

## set_armor_groups


```lua
fun(self: any, groups: table<string, integer>)
```

 * `set_armor_groups({group1=rating, group2=rating, ...})`
     * sets the object's full list of armor groups
     * same table syntax as for `get_armor_groups`
     * note: all armor groups not in the table will be removed

## set_attach


```lua
fun(self: any, parent: ObjectRef, bone?: string, position?: vector, rotation?: vector, forced_visible?: boolean)
```

 * `set_attach(parent[, bone, position, rotation, forced_visible])`
     * Attaches object to `parent`
     * See 'Attachments' section for details
     * `parent`: `ObjectRef` to attach to
     * `bone`: Bone to attach to. Default is `""` (the root bone)
     * `position`: relative position, default `{x=0, y=0, z=0}`
     * `rotation`: relative rotation in degrees, default `{x=0, y=0, z=0}`
     * `forced_visible`: Boolean to control whether the attached entity
        should appear in first person, default `false`.
     * This command may fail silently (do nothing) when it would result
       in circular attachments.

## set_attribute


```lua
fun(self: any, attribute: string, value: string|number)
```

 Player only
 * `set_attribute(attribute, value)`:  DEPRECATED, use get_meta() instead
     * Sets an extra attribute with value on player.
     * `value` must be a string, or a number which will be converted to a
       string.
     * If `value` is `nil`, remove attribute from player.

## set_bone_override


```lua
fun(self: any, bone: string, override: table)
```

 * `set_bone_override(bone, override)`
     * `bone`: string
     * `override`: `{ position = property, rotation = property, scale = property }` or `nil`
     * `override = nil` (including omission) is shorthand for `override = {}` which clears the override
     * Each `property` is a table of the form
       `{ vec = vector, interpolation = 0, absolute = false }` or `nil`
         * `vec` is in the same coordinate system as the model, and in radians for rotation.
           It defaults to `vector.zero()` for translation and rotation and `vector.new(1, 1, 1)` for scale.
         * `interpolation`: The old and new overrides are interpolated over this timeframe (in seconds).
         * `absolute`: If set to `false` (which is the default),
           the override will be relative to the animated property:
             * Translation in the case of `position`;
             * Composition in the case of `rotation`;
             * Per-axis multiplication in the case of `scale`
     * `property = nil` is equivalent to no override on that property
     * **Note:** Unlike `set_bone_position`, the rotation is in radians, not degrees.
     * Compatibility note: Clients prior to 5.9.0 only support absolute position and rotation.
       All values are treated as absolute and are set immediately (no interpolation).

## set_bone_position


```lua
fun(self: any, bone: string, position: any, rotation: any)
```

 * `set_bone_position([bone, position, rotation])`
     * Sets absolute bone overrides, e.g. it is equivalent to
       ```lua
       obj:set_bone_override(bone, {
           position = {vec = position, absolute = true},
           rotation = {vec = rotation:apply(math.rad), absolute = true}
       })
       ```
     * **Note:** Rotation is in degrees, not radians.
     * **Deprecated:** Use `set_bone_override` instead.

## set_breath


```lua
fun(self: any, value: number)
```

 Player only
 * `set_breath(value)`: sets player's breath
     * values:
         * `0`: player is drowning
         * max: bubbles bar is not shown
         * See [Object properties] for more information
     * Is limited to range 0 ... 65535 (2^16 - 1)

## set_camera


```lua
fun(self: any, params: { mode: "any"|"first"|"third"|"third_front" })
```

 Player only
 * `set_camera(params)`: Sets camera parameters.
     * `mode`: Defines the camera mode used
       - `any`: free choice between all modes (default)
       - `first`: first-person camera
       - `third`: third-person camera
       - `third_front`: third-person camera, looking opposite of movement direction
     * Supported by client since 5.12.0.

## set_clouds


```lua
fun(self: any, cloud_parameters: table)
```

 Player only
 * `set_clouds(cloud_parameters)`: set cloud parameters
     * Passing no arguments resets clouds to their default values.
     * `cloud_parameters` is a table with the following optional fields:
         * `density`: from `0` (no clouds) to `1` (full clouds) (default `0.4`)
         * `color`: basic cloud color with alpha channel, ColorSpec
           (default `#fff0f0e5`).
         * `ambient`: cloud color lower bound, use for a "glow at night" effect.
           ColorSpec (alpha ignored, default `#000000`)
         * `height`: cloud height, i.e. y of cloud base (default per conf,
           usually `120`)
         * `thickness`: cloud thickness in nodes (default `16`).
           if set to zero the clouds are rendered flat.
         * `speed`: 2D cloud speed + direction in nodes per second
           (default `{x=0, z=-2}`).
         * `shadow`: shadow color, applied to the base of the cloud
           (default `#cccccc`).

## set_detach


```lua
fun(self: any)
```

 * `set_detach()`: Detaches object. No-op if object was not attached.

## set_eye_offset


```lua
fun(self: any, firstperson?: vector, thirdperson_back?: vector, thirdperson_front?: vector)
```

 Player only
 * `set_eye_offset([firstperson, thirdperson_back, thirdperson_front])`: Sets camera offset vectors.
     * `firstperson`: Offset in first person view.
       Defaults to `vector.zero()` if unspecified.
     * `thirdperson_back`: Offset in third person back view.
       Clamped between `vector.new(-10, -10, -5)` and `vector.new(10, 15, 5)`.
       Defaults to `vector.zero()` if unspecified.
     * `thirdperson_front`: Offset in third person front view.
       Same limits as for `thirdperson_back` apply.
       Defaults to `thirdperson_back` if unspecified.

## set_flags


```lua
fun(self: any, flags: { breathing: boolean?, drowning: boolean?, node_damage: boolean? })
```

 Player only
 * `set_flags(flags)`: sets flags
   * takes a table in the same format as returned by `get_flags`
   * absent fields are left unchanged

## set_formspec_prepend


```lua
fun(self: any, formspec: string)
```

 Player only
 * `set_formspec_prepend(formspec)`:
     * the formspec string will be added to every formspec shown to the user,
       except for those with a no_prepend[] tag.
     * This should be used to set style elements such as background[] and
       bgcolor[], any non-style elements (eg: label) may result in weird behavior.
     * Only affects formspecs shown after this is called.

## set_fov


```lua
fun(self: any, fov: number, is_multiplier: boolean, transition_time?: number)
```

 Player only
 * `set_fov(fov, is_multiplier, transition_time)`: Sets player's FOV
     * `fov`: Field of View (FOV) value.
     * `is_multiplier`: Set to `true` if the FOV value is a multiplier.
       Defaults to `false`.
     * `transition_time`: If defined, enables smooth FOV transition.
       Interpreted as the time (in seconds) to reach target FOV.
       If set to 0, FOV change is instantaneous. Defaults to 0.
     * Set `fov` to 0 to clear FOV override.

## set_hp


```lua
fun(self: any, hp: integer, reason: PlayerHPChangeReason)
```

 * `set_hp(hp, reason)`: set number of health points
     * See reason in register_on_player_hpchange
     * Is limited to the range of 0 ... 65535 (2^16 - 1)
     * For players: HP are also limited by `hp_max` specified in object properties
 Unofficial note:I *assume* it's a PlayerHPChangeReason, i am not certain

## set_inventory_formspec


```lua
fun(self: any, formspec: string)
```

 Player only
 * `set_inventory_formspec(formspec)`
     * Redefines the player's inventory formspec.
     * Should usually be called at least once in the `on_joinplayer` callback.
     * If `formspec` is `""`, the player's inventory is disabled.
     * If the inventory formspec is currently open on the client, it is
       updated immediately.
     * See also: `core.register_on_player_receive_fields`

## set_lighting


```lua
fun(self: any, light_definition: table)
```

 Player only
 * `set_lighting(light_definition)`: sets lighting for the player
     * Passing no arguments resets lighting to its default values.
     * `light_definition` is a table with the following optional fields:
       * `saturation` sets the saturation (vividness; default: `1.0`).
         * It is applied according to the function `result = b*(1-s) + c*s`, where:
           * `c` is the original color
           * `b` is the greyscale version of the color with the same luma
           * `s` is the saturation set here
         * The resulting color always has the same luma (perceived brightness) as the original.
         * This means that:
           * values > 1 oversaturate
           * values < 1 down to 0 desaturate, 0 being entirely greyscale
           * values < 0 cause an effect similar to inversion,
             but keeping original luma and being symmetrical in terms of saturation
             (eg. -1 and 1 is the same saturation and luma, but different hues)
         * This value has no effect on clients who have shaders or post-processing disabled.
       * `shadows` is a table that controls ambient shadows
         * This has no effect on clients who have the "Dynamic Shadows" effect disabled.
         * `intensity` sets the intensity of the shadows from 0 (no shadows, default) to 1 (blackness)
         * `tint` tints the shadows with the provided color, with RGB values ranging from 0 to 255.
           (default `{r=0, g=0, b=0}`)
       * `exposure` is a table that controls automatic exposure.
         The basic exposure factor equation is `e = 2^exposure_correction / clamp(luminance, 2^luminance_min, 2^luminance_max)`
         * This has no effect on clients who have the "Automatic Exposure" effect disabled.
         * `luminance_min` set the lower luminance boundary to use in the calculation (default: `-3.0`)
         * `luminance_max` set the upper luminance boundary to use in the calculation (default: `-3.0`)
         * `exposure_correction` correct observed exposure by the given EV value (default: `0.0`)
         * `speed_dark_bright` set the speed of adapting to bright light (default: `1000.0`)
         * `speed_bright_dark` set the speed of adapting to dark scene (default: `1000.0`)
         * `center_weight_power` set the power factor for center-weighted luminance measurement (default: `1.0`)
       * `bloom` is a table that controls bloom.
         * This has no effect on clients with protocol version < 46 or clients who
           have the "Bloom" effect disabled.
         * `intensity` defines much bloom is applied to the rendered image.
           * Recommended range: from 0.0 to 1.0, default: 0.05
           * If set to 0, bloom is disabled.
           * The default value is to be changed from 0.05 to 0 in the future.
             If you wish to keep the current default value, you should set it
             explicitly.
         * `strength_factor` defines the magnitude of bloom overexposure.
           * Recommended range: from 0.1 to 10.0, default: 1.0
         * `radius` is a logical value that controls how far the bloom effect
           spreads from the bright objects.
           * Recommended range: from 0.1 to 8.0, default: 1.0
         * The behavior of values outside the recommended range is unspecified.
       * `volumetric_light`: is a table that controls volumetric light (a.k.a. "godrays")
         * This has no effect on clients who have the "Volumetric Lighting" or "Bloom" effects disabled.
         * `strength`: sets the strength of the volumetric light effect from 0 (off, default) to 1 (strongest).
             * `0.2` is a reasonable standard value.
             * Currently, bloom `intensity` and `strength_factor` affect volumetric
               lighting `strength` and vice versa. This behavior is to be changed
               in the future, do not rely on it.


## set_local_animation


```lua
fun(self: any, idle: any, walk: any, dig: any, walk_while_dig: any, frame_speed: any)
```

 Player only
 * `set_local_animation(idle, walk, dig, walk_while_dig, frame_speed)`:
   set animation for player model in third person view.
     * Every animation equals to a `{x=starting frame, y=ending frame}` table.
     * `frame_speed` sets the animations frame speed. Default is 30.
 Unofficial note: Sorry, no types for this one

## set_look_horizontal


```lua
fun(self: any, radians: number)
```

 Player only
 * `set_look_horizontal(radians)`: sets look yaw
     * radians: Angle from the +z direction, where positive is counter-clockwise.

## set_look_pitch


```lua
fun(self: any, radians: number)
```

 Player only
 * `set_look_pitch(radians)`: sets look pitch - Deprecated. Use
   `set_look_vertical`.

## set_look_vertical


```lua
fun(self: any, radians: number)
```

 Player only
 * `set_look_vertical(radians)`: sets look pitch
     * radians: Angle from looking forward, where positive is downwards.

## set_look_yaw


```lua
fun(self: any, radians: number)
```

 Player only
 * `set_look_yaw(radians)`: sets look yaw - Deprecated. Use
   `set_look_horizontal`.

## set_minimap_modes


```lua
fun(self: any, modes: ({ type: "off"|"radar"|"surface"|"texture", label: string?, size: integer, texture: string?, scale: integer? })[], selected_mode: integer)
```

 Player only
 * `set_minimap_modes({mode, mode, ...}, selected_mode)`
     * Overrides the available minimap modes (and toggle order), and changes the
     selected mode.
     * `mode` is a table consisting of up to four fields:
         * `type`: Available type:
             * `off`: Minimap off
             * `surface`: Minimap in surface mode
             * `radar`: Minimap in radar mode
             * `texture`: Texture to be displayed instead of terrain map
               (texture is centered around 0,0 and can be scaled).
               Texture size is limited to 512 x 512 pixel.
         * `label`: Optional label to display on minimap mode toggle
           The translation must be handled within the mod.
         * `size`: Sidelength or diameter, in number of nodes, of the terrain
           displayed in minimap
         * `texture`: Only for texture type, name of the texture to display
         * `scale`: Only for texture type, scale of the texture map in nodes per
           pixel (for example a `scale` of 2 means each pixel represents a 2x2
           nodes square)
     * `selected_mode` is the mode index to be selected after modes have been changed
     (0 is the first mode).

## set_moon


```lua
fun(self: any, moon_parameters: table)
```

 Player only
 * `set_moon(moon_parameters)`:
     * Passing no arguments resets the moon to its default values.
     * `moon_parameters` is a table with the following optional fields:
         * `visible`: Boolean for whether the moon is visible.
             (default: `true`)
         * `texture`: A regular texture for the moon. Setting to `""`
             will re-enable the mesh moon. (default: `"moon.png"`, if it exists)
             The texture appears non-rotated at sunrise / moonset and rotated 180
             degrees (upside down) at sunset / moonrise.
             Note: Relative to the sun, the moon texture is hence rotated by 180°.
             You can use the `^[transformR180` texture modifier to achieve the same orientation.
         * `tonemap`: A 512x1 texture containing the tonemap for the moon
             (default: `"moon_tonemap.png"`)
         * `scale`: Float controlling the overall size of the moon (default: `1`)
             Note: For legacy reasons, the sun is bigger than the moon by a factor
             of about `1.57` for equal `scale` values.

## set_nametag_attributes


```lua
fun(self: any, attributes: { text: string?, color: ColorSpec?, bgcolor: (boolean|ColorSpec)? })
```

 * `set_nametag_attributes(attributes)`
     * sets the attributes of the nametag of an object
     * `attributes`:
       ```lua
       {
           text = "My Nametag",
           color = ColorSpec,
           -- ^ Text color
           bgcolor = ColorSpec or false,
           -- ^ Sets background color of nametag
           -- `false` will cause the background to be set automatically based on user settings
           -- Default: false
       }
       ```

## set_observers


```lua
fun(self: any, observers: table<string, boolean>)
```

 * `set_observers(observers)`: sets observers (players this object is sent to)
     * If `observers` is `nil`, the object's observers are "unmanaged":
       The object is sent to all players as governed by server settings. This is the default.
     * `observers` is a "set" of player names: `{name1 = true, name2 = true, ...}`
         * A set is a table where the keys are the elements of the set
           (in this case, *valid* player names) and the values are all `true`.
     * Attachments: The *effective observers* of an object are made up of
       all players who can observe the object *and* are also effective observers
       of its parent object (if there is one).
     * Players are automatically added to their own observer sets.
       Players **must** effectively observe themselves.
     * Object activation and deactivation are unaffected by observability.
     * Attached sounds do not work correctly and thus should not be used
       on objects with managed observers yet.

## set_physics_override


```lua
fun(self: any, override_table: table)
```

 Player only
 * `set_physics_override(override_table)`
     * Overrides the physics attributes of the player
     * `override_table` is a table with the following fields:
         * `speed`: multiplier to *all* movement speed (`speed_*`) and
                    acceleration (`acceleration_*`) values (default: `1`)
         * `speed_walk`: multiplier to default walk speed value (default: `1`)
             * Note: The actual walk speed is the product of `speed` and `speed_walk`
         * `speed_climb`: multiplier to default climb speed value (default: `1`)
             * Note: The actual climb speed is the product of `speed` and `speed_climb`
         * `speed_crouch`: multiplier to default sneak speed value (default: `1`)
             * Note: The actual sneak speed is the product of `speed` and `speed_crouch`
         * `speed_fast`: multiplier to default speed value in Fast Mode (default: `1`)
             * Note: The actual fast speed is the product of `speed` and `speed_fast`
         * `jump`: multiplier to default jump value (default: `1`)
         * `gravity`: multiplier to default gravity value (default: `1`)
         * `liquid_fluidity`: multiplier to liquid movement resistance value
           (for nodes with `liquid_move_physics`); the higher this value, the lower the
           resistance to movement. At `math.huge`, the resistance is zero and you can
           move through any liquid like air. (default: `1`)
             * Warning: Values below 1 are currently unsupported.
         * `liquid_fluidity_smooth`: multiplier to default maximum liquid resistance value
           (for nodes with `liquid_move_physics`); controls deceleration when entering
           node at high speed. At higher values you come to a halt more quickly
           (default: `1`)
         * `liquid_sink`: multiplier to default liquid sinking speed value;
           (for nodes with `liquid_move_physics`) (default: `1`)
         * `acceleration_default`: multiplier to horizontal and vertical acceleration
           on ground or when climbing (default: `1`)
             * Note: The actual acceleration is the product of `speed` and `acceleration_default`
         * `acceleration_air`: multiplier to acceleration
           when jumping or falling (default: `1`)
             * Note: The actual acceleration is the product of `speed` and `acceleration_air`
         * `acceleration_fast`: multiplier to acceleration in Fast Mode (default: `1`)
             * Note: The actual acceleration is the product of `speed` and `acceleration_fast`
         * `sneak`: whether player can sneak (default: `true`)
         * `sneak_glitch`: whether player can use the new move code replications
           of the old sneak side-effects: sneak ladders and 2 node sneak jump
           (default: `false`)
         * `new_move`: use new move/sneak code. When `false` the exact old code
           is used for the specific old sneak behavior (default: `true`)
     * Note: All numeric fields above modify a corresponding `movement_*` setting.
     * For games, we recommend for simpler code to first modify the `movement_*`
       settings (e.g. via the game's `minetest.conf`) to set a global base value
       for all players and only use `set_physics_override` when you need to change
       from the base value on a per-player basis
     * Note: Some of the fields don't exist in old API versions, see feature
       `physics_overrides_v2`.


## set_pos


```lua
fun(self: any, pos: vector)
```

 * `set_pos(pos)`:
     * Sets the position of the object.
     * No-op if object is attached.
     * `pos` is a vector `{x=num, y=num, z=num}`

## set_properties


```lua
fun(self: any, ObjectProps: ObjectProps)
```

 * `set_properties(object property table)`

## set_rotation


```lua
fun(self: any, rot: vector)
```

 Luaentity only
 * `set_rotation(rot)`
     * Sets the rotation
     * `rot` is a vector (radians). X is pitch (elevation), Y is yaw (heading)
       and Z is roll (bank).
     * Does not reset rotation incurred through `automatic_rotate`.
       Remove & re-add your objects to force a certain rotation.

## set_sky


```lua
fun(self: any, sky_parameters: table)
```

 Player only
 * `set_sky(sky_parameters)`
     * The presence of the function `set_sun`, `set_moon` or `set_stars` indicates
       whether `set_sky` accepts this format. Check the legacy format otherwise.
     * Passing no arguments resets the sky to its default values.
     * `sky_parameters` is a table with the following optional fields:
         * `base_color`: ColorSpec, meaning depends on `type` (default: `#ffffff`)
         * `body_orbit_tilt`: Float, rotation angle of sun/moon orbit in degrees.
            By default, orbit is controlled by a client-side setting, and this field is not set.
            After a value is assigned, it can only be changed to another float value.
            Valid range [-60.0,60.0] (default: not set)
         * `type`: Available types:
             * `"regular"`: Uses 0 textures, `base_color` ignored
             * `"skybox"`: Uses 6 textures, `base_color` used as fog.
             * `"plain"`: Uses 0 textures, `base_color` used as both fog and sky.
             (default: `"regular"`)
         * `textures`: A table containing up to six textures in the following
             order: Y+ (top), Y- (bottom), X+ (east), X- (west), Z- (south), Z+ (north).
             The top and bottom textures are oriented in-line with the east (X+) face (the top edge of the
             bottom texture and the bottom edge of the top texture touch the east face).
             Some top and bottom textures expect to be aligned with the north face and will need to be rotated
             by -90 and 90 degrees, respectively, to fit the eastward orientation.
         * `clouds`: Boolean for whether clouds appear. (default: `true`)
         * `sky_color`: A table used in `"regular"` type only, containing the
           following values (alpha is ignored):
             * `day_sky`: ColorSpec, for the top half of the sky during the day.
               (default: `#61b5f5`)
             * `day_horizon`: ColorSpec, for the bottom half of the sky during the day.
               (default: `#90d3f6`)
             * `dawn_sky`: ColorSpec, for the top half of the sky during dawn/sunset.
               (default: `#b4bafa`)
               The resulting sky color will be a darkened version of the ColorSpec.
               Warning: The darkening of the ColorSpec is subject to change.
             * `dawn_horizon`: ColorSpec, for the bottom half of the sky during dawn/sunset.
               (default: `#bac1f0`)
               The resulting sky color will be a darkened version of the ColorSpec.
               Warning: The darkening of the ColorSpec is subject to change.
             * `night_sky`: ColorSpec, for the top half of the sky during the night.
               (default: `#006bff`)
               The resulting sky color will be a dark version of the ColorSpec.
               Warning: The darkening of the ColorSpec is subject to change.
             * `night_horizon`: ColorSpec, for the bottom half of the sky during the night.
               (default: `#4090ff`)
               The resulting sky color will be a dark version of the ColorSpec.
               Warning: The darkening of the ColorSpec is subject to change.
             * `indoors`: ColorSpec, for when you're either indoors or underground.
               (default: `#646464`)
             * `fog_sun_tint`: ColorSpec, changes the fog tinting for the sun
               at sunrise and sunset. (default: `#f47d1d`)
             * `fog_moon_tint`: ColorSpec, changes the fog tinting for the moon
               at sunrise and sunset. (default: `#7f99cc`)
             * `fog_tint_type`: string, changes which mode the directional fog
                 abides by, `"custom"` uses `sun_tint` and `moon_tint`, while
                 `"default"` uses the classic Luanti sun and moon tinting.
                 Will use tonemaps, if set to `"default"`. (default: `"default"`)
         * `fog`: A table with following optional fields:
             * `fog_distance`: integer, set an upper bound for the client's viewing_range.
                Any value >= 0 sets the desired upper bound for viewing_range,
                disables range_all and prevents disabling fog (F3 key by default).
                Any value < 0 resets the behavior to being client-controlled.
                (default: -1)
             * `fog_start`: float, override the client's fog_start.
                Fraction of the visible distance at which fog starts to be rendered.
                Any value between [0.0, 0.99] set the fog_start as a fraction of the viewing_range.
                Any value < 0, resets the behavior to being client-controlled.
                (default: -1)
             * `fog_color`: ColorSpec, override the color of the fog.
                Unlike `base_color` above this will apply regardless of the skybox type.
                (default: `"#00000000"`, which means no override)

## set_sprite


```lua
fun(self: any, start_frame?: { x: number, y: number }, num_frames?: integer, framelength?: number, select_x_by_camera?: boolean|string[])
```

 Luaentity only
 * `set_sprite(start_frame, num_frames, framelength, select_x_by_camera)`
     * Specifies and starts a sprite animation
     * Only used by `sprite` and `upright_sprite` visuals
     * Animations iterate along the frame `y` position.
     * `start_frame`: {x=column number, y=row number}, the coordinate of the
       first frame, default: `{x=0, y=0}`
     * `num_frames`: Total frames in the texture, default: `1`
     * `framelength`: Time per animated frame in seconds, default: `0.2`
     * `select_x_by_camera`: Only for visual = `sprite`. Changes the frame `x`
       position according to the view direction. default: `false`.
         * First column:  subject facing the camera
         * Second column: subject looking to the left
         * Third column:  subject backing the camera
         * Fourth column: subject looking to the right
         * Fifth column:  subject viewed from above
         * Sixth column:  subject viewed from below

## set_stars


```lua
fun(self: any, star_parameters: table)
```

 Player only
 * `set_stars(star_parameters)`:
     * Passing no arguments resets stars to their default values.
     * `star_parameters` is a table with the following optional fields:
         * `visible`: Boolean for whether the stars are visible.
             (default: `true`)
         * `day_opacity`: Float for maximum opacity of stars at day.
             No effect if `visible` is false.
             (default: 0.0; maximum: 1.0; minimum: 0.0)
         * `count`: Integer number to set the number of stars in
             the skybox. Only applies to `"skybox"` and `"regular"` sky types.
             (default: `1000`)
         * `star_color`: ColorSpec, sets the colors of the stars,
             alpha channel is used to set overall star brightness.
             (default: `#ebebff69`)
         * `scale`: Float controlling the overall size of the stars (default: `1`)

## set_sun


```lua
fun(self: any, sun_parameters: table)
```

 Player only
 * `set_sun(sun_parameters)`:
     * Passing no arguments resets the sun to its default values.
     * `sun_parameters` is a table with the following optional fields:
         * `visible`: Boolean for whether the sun is visible.
             (default: `true`)
         * `texture`: A regular texture for the sun. Setting to `""`
             will re-enable the mesh sun. (default: "sun.png", if it exists)
             The texture appears non-rotated at sunrise and rotated 180 degrees
             (upside down) at sunset.
         * `tonemap`: A 512x1 texture containing the tonemap for the sun
             (default: `"sun_tonemap.png"`)
         * `sunrise`: A regular texture for the sunrise texture.
             (default: `"sunrisebg.png"`)
         * `sunrise_visible`: Boolean for whether the sunrise texture is visible.
             (default: `true`)
         * `scale`: Float controlling the overall size of the sun. (default: `1`)
             Note: For legacy reasons, the sun is bigger than the moon by a factor
             of about `1.57` for equal `scale` values.

## set_texture_mod


```lua
fun(self: any, mod: string)
```

 Luaentity only
 * `set_texture_mod(mod)`
     * Set a texture modifier to the base texture, for sprites and meshes.
     * When calling `set_texture_mod` again, the previous one is discarded.
     * `mod` the texture modifier. See [Texture modifiers].

## set_velocity


```lua
fun(self: any, vel: vector)
```

 * `set_velocity(vel)`
     * Sets the velocity
     * `vel` is a vector, e.g. `{x=0.0, y=2.3, z=1.0}`

## set_wielded_item


```lua
fun(self: any, item: ItemStack):boolean?
```

 * `set_wielded_item(item)`: replaces the wielded item, returns `true` if
   successful.

## set_yaw


```lua
fun(self: any, yaw: number)
```

 Luaentity only
 * `set_yaw(yaw)`: sets the yaw in radians (heading).


---

# OreDef

## biomes


```lua
(string|string[])?
```

 List of biomes in which this ore occurs.
 Occurs in all biomes if this is omitted, and ignored if the Mapgen
 being used does not support biomes.
 Can be a list of (or a single) biome names, IDs, or definitions.

## clust_num_ores


```lua
integer?
```

 Number of ores in a cluster

## clust_scarcity


```lua
number?
```

 Ore has a 1 out of clust_scarcity chance of spawning in a node.
 If the desired average distance between ores is 'd', set this to
 d * d * d.

## clust_size


```lua
integer?
```

 Size of the bounding box of the cluster.
 In this example, there is a 3 * 3 * 3 cluster where 8 out of the 27
 nodes are coal ore.

## column_height_max


```lua
integer?
```

 "sheet" type

## column_height_min


```lua
integer?
```

 "sheet" type

## column_midpoint_factor


```lua
integer?
```

 "sheet" type

## flags


```lua
string?
```

 Attributes for the ore generation, see 'Ore attributes' section above
 Ore attributes
 --------------

 See section [Flag Specifier Format].

 Currently supported flags:
 `puff_cliffs`, `puff_additive_composition`.

 ### `puff_cliffs`

 If set, puff ore generation will not taper down large differences in
 displacement when approaching the edge of a puff. This flag has no effect for
 ore types other than `puff`.

 ### `puff_additive_composition`

 By default, when noise described by `np_puff_top` or `np_puff_bottom` results
 in a negative displacement, the sub-column at that point is not generated. With
 this attribute set, puff ore generation will instead generate the absolute
 difference in noise displacement values. This flag has no effect for ore types
 other than `puff`.

## name


```lua
string
```

## noise_params


```lua
NoiseParams
```

 NoiseParams structure describing one of the noises used for
 ore distribution.
 Needed by "sheet", "puff", "blob" and "vein" ores.
 Omit from "scatter" ore for a uniform ore distribution.
 Omit from "stratum" ore for a simple horizontal strata from y_min to
 y_max.

## noise_threshold


```lua
number?
```

 If noise is above this threshold, ore is placed. Not needed for a
 uniform distribution.

## np_puff_bottom


```lua
NoiseParams?
```

 ### Format example

 For 2D or 3D value noise or value noise maps:

 ```lua
 np_terrain = {
     offset = 0,
     scale = 1,
     spread = {x = 500, y = 500, z = 500},
     seed = 571347,
     octaves = 5,
     persistence = 0.63,
     lacunarity = 2.0,
     flags = "defaults, absvalue",
 }
 ```

 For 2D noise the Z component of `spread` is still defined but is ignored.
 A single noise parameter table can be used for 2D or 3D noise.

## np_puff_top


```lua
NoiseParams?
```

 "puff" type

## np_stratum_thickness


```lua
NoiseParams?
```

 "stratum"

## ore


```lua
string
```

 Ore node to place

## ore_param2


```lua
integer?
```

 Param2 to set for ore (e.g. facedir rotation)

## ore_type


```lua
"blob"|"puff"|"scatter"|"sheet"|"stratum"...(+1)
```

 Supported: "scatter", "sheet", "puff", "blob", "vein", "stratum"

## random_factor


```lua
number?
```

 "vein" type

## stratum_thickness


```lua
number?
```

## wherein


```lua
string|string[]
```

 Node to place ore in. Multiple are possible by passing a list.

## y_max


```lua
number?
```

## y_min


```lua
number?
```


---

# Particle

## acceleration


```lua
vector?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## animation


```lua
TileAnimation?
```

 Optional, specifies how to animate the particle texture

## bounce


```lua
(number|{ min: number, max: number, bias: number? })?
```

 v5.6.0 and later: Optional bounce range, consult the following section

## collision_removal


```lua
boolean?
```

 If true particle is removed when it collides.
 Requires collisiondetection = true to have any effect.

## collisiondetection


```lua
boolean?
```

 If true collides with `walkable` nodes and, depending on the
 `object_collision` field, objects too.

## drag


```lua
vector?
```

 v5.6.0 and later: Optional drag value, consult the following section
 Note: Only a vector is supported here. Alternative forms like a single
 number are not supported.

## expirationtime


```lua
number
```

## glow


```lua
number?
```

 Optional, specify particle self-luminescence in darkness.
 Values 0-14.

## jitter


```lua
(number|{ min: number, max: number, bias: number? })?
```

 v5.6.0 and later: Optional jitter range, consult the following section

## node


```lua
(MapNodeOpt|{ name: string, param1: number?, param2: number? })?
```

 Optional, if specified the particle will have the same appearance as
 node dig particles for the given node.
 `texture` and `animation` will be ignored if this is set.

## node_tile


```lua
number?
```

 Optional, only valid in combination with `node`
 If set to a valid number 1-6, specifies the tile from which the
 particle texture is picked.
 Otherwise, the default behavior is used. (currently: any random tile)

## object_collision


```lua
boolean?
```

 If true particle collides with objects that are defined as
 `physical = true,` and `collide_with_objects = true,`.
 Requires collisiondetection = true to have any effect.

## playername


```lua
string?
```

 Optional, if specified spawns particle only on the player's client

## pos


```lua
vector
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## size


```lua
number?
```

 Scales the visual size of the particle texture.
 If `node` is set, size can be set to 0 to spawn a randomly-sized
 particle (just like actual node dig particles).

## texture


```lua
(string|ParticleTexture)?
```

 The texture of the particle
 v5.6.0 and later: also supports the table format described in the
 following section, but due to a bug this did not take effect
 (beyond the texture name).
 v5.9.0 and later: fixes the bug.
 Note: "texture.animation" is ignored here. Use "animation" below instead.

## velocity


```lua
vector?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## vertical


```lua
boolean?
```

 If true faces player using y axis only


---

# ParticleSpawner

## acc


```lua
(number|vector|{ min: number|vector, max: number|vector, bias: number? })?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## acc_tween


```lua
particle_spawner_tween_vec3_range?
```

 Cannot be done using generics i think, if yes contribute in :)

## amount


```lua
number
```

 Number of particles spawned over the time period `time`.

## animation


```lua
TileAnimation?
```

 Optional, specifies how to animate the particles' texture
 v5.6.0 and later: set length to -1 to synchronize the length
 of the animation with the expiration time of individual particles.
 (-2 causes the animation to be played twice, and so on)

## attached


```lua
ObjectRef?
```

 If defined, particle positions, velocities and accelerations are
 relative to this object's position and yaw

## attract


```lua
ParticleSpawnerAttract?
```

## bounce


```lua
(number|{ min: number, max: number, bias: number? })?
```

## bounce_tween


```lua
particle_spawner_tween_float_range?
```

## collision_removal


```lua
boolean?
```

 If true particles are removed when they collide.
 Requires collisiondetection = true to have any effect.

## collisiondetection


```lua
boolean?
```

 If true collide with `walkable` nodes and, depending on the
 `object_collision` field, objects too.

## drag


```lua
(number|vector|{ min: number|vector, max: number|vector, bias: number? })?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## drag_tween


```lua
particle_spawner_tween_vec3_range?
```

Unofficial note: oh its that thing conservatives are mad abou- nevermind no sorry wrong oops

## exptime


```lua
(number|{ min: number, max: number, bias: number? })?
```

## exptime_tween


```lua
particle_spawner_tween_float_range?
```

## glow


```lua
number?
```

 Optional, specify particle self-luminescence in darkness.
 Values 0-14.

## jitter


```lua
(number|vector|{ min: number|vector, max: number|vector, bias: number? })?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## jitter_tween


```lua
particle_spawner_tween_vec3_range?
```

 Cannot be done using generics i think, if yes contribute in :)

## node


```lua
(MapNodeOpt|{ name: string, param1: number?, param2: number? })?
```

 Optional, if specified the particles will have the same appearance as
 node dig particles for the given node.
 `texture` and `animation` will be ignored if this is set.

## node_tile


```lua
number?
```

 Optional, only valid in combination with `node`
 If set to a valid number 1-6, specifies the tile from which the
 particle texture is picked.
 Otherwise, the default behavior is used. (currently: any random tile)

## object_collision


```lua
boolean?
```

 If true particles collide with objects that are defined as
 `physical = true,` and `collide_with_objects = true,`.
 Requires collisiondetection = true to have any effect.

## playername


```lua
string?
```

 Optional, if specified spawns particles only on the player's client

## pos


```lua
(number|vector|{ min: number|vector, max: number|vector, bias: number? })?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## pos_tween


```lua
particle_spawner_tween_vec3_range?
```

 Cannot be done using generics i think, if yes contribute in :)

## radius


```lua
(number|vector|{ min: number|vector, max: number|vector, bias: number? })?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## radius_tween


```lua
particle_spawner_tween_vec3_range?
```

 Cannot be done using generics i think, if yes contribute in :)

## size


```lua
(number|{ min: number, max: number, bias: number? })?
```

## size_tween


```lua
particle_spawner_tween_float_range?
```

## textpool


```lua
string|ParticleTexture[]?
```

 For particlespawners, it is also possible to set the `texpool` property instead
 of a single texture definition. A `texpool` consists of a list of possible
 particle textures. Every time a particle is spawned, the engine will pick a
 texture at random from the `texpool` and assign it as that particle's texture.
 You can also specify a `texture` in addition to a `texpool`; the `texture`
 value will be ignored on newer clients but will be sent to older (pre-v5.6.0)
 clients that do not implement texpools.

 ```lua
 texpool = {
     "mymod_particle_texture.png";
     { name = "mymod_spark.png", alpha_tween = {1, 0} },
     {
       name = "mymod_dust.png",
       alpha = 0.3,
       scale = 1.5,
       animation = {
             type = "vertical_frames",
             aspect_w = 16, aspect_h = 16,

             length = 3,
             -- the animation lasts for 3s and then repeats
             length = -3,
             -- repeat the animation three times over the particle's lifetime
             -- (post-v5.6.0 clients only)
       },
     },
 }
 ```

## texture


```lua
(string|ParticleTexture)?
```

 The texture of the particle
 v5.6.0 and later: also supports the table format described in the
 following section.

## time


```lua
number
```

 Lifespan of spawner in seconds.
 If time is 0 spawner has infinite lifespan and spawns the `amount` on
 a per-second basis.

## vel


```lua
(number|vector|{ min: number|vector, max: number|vector, bias: number? })?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## vel_tween


```lua
particle_spawner_tween_vec3_range?
```

 Cannot be done using generics i think, if yes contribute in :)

## vertical


```lua
boolean?
```

 If true face player using y axis only


---

# ParticleSpawnerAttract

## die_on_contact


```lua
boolean?
```

## direction


```lua
vector?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## direction_attached


```lua
ObjectRef?
```

 `ObjectRef`
 -----------

 Moving things in the game are generally these.
 This is basically a reference to a C++ `ServerActiveObject`.

 ### Advice on handling `ObjectRefs`

 When you receive an `ObjectRef` as a callback argument or from another API
 function, it is possible to store the reference somewhere and keep it around.
 It will keep functioning until the object is unloaded or removed.

 However, doing this is **NOT** recommended - `ObjectRefs` should be "let go"
 of as soon as control is returned from Lua back to the engine.

 Doing so is much less error-prone and you will never need to wonder if the
 object you are working with still exists.

 If this is not feasible, you can test whether an `ObjectRef` is still valid
 via `object:is_valid()`.

 Getters may be called for invalid objects and will return nothing then.
 All other methods should not be called on invalid objects.

 ### Attachments

 It is possible to attach objects to other objects (`set_attach` method).

 When an object is attached, it is positioned relative to the parent's position
 and rotation. `get_pos` and `get_rotation` will always return the parent's
 values and changes via their setter counterparts are ignored.

 To change position or rotation call `set_attach` again with the new values.

 **Note**: Just like model dimensions, the relative position in `set_attach`
 must be multiplied by 10 compared to world positions.

 It is also possible to attach to a bone of the parent object. In that case the
 child will follow movement and rotation of that bone.


## direction_tween


```lua
particle_spawner_tween_vec3?
```

## kind


```lua
"line"|"none"|"plane"|"point"
```

## origin


```lua
vector?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## origin_attached


```lua
ObjectRef?
```

 `ObjectRef`
 -----------

 Moving things in the game are generally these.
 This is basically a reference to a C++ `ServerActiveObject`.

 ### Advice on handling `ObjectRefs`

 When you receive an `ObjectRef` as a callback argument or from another API
 function, it is possible to store the reference somewhere and keep it around.
 It will keep functioning until the object is unloaded or removed.

 However, doing this is **NOT** recommended - `ObjectRefs` should be "let go"
 of as soon as control is returned from Lua back to the engine.

 Doing so is much less error-prone and you will never need to wonder if the
 object you are working with still exists.

 If this is not feasible, you can test whether an `ObjectRef` is still valid
 via `object:is_valid()`.

 Getters may be called for invalid objects and will return nothing then.
 All other methods should not be called on invalid objects.

 ### Attachments

 It is possible to attach objects to other objects (`set_attach` method).

 When an object is attached, it is positioned relative to the parent's position
 and rotation. `get_pos` and `get_rotation` will always return the parent's
 values and changes via their setter counterparts are ignored.

 To change position or rotation call `set_attach` again with the new values.

 **Note**: Just like model dimensions, the relative position in `set_attach`
 must be multiplied by 10 compared to world positions.

 It is also possible to attach to a bone of the parent object. In that case the
 child will follow movement and rotation of that bone.


## origin_tween


```lua
particle_spawner_tween_vec3?
```

## strength


```lua
number
```

## strength_tween


```lua
particle_spawner_tween_float_range?
```


---

# ParticleSpawner_id


---

# ParticleTexture

## alpha


```lua
number?
```

## alpha_tween


```lua
(number|{ min: number, max: number, bias: number? })?
```

## animation


```lua
TileAnimation?
```

## blend


```lua
("add"|"alpha"|"clip"|"screen"|"sub")?
```

## name


```lua
string
```

## scale


```lua
(number|{ x: number, y: number })?
```

## scale_tween


```lua
particle_spawner_tween_vec2?
```


---

# ParticleTextureI


---

# PcgRandom


```lua
PcgRandom
```


```lua
function PcgRandom(seed: integer, seq?: integer[])
  -> PcgRandom
```


---

# PcgRandom

## get_state


```lua
(method) PcgRandom:get_state()
  -> string
```

 * `get_state()`: return generator state encoded in string

## next


```lua
(method) PcgRandom:next()
  -> integer
```

 * `next()`: return next integer random number [`-2147483648`...`2147483647`]

## rand_normal_dist


```lua
(method) PcgRandom:rand_normal_dist(min: integer, max: integer, num_trials?: integer)
  -> integer
```

 * `rand_normal_dist(min, max, num_trials=6)`: return normally distributed
   random number [`min`...`max`].
     * This is only a rough approximation of a normal distribution with:
     * `mean = (max - min) / 2`, and
     * `variance = (((max - min + 1) ^ 2) - 1) / (12 * num_trials)`
     * Increasing `num_trials` improves accuracy of the approximation

## set_state


```lua
(method) PcgRandom:set_state(state: string)
```

 * `set_state(state_string)`: restore generator state from encoded string


---

# PcgRandom.get_state


```lua
(method) PcgRandom:get_state()
  -> string
```


---

# PcgRandom.next


```lua
(method) PcgRandom:next()
  -> integer
```


```lua
(method) PcgRandom:next(min: integer, max: integer)
  -> integer
```


---

# PcgRandom.rand_normal_dist


```lua
(method) PcgRandom:rand_normal_dist(min: integer, max: integer, num_trials?: integer)
  -> integer
```


---

# PcgRandom.set_state


```lua
(method) PcgRandom:set_state(state: string)
```


---

# PerlinNoise


```lua
function PerlinNoise(noiseparams: NoiseParams)
  -> ValueNoise
```


---

# PerlinNoiseMap


```lua
function PerlinNoiseMap(noiseparams: NoiseParams, size: vector|{ x: number, y: number })
  -> ValueNoiseMap
```


---

# PlayerHPChangeReason

## from


```lua
"engine"|"mod"
```

## node


```lua
(MapNode|{ name: string, param1: number, param2: number })?
```

## node_pos


```lua
vector?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## type


```lua
"drown"|"fall"|"node_damage"|"punch"|"respawn"...(+1)
```


---

# PlayerMetaRef

## contains


```lua
fun(key: string):boolean?
```

 * `contains(key)`: Returns true if key present, otherwise false.
     * Returns `nil` when the MetaData is inexistent.

## get


```lua
fun(key: string):string?
```

 * `get(key)`: Returns `nil` if key not present, else the stored string.

## get_float


```lua
fun(key: string):number
```

## get_int


```lua
fun(key: string):integer
```

 * `get_int(key)`: Returns `0` if key not present.

## get_keys


```lua
fun():string[]
```

## set_float


```lua
fun(key: string, value: number)
```

 * `set_float(key, value)`
     * Store a number (a 64-bit float) exactly.
     * The value will be converted into a string when stored.

## set_int


```lua
fun(key: string, value: integer)
```

 * `set_int(key, value)`
     * The range for the value is system-dependent (usually 32 bits).
       The value will be converted into a string when stored.

## set_string


```lua
fun(key: string, value: string)
```

 * `set_string(key, value)`: Value of `""` will delete the key.

## to_table


```lua
fun():{ fields: table<string, string>, inventory: InvTable }
```


---

# PlayerRef

## add_player_velocity


```lua
fun(self: any, vel: vector)
```

 Player only
 * `add_player_velocity(vel)`: **DEPRECATED**, use add_velocity(vel) instead.

## add_pos


```lua
fun(self: any, pos: vector)
```

 * `add_pos(pos)`:
     * Changes position by adding to the current position.
     * No-op if object is attached.
     * `pos` is a vector `{x=num, y=num, z=num}`.
     * In comparison to using `set_pos`, `add_pos` will avoid synchronization problems.

## add_velocity


```lua
fun(self: any, vel: vector)
```

 * `add_velocity(vel)`
     * Changes velocity by adding to the current velocity.
     * `vel` is a vector, e.g. `{x=0.0, y=2.3, z=1.0}`
     * In comparison to using `get_velocity`, adding the velocity and then using
       `set_velocity`, `add_velocity` is supposed to avoid synchronization problems.
       Additionally, players also do not support `set_velocity`.
     * If object is a player:
         * Does not apply during `free_move`.
         * Note that since the player speed is normalized at each move step,
           increasing e.g. Y velocity beyond what would usually be achieved
           (see: physics overrides) will cause existing X/Z velocity to be reduced.
         * Example: `add_velocity({x=0, y=6.5, z=0})` is equivalent to
           pressing the jump key (assuming default settings)

## get_acceleration


```lua
fun(self: any):vector?
```

 * `get_acceleration()`: returns the acceleration, a vector

## get_animation


```lua
fun(self: any):{ x: number, y: number }, number, number, boolean
```

 * `get_animation()`: returns current animation parameters set by `set_animation`:
     * `frame_range`, `frame_speed`, `frame_blend`, `frame_loop`.

## get_armor_groups


```lua
fun(self: any):table<string, integer>
```

 * `get_armor_groups()`:
     * returns a table with all of the object's armor group ratings
     * syntax: the table keys are the armor group names,
       the table values are the corresponding group ratings
     * see section '`ObjectRef` armor groups' for details

## get_attach


```lua
fun(self: any):ObjectRef?, string?, vector?, vector?, boolean?
```

 * `get_attach()`:
     * returns current attachment parameters or nil if it isn't attached
     * If attached, returns `parent`, `bone`, `position`, `rotation`, `forced_visible`

## get_attribute


```lua
fun(self: any, attribute: string):string|nil
```

 Player only
 * `get_attribute(attribute)`:  DEPRECATED, use get_meta() instead
     * Returns value (a string) for extra attribute.
     * Returns `nil` if no attribute found.

## get_bone_override


```lua
fun(self: any, bone: string):table
```

 * `get_bone_override(bone)`: returns `override` in the above format
     * **Note:** Unlike `get_bone_position`, the returned rotation is in radians, not degrees.

## get_bone_overrides


```lua
fun(self: any):table<string, table>
```

 * `get_bone_overrides()`: returns all bone overrides as table `{[bonename] = override, ...}`

## get_bone_position


```lua
fun(self: any, bone: string):vector
```

 * `get_bone_position(bone)`: returns the previously set position and rotation of the bone
     * Shorthand for `get_bone_override(bone).position.vec, get_bone_override(bone).rotation.vec:apply(math.deg)`.
     * **Note:** Returned rotation is in degrees, not radians.
     * **Deprecated:** Use `get_bone_override` instead.

## get_breath


```lua
fun(self: any):number?
```

 Player only
 * `get_breath()`: returns player's breath

## get_camera


```lua
fun(self: any):{ mode: "any"|"first"|"third"|"third_front" }?
```

 Player only
 * `get_camera()`: Returns the camera parameters as a table as above.

## get_children


```lua
fun(self: any):ObjectRef[]
```

 * `get_children()`: returns a list of ObjectRefs that are attached to the
     object.

## get_clouds


```lua
fun(self: any):table
```

 Player only
 * `get_clouds()`: returns a table with the current cloud parameters as in
   `set_clouds`.

## get_day_night_ratio


```lua
fun(self: any):number?
```

 Player only
 * `get_day_night_ratio()`: returns the ratio or nil if it isn't overridden

## get_effective_observers


```lua
fun(self: any):table<string, boolean>
```

 * `get_effective_observers()`:
     * Like `get_observers()`, but returns the "effective" observers, taking into account attachments
     * Time complexity: O(nm)
         * n: number of observers of the involved entities
         * m: number of ancestors along the attachment chain

## get_entity_name


```lua
fun(self: any):string?
```

 Luaentity only
 * `get_entity_name()`:
     * **Deprecated**: Will be removed in a future version,
       use `:get_luaentity().name` instead.

## get_eye_offset


```lua
fun(self: any):vector?, vector?, vector?
```

 Player only
 * `get_eye_offset()`: Returns camera offset vectors as set via `set_eye_offset`.

## get_flags


```lua
fun(self: any):{ breathing: boolean, drowning: boolean, node_damage: boolean }?
```

 Player only
 * `get_flags()`: returns a table of player flags (the following boolean fields):
   * `breathing`: Whether breathing (regaining air) is enabled, default `true`.
   * `drowning`: Whether drowning (losing air) is enabled, default `true`.
   * `node_damage`: Whether the player takes damage from nodes, default `true`.

## get_formspec_prepend


```lua
fun(self: any):string?
```

 Player only
 * `get_formspec_prepend()`: returns a formspec string.

## get_fov


```lua
fun(self: any):number?
```

 Player only
 * `get_fov()`: Returns the following:
     * Server-sent FOV value. Returns 0 if an FOV override doesn't exist.
     * Boolean indicating whether the FOV value is a multiplier.
     * Time (in seconds) taken for the FOV transition. Set by `set_fov`.

## get_hp


```lua
fun(self: any):number
```

 * `get_hp()`: returns number of health points

## get_inventory


```lua
fun(self: any):InvRef?
```

 * `get_inventory()`: returns an `InvRef` for players, otherwise returns `nil`

## get_inventory_formspec


```lua
fun(self: any):string?
```

 Player only
 * `get_inventory_formspec()`: returns a formspec string

## get_lighting


```lua
fun(self: any):table?
```

 Player only
 * `get_lighting()`: returns the current state of lighting for the player.
     * Result is a table with the same fields as `light_definition` in `set_lighting`.

## get_local_animation


```lua
fun(self: any):table?, table?, table?, table?, table?
```

 Player only
 * `get_local_animation()`: returns idle, walk, dig, walk_while_dig tables and
   `frame_speed`.
 Unofficial note: Sorry, no types for this one

## get_look_dir


```lua
fun(self: any):vector?
```

 Player only
 * `get_look_dir()`: get camera direction as a unit vector

## get_look_horizontal


```lua
fun(self: any):number?
```

 Player only
 * `get_look_horizontal()`: yaw in radians
     * Angle is counter-clockwise from the +z direction.

## get_look_pitch


```lua
fun(self: any):number?
```

 Player only
 * `get_look_pitch()`: pitch in radians - Deprecated as broken. Use
   `get_look_vertical`.
     * Angle ranges between -pi/2 and pi/2, which are straight down and up
       respectively.

## get_look_vertical


```lua
fun(self: any):number?
```

 Player only
 * `get_look_vertical()`: pitch in radians
     * Angle ranges between -pi/2 and pi/2, which are straight up and down
       respectively.

## get_look_yaw


```lua
fun(self: any):number?
```

 Player only
 * `get_look_yaw()`: yaw in radians - Deprecated as broken. Use
   `get_look_horizontal`.
     * Angle is counter-clockwise from the +x direction.

## get_luaentity


```lua
fun(self: any):luaentity?
```

 * `get_luaentity()`:
     * Returns the object's associated luaentity table, if there is one
     * Otherwise returns `nil` (e.g. for players)

## get_meta


```lua
fun(self: any):PlayerMetaRef
```

 Player only
 * `get_meta()`: Returns metadata associated with the player (a PlayerMetaRef).

## get_moon


```lua
fun(self: any):table?
```

 Player only
 * `get_moon()`: returns a table with the current moon parameters as in
     `set_moon`.

## get_nametag_attributes


```lua
fun(self: any):{ text: string, color: ColorSpec, bgcolor: boolean|ColorSpec }
```

 * `get_nametag_attributes()`
     * returns a table with the attributes of the nametag of an object
     * a nametag is a HUD text rendered above the object
     * ```lua
       {
           text = "",
           color = {a=0..255, r=0..255, g=0..255, b=0..255},
           bgcolor = {a=0..255, r=0..255, g=0..255, b=0..255},
       }
       ```

## get_observers


```lua
fun(self: any):table<string, boolean>?
```

 * `get_observers()`:
     * throws an error if the object is invalid
     * returns `nil` if the observers are unmanaged
     * returns a table with all observer names as keys and `true` values (a "set") otherwise

## get_physics_override


```lua
fun(self: any):table
```

 Player only
 * `get_physics_override()`: returns the table given to `set_physics_override`

## get_player_control


```lua
fun(self: any):{ up: boolean, down: boolean, left: boolean, right: boolean, jump: boolean, aux1: boolean, sneak: boolean, dig: boolean, place: boolean, zoom: boolean, movement_x: number, movement_y: number }
```

 Player only
 * `get_player_control()`: returns table with player input
     * The table contains the following boolean fields representing the pressed
       keys: `up`, `down`, `left`, `right`, `jump`, `aux1`, `sneak`, `dig`,
       `place`, `LMB`, `RMB` and `zoom`.
     * The fields `LMB` and `RMB` are equal to `dig` and `place` respectively,
       and exist only to preserve backwards compatibility.
     * The table also contains the fields `movement_x` and `movement_y`.
         * They represent the movement of the player. Values are numbers in the
           range [-1.0,+1.0].
         * They take both keyboard and joystick input into account.
         * You should prefer them over `up`, `down`, `left` and `right` to
           support different input methods correctly.
     * Returns an empty table `{}` if the object is not a player.

## get_player_control_bits


```lua
fun(self: any):number
```

 Player only
 * `get_player_control_bits()`: returns integer with bit packed player pressed
   keys.
     * Bits:
         * 0 - up
         * 1 - down
         * 2 - left
         * 3 - right
         * 4 - jump
         * 5 - aux1
         * 6 - sneak
         * 7 - dig
         * 8 - place
         * 9 - zoom
     * Returns `0` (no bits set) if the object is not a player.

## get_player_name


```lua
fun(self: any):string?
```

 * `get_player_name()`: Returns player name or `""` if is not a player
 Player only

## get_player_velocity


```lua
fun(self: any):vector?
```

 Player only
 * `get_player_velocity()`: **DEPRECATED**, use get_velocity() instead.
   table {x, y, z} representing the player's instantaneous velocity in nodes/s

## get_pos


```lua
fun(self: any):vector
```

 * `get_pos()`: returns position as vector `{x=num, y=num, z=num}`

## get_properties


```lua
fun(self: any):ObjectProps
```

 * `get_properties()`: returns a table of all object properties

## get_rotation


```lua
fun(self: any):vector?
```

 * `get_rotation()`: returns the rotation, a vector (radians)

## get_sky


```lua
fun(self: any, as_table: boolean):table?
```

 Player only
 * `get_sky(as_table)`:
     * `as_table`: boolean that determines whether the deprecated version of this
     function is being used.
         * `true` returns a table containing sky parameters as defined in `set_sky(sky_parameters)`.
         * Deprecated: `false` or `nil` returns base_color, type, table of textures,
         clouds.

## get_stars


```lua
fun(self: any):table?
```

 Player only
 * `get_stars()`: returns a table with the current stars parameters as in
     `set_stars`.

## get_sun


```lua
fun(self: any):table?
```

 Player only
 * `get_sun()`: returns a table with the current sun parameters as in
     `set_sun`.

## get_texture_mod


```lua
fun(self: any):string?
```

 * `get_texture_mod()` returns current texture modifier

## get_velocity


```lua
fun(self: any):vector
```

 * `get_velocity()`: returns the velocity, a vector.

## get_wield_index


```lua
fun(self: any):integer?
```

 * `get_wield_index()`: returns the wield list index of the wielded item (starting with 1)

## get_wield_list


```lua
fun(self: any):string?
```

 * `get_wield_list()`: returns the name of the inventory list the wielded item
    is in.

## get_wielded_item


```lua
fun(self: any):ItemStack?
```

 * `get_wielded_item()`: returns a copy of the wielded item as an `ItemStack`

## get_yaw


```lua
fun(self: any):number
```

 * `get_yaw()`: returns number in radians

## hud_add


```lua
fun(self: any, hud: HudDef):HudID?
```

 Player only
 * `hud_add(hud definition)`: add a HUD element described by HUD def, returns ID
    number on success

## hud_change


```lua
fun(self: any, id: HudID, stat: string, value: any)
```

 Player only
 * `hud_change(id, stat, value)`: change a value of a previously added HUD
   element.
     * `stat` supports the same keys as in the hud definition table except for
       `"type"` (or the deprecated `"hud_elem_type"`).

## hud_get


```lua
fun(self: any, id: HudID)
```

 Player only
 * `hud_get(id)`: gets the HUD element definition structure of the specified ID

## hud_get_all


```lua
fun(self: any):table<HudID, HudDef>
```

 Player only
 * `hud_get_all()`:
     * Returns a table in the form `{ [id] = HUD definition, [id] = ... }`.
     * A mod should keep track of its introduced IDs and only use this to access foreign elements.
     * It is discouraged to change foreign HUD elements.

## hud_get_flags


```lua
fun(self: any):{ hotbar: boolean?, healthbar: boolean?, crosshair: boolean?, wielditem: boolean?, breathbar: boolean?, minimap: boolean?, minimap_radar: boolean?, basic_debug: boolean? }
```

 Player only
 * `hud_get_flags()`: returns a table of player HUD flags with boolean values.
     * See `hud_set_flags` for a list of flags that can be toggled.

## hud_get_hotbar_image


```lua
fun(self: any):string?
```

 Player only
 * `hud_get_hotbar_image()`: returns texturename

## hud_get_hotbar_itemcount


```lua
fun(self: any):integer?
```

 Player only
 * `hud_get_hotbar_itemcount()`: returns number of visible items
     * This value is also clamped by the `"main"` list size.

## hud_get_hotbar_selected_image


```lua
fun(self: any):string?
```

 Player only
 * `hud_get_hotbar_selected_image()`: returns texturename

## hud_remove


```lua
fun(self: any, id: HudID)
```

 Player only
 * `hud_remove(id)`: remove the HUD element of the specified id

## hud_set_flags


```lua
fun(self: any, flags: { hotbar: boolean?, healthbar: boolean?, crosshair: boolean?, wielditem: boolean?, breathbar: boolean?, minimap: boolean?, minimap_radar: boolean?, basic_debug: boolean? })
```

 Player only
 * `hud_set_flags(flags)`: sets specified HUD flags of player.
     * `flags`: A table with the following fields set to boolean values
         * `hotbar`
         * `healthbar`
         * `crosshair`
         * `wielditem`
         * `breathbar`
         * `minimap`: Modifies the client's permission to view the minimap.
           The client may locally elect to not view the minimap.
         * `minimap_radar`: is only usable when `minimap` is true
         * `basic_debug`: Allow showing basic debug info that might give a gameplay advantage.
           This includes map seed, player position, look direction, the pointed node and block bounds.
           Does not affect players with the `debug` privilege.
         * `chat`: Modifies the client's permission to view chat on the HUD.
           The client may locally elect to not view chat. Does not affect the console.
     * If a flag equals `nil`, the flag is not modified

## hud_set_hotbar_image


```lua
fun(self: any, texturename: string)
```

 Player only
 * `hud_set_hotbar_image(texturename)`
     * sets background image for hotbar

## hud_set_hotbar_itemcount


```lua
fun(self: any, count: integer)
```

 Player only
 * `hud_set_hotbar_itemcount(count)`: sets number of items in builtin hotbar
     * `count`: number of items, must be between `1` and `32`
     * If `count` exceeds the `"main"` list size, the list size will be used instead.

## hud_set_hotbar_selected_image


```lua
fun(self: any, texturename: string)
```

 Player only
 * `hud_set_hotbar_selected_image(texturename)`
     * sets image for selected item of hotbar

## is_player


```lua
fun(self: any):boolean
```

 * `is_player()`: returns true for players, false otherwise

## is_valid


```lua
fun(self: any):boolean
```

 * `is_valid()`: returns whether the object is valid.
    * See "Advice on handling `ObjectRefs`" above.

## move_to


```lua
fun(self: any, pos: vector, continuous?: boolean)
```

 * `move_to(pos, continuous=false)`
     * Does an interpolated move for Lua entities for visually smooth transitions.
     * If `continuous` is true, the Lua entity will not be moved to the current
       position before starting the interpolated move.
     * For players this does the same as `set_pos`,`continuous` is ignored.
     * no-op if object is attached

## override_day_night_ratio


```lua
fun(self: any, number: any)
```

 Player only
 * `override_day_night_ratio(ratio or nil)`
     * `0`...`1`: Overrides day-night ratio, controlling sunlight to a specific
       amount.
     * Passing no arguments disables override, defaulting to sunlight based on day-night cycle
     * See also `core.time_to_day_night_ratio`,

## punch


```lua
fun(self: any, puncher: ObjectRef, time_from_last_punch?: number, tool_capabilities?: tool_capabilities, dir?: vector)
```

 * `punch(puncher, time_from_last_punch, tool_capabilities, dir)`
     * punches the object, triggering all consequences a normal punch would have
     * `puncher`: another `ObjectRef` which punched the object or `nil`
     * `dir`: direction vector of punch
     * Other arguments: See `on_punch` for entities
     * Arguments `time_from_last_punch`, `tool_capabilities`, and `dir`
       will be replaced with a default value when the caller sets them to `nil`.

## remove


```lua
fun(self: any)
```

 * `remove()`: remove object
     * The object is removed after returning from Lua. However the `ObjectRef`
       itself instantly becomes unusable with all further method calls having
       no effect and returning `nil`.

## respawn


```lua
fun(self: any)
```

 Player only
 * `respawn()`: Respawns the player using the same mechanism as the death screen,
   including calling `on_respawnplayer` callbacks.

## right_click


```lua
fun(self: any, clicker: PlayerRef)
```

 * `right_click(clicker)`:
     * simulates using the 'place/use' key on the object
     * triggers all consequences as if a real player had done this
     * `clicker` is another `ObjectRef` which has clicked
     * note: this is called `right_click` for historical reasons only

## send_mapblock


```lua
fun(self: any, blockpos: vector):boolean?
```

 Player only
 * `send_mapblock(blockpos)`:
     * Sends an already loaded mapblock to the player.
     * Returns `false` if nothing was sent (note that this can also mean that
       the client already has the block)
     * Resource intensive - use sparsely

## set_acceleration


```lua
fun(self: any, acc: vector)
```

 * `set_acceleration(acc)`
     * Sets the acceleration
     * `acc` is a vector

## set_animation


```lua
fun(self: any, frame_range?: { x: number, y: number }, frame_speed?: number, frame_blend?: number, frame_loop?: boolean)
```

 * `set_animation(frame_range, frame_speed, frame_blend, frame_loop)`
     * Sets the object animation parameters and (re)starts the animation
     * Animations only work with a `"mesh"` visual
     * `frame_range`: Beginning and end frame (as specified in the mesh file).
        * Syntax: `{x=start_frame, y=end_frame}`
        * Animation interpolates towards the end frame but stops when it is reached
        * If looped, there is no interpolation back to the start frame
        * If looped, the model should look identical at start and end
        * default: `{x=1.0, y=1.0}`
     * `frame_speed`: How fast the animation plays, in frames per second (number)
        * default: `15.0`
     * `frame_blend`: number, default: `0.0`
     * `frame_loop`: If `true`, animation will loop. If false, it will play once
        * default: `true`

## set_animation_frame_speed


```lua
fun(self: any, frame_speed: number)
```

 * `set_animation_frame_speed(frame_speed)`
     * Sets the frame speed of the object's animation
     * Unlike `set_animation`, this will not restart the animation
     * `frame_speed`: See `set_animation`

## set_armor_groups


```lua
fun(self: any, groups: table<string, integer>)
```

 * `set_armor_groups({group1=rating, group2=rating, ...})`
     * sets the object's full list of armor groups
     * same table syntax as for `get_armor_groups`
     * note: all armor groups not in the table will be removed

## set_attach


```lua
fun(self: any, parent: ObjectRef, bone?: string, position?: vector, rotation?: vector, forced_visible?: boolean)
```

 * `set_attach(parent[, bone, position, rotation, forced_visible])`
     * Attaches object to `parent`
     * See 'Attachments' section for details
     * `parent`: `ObjectRef` to attach to
     * `bone`: Bone to attach to. Default is `""` (the root bone)
     * `position`: relative position, default `{x=0, y=0, z=0}`
     * `rotation`: relative rotation in degrees, default `{x=0, y=0, z=0}`
     * `forced_visible`: Boolean to control whether the attached entity
        should appear in first person, default `false`.
     * This command may fail silently (do nothing) when it would result
       in circular attachments.

## set_attribute


```lua
fun(self: any, attribute: string, value: string|number)
```

 Player only
 * `set_attribute(attribute, value)`:  DEPRECATED, use get_meta() instead
     * Sets an extra attribute with value on player.
     * `value` must be a string, or a number which will be converted to a
       string.
     * If `value` is `nil`, remove attribute from player.

## set_bone_override


```lua
fun(self: any, bone: string, override: table)
```

 * `set_bone_override(bone, override)`
     * `bone`: string
     * `override`: `{ position = property, rotation = property, scale = property }` or `nil`
     * `override = nil` (including omission) is shorthand for `override = {}` which clears the override
     * Each `property` is a table of the form
       `{ vec = vector, interpolation = 0, absolute = false }` or `nil`
         * `vec` is in the same coordinate system as the model, and in radians for rotation.
           It defaults to `vector.zero()` for translation and rotation and `vector.new(1, 1, 1)` for scale.
         * `interpolation`: The old and new overrides are interpolated over this timeframe (in seconds).
         * `absolute`: If set to `false` (which is the default),
           the override will be relative to the animated property:
             * Translation in the case of `position`;
             * Composition in the case of `rotation`;
             * Per-axis multiplication in the case of `scale`
     * `property = nil` is equivalent to no override on that property
     * **Note:** Unlike `set_bone_position`, the rotation is in radians, not degrees.
     * Compatibility note: Clients prior to 5.9.0 only support absolute position and rotation.
       All values are treated as absolute and are set immediately (no interpolation).

## set_bone_position


```lua
fun(self: any, bone: string, position: any, rotation: any)
```

 * `set_bone_position([bone, position, rotation])`
     * Sets absolute bone overrides, e.g. it is equivalent to
       ```lua
       obj:set_bone_override(bone, {
           position = {vec = position, absolute = true},
           rotation = {vec = rotation:apply(math.rad), absolute = true}
       })
       ```
     * **Note:** Rotation is in degrees, not radians.
     * **Deprecated:** Use `set_bone_override` instead.

## set_breath


```lua
fun(self: any, value: number)
```

 Player only
 * `set_breath(value)`: sets player's breath
     * values:
         * `0`: player is drowning
         * max: bubbles bar is not shown
         * See [Object properties] for more information
     * Is limited to range 0 ... 65535 (2^16 - 1)

## set_camera


```lua
fun(self: any, params: { mode: "any"|"first"|"third"|"third_front" })
```

 Player only
 * `set_camera(params)`: Sets camera parameters.
     * `mode`: Defines the camera mode used
       - `any`: free choice between all modes (default)
       - `first`: first-person camera
       - `third`: third-person camera
       - `third_front`: third-person camera, looking opposite of movement direction
     * Supported by client since 5.12.0.

## set_clouds


```lua
fun(self: any, cloud_parameters: table)
```

 Player only
 * `set_clouds(cloud_parameters)`: set cloud parameters
     * Passing no arguments resets clouds to their default values.
     * `cloud_parameters` is a table with the following optional fields:
         * `density`: from `0` (no clouds) to `1` (full clouds) (default `0.4`)
         * `color`: basic cloud color with alpha channel, ColorSpec
           (default `#fff0f0e5`).
         * `ambient`: cloud color lower bound, use for a "glow at night" effect.
           ColorSpec (alpha ignored, default `#000000`)
         * `height`: cloud height, i.e. y of cloud base (default per conf,
           usually `120`)
         * `thickness`: cloud thickness in nodes (default `16`).
           if set to zero the clouds are rendered flat.
         * `speed`: 2D cloud speed + direction in nodes per second
           (default `{x=0, z=-2}`).
         * `shadow`: shadow color, applied to the base of the cloud
           (default `#cccccc`).

## set_detach


```lua
fun(self: any)
```

 * `set_detach()`: Detaches object. No-op if object was not attached.

## set_eye_offset


```lua
fun(self: any, firstperson?: vector, thirdperson_back?: vector, thirdperson_front?: vector)
```

 Player only
 * `set_eye_offset([firstperson, thirdperson_back, thirdperson_front])`: Sets camera offset vectors.
     * `firstperson`: Offset in first person view.
       Defaults to `vector.zero()` if unspecified.
     * `thirdperson_back`: Offset in third person back view.
       Clamped between `vector.new(-10, -10, -5)` and `vector.new(10, 15, 5)`.
       Defaults to `vector.zero()` if unspecified.
     * `thirdperson_front`: Offset in third person front view.
       Same limits as for `thirdperson_back` apply.
       Defaults to `thirdperson_back` if unspecified.

## set_flags


```lua
fun(self: any, flags: { breathing: boolean?, drowning: boolean?, node_damage: boolean? })
```

 Player only
 * `set_flags(flags)`: sets flags
   * takes a table in the same format as returned by `get_flags`
   * absent fields are left unchanged

## set_formspec_prepend


```lua
fun(self: any, formspec: string)
```

 Player only
 * `set_formspec_prepend(formspec)`:
     * the formspec string will be added to every formspec shown to the user,
       except for those with a no_prepend[] tag.
     * This should be used to set style elements such as background[] and
       bgcolor[], any non-style elements (eg: label) may result in weird behavior.
     * Only affects formspecs shown after this is called.

## set_fov


```lua
fun(self: any, fov: number, is_multiplier: boolean, transition_time?: number)
```

 Player only
 * `set_fov(fov, is_multiplier, transition_time)`: Sets player's FOV
     * `fov`: Field of View (FOV) value.
     * `is_multiplier`: Set to `true` if the FOV value is a multiplier.
       Defaults to `false`.
     * `transition_time`: If defined, enables smooth FOV transition.
       Interpreted as the time (in seconds) to reach target FOV.
       If set to 0, FOV change is instantaneous. Defaults to 0.
     * Set `fov` to 0 to clear FOV override.

## set_hp


```lua
fun(self: any, hp: integer, reason: PlayerHPChangeReason)
```

 * `set_hp(hp, reason)`: set number of health points
     * See reason in register_on_player_hpchange
     * Is limited to the range of 0 ... 65535 (2^16 - 1)
     * For players: HP are also limited by `hp_max` specified in object properties
 Unofficial note:I *assume* it's a PlayerHPChangeReason, i am not certain

## set_inventory_formspec


```lua
fun(self: any, formspec: string)
```

 Player only
 * `set_inventory_formspec(formspec)`
     * Redefines the player's inventory formspec.
     * Should usually be called at least once in the `on_joinplayer` callback.
     * If `formspec` is `""`, the player's inventory is disabled.
     * If the inventory formspec is currently open on the client, it is
       updated immediately.
     * See also: `core.register_on_player_receive_fields`

## set_lighting


```lua
fun(self: any, light_definition: table)
```

 Player only
 * `set_lighting(light_definition)`: sets lighting for the player
     * Passing no arguments resets lighting to its default values.
     * `light_definition` is a table with the following optional fields:
       * `saturation` sets the saturation (vividness; default: `1.0`).
         * It is applied according to the function `result = b*(1-s) + c*s`, where:
           * `c` is the original color
           * `b` is the greyscale version of the color with the same luma
           * `s` is the saturation set here
         * The resulting color always has the same luma (perceived brightness) as the original.
         * This means that:
           * values > 1 oversaturate
           * values < 1 down to 0 desaturate, 0 being entirely greyscale
           * values < 0 cause an effect similar to inversion,
             but keeping original luma and being symmetrical in terms of saturation
             (eg. -1 and 1 is the same saturation and luma, but different hues)
         * This value has no effect on clients who have shaders or post-processing disabled.
       * `shadows` is a table that controls ambient shadows
         * This has no effect on clients who have the "Dynamic Shadows" effect disabled.
         * `intensity` sets the intensity of the shadows from 0 (no shadows, default) to 1 (blackness)
         * `tint` tints the shadows with the provided color, with RGB values ranging from 0 to 255.
           (default `{r=0, g=0, b=0}`)
       * `exposure` is a table that controls automatic exposure.
         The basic exposure factor equation is `e = 2^exposure_correction / clamp(luminance, 2^luminance_min, 2^luminance_max)`
         * This has no effect on clients who have the "Automatic Exposure" effect disabled.
         * `luminance_min` set the lower luminance boundary to use in the calculation (default: `-3.0`)
         * `luminance_max` set the upper luminance boundary to use in the calculation (default: `-3.0`)
         * `exposure_correction` correct observed exposure by the given EV value (default: `0.0`)
         * `speed_dark_bright` set the speed of adapting to bright light (default: `1000.0`)
         * `speed_bright_dark` set the speed of adapting to dark scene (default: `1000.0`)
         * `center_weight_power` set the power factor for center-weighted luminance measurement (default: `1.0`)
       * `bloom` is a table that controls bloom.
         * This has no effect on clients with protocol version < 46 or clients who
           have the "Bloom" effect disabled.
         * `intensity` defines much bloom is applied to the rendered image.
           * Recommended range: from 0.0 to 1.0, default: 0.05
           * If set to 0, bloom is disabled.
           * The default value is to be changed from 0.05 to 0 in the future.
             If you wish to keep the current default value, you should set it
             explicitly.
         * `strength_factor` defines the magnitude of bloom overexposure.
           * Recommended range: from 0.1 to 10.0, default: 1.0
         * `radius` is a logical value that controls how far the bloom effect
           spreads from the bright objects.
           * Recommended range: from 0.1 to 8.0, default: 1.0
         * The behavior of values outside the recommended range is unspecified.
       * `volumetric_light`: is a table that controls volumetric light (a.k.a. "godrays")
         * This has no effect on clients who have the "Volumetric Lighting" or "Bloom" effects disabled.
         * `strength`: sets the strength of the volumetric light effect from 0 (off, default) to 1 (strongest).
             * `0.2` is a reasonable standard value.
             * Currently, bloom `intensity` and `strength_factor` affect volumetric
               lighting `strength` and vice versa. This behavior is to be changed
               in the future, do not rely on it.


## set_local_animation


```lua
fun(self: any, idle: any, walk: any, dig: any, walk_while_dig: any, frame_speed: any)
```

 Player only
 * `set_local_animation(idle, walk, dig, walk_while_dig, frame_speed)`:
   set animation for player model in third person view.
     * Every animation equals to a `{x=starting frame, y=ending frame}` table.
     * `frame_speed` sets the animations frame speed. Default is 30.
 Unofficial note: Sorry, no types for this one

## set_look_horizontal


```lua
fun(self: any, radians: number)
```

 Player only
 * `set_look_horizontal(radians)`: sets look yaw
     * radians: Angle from the +z direction, where positive is counter-clockwise.

## set_look_pitch


```lua
fun(self: any, radians: number)
```

 Player only
 * `set_look_pitch(radians)`: sets look pitch - Deprecated. Use
   `set_look_vertical`.

## set_look_vertical


```lua
fun(self: any, radians: number)
```

 Player only
 * `set_look_vertical(radians)`: sets look pitch
     * radians: Angle from looking forward, where positive is downwards.

## set_look_yaw


```lua
fun(self: any, radians: number)
```

 Player only
 * `set_look_yaw(radians)`: sets look yaw - Deprecated. Use
   `set_look_horizontal`.

## set_minimap_modes


```lua
fun(self: any, modes: ({ type: "off"|"radar"|"surface"|"texture", label: string?, size: integer, texture: string?, scale: integer? })[], selected_mode: integer)
```

 Player only
 * `set_minimap_modes({mode, mode, ...}, selected_mode)`
     * Overrides the available minimap modes (and toggle order), and changes the
     selected mode.
     * `mode` is a table consisting of up to four fields:
         * `type`: Available type:
             * `off`: Minimap off
             * `surface`: Minimap in surface mode
             * `radar`: Minimap in radar mode
             * `texture`: Texture to be displayed instead of terrain map
               (texture is centered around 0,0 and can be scaled).
               Texture size is limited to 512 x 512 pixel.
         * `label`: Optional label to display on minimap mode toggle
           The translation must be handled within the mod.
         * `size`: Sidelength or diameter, in number of nodes, of the terrain
           displayed in minimap
         * `texture`: Only for texture type, name of the texture to display
         * `scale`: Only for texture type, scale of the texture map in nodes per
           pixel (for example a `scale` of 2 means each pixel represents a 2x2
           nodes square)
     * `selected_mode` is the mode index to be selected after modes have been changed
     (0 is the first mode).

## set_moon


```lua
fun(self: any, moon_parameters: table)
```

 Player only
 * `set_moon(moon_parameters)`:
     * Passing no arguments resets the moon to its default values.
     * `moon_parameters` is a table with the following optional fields:
         * `visible`: Boolean for whether the moon is visible.
             (default: `true`)
         * `texture`: A regular texture for the moon. Setting to `""`
             will re-enable the mesh moon. (default: `"moon.png"`, if it exists)
             The texture appears non-rotated at sunrise / moonset and rotated 180
             degrees (upside down) at sunset / moonrise.
             Note: Relative to the sun, the moon texture is hence rotated by 180°.
             You can use the `^[transformR180` texture modifier to achieve the same orientation.
         * `tonemap`: A 512x1 texture containing the tonemap for the moon
             (default: `"moon_tonemap.png"`)
         * `scale`: Float controlling the overall size of the moon (default: `1`)
             Note: For legacy reasons, the sun is bigger than the moon by a factor
             of about `1.57` for equal `scale` values.

## set_nametag_attributes


```lua
fun(self: any, attributes: { text: string?, color: ColorSpec?, bgcolor: (boolean|ColorSpec)? })
```

 * `set_nametag_attributes(attributes)`
     * sets the attributes of the nametag of an object
     * `attributes`:
       ```lua
       {
           text = "My Nametag",
           color = ColorSpec,
           -- ^ Text color
           bgcolor = ColorSpec or false,
           -- ^ Sets background color of nametag
           -- `false` will cause the background to be set automatically based on user settings
           -- Default: false
       }
       ```

## set_observers


```lua
fun(self: any, observers: table<string, boolean>)
```

 * `set_observers(observers)`: sets observers (players this object is sent to)
     * If `observers` is `nil`, the object's observers are "unmanaged":
       The object is sent to all players as governed by server settings. This is the default.
     * `observers` is a "set" of player names: `{name1 = true, name2 = true, ...}`
         * A set is a table where the keys are the elements of the set
           (in this case, *valid* player names) and the values are all `true`.
     * Attachments: The *effective observers* of an object are made up of
       all players who can observe the object *and* are also effective observers
       of its parent object (if there is one).
     * Players are automatically added to their own observer sets.
       Players **must** effectively observe themselves.
     * Object activation and deactivation are unaffected by observability.
     * Attached sounds do not work correctly and thus should not be used
       on objects with managed observers yet.

## set_physics_override


```lua
fun(self: any, override_table: table)
```

 Player only
 * `set_physics_override(override_table)`
     * Overrides the physics attributes of the player
     * `override_table` is a table with the following fields:
         * `speed`: multiplier to *all* movement speed (`speed_*`) and
                    acceleration (`acceleration_*`) values (default: `1`)
         * `speed_walk`: multiplier to default walk speed value (default: `1`)
             * Note: The actual walk speed is the product of `speed` and `speed_walk`
         * `speed_climb`: multiplier to default climb speed value (default: `1`)
             * Note: The actual climb speed is the product of `speed` and `speed_climb`
         * `speed_crouch`: multiplier to default sneak speed value (default: `1`)
             * Note: The actual sneak speed is the product of `speed` and `speed_crouch`
         * `speed_fast`: multiplier to default speed value in Fast Mode (default: `1`)
             * Note: The actual fast speed is the product of `speed` and `speed_fast`
         * `jump`: multiplier to default jump value (default: `1`)
         * `gravity`: multiplier to default gravity value (default: `1`)
         * `liquid_fluidity`: multiplier to liquid movement resistance value
           (for nodes with `liquid_move_physics`); the higher this value, the lower the
           resistance to movement. At `math.huge`, the resistance is zero and you can
           move through any liquid like air. (default: `1`)
             * Warning: Values below 1 are currently unsupported.
         * `liquid_fluidity_smooth`: multiplier to default maximum liquid resistance value
           (for nodes with `liquid_move_physics`); controls deceleration when entering
           node at high speed. At higher values you come to a halt more quickly
           (default: `1`)
         * `liquid_sink`: multiplier to default liquid sinking speed value;
           (for nodes with `liquid_move_physics`) (default: `1`)
         * `acceleration_default`: multiplier to horizontal and vertical acceleration
           on ground or when climbing (default: `1`)
             * Note: The actual acceleration is the product of `speed` and `acceleration_default`
         * `acceleration_air`: multiplier to acceleration
           when jumping or falling (default: `1`)
             * Note: The actual acceleration is the product of `speed` and `acceleration_air`
         * `acceleration_fast`: multiplier to acceleration in Fast Mode (default: `1`)
             * Note: The actual acceleration is the product of `speed` and `acceleration_fast`
         * `sneak`: whether player can sneak (default: `true`)
         * `sneak_glitch`: whether player can use the new move code replications
           of the old sneak side-effects: sneak ladders and 2 node sneak jump
           (default: `false`)
         * `new_move`: use new move/sneak code. When `false` the exact old code
           is used for the specific old sneak behavior (default: `true`)
     * Note: All numeric fields above modify a corresponding `movement_*` setting.
     * For games, we recommend for simpler code to first modify the `movement_*`
       settings (e.g. via the game's `minetest.conf`) to set a global base value
       for all players and only use `set_physics_override` when you need to change
       from the base value on a per-player basis
     * Note: Some of the fields don't exist in old API versions, see feature
       `physics_overrides_v2`.


## set_pos


```lua
fun(self: any, pos: vector)
```

 * `set_pos(pos)`:
     * Sets the position of the object.
     * No-op if object is attached.
     * `pos` is a vector `{x=num, y=num, z=num}`

## set_properties


```lua
fun(self: any, ObjectProps: ObjectProps)
```

 * `set_properties(object property table)`

## set_rotation


```lua
fun(self: any, rot: vector)
```

 Luaentity only
 * `set_rotation(rot)`
     * Sets the rotation
     * `rot` is a vector (radians). X is pitch (elevation), Y is yaw (heading)
       and Z is roll (bank).
     * Does not reset rotation incurred through `automatic_rotate`.
       Remove & re-add your objects to force a certain rotation.

## set_sky


```lua
fun(self: any, sky_parameters: table)
```

 Player only
 * `set_sky(sky_parameters)`
     * The presence of the function `set_sun`, `set_moon` or `set_stars` indicates
       whether `set_sky` accepts this format. Check the legacy format otherwise.
     * Passing no arguments resets the sky to its default values.
     * `sky_parameters` is a table with the following optional fields:
         * `base_color`: ColorSpec, meaning depends on `type` (default: `#ffffff`)
         * `body_orbit_tilt`: Float, rotation angle of sun/moon orbit in degrees.
            By default, orbit is controlled by a client-side setting, and this field is not set.
            After a value is assigned, it can only be changed to another float value.
            Valid range [-60.0,60.0] (default: not set)
         * `type`: Available types:
             * `"regular"`: Uses 0 textures, `base_color` ignored
             * `"skybox"`: Uses 6 textures, `base_color` used as fog.
             * `"plain"`: Uses 0 textures, `base_color` used as both fog and sky.
             (default: `"regular"`)
         * `textures`: A table containing up to six textures in the following
             order: Y+ (top), Y- (bottom), X+ (east), X- (west), Z- (south), Z+ (north).
             The top and bottom textures are oriented in-line with the east (X+) face (the top edge of the
             bottom texture and the bottom edge of the top texture touch the east face).
             Some top and bottom textures expect to be aligned with the north face and will need to be rotated
             by -90 and 90 degrees, respectively, to fit the eastward orientation.
         * `clouds`: Boolean for whether clouds appear. (default: `true`)
         * `sky_color`: A table used in `"regular"` type only, containing the
           following values (alpha is ignored):
             * `day_sky`: ColorSpec, for the top half of the sky during the day.
               (default: `#61b5f5`)
             * `day_horizon`: ColorSpec, for the bottom half of the sky during the day.
               (default: `#90d3f6`)
             * `dawn_sky`: ColorSpec, for the top half of the sky during dawn/sunset.
               (default: `#b4bafa`)
               The resulting sky color will be a darkened version of the ColorSpec.
               Warning: The darkening of the ColorSpec is subject to change.
             * `dawn_horizon`: ColorSpec, for the bottom half of the sky during dawn/sunset.
               (default: `#bac1f0`)
               The resulting sky color will be a darkened version of the ColorSpec.
               Warning: The darkening of the ColorSpec is subject to change.
             * `night_sky`: ColorSpec, for the top half of the sky during the night.
               (default: `#006bff`)
               The resulting sky color will be a dark version of the ColorSpec.
               Warning: The darkening of the ColorSpec is subject to change.
             * `night_horizon`: ColorSpec, for the bottom half of the sky during the night.
               (default: `#4090ff`)
               The resulting sky color will be a dark version of the ColorSpec.
               Warning: The darkening of the ColorSpec is subject to change.
             * `indoors`: ColorSpec, for when you're either indoors or underground.
               (default: `#646464`)
             * `fog_sun_tint`: ColorSpec, changes the fog tinting for the sun
               at sunrise and sunset. (default: `#f47d1d`)
             * `fog_moon_tint`: ColorSpec, changes the fog tinting for the moon
               at sunrise and sunset. (default: `#7f99cc`)
             * `fog_tint_type`: string, changes which mode the directional fog
                 abides by, `"custom"` uses `sun_tint` and `moon_tint`, while
                 `"default"` uses the classic Luanti sun and moon tinting.
                 Will use tonemaps, if set to `"default"`. (default: `"default"`)
         * `fog`: A table with following optional fields:
             * `fog_distance`: integer, set an upper bound for the client's viewing_range.
                Any value >= 0 sets the desired upper bound for viewing_range,
                disables range_all and prevents disabling fog (F3 key by default).
                Any value < 0 resets the behavior to being client-controlled.
                (default: -1)
             * `fog_start`: float, override the client's fog_start.
                Fraction of the visible distance at which fog starts to be rendered.
                Any value between [0.0, 0.99] set the fog_start as a fraction of the viewing_range.
                Any value < 0, resets the behavior to being client-controlled.
                (default: -1)
             * `fog_color`: ColorSpec, override the color of the fog.
                Unlike `base_color` above this will apply regardless of the skybox type.
                (default: `"#00000000"`, which means no override)

## set_sprite


```lua
fun(self: any, start_frame?: { x: number, y: number }, num_frames?: integer, framelength?: number, select_x_by_camera?: boolean|string[])
```

 Luaentity only
 * `set_sprite(start_frame, num_frames, framelength, select_x_by_camera)`
     * Specifies and starts a sprite animation
     * Only used by `sprite` and `upright_sprite` visuals
     * Animations iterate along the frame `y` position.
     * `start_frame`: {x=column number, y=row number}, the coordinate of the
       first frame, default: `{x=0, y=0}`
     * `num_frames`: Total frames in the texture, default: `1`
     * `framelength`: Time per animated frame in seconds, default: `0.2`
     * `select_x_by_camera`: Only for visual = `sprite`. Changes the frame `x`
       position according to the view direction. default: `false`.
         * First column:  subject facing the camera
         * Second column: subject looking to the left
         * Third column:  subject backing the camera
         * Fourth column: subject looking to the right
         * Fifth column:  subject viewed from above
         * Sixth column:  subject viewed from below

## set_stars


```lua
fun(self: any, star_parameters: table)
```

 Player only
 * `set_stars(star_parameters)`:
     * Passing no arguments resets stars to their default values.
     * `star_parameters` is a table with the following optional fields:
         * `visible`: Boolean for whether the stars are visible.
             (default: `true`)
         * `day_opacity`: Float for maximum opacity of stars at day.
             No effect if `visible` is false.
             (default: 0.0; maximum: 1.0; minimum: 0.0)
         * `count`: Integer number to set the number of stars in
             the skybox. Only applies to `"skybox"` and `"regular"` sky types.
             (default: `1000`)
         * `star_color`: ColorSpec, sets the colors of the stars,
             alpha channel is used to set overall star brightness.
             (default: `#ebebff69`)
         * `scale`: Float controlling the overall size of the stars (default: `1`)

## set_sun


```lua
fun(self: any, sun_parameters: table)
```

 Player only
 * `set_sun(sun_parameters)`:
     * Passing no arguments resets the sun to its default values.
     * `sun_parameters` is a table with the following optional fields:
         * `visible`: Boolean for whether the sun is visible.
             (default: `true`)
         * `texture`: A regular texture for the sun. Setting to `""`
             will re-enable the mesh sun. (default: "sun.png", if it exists)
             The texture appears non-rotated at sunrise and rotated 180 degrees
             (upside down) at sunset.
         * `tonemap`: A 512x1 texture containing the tonemap for the sun
             (default: `"sun_tonemap.png"`)
         * `sunrise`: A regular texture for the sunrise texture.
             (default: `"sunrisebg.png"`)
         * `sunrise_visible`: Boolean for whether the sunrise texture is visible.
             (default: `true`)
         * `scale`: Float controlling the overall size of the sun. (default: `1`)
             Note: For legacy reasons, the sun is bigger than the moon by a factor
             of about `1.57` for equal `scale` values.

## set_texture_mod


```lua
fun(self: any, mod: string)
```

 Luaentity only
 * `set_texture_mod(mod)`
     * Set a texture modifier to the base texture, for sprites and meshes.
     * When calling `set_texture_mod` again, the previous one is discarded.
     * `mod` the texture modifier. See [Texture modifiers].

## set_velocity


```lua
fun(self: any, vel: vector)
```

 * `set_velocity(vel)`
     * Sets the velocity
     * `vel` is a vector, e.g. `{x=0.0, y=2.3, z=1.0}`

## set_wielded_item


```lua
fun(self: any, item: ItemStack):boolean?
```

 * `set_wielded_item(item)`: replaces the wielded item, returns `true` if
   successful.

## set_yaw


```lua
fun(self: any, yaw: number)
```

 Luaentity only
 * `set_yaw(yaw)`: sets the yaw in radians (heading).


---

# PrivDef

## description


```lua
string
```

## give_to_admin


```lua
boolean?
```

 Whether to grant the privilege to the server admin.
 Uses value of 'give_to_singleplayer' by default.

## give_to_singleplayer


```lua
boolean
```

## on_grant


```lua
fun(name: string, granter_name: string)
```

 Note that the above two callbacks will be called twice if a player is
 responsible, once with the player name, and then with a nil player
 name.
 Return true in the above callbacks to stop register_on_priv_grant or
 revoke being called.

## on_revoke


```lua
fun(name: string, revoker_name: string)
```

 Note that the above two callbacks will be called twice if a player is
 responsible, once with the player name, and then with a nil player
 name.
 Return true in the above callbacks to stop register_on_priv_grant or
 revoke being called.


---

# Proto


---

# PseudoRandom


```lua
PseudoRandom
```


```lua
function PseudoRandom(seed: integer)
```


---

# PseudoRandom

## get_state


```lua
(method) PseudoRandom:get_state()
  -> integer
```

 * `get_state()`: return state of pseudorandom generator as number
     * use returned number as seed in PseudoRandom constructor to restore

## next


```lua
(method) PseudoRandom:next()
  -> integer
```

 * `next()`: return next integer random number [`0`...`32767`]


---

# PseudoRandom.get_state


```lua
(method) PseudoRandom:get_state()
  -> integer
```


---

# PseudoRandom.next


```lua
(method) PseudoRandom:next()
  -> integer
```


```lua
(method) PseudoRandom:next(min: integer, max: integer)
  -> integer
```


---

# Raycast


```lua
function Raycast(pos1: vector, pos2: vector, objects?: boolean, liquids?: boolean, pointabilities?: { nodes: table<string, boolean|"blocking">?, objects: table<string, boolean|"blocking">? })
  -> Raycast: function
```


---

# SecureRandom

## next_bytes


```lua
(method) SecureRandom:next_bytes(count: integer)
  -> string
```

 * `next_bytes([count])`: return next `count` (default 1, capped at 2048) many
   random bytes, as a string.


---

# SecureRandom


```lua
SecureRandom
```


```lua
function SecureRandom()
  -> SecureRandom
```


---

# SecureRandom.next_bytes


```lua
(method) SecureRandom:next_bytes(count: integer)
  -> string
```


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

# Settings


```lua
function Settings(filename: string)
  -> Settings
```


---

# Settings

## get


```lua
fun(key: string):any
```

 * `get(key)`: returns a value
     * Returns `nil` if `key` is not found.

## get_bool


```lua
fun(key: string, fundefault: any):any
```

 * `get_bool(key, [default])`: returns a boolean
     * `default` is the value returned if `key` is not found.
     * Returns `nil` if `key` is not found and `default` not specified.

## get_flags


```lua
fun(key: string):table<string, boolean>
```

 * `get_flags(key)`:
     * Returns `{flag = true/false, ...}` according to the set flags.
     * Is currently limited to mapgen flags `mg_flags` and mapgen-specific
       flags like `mgv5_spflags`.
     * Returns `nil` if `key` is not found.

## get_names


```lua
fun():string[]
```

 * `get_names()`: returns `{key1,...}`

## get_np_group


```lua
fun(key: string):NoiseParams
```

 * `get_np_group(key)`: returns a NoiseParams table
     * Returns `nil` if `key` is not found.

## get_pos


```lua
fun(key: string):vector?
```

 * `get_pos(key)`:
     * Returns a `vector`
     * Returns `nil` if no value is found or parsing failed.

## has


```lua
fun(key: string):boolean
```

 * `has(key)`:
     * Returns a boolean indicating whether `key` exists.
     * In contrast to the various getter functions, `has()` doesn't consider
       any default values.
     * This means that on the main settings object (`core.settings`),
       `get(key)` might return a value even if `has(key)` returns `false`.

## remove


```lua
fun(key: boolean):boolean
```

 * `remove(key)`: returns a boolean (`true` for success)

## set


```lua
fun(key: string, value: any)
```

 * `set(key, value)`
     * Setting names can't contain whitespace or any of `="{}#`.
     * Setting values can't contain the sequence `\n"""`.
     * Setting names starting with "secure." can't be set on the main settings
       object (`core.settings`).

## set_bool


```lua
fun(key: string, value: boolean)
```

 * `set_bool(key, value)`
     * See documentation for `set()` above.

## set_np_group


```lua
fun(key: string, value: NoiseParams)
```

 * `set_np_group(key, value)`
     * `value` is a NoiseParams table.
     * Also, see documentation for `set()` above.

## set_pos


```lua
fun(key: string, value: vector)
```

 * `set_pos(key, value)`
     * `value` is a `vector`.
     * Also, see documentation for `set()` above.

## to_table


```lua
fun():table
```

 * `to_table()`: returns `{[key1]=value1,...}`

## write


```lua
fun():boolean
```

 * `write()`: returns a boolean (`true` for success)
     * Writes changes to file.


---

# SimpleSoundSpec

## fade


```lua
number?
```

## gain


```lua
number?
```

## name


```lua
string
```

## pitch


```lua
number?
```


---

# Spacea

## Set


```lua
Set
```

## default_jump


```lua
number
```

## entities


```lua
Spacea.Entities
```

## f


```lua
Functional
```

## foreach


```lua
function s.foreach(t: <T>[], f: fun(v: <T>, i: integer))
```

 equivalent to an *ipairs* loop

## foreachp


```lua
function s.foreachp(t: table<any, any>, f: fun(v: any, k: any))
```

 equivalent to a *pairs* loop
 Ordering is randomized

@*param* `t` — any table

## get_or_load_node


```lua
function s.get_or_load_node(pos: vector)
  -> MapNode|{ name: string, param1: number, param2: number }
```

## globalstep_with_timer


```lua
function s.globalstep_with_timer(timer_max: number, f: fun(dtime: number))
  -> nil
```

## gravity


```lua
number
```

## is_air


```lua
function s.is_air(name: any)
  -> boolean
```

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

## mapgen


```lua
table
```

## player


```lua
table
```

## settings


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

# Spacea.Entities

## get_eyepos


```lua
function Spacea.Entities.get_eyepos(object: ObjectRef)
  -> vector
```


---

# StorageRef

## contains


```lua
fun(key: string):boolean?
```

 * `contains(key)`: Returns true if key present, otherwise false.
     * Returns `nil` when the MetaData is inexistent.

## get


```lua
fun(key: string):string?
```

 * `get(key)`: Returns `nil` if key not present, else the stored string.

## get_float


```lua
fun(key: string):number
```

## get_int


```lua
fun(key: string):integer
```

 * `get_int(key)`: Returns `0` if key not present.

## get_keys


```lua
fun():string[]
```

## set_float


```lua
fun(key: string, value: number)
```

 * `set_float(key, value)`
     * Store a number (a 64-bit float) exactly.
     * The value will be converted into a string when stored.

## set_int


```lua
fun(key: string, value: integer)
```

 * `set_int(key, value)`
     * The range for the value is system-dependent (usually 32 bits).
       The value will be converted into a string when stored.

## set_string


```lua
fun(key: string, value: string)
```

 * `set_string(key, value)`: Value of `""` will delete the key.

## to_table


```lua
fun():{ fields: table<string, string>, inventory: InvTable }
```


---

# Tile


---

# TileAnimation

## aspect_h


```lua
integer?
```

## aspect_w


```lua
integer?
```

## frame_length


```lua
number?
```

## frames_h


```lua
integer?
```

## frames_w


```lua
integer?
```

## length


```lua
number?
```

## type


```lua
"sheet_2d"|"vertical_frames"
```


---

# TouchInteractionMode


---

# Trace


---

# ValueNoise


```lua
function ValueNoise(noiseparams: NoiseParams)
  -> ValueNoise
```


---

# ValueNoise

## get_2d


```lua
fun(pos: { x: number, y: number }):{ x: number, y: number }
```

 * `get_2d(pos)`: returns 2D noise value at `pos={x=,y=}`

## get_3d


```lua
fun(pos: vector):vector
```

 * `get_3d(pos)`: returns 3D noise value at `pos={x=,y=,z=}`


---

# ValueNoiseMap


```lua
function ValueNoiseMap(noiseparams: NoiseParams, size: vector|{ x: number, y: number })
  -> ValueNoiseMap
```


---

# ValueNoiseMap

## calc_2d_map


```lua
fun(pos: { x: number, y: number })
```

 * `calc_2d_map(pos)`: Calculates the 2d noise map starting at `pos`. The result
   is stored internally.

## calc_3d_map


```lua
fun(pos: vector)
```

 * `calc_3d_map(pos)`: Calculates the 3d noise map starting at `pos`. The result
   is stored internally.

## get_2d_map


```lua
fun(pos: { x: number, y: number }):number[][]
```

 * `get_2d_map(pos)`: returns a `<size.x>` times `<size.y>` 2D array of 2D noise
   with values starting at `pos={x=,y=}`

## get_2d_map_flat


```lua
fun(pos: { x: number, y: number }, buffer?: number[]):number[]?
```

 * `get_2d_map_flat(pos, buffer)`: returns a flat `<size.x * size.y>` element
   array of 2D noise with values starting at `pos={x=,y=}`

## get_3d_map


```lua
fun(pos: vector):number[][][]
```

 * `get_3d_map(pos)`: returns a `<size.x>` times `<size.y>` times `<size.z>`
   3D array of 3D noise with values starting at `pos={x=,y=,z=}`.

## get_3d_map_flat


```lua
fun(pos: vector, buffer?: number[]):number[]?
```

 * `get_3d_map_flat(pos, buffer)`: Same as `get2dMap_flat`, but 3D noise

## get_map_slice


```lua
fun(slice_offset: { x: number?, y: number?, z: number? }, slice_size: { x: number?, y: number?, z: number? }, buffer?: number[]):number[]?
```

 * `get_map_slice(slice_offset, slice_size, buffer)`: In the form of an array,
   returns a slice of the most recently computed noise results. The result slice
   begins at coordinates `slice_offset` and takes a chunk of `slice_size`.
   E.g., to grab a 2-slice high horizontal 2d plane of noise starting at buffer
   offset `y = 20`:
   ```lua
   noisevals = noise:get_map_slice({y=20}, {y=2})
   ```
   It is important to note that `slice_offset` offset coordinates begin at 1,
   and are relative to the starting position of the most recently calculated
   noise.
   To grab a single vertical column of noise starting at map coordinates
   `x = 1023, y=1000, z = 1000`:
   ```lua
   noise:calc_3d_map({x=1000, y=1000, z=1000})
   noisevals = noise:get_map_slice({x=24, z=1}, {x=1, z=1})
   ```


---

# VoxelArea

## contains


```lua
(method) VoxelArea:contains(x: number, y: number, z: number)
  -> boolean
```

## containsi


```lua
(method) VoxelArea:containsi(i: number)
  -> boolean
```

## containsp


```lua
(method) VoxelArea:containsp(p: vector)
  -> boolean
```

## getExtent


```lua
(method) VoxelArea:getExtent()
  -> vector
```

## getVolume


```lua
(method) VoxelArea:getVolume()
  -> vector
```

## index


```lua
(method) VoxelArea:index(x: number, y: number, z: number)
  -> number
```

* `index(x, y, z)`: returns the index of an absolute position in a flat array
  starting at `1`.
    * `x`, `y` and `z` must be integers to avoid an incorrect index result.
    * The position (x, y, z) is not checked for being inside the area volume,
      being outside can cause an incorrect index result.
    * Useful for things like `VoxelManip`, raw Schematic specifiers,
      `ValueNoiseMap:get2d`/`3dMap`, and so on.


## indexp


```lua
(method) VoxelArea:indexp(p: vector)
  -> number
```

* `indexp(p)`: same functionality as `index(x, y, z)` but takes a vector.
    * As with `index(x, y, z)`, the components of `p` must be integers, and `p`
      is not checked for being inside the area volume.
    

## new


```lua
(method) VoxelArea:new(arg: { MinEdge: vector, MaxEdge: vector })
  -> VoxelArea
```

## position


```lua
(method) VoxelArea:position(i: number)
  -> vector
```

 * `position(i)`: returns the absolute position vector corresponding to index
   `i`.


---

# VoxelArea


```lua
VoxelArea
```


```lua
function VoxelArea(pmin: vector, pmax: vector)
  -> VoxelArea
```


---

# VoxelArea.contains


```lua
(method) VoxelArea:contains(x: number, y: number, z: number)
  -> boolean
```


---

# VoxelArea.containsi


```lua
(method) VoxelArea:containsi(i: number)
  -> boolean
```


---

# VoxelArea.containsp


```lua
(method) VoxelArea:containsp(p: vector)
  -> boolean
```


---

# VoxelArea.getExtent


```lua
(method) VoxelArea:getExtent()
  -> vector
```


---

# VoxelArea.getVolume


```lua
(method) VoxelArea:getVolume()
  -> vector
```


---

# VoxelArea.index


```lua
(method) VoxelArea:index(x: number, y: number, z: number)
  -> number
```


---

# VoxelArea.indexp


```lua
(method) VoxelArea:indexp(p: vector)
  -> number
```


---

# VoxelArea.new


```lua
(method) VoxelArea:new(arg: { MinEdge: vector, MaxEdge: vector })
  -> VoxelArea
```


---

# VoxelArea.position


```lua
(method) VoxelArea:position(i: number)
  -> vector
```


---

# VoxelManip


```lua
VoxelManip
```


```lua
function VoxelManip(p1?: vector, p2?: vector)
  -> VoxelManip
```


---

# VoxelManip

## calc_lighting


```lua
(method) VoxelManip:calc_lighting(p1?: vector, p2?: vector, propagate_shadow?: boolean)
  -> boolean
```

* `calc_lighting([p1, p2], [propagate_shadow])`:  Calculate lighting within the
  `VoxelManip`.
    * To be used only with a `VoxelManip` object from `core.get_mapgen_object`.
    * (`p1`, `p2`) is the area in which lighting is set, defaults to the whole
      area if left out or nil. For almost all uses these should be left out
      or nil to use the default.
    * `propagate_shadow` is an optional boolean deciding whether shadows in a
      generated mapchunk above are propagated down into the mapchunk, defaults
      to `true` if left out.


## close


```lua
(method) VoxelManip:close()
  -> nil
```

 * `close()`: Frees the data buffers associated with the VoxelManip object.
    It will become empty.
    * Since Lua's garbage collector is not aware of the potentially significant
      memory behind a VoxelManip, frequent VoxelManip usage can cause the server to
      run out of RAM. Therefore it's recommend to call this method once you're done
      with the VoxelManip.
    * (introduced in 5.13.0)

## get_data


```lua
(method) VoxelManip:get_data(data: content_id[])
  -> nil
```

 Retrieves the node content data loaded into the `VoxelManip` object, the `data` table will be used to store the result

## get_emerged_area


```lua
(method) VoxelManip:get_emerged_area()
  -> emin: vector
  2. emax: vector
```

* `get_emerged_area()`: Returns actual emerged minimum and maximum positions.
 * "Emerged" does not imply that this region was actually loaded from the map,
    if `initialize()` has been used.

## get_light_data


```lua
(method) VoxelManip:get_light_data(buffer?: light_level[])
  -> light_level[]?
```

* `get_light_data([buffer])`: Gets the light data read into the
  `VoxelManip` object
    * Returns an array (indices 1 to volume) of integers ranging from `0` to
      `255`.
    * Each value is the bitwise combination of day and night light values
      (`0` to `15` each).
    * `light = day + (night * 16)`
    * If the param `buffer` is present, this table will be used to store the
      result instead.


## get_node_at


```lua
(method) VoxelManip:get_node_at(pos: vector)
  -> MapNode|{ name: string, param1: number, param2: number }
```

 Unofficial note: i don't think you should be using this for performance reasons, this is a function i would personally NEVER use

## get_param2_data


```lua
(method) VoxelManip:get_param2_data(buffer?: number[])
  -> number[]?
```

## initialize


```lua
(method) VoxelManip:initialize(p1: vector, p2: vector, node: MapNodeOpt|{ name: string, param1: number?, param2: number? })
  -> pmin: vector
  2. pmax: vector
```

* `initialize(p1, p2, [node])`: Clears and resizes the VoxelManip object to
  comprise the region formed by `p1` and `p2`.
   * **No data** is read from the map, so you can use this to treat `VoxelManip`
     objects as general containers of node data.
   * `node`: if present the data will be filled with this node; if not it will
     be uninitialized
   * returns actual emerged `pmin`, actual emerged `pmax` (MapBlock-aligned)
   * (introduced in 5.13.0)


## read_from_map


```lua
(method) VoxelManip:read_from_map(p1: vector, p2: vector)
  -> pmin: vector
  2. pmax: vector
```

* `read_from_map(p1, p2)`: Loads a part of the map into the VoxelManip object
  containing the region formed by `p1` and `p2`.
    * returns actual emerged `pmin`, actual emerged `pmax` (MapBlock-aligned)
    * Note that calling this multiple times will *add* to the area loaded in the
      VoxelManip, and not reset it.


## set_data


```lua
(method) VoxelManip:set_data(data: content_id[])
  -> nil
```

## set_light_data


```lua
(method) VoxelManip:set_light_data(light_data: light_level[])
```

* `set_light_data(light_data)`: Sets the `param1` (light) contents of each node
  in the `VoxelManip`.
    * expects lighting data in the same format that `get_light_data()` returns


## set_lighting


```lua
(method) VoxelManip:set_lighting(light: light|{ day: light_level, light: light_level }, p1?: vector, p2?: vector)
```

* `set_lighting(light, [p1, p2])`: Set the lighting within the `VoxelManip` to
  a uniform value.
    * `light` is a table, `{day=<0...15>, night=<0...15>}`
    * To be used only by a `VoxelManip` object from
      `core.get_mapgen_object`.
    * (`p1`, `p2`) is the area in which lighting is set, defaults to the whole
      area if left out.


## set_node_at


```lua
(method) VoxelManip:set_node_at(pos: vector, node: MapNodeOpt|{ name: string, param1: number?, param2: number? })
  -> nil
```

 Unofficial note: i don't think you should be using this for performance reasons, this is a function i would personally NEVER use

## set_param2_data


```lua
(method) VoxelManip:set_param2_data(param2_data: number[])
  -> nil
```

## update_liquids


```lua
(method) VoxelManip:update_liquids()
  -> nil
```

## update_map


```lua
(method) VoxelManip:update_map()
```

 Unofficial note: In need of a noop? Instead of depending on modlib to do it, how about using this pre-made function baked into the luanti api, written most likely in C for super fast noops
 Does nothing, kept for compatibility.

## was_modified


```lua
(method) VoxelManip:was_modified()
```

* `was_modified()`: Returns `true` if the data in the VoxelManip has been modified
   since it was last read from the map. This means you have to call `get_data()` again.
   This only applies to a `VoxelManip` object from `core.get_mapgen_object`,
   where the engine will keep the map and the VM in sync automatically.
   * Note: this doesn't do what you think it does and is subject to removal. Don't use it!


## write_to_map


```lua
(method) VoxelManip:write_to_map(light?: boolean)
  -> nil
```

Unofficial note: If you can, try to not use this function for performance reasons (there is no alternative, but you can avoid using it by checking if vmanip data was modified, if yes then use it)

* `write_to_map([light])`: Writes the data loaded from the `VoxelManip` back to
  the map.
    * **important**: you should call `set_data()` before this, or nothing will change.
    * if `light` is true, then lighting is automatically recalculated.
      The default value is true.
      If `light` is false, no light calculations happen, and you should correct
      all modified blocks with `core.fix_light()` as soon as possible.
      Keep in mind that modifying the map where light is incorrect can cause
      more lighting bugs.



---

# VoxelManip.calc_lighting


```lua
(method) VoxelManip:calc_lighting(p1?: vector, p2?: vector, propagate_shadow?: boolean)
  -> boolean
```


---

# VoxelManip.close


```lua
(method) VoxelManip:close()
  -> nil
```


---

# VoxelManip.get_data


```lua
(method) VoxelManip:get_data(data: content_id[])
  -> nil
```


```lua
(method) VoxelManip:get_data()
  -> content_id[]
```


---

# VoxelManip.get_emerged_area


```lua
(method) VoxelManip:get_emerged_area()
  -> emin: vector
  2. emax: vector
```


---

# VoxelManip.get_light_data


```lua
(method) VoxelManip:get_light_data(buffer?: light_level[])
  -> light_level[]?
```


---

# VoxelManip.get_node_at


```lua
(method) VoxelManip:get_node_at(pos: vector)
  -> MapNode|{ name: string, param1: number, param2: number }
```


---

# VoxelManip.get_param2_data


```lua
(method) VoxelManip:get_param2_data(buffer?: number[])
  -> number[]?
```


---

# VoxelManip.initialize


```lua
(method) VoxelManip:initialize(p1: vector, p2: vector, node: MapNodeOpt|{ name: string, param1: number?, param2: number? })
  -> pmin: vector
  2. pmax: vector
```


---

# VoxelManip.read_from_map


```lua
(method) VoxelManip:read_from_map(p1: vector, p2: vector)
  -> pmin: vector
  2. pmax: vector
```


---

# VoxelManip.set_data


```lua
(method) VoxelManip:set_data(data: content_id[])
  -> nil
```


---

# VoxelManip.set_light_data


```lua
(method) VoxelManip:set_light_data(light_data: light_level[])
```


---

# VoxelManip.set_lighting


```lua
(method) VoxelManip:set_lighting(light: light|{ day: light_level, light: light_level }, p1?: vector, p2?: vector)
```


---

# VoxelManip.set_node_at


```lua
(method) VoxelManip:set_node_at(pos: vector, node: MapNodeOpt|{ name: string, param1: number?, param2: number? })
  -> nil
```


---

# VoxelManip.set_param2_data


```lua
(method) VoxelManip:set_param2_data(param2_data: number[])
  -> nil
```


---

# VoxelManip.update_liquids


```lua
(method) VoxelManip:update_liquids()
  -> nil
```


---

# VoxelManip.update_map


```lua
(method) VoxelManip:update_map()
```


---

# VoxelManip.was_modified


```lua
(method) VoxelManip:was_modified()
```


---

# VoxelManip.write_to_map


```lua
(method) VoxelManip:write_to_map(light?: boolean)
  -> nil
```


---

# _G


---

# _G


```lua
_G
```


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

# cheat_type

## type


```lua
string|"dug_too_fast"|"dug_unbreakable"|"finished_unknown_dig"|"interacted_too_far"...(+3)
```


---

# collectgarbage


```lua
function collectgarbage(opt?: "collect"|"count"|"isrunning"|"restart"|"setpause"...(+3), arg?: integer)
  -> any
```


---

# collision

## axis


```lua
"x"|"y"|"z"
```

## new_pos


```lua
vector
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## new_velocity


```lua
vector
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## node_pos


```lua
vector?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## object


```lua
ObjectRef?
```

 `ObjectRef`
 -----------

 Moving things in the game are generally these.
 This is basically a reference to a C++ `ServerActiveObject`.

 ### Advice on handling `ObjectRefs`

 When you receive an `ObjectRef` as a callback argument or from another API
 function, it is possible to store the reference somewhere and keep it around.
 It will keep functioning until the object is unloaded or removed.

 However, doing this is **NOT** recommended - `ObjectRefs` should be "let go"
 of as soon as control is returned from Lua back to the engine.

 Doing so is much less error-prone and you will never need to wonder if the
 object you are working with still exists.

 If this is not feasible, you can test whether an `ObjectRef` is still valid
 via `object:is_valid()`.

 Getters may be called for invalid objects and will return nothing then.
 All other methods should not be called on invalid objects.

 ### Attachments

 It is possible to attach objects to other objects (`set_attach` method).

 When an object is attached, it is positioned relative to the parent's position
 and rotation. `get_pos` and `get_rotation` will always return the parent's
 values and changes via their setter counterparts are ignored.

 To change position or rotation call `set_attach` again with the new values.

 **Note**: Just like model dimensions, the relative position in `set_attach`
 must be multiplied by 10 compared to world positions.

 It is also possible to attach to a bone of the parent object. In that case the
 child will follow movement and rotation of that bone.


## old_velocity


```lua
vector
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## type


```lua
"node"|"object"
```


---

# content_id


---

# core


```lua
core
```


---

# core

## CONTENT_AIR


```lua
content_id
```

## CONTENT_IGNORE


```lua
content_id
```

## CONTENT_UNKNOWN


```lua
content_id
```

 HACK:

## EMERGE_CANCELLED


```lua
core.EMERGE_CANCELLED
```

## EMERGE_ERRORED


```lua
core.EMERGE_ERRORED
```

## EMERGE_FROM_DISK


```lua
core.EMERGE_FROM_DISK
```

## EMERGE_FROM_MEMORY


```lua
core.EMERGE_FROM_MEMORY
```

## EMERGE_GENERATED


```lua
core.EMERGE_GENERATED
```

## add_entity


```lua
function core.add_entity(pos: vector, name: string, staticdata?: string)
  -> luaentity?
```

 * `core.add_entity(pos, name, [staticdata])`: Spawn Lua-defined entity at
   position.
     * Returns `ObjectRef`, or `nil` if failed
     * Entities with `static_save = true` can be added also
       to unloaded and non-generated blocks.

## add_item


```lua
function core.add_item(pos: vector, item: ItemStack)
  -> luaentity?
```

 * `core.add_item(pos, item)`: Spawn item
     * Returns `ObjectRef`, or `nil` if failed
     * Items can be added also to unloaded and non-generated blocks.

## add_node


```lua
function
```

 Alias to core.set_node
 Unofficial note: I think you should be strict and only use `core.set_node`

## add_particle


```lua
function core.add_particle(particle_def: Particle)
```

 Unofficial note: Prefer not doing 100 000 particles in a single globalstep
 Because that will make the network scream, with no way to debug it
 Instead, invest time into particlespawners, invest time into creating an issue on luanti github, invest time into creating a client side mod

## add_particlespawner


```lua
function core.add_particlespawner(particlespawner_def: ParticleSpawner)
  -> -1|ParticleSpawner_id
```

 * Add a `ParticleSpawner`, an object that spawns an amount of particles
   over `time` seconds.
 * Returns an `id`, and -1 if adding didn't succeed

```lua
--  Unofficial note: Intentionally obscured type, i'll let you know a secret... it's a number, but don't act like it's a number
return #1:
    | -1
```

## after


```lua
function core.after(time: number, f: function, ...any)
  -> job
```

 * `core.after(time, func, ...)`: returns job table to use as below.
     * Call the function `func` after `time` seconds, may be fractional
     * Optional: Variable number of arguments that are passed to `func`
     * Jobs set for earlier times are executed earlier. If multiple jobs expire
       at exactly the same time, then they are executed in registration order.
     * `time` is a lower bound. The job is executed in the first server-step that
       started at least `time` seconds after the last time a server-step started,
       measured with globalstep dtime.
     * If `time` is `0`, the job is executed in the next step.

## ban_player


```lua
function core.ban_player(name: string)
  -> success: boolean
```

 * `core.ban_player(name)`: ban the IP of a currently connected player
     * Returns boolean indicating success

## bulk_set_node


```lua
function core.bulk_set_node(posarr: vector[], node: MapNodeOpt|{ name: string, param1: number?, param2: number? })
```

## bulk_swap_node


```lua
function core.bulk_swap_node(posarr: vector[], node: MapNodeOpt|{ name: string, param1: number?, param2: number? })
```

 * `core.bulk_swap_node({pos1, pos2, pos3, ...}, node)`
     * Equivalent to `core.swap_node` but in bulk.

## calculate_knockback


```lua
function core.calculate_knockback(player: PlayerRef, hitter: ObjectRef, time_from_last_punch: number, tool_capabilities: vector, dir: vector, distance: number, damage: any)
```

 * `core.calculate_knockback(player, hitter, time_from_last_punch,
   tool_capabilities, dir, distance, damage)`
     * Returns the amount of knockback applied on the punched player.
     * Arguments are equivalent to `register_on_punchplayer`, except the following:
         * `distance`: distance between puncher and punched player
     * This function can be overridden by mods that wish to modify this behavior.
     * You may want to cache and call the old function to allow multiple mods to
       change knockback behavior.

## cancel_shutdown_requests


```lua
function core.cancel_shutdown_requests()
```

 * `core.cancel_shutdown_requests()`: cancel current delayed shutdown

## chat_send_all


```lua
function core.chat_send_all(text: string)
  -> nil
```

## chat_send_player


```lua
function core.chat_send_player(name: string, text: string)
  -> nil
```

## check_for_falling


```lua
function core.check_for_falling(pos: vector)
```

 * `core.check_for_falling(pos)`
     * causes an unsupported `group:falling_node` node to fall and causes an
       unattached `group:attached_node` node to fall.
     * spread these updates to neighbors and can cause a cascade
       of nodes to fall.

## check_single_for_falling


```lua
function core.check_single_for_falling(pos: vector)
```

 Unofficial note: You can override this one for your own custom cool falling blocks
 * `core.check_single_for_falling(pos)`
     * causes an unsupported `group:falling_node` node to fall and causes an
       unattached `group:attached_node` node to fall.
     * does not spread these updates to neighbors.

## clear_craft


```lua
function core.clear_craft(recipe: CraftRecipe)
```

## clear_objects


```lua
function core.clear_objects(opt?: "full"|"quick")
```

 * `core.clear_objects([options])`
     * Clear all objects in the environment
     * Takes an optional table as an argument with the field `mode`.
         * mode = `"full"`: Load and go through every mapblock, clearing
                             objects (default).
         * mode = `"quick"`: Clear objects immediately in loaded mapblocks,
                             clear objects in unloaded mapblocks only when the
                             mapblocks are next activated.

```lua
opt:
    | "full"
    | "quick"
```

## clear_registered_biomes


```lua
function core.clear_registered_biomes()
  -> nil
```

 * `core.clear_registered_biomes()`
     * Clears all biomes currently registered.
     * Warning: Clearing and re-registering biomes alters the biome to biome ID
       correspondences, so any decorations or ores using the 'biomes' field must
       afterwards be cleared and re-registered.

## clear_registered_decorations


```lua
function core.clear_registered_decorations()
```

## clear_registered_ores


```lua
function core.clear_registered_ores()
```

## clear_registered_schematics


```lua
function core.clear_registered_schematics()
```

## close_formspec


```lua
function core.close_formspec(playername: string, formname: string)
  -> nil
```

 * `core.close_formspec(playername, formname)`
     * `playername`: name of player to close formspec
     * `formname`: has to exactly match the one given in `show_formspec`, or the
       formspec will not close.
     * calling `show_formspec(playername, formname, "")` is equal to this
       expression.
     * to close a formspec regardless of the formname, call
       `core.close_formspec(playername, "")`.
       **USE THIS ONLY WHEN ABSOLUTELY NECESSARY!**

## colorize


```lua
function core.colorize(color: ColorString, message: string)
  -> string
```

 Equivalent to: core.get_color_escape_sequence(color) .. message .. core.get_color_escape_sequence("#ffffff")
 (Unofficial note: this is mostly for formspec UI elements)

## colorspec_to_bytes


```lua
function core.colorspec_to_bytes(colorspec: ColorSpec)
  -> string
```

 Layout: RGBA

## colorspec_to_colorstring


```lua
function core.colorspec_to_colorstring(colorspec: ColorSpec)
  -> ColorString
```

 Colorspec to hex basically

## colorspec_to_table


```lua
function core.colorspec_to_table(colorspec: ColorSpec)
  -> { r: number, g: number, b: number, a: number }
```

## compare_block_status


```lua
function core.compare_block_status(pos: vector, condition: string|"active"|"emerging"|"loaded"|"unknown")
  -> boolean?
```

 * `core.compare_block_status(pos, condition)`
     * Checks whether the mapblock at position `pos` is in the wanted condition.
     * `condition` may be one of the following values:
         * `"unknown"`: not in memory
         * `"emerging"`: in the queue for loading from disk or generating
         * `"loaded"`: in memory but inactive (no ABMs are executed)
         * `"active"`: in memory and active
         * Other values are reserved for future functionality extensions
     * Return value, the comparison status:
         * `false`: Mapblock does not fulfill the wanted condition
         * `true`: Mapblock meets the requirement
         * `nil`: Unsupported `condition` value

```lua
condition:
    | "unknown"
    | "emerging"
    | "loaded"
    | "active"
```

## compress


```lua
function core.compress(data: string, method: "deflate"|"zstd", ...any)
  -> string
```

 * `core.compress(data, method, ...)`: returns `compressed_data`
     * Compress a string of data.
     * `method` is a string identifying the compression method to be used.
     * Supported compression methods:
         * Deflate (zlib): `"deflate"`
         * Zstandard: `"zstd"`
     * `...` indicates method-specific arguments. Currently defined arguments
       are:
         * Deflate: `level` - Compression level, `0`-`9` or `nil`.
         * Zstandard: `level` - Compression level. Integer or `nil`. Default `3`.
         Note any supported Zstandard compression level could be used here,
         but these are subject to change between Zstandard versions.

```lua
method:
    | "zstd"
    | "deflate"
```

## cpdir


```lua
function core.cpdir(source: string, destination: string)
  -> success: boolean
```

## create_detached_inventory


```lua
function core.create_detached_inventory(name: string, callbacks: nil, player_name?: string)
  -> InvRef
```

## create_schematic


```lua
function core.create_schematic(p1: vector, p2: vector, probabilities: { pos: vector, prob: number }[], filename: string, slice_prob_list: { ypos: number, prob: number }[])
```

 * `core.create_schematic(p1, p2, probability_list, filename, slice_prob_list)`
     * Create a schematic from the volume of map specified by the box formed by
       p1 and p2.
     * Apply the specified probability and per-node force-place to the specified
       nodes according to the `probability_list`.
         * `probability_list` is an array of tables containing two fields, `pos`
           and `prob`.
             * `pos` is the 3D vector specifying the absolute coordinates of the
               node being modified,
             * `prob` is an integer value from `0` to `255` that encodes
               probability and per-node force-place. Probability has levels
               0-127, then 128 may be added to encode per-node force-place.
               For probability stated as 0-255, divide by 2 and round down to
               get values 0-127, then add 128 to apply per-node force-place.
             * If there are two or more entries with the same pos value, the
               last entry is used.
             * If `pos` is not inside the box formed by `p1` and `p2`, it is
               ignored.
             * If `probability_list` equals `nil`, no probabilities are applied.
     * Apply the specified probability to the specified horizontal slices
       according to the `slice_prob_list`.
         * `slice_prob_list` is an array of tables containing two fields, `ypos`
           and `prob`.
             * `ypos` indicates the y position of the slice with a probability
               applied, the lowest slice being `ypos = 0`.
             * If slice probability list equals `nil`, no slice probabilities
               are applied.
     * Saves schematic in the Luanti Schematic format to filename.

@*param* `probabilities` — unwanted commentary: wow that seems inefficient, good luck!

## debug


```lua
function core.debug(...any)
  -> nil
```

 Unofficial note: I made it deprecated because this should NOT be in any production code, and you should use something better tbh, like dbg.pp (from lars's dbg mod)
 * Equivalent to `core.log(table.concat({...}, "\t"))`

## decode_base64


```lua
function core.decode_base64(string: string)
  -> string
```

 * `core.decode_base64(string)`: returns string or nil on failure
     * Padding characters are only supported starting at version 5.4.0, where
       5.5.0 and newer perform proper checks.
     * Decodes a string encoded in base64.

## decompress


```lua
function core.decompress(compressed_data: string, method: "deflate"|"zstd", ...nil)
  -> string
```

 * `core.decompress(compressed_data, method, ...)`: returns data
     * Decompress a string of data using the algorithm specified by `method`.
     * See documentation on `core.compress()` for supported compression
       methods.
     * `...` indicates method-specific arguments. Currently, no methods use this

```lua
method:
    | "zstd"
    | "deflate"
```

## delete_area


```lua
function core.delete_area(pos1: vector, pos2: vector)
  -> nil
```

 * `core.delete_area(pos1, pos2)`
     * delete all mapblocks in the area from pos1 to pos2, inclusive

## delete_particlespawner


```lua
function core.delete_particlespawner(id: ParticleSpawner_id, player?: PlayerRef)
```

 * `core.delete_particlespawner(id, player)`
     * Delete `ParticleSpawner` with `id` (return value from
       `core.add_particlespawner`).
     * If playername is specified, only deletes on the player's client,
       otherwise on all clients.

## deserialize


```lua
function core.deserialize(string: string, safe?: boolean)
  -> any
```

 * `core.deserialize(string[, safe])`: returns a table
     * Convert a string returned by `core.serialize` into a table
     * `string` is loaded in an empty sandbox environment.
     * Will load functions if `safe` is `false` or omitted.
       Although these functions cannot directly access the global environment,
       they could bypass this restriction with maliciously crafted Lua bytecode
       if mod security is disabled.
     * Will silently strip functions embedded via calls to `loadstring`
       (typically bytecode dumped by `core.serialize`) if `safe` is `true`.
       You should not rely on this if possible.
       * Example: `core.deserialize("return loadstring('')", true)` will be `nil`.
     * This function should not be used on untrusted data, regardless of the
      value of `safe`. It is fine to serialize then deserialize user-provided
      data, but directly providing user input to deserialize is always unsafe.
     * Example: `deserialize('return { ["foo"] = "bar" }')`,
       returns `{foo="bar"}`
     * Example: `deserialize('print("foo")')`, returns `nil`
       (function call fails), returns
       `error:[string "print("foo")"]:1: attempt to call global 'print' (a nil value)`

## dig_node


```lua
function core.dig_node(pos: vector, digger?: PlayerRef)
  -> boolean
```

 * `core.dig_node(pos[, digger])`
     * Dig node with the same effects that a player would cause
     * `digger`: The ObjectRef that digs the node (optional)
     * Returns `true` if successful, `false` on failure (e.g. protected location)

## dir_to_facedir


```lua
function core.dir_to_facedir(dir: vector, is6d?: boolean)
  -> number
```

## dir_to_fourdir


```lua
function core.dir_to_fourdir(dir: vector)
  -> number
```

## dir_to_wallmounted


```lua
function core.dir_to_wallmounted(dir: vector)
  -> number
```

## dir_to_yaw


```lua
function core.dir_to_yaw(dir: vector)
  -> number
```

## disconnect_player


```lua
function core.disconnect_player(name: string, reason?: string, reconnect?: boolean)
```

 * `core.disconnect_player(name[, reason[, reconnect]])`: disconnect a player with an
   optional reason, this will not prefix with 'Kicked: ' like kick_player.
   If no reason is given, it will default to 'Disconnected.'
     * Returns boolean indicating success (false if player nonexistent)

## dynamic_add_media


```lua
(async) function core.dynamic_add_media(options: { filename: string?, filepath: string?, filedata: string?, to_player: string?, ephemeral: boolean? }, callback: function)
```

 * `core.dynamic_add_media(options, callback)`
     * `options`: table containing the following parameters
         * `filename`: name the media file will be usable as
                       (optional if `filepath` present)
         * `filepath`: path to the file on the filesystem [*]
         * `filedata`: the data of the file to be sent [*]
         * `to_player`: name of the player the media should be sent to instead of
                        all players (optional)
         * `ephemeral`: boolean that marks the media as ephemeral,
                        it will not be cached on the client (optional, default false)
         * Exactly one of the parameters marked [*] must be specified.
     * `callback`: function with arguments `name`, which is a player name
     * Pushes the specified media file to client(s). (details below)
       The file must be a supported image, sound or model format.
       Dynamically added media is not persisted between server restarts.
     * Returns false on error, true if the request was accepted
     * The given callback will be called for every player as soon as the
       media is available on the client.
     * Details/Notes:
       * If `ephemeral`=false and `to_player` is unset the file is added to the media
         sent to clients on startup, this means the media will appear even on
         old clients if they rejoin the server.
       * If `ephemeral`=false the file must not be modified, deleted, moved or
         renamed after calling this function.
       * Regardless of any use of `ephemeral`, adding media files with the same
         name twice is not possible/guaranteed to work. An exception to this is the
         use of `to_player` to send the same, already existent file to multiple
         chosen players.
       * You can also call this at startup time. In that case `callback` MUST
         be `nil` and you cannot use `ephemeral` or `to_player`, as these logically
         do not make sense.
     * Clients will attempt to fetch files added this way via remote media,
       this can make transfer of bigger files painless (if set up). Nevertheless
       it is advised not to use dynamic media for big media files.

## emerge_area


```lua
(async) function core.emerge_area(pos1: vector, pos2: vector, callback: fun(blockpos: vector, action: core.EMERGE_CANCELLED|core.EMERGE_ERRORED|core.EMERGE_FROM_DISK|core.EMERGE_FROM_MEMORY|core.EMERGE_GENERATED, calls_remaining: number, param?: any), param?: any)
```

 * `core.emerge_area(pos1, pos2, [callback], [param])`
     * Queue all blocks in the area from `pos1` to `pos2`, inclusive, to be
       asynchronously fetched from memory, loaded from disk, or if inexistent,
       generates them.
     * If `callback` is a valid Lua function, this will be called for each block
       emerged.
     * The function signature of callback is:
       `function EmergeAreaCallback(blockpos, action, calls_remaining, param)`
         * `blockpos` is the *block* coordinates of the block that had been
           emerged.
         * `action` could be one of the following constant values:
             * `core.EMERGE_CANCELLED`
             * `core.EMERGE_ERRORED`
             * `core.EMERGE_FROM_MEMORY`
             * `core.EMERGE_FROM_DISK`
             * `core.EMERGE_GENERATED`
         * `calls_remaining` is the number of callbacks to be expected after
           this one.
         * `param` is the user-defined parameter passed to emerge_area (or
           nil if the parameter was absent).

## encode_base64


```lua
function core.encode_base64(string: string)
  -> string
```

 * `core.encode_base64(string)`: returns string encoded in base64
     * Encodes a string in base64.

## encode_png


```lua
function core.encode_png(width: integer, height: integer, data: string|ColorSpec[], compression?: integer)
  -> string
```

 Unofficial note: shhh.... but you can do this in `core.handle_async` instead, get like a really good Promise library
 Unofficial note: shh... but you can also use it real-time and it's real cool
 Unofficial note: you can do "[png:"..core.encode_base64(core.encode_png(...)) to have a png
 Unofficial note: Can we do jpeg XL next?
 * `core.encode_png(width, height, data, [compression])`: Encode a PNG
   image and return it in string form.
     * `width`: Width of the image
     * `height`: Height of the image
     * `data`: Image data, one of:
         * array table of ColorSpec, length must be width*height
         * string with raw RGBA pixels, length must be width*height*4
     * `compression`: Optional zlib compression level, number in range 0 to 9.
   The data is one-dimensional, starting in the upper left corner of the image
   and laid out in scanlines going from left to right, then top to bottom.
   You can use `colorspec_to_bytes` to generate raw RGBA values.
   Palettes are not supported at the moment.
   You may use this to procedurally generate textures during server init.

## error_handler


```lua
function core.error_handler(err: any, level: any)
  -> string
```

 When an error occurs that is not caught, Luanti calls the function
 `core.error_handler` with the error object as its first argument. The second
 argument is the stack level where the error occurred. The return value is the
 error string that should be shown. By default this is a backtrace from
 `debug.traceback`. If the error object is not a string, it is first converted
 with `tostring` before being displayed. This means that you can use tables as
 error objects so long as you give them `__tostring` metamethods.

 You can override `core.error_handler`. You should call the previous handler
 with the correct stack level in your implementation.

## explode_scrollbar_event


```lua
function core.explode_scrollbar_event(string: string)
  -> { type: "CHG"|"DCL"|"INV", value: number? }
```

## explode_table_event


```lua
function core.explode_table_event(string: string)
  -> { type: "CHG"|"DCL"|"INV", row: number?, column: number? }
```

 * `core.explode_table_event(string)`: returns a table
     * returns e.g. `{type="CHG", row=1, column=2}`
     * `type` is one of:
         * `"INV"`: no row selected
         * `"CHG"`: selected
         * `"DCL"`: double-click

## explode_textlist_event


```lua
function core.explode_textlist_event(string: string)
  -> { type: "CHG"|"DCL"|"INV", index: number? }
```

 * `core.explode_table_event(string)`: returns a table
     * returns e.g. `{type="CHG", row=1, column=2}`
     * `type` is one of:
         * `"INV"`: no row selected
         * `"CHG"`: selected
         * `"DCL"`: double-click

## facedir_to_dir


```lua
function core.facedir_to_dir(facedir: number)
  -> vector
```

## features


```lua
function core.features()
  -> core.features
```

## find_node_near


```lua
function core.find_node_near(pos: any, radius: number, nodenames: string|string[], search_center?: boolean)
  -> vector?
```

 Unofficial note: I think this function is a lot laggier than the alternatives
 If you are simply trying to check if a node is in a big area, use `core.find_nodes_in_area`
 Anyway, someone will need to fact check me on that claim! Anyway: The actual docs:
 But you can notice that it doesn't have that pesky volume limit, so it's implemented differently

 * `core.find_node_near(pos, radius, nodenames, [search_center])`: returns
   pos or `nil`.
     * `radius`: using a maximum metric
     * `nodenames`: e.g. `{"ignore", "group:tree"}` or `"default:dirt"`
     * `search_center` is an optional boolean (default: `false`)
       If true `pos` is also checked for the nodes

## find_nodes_in_area


```lua
function core.find_nodes_in_area(pos1: vector, pos2: vector, nodenames: string|string[], grouped?: boolean)
  -> table<string, vector[]>|vector[]
  2. table<string, number>?
```

 * `core.find_nodes_in_area(pos1, pos2, nodenames, [grouped])`
     * `pos1` and `pos2` are the min and max positions of the area to search.
     * `nodenames`: e.g. `{"ignore", "group:tree"}` or `"default:dirt"`
     * If `grouped` is true the return value is a table indexed by node name
       which contains lists of positions.
     * If `grouped` is false or absent the return values are as follows:
       first value: Table with all node positions
       second value: Table with the count of each node with the node name
       as index
     * Area volume is limited to 150,000,000 nodes

## find_nodes_in_area_under_air


```lua
function core.find_nodes_in_area_under_air(pos1: vector, pos2: vector, nodenames: string|string[])
  -> vector[]
```

 * `core.find_nodes_in_area_under_air(pos1, pos2, nodenames)`: returns a
   list of positions.
     * `nodenames`: e.g. `{"ignore", "group:tree"}` or `"default:dirt"`
     * Return value: Table with all node positions with a node air above
     * Area volume is limited to 150,000,000 nodes

## find_nodes_with_meta


```lua
function core.find_nodes_with_meta(pos1: vector, pos2: vector)
  -> vector[]
```

 * `core.find_nodes_with_meta(pos1, pos2)`
     * Get a table of positions of nodes that have metadata within a region
       {pos1, pos2}.

## find_path


```lua
function core.find_path(pos1: vector, pos2: vector, searchdistance: number, max_jump: number, max_drop: number, algo: "A*"|"A*_noprefetch"|"Dijkstra")
  -> vector[]?
```

 * `core.find_path(pos1, pos2, searchdistance, max_jump, max_drop, algorithm)`
     * returns table containing path that can be walked on
     * returns a table of 3D points representing a path from `pos1` to `pos2` or
       `nil` on failure.
     * Reasons for failure:
         * No path exists at all
         * No path exists within `searchdistance` (see below)
         * Start or end pos is buried in land
     * `pos1`: start position
     * `pos2`: end position
     * `searchdistance`: maximum distance from the search positions to search in.
       In detail: Path must be completely inside a cuboid. The minimum
       `searchdistance` of 1 will confine search between `pos1` and `pos2`.
       Larger values will increase the size of this cuboid in all directions
     * `max_jump`: maximum height difference to consider walkable
     * `max_drop`: maximum height difference to consider droppable
     * `algorithm`: One of `"A*_noprefetch"` (default), `"A*"`, `"Dijkstra"`.
       Difference between `"A*"` and `"A*_noprefetch"` is that
       `"A*"` will pre-calculate the cost-data, the other will calculate it
       on-the-fly

```lua
algo:
    | "A*_noprefetch"
    | "A*"
    | "Dijkstra"
```

## fix_light


```lua
function core.fix_light(pos1: vector, pos2: vector)
  -> boolean
```

 * `core.fix_light(pos1, pos2)`: returns `true`/`false`
     * resets the light in a cuboid-shaped part of
       the map and removes lighting bugs.
     * Loads the area if it is not loaded.
     * `pos1` is the corner of the cuboid with the least coordinates
       (in node coordinates), inclusive.
     * `pos2` is the opposite corner of the cuboid, inclusive.
     * The actual updated cuboid might be larger than the specified one,
       because only whole map blocks can be updated.
       The actual updated area consists of those map blocks that intersect
       with the given cuboid.
     * However, the neighborhood of the updated area might change
       as well, as light can spread out of the cuboid, also light
       might be removed.
     * returns `false` if the area is not fully generated,
       `true` otherwise

## forceload_block


```lua
function core.forceload_block(pos: vector, transient?: boolean, limit?: number)
```

 * `core.forceload_block(pos[, transient[, limit]])`
     * forceloads the position `pos`.
     * this means that the mapblock containing `pos` will always be kept in the
       `"active"` state, regardless of nearby players or server settings.
     * returns `true` if area could be forceloaded
     * If `transient` is `false` or absent, the forceload will be persistent
       (saved between server runs). If `true`, the forceload will be transient
       (not saved between server runs).
     * `limit` is an optional limit on the number of blocks that can be
       forceloaded at once. If `limit` is negative, there is no limit. If it is
       absent, the limit is the value of the setting `"max_forceloaded_blocks"`.
       If the call would put the number of blocks over the limit, the call fails.

## forceload_free_block


```lua
function core.forceload_free_block(pos: vector, transient?: boolean)
```

 * `core.forceload_free_block(pos[, transient])`
     * stops forceloading the position `pos`
     * If `transient` is `false` or absent, frees a persistent forceload.
       If `true`, frees a transient forceload.

## format_chat_message


```lua
function core.format_chat_message(name: string, message: string)
  -> nil
```

 * `core.format_chat_message(name, message)`
     * Used by the server to format a chat message, based on the setting `chat_message_format`.
       Refer to the documentation of the setting for a list of valid placeholders.
     * Takes player name and message, and returns the formatted string to be sent to players.
     * Can be redefined by mods if required, for things like colored names or messages.
     * **Only** the first occurrence of each placeholder will be replaced.

## formspec_escape


```lua
function core.formspec_escape(string: string)
  -> string
```

 escapes the characters "[", "]", "", "," and ";", which cannot be used in formspecs.

## fourdir_to_dir


```lua
function core.fourdir_to_dir(fourdir: number)
  -> vector
```

## generate_decorations


```lua
function core.generate_decorations(vm: VoxelManip, pos1?: vector, pos2?: vector)
```

 * `core.generate_decorations(vm, pos1, pos2)`
     * Generate all registered decorations within the VoxelManip `vm` and in the
       area from `pos1` to `pos2`.
     * `pos1` and `pos2` are optional and default to mapchunk minp and maxp.

## generate_ores


```lua
function core.generate_ores(vm: VoxelManip, pos1?: vector, pos2?: vector)
```

 * `core.generate_ores(vm, pos1, pos2)`
     * Generate all registered ores within the VoxelManip `vm` and in the area
       from `pos1` to `pos2`.
     * `pos1` and `pos2` are optional and default to mapchunk minp and maxp.

## get_all_craft_recipes


```lua
function core.get_all_craft_recipes(query_item: string)
  -> { method: "cooking"|"fuel"|"normal", width: number, items: ItemStack[], output: string }[]?
```

 * `core.get_all_craft_recipes(query item)`: returns a table or `nil`
     * returns indexed table with all registered recipes for query item (node)
       or `nil` if no recipe was found.
     * recipe entry table:
         * `method`: 'normal' or 'cooking' or 'fuel'
         * `width`: 0-3, 0 means shapeless recipe
         * `items`: indexed [1-9] table with recipe items
         * `output`: string with item name and quantity
     * Example result for `"default:gold_ingot"` with two recipes:
       ```lua
       {
           {
               method = "cooking", width = 3,
               output = "default:gold_ingot", items = {"default:gold_lump"}
           },
           {
               method = "normal", width = 1,
               output = "default:gold_ingot 9", items = {"default:goldblock"}
           }
       }
       ```

## get_artificial_light


```lua
function core.get_artificial_light(param1: number)
  -> number
```

 * `core.get_artificial_light(param1)`
     * Calculates the artificial light (light from e.g. torches) value from the
       `param1` value.
     * `param1`: The param1 value of a `paramtype = "light"` node.
     * Returns a number between `0` and `15`
     * Currently it's the same as `math.floor(param1 / 16)`, except that it
       ensures compatibility.

## get_background_escape_sequence


```lua
function core.get_background_escape_sequence(color: ColorString)
  -> string
```

 The escape sequence sets the background of the whole text element to color. Only defined for item descriptions and tooltips.

## get_ban_description


```lua
function core.get_ban_description(ip_or_name: string)
  -> string
```

 * `core.get_ban_description(ip_or_name)`: returns list of bans matching
   IP address or name formatted as string

## get_ban_list


```lua
function core.get_ban_list()
  -> string
```

 * `core.get_ban_list()`: returns a list of all bans formatted as string

## get_biome_data


```lua
function core.get_biome_data(pos: vector)
  -> { biome: number, heat: number, humidity: number }?
```

 * `core.get_biome_data(pos)`
     * Returns a table containing:
         * `biome` the biome id of the biome at that position
         * `heat` the heat at the position
         * `humidity` the humidity at the position
     * Or returns `nil` on failure.

## get_biome_id


```lua
function core.get_biome_id(biome_name: string)
  -> number
```

 * `core.get_biome_id(biome_name)`
     * Returns the biome id, as used in the biomemap Mapgen object and returned
       by `core.get_biome_data(pos)`, for a given biome_name string.

## get_biome_name


```lua
function core.get_biome_name(biome_id: number)
  -> string?
```

 * `core.get_biome_name(biome_id)`
     * Returns the biome name string for the provided biome id, or `nil` on
       failure.
     * If no biomes have been registered, such as in mgv6, returns `default`.

## get_color_escape_sequence


```lua
function core.get_color_escape_sequence(color: ColorString)
  -> string
```

 The escape sequence sets the text color to color
 (Unofficial note: this is mostly for formspec UI elements)

## get_connected_players


```lua
function core.get_connected_players()
  -> PlayerRef[]
```

 * `core.get_connected_players()`: returns list of `ObjectRefs`

## get_content_id


```lua
function core.get_content_id(name: string)
  -> content_id
```

 * `core.get_content_id(name)`: returns an integer
     * Gets the internal content ID of `name`

## get_craft_recipe


```lua
function core.get_craft_recipe(output: string)
  -> { method: "cooking"|"fuel"|"normal", width: number, items: ItemStack[]? }?
```

 * `core.get_craft_recipe(output)`: returns input
     * returns last registered recipe for output item (node)
     * `output` is a node or item type such as `"default:torch"`
     * `input.method` = `"normal"` or `"cooking"` or `"fuel"`
     * `input.width` = for example `3`
     * `input.items` = for example
       `{stack1, stack2, stack3, stack4, stack 5, stack 6, stack 7, stack 8, stack 9}`
         * `input.items` = `nil` if no recipe found

## get_craft_result


```lua
function core.get_craft_result(input: { method: "cooking"|"fuel"|"normal", width: number, items: ItemStack[] })
  -> { item: ItemStack, time: number?, replacements: ItemStack[] }?
  2. ItemStack?
```

 * `core.get_craft_result(input)`: returns `output, decremented_input`
     * `input.method` = `"normal"` or `"cooking"` or `"fuel"`
     * `input.width` = for example `3`
     * `input.items` = for example
       `{stack1, stack2, stack3, stack4, stack 5, stack 6, stack 7, stack 8, stack 9}`
     * `output.item` = `ItemStack`, if unsuccessful: empty `ItemStack`
     * `output.time` = a number, if unsuccessful: `0`
     * `output.replacements` = List of replacement `ItemStack`s that couldn't be
       placed in `decremented_input.items`. Replacements can be placed in
       `decremented_input` if the stack of the replaced item has a count of 1.
     * `decremented_input` = like `input`

## get_current_modname


```lua
function core.get_current_modname()
  -> string
```

 Returns currently loading mod's name WHEN LOADING A MOD

## get_day_count


```lua
function core.get_day_count()
  -> number
```

 * `core.get_day_count()`: returns number days elapsed since world was
   created.
     * Time changes are accounted for.

## get_decoration_id


```lua
function core.get_decoration_id(decoration_name: string)
```

## get_dig_params


```lua
function core.get_dig_params(groups: table<string, integer>, tool_capabilities: tool_capabilities, wear?: integer)
  -> table
```

## get_dir_list


```lua
function core.get_dir_list(path: string, is_dir: true|false|nil)
```

 * `core.get_dir_list(path, [is_dir])`: returns list of entry names
     * is_dir is one of:
         * nil: return all entries,
         * true: return only subdirectory names, or
         * false: return only file names.

```lua
is_dir:
    | true
    | false
```

## get_game_info


```lua
function core.get_game_info()
  -> { id: string, title: string, author: string, path: string }
```

 Unofficial: Path is the root directory of the game, useful if you are looking for it

## get_gametime


```lua
function core.get_gametime()
  -> number?
```

 * `core.get_gametime()`: returns the time, in seconds, since the world was
   created. The time is not available (`nil`) before the first server step.

## get_gen_notify


```lua
function core.get_gen_notify()
  -> string
  2. table<string, vector>
  3. table<string, any>
```

 Unofficial Note: The types are a guess xD i have no idea how this works

## get_heat


```lua
function core.get_heat(pos: vector)
  -> number?
```

 Unofficial note: this relates to the biome heat, idk override it and make your own custom mapgen if you dare
 * `core.get_heat(pos)`
     * Returns the heat at the position, or `nil` on failure.

## get_hit_params


```lua
function core.get_hit_params(groups: table<string, integer>, tool_capabilities?: tool_capabilities, time_from_last_punch?: number, wear?: integer)
  -> table
```

## get_humidity


```lua
function core.get_humidity(pos: vector)
  -> number?
```

 Unofficial note: this relates to the biome humidity, idk override it and make your own custom mapgen if you dare
 * `core.get_humidity(pos)`
     * Returns the humidity at the position, or `nil` on failure.

## get_inventory_location


```lua
function core.get_inventory_location(location: inventory_location)
  -> InvRef
```

 `core.get_inventory(location)`: returns an `InvRef`

 * `location` = e.g.
     * `{type="player", name="celeron55"}`
     * `{type="node", pos={x=, y=, z=}}`
     * `{type="detached", name="creative"}`

## get_item_group


```lua
function core.get_item_group(name: string, group: string)
  -> integer
```

 * `core.get_item_group(name, group)`: returns a rating
     * Get rating of a group of an item. (`0` means: not in group)

## get_mapgen_edges


```lua
function core.get_mapgen_edges(mapgen_limit?: number, chunksize?: number)
```

 * `core.get_mapgen_edges([mapgen_limit[, chunksize]])`
     * Returns the minimum and maximum possible generated node positions
       in that order.
     * `mapgen_limit` is an optional number. If it is absent, its value is that
       of the *active* mapgen setting `"mapgen_limit"`.
     * `chunksize` is an optional number. If it is absent, its value is that
       of the *active* mapgen setting `"chunksize"`.

## get_mapgen_object


```lua
function core.get_mapgen_object(objectname: string)
```

## get_mapgen_setting


```lua
function core.get_mapgen_setting(name: string)
  -> string
```

 * `core.get_mapgen_setting(name)`
     * Gets the *active* mapgen setting (or nil if none exists) in string
       format with the following order of precedence:
         1) Settings loaded from map_meta.txt or overrides set during mod
            execution.
         2) Settings set by mods without a metafile override
         3) Settings explicitly set in the user config file, minetest.conf
         4) Settings set as the user config default

## get_mapgen_setting_noiseparams


```lua
function core.get_mapgen_setting_noiseparams(name: string)
  -> NoiseParams
```

 * `core.get_mapgen_setting_noiseparams(name)`
     * Same as above, but returns the value as a NoiseParams table if the
       setting `name` exists and is a valid NoiseParams.

## get_meta


```lua
function core.get_meta(pos: vector)
  -> NodeMetaRef
```

## get_mod_storage


```lua
function core.get_mod_storage()
  -> StorageRef
```

 * `core.get_mod_storage()`:
     * returns reference to mod private `StorageRef`
     * must be called during mod load time

## get_modnames


```lua
function core.get_modnames()
  -> string[]
```

## get_modpath


```lua
function core.get_modpath(modname: string)
  -> string
```

## get_name_from_content_id


```lua
function core.get_name_from_content_id(content_id: content_id)
  -> string
```

 * `core.get_name_from_content_id(content_id)`: returns a string
     * Gets the name of the content with that content ID

## get_natural_light


```lua
function core.get_natural_light(pos: vector, timeofday?: number)
  -> light_level?
```

 * `core.get_natural_light(pos[, timeofday])`
     * Figures out the sunlight (or moonlight) value at pos at the given time of
       day.
     * `pos`: The position of the node
     * `timeofday`: `nil` for current time, `0` for night, `0.5` for day
     * Returns a number between `0` and `15` or `nil`
     * This function tests 203 nodes in the worst case, which happens very
       unlikely

## get_node


```lua
function core.get_node(pos: vector)
  -> MapNode|{ name: string, param1: number, param2: number }
```

 * `core.get_node(pos)`
     * Returns the node at the given position as table in the same format as `set_node`.
     * This function never returns `nil` and instead returns
       `{name="ignore", param1=0, param2=0}` for unloaded areas.

## get_node_boxes


```lua
function core.get_node_boxes(box_type: "collision_box"|"node_box"|"selection_box", pos: vector, node?: MapNode|{ name: string, param1: number, param2: number })
  -> number[][]
```

 * `core.get_node_boxes(box_type, pos, [node])`
     * `box_type` must be `"node_box"`, `"collision_box"` or `"selection_box"`.
     * `pos` must be a node position.
     * `node` can be a table in the form `{name=string, param1=number, param2=number}`.
       If `node` is `nil`, the actual node at `pos` is used instead.
     * Resolves any facedir-rotated boxes, connected boxes and the like into
       actual boxes.
     * Returns a list of boxes in the form
       `{{x1, y1, z1, x2, y2, z2}, {x1, y1, z1, x2, y2, z2}, ...}`. Coordinates
       are relative to `pos`.
     * See also: [Node boxes](file:///home/et/.minetest/games/spacea/dev/lsp_definitions/luanti/%23node-boxes)

```lua
box_type:
    | "node_box"
    | "collision_box"
    | "selection_box"
```

## get_node_drops


```lua
function core.get_node_drops(node: string|MapNodeOpt|{ name: string, param1: number?, param2: number? }, toolname?: string, tool?: ItemStack, digger?: ObjectRef, pos?: vector)
  -> string[]
```

## get_node_group


```lua
function core.get_node_group(name: any, group: any)
```

 * `core.get_node_group(name, group)`: returns a rating
     * Deprecated: An alias for the former.

## get_node_light


```lua
function core.get_node_light(pos: vector, timeofday?: number)
  -> light_level?
```

 Unofficial note: NOO!!! THE LAIGHT!!! NOT THE LAIGHT!!!

 * `core.get_node_light(pos[, timeofday])`
     * Gets the light value at the given position. Note that the light value
       "inside" the node at the given position is returned, so you usually want
       to get the light value of a neighbor.
     * `pos`: The position where to measure the light.
     * `timeofday`: `nil` for current time, `0` for night, `0.5` for day
     * Returns a number between `0` and `15` or `nil`
     * `nil` is returned e.g. when the map isn't loaded at `pos`

## get_node_or_nil


```lua
function core.get_node_or_nil(pos: vector)
  -> (MapNode|{ name: string, param1: number, param2: number })?
```

 * `core.get_node_or_nil(pos)`
     * Same as `get_node` but returns `nil` for unloaded areas.
     * Note that even loaded areas can contain "ignore" nodes.

## get_node_raw


```lua
function core.get_node_raw(x: number, y: number, z: number)
  -> content_id
  2. param1: number
  3. param2: number
  4. pos_ok: boolean
```

 * `core.get_node_raw(x, y, z)`
     * Same as `get_node` but a faster low-level API
     * Returns `content_id`, `param1`, `param2`, and `pos_ok`
     * The `content_id` can be mapped to a name using `core.get_name_from_content_id()`
     * If `pos_ok` is false, the area is unloaded and `content_id == core.CONTENT_IGNORE`

## get_node_timer


```lua
function core.get_node_timer(pos: vector)
  -> NodeTimerRef
```

## get_noiseparams


```lua
function core.get_noiseparams(name: string)
  -> NoiseParams
```

## get_objects_in_area


```lua
function core.get_objects_in_area(minp: vector, maxp: vector)
  -> ObjectRef[]
```

 * `core.get_objects_in_area(min_pos, max_pos)`
     * returns a list of ObjectRefs
     * `min_pos` and `max_pos` are the min and max positions of the area to search
     * **Warning**: The same warning as for `core.get_objects_inside_radius` applies.
       Use `core.objects_in_area` instead to iterate only valid objects.

## get_objects_inside_radius


```lua
function core.get_objects_inside_radius(center: vector, radius: number)
  -> ObjectRef[]
```

 * `core.get_objects_inside_radius(center, radius)`
     * returns a list of ObjectRefs
     * `radius`: using a Euclidean metric
     * **Warning**: Any kind of interaction with the environment or other APIs
       can cause later objects in the list to become invalid while you're iterating it.
       (e.g. punching an entity removes its children)
       It is recommended to use `core.objects_inside_radius` instead, which
       transparently takes care of this possibility.

## get_perlin


```lua
function core.get_perlin(noiseparams: NoiseParams)
  -> ValueNoise
```

## get_perlin_noise_map


```lua
function core.get_perlin_noise_map(noiseparams: NoiseParams, size: vector|{ x: number, y: number })
  -> ValueNoiseMap
```

## get_player_by_name


```lua
function core.get_player_by_name(name: string)
  -> PlayerRef
```

 * `core.get_player_by_name(name)`: Get an `ObjectRef` to a player
     * Returns nothing in case of error (player offline, doesn't exist, ...).

## get_player_information


```lua
function core.get_player_information(player_name: string)
  -> player_information
```

## get_player_window_information


```lua
function core.get_player_window_information(player_name: string)
  -> Client: window_information?
```

@*return* `Client` — must have version 5.7+

## get_pointed_thing_position


```lua
function core.get_pointed_thing_position(pointed_thing: pointed_thing, above: boolean)
  -> vector
```

 * `core.get_pointed_thing_position(pointed_thing, above)`
     * Returns the position of a `pointed_thing` or `nil` if the `pointed_thing`
       does not refer to a node or entity.
     * If the optional `above` parameter is true and the `pointed_thing` refers
       to a node, then it will return the `above` position of the `pointed_thing`.

## get_position_from_hash


```lua
function core.get_position_from_hash(hash: poshash)
  -> vector
```

 * `core.get_position_from_hash(hash)`: returns a position
     * Inverse transform of `core.hash_node_position`

## get_server_max_lag


```lua
function core.get_server_max_lag()
  -> number?
```

 * `core.get_server_max_lag()`: returns the current maximum lag
   of the server in seconds or nil if server is not fully loaded yet

## get_server_status


```lua
function core.get_server_status(name: string, joined: boolean)
  -> string?
```

 Unofficial note: This is really cool i didn't know this
 * `core.get_server_status(name, joined)`
     * Returns the server status string when a player joins or when the command
       `/status` is called. Returns `nil` or an empty string when the message is
       disabled.
     * `joined`: Boolean value, indicates whether the function was called when
       a player joined.
     * This function may be overwritten by mods to customize the status message.

## get_server_uptime


```lua
function core.get_server_uptime()
  -> number
```

 * `core.get_server_uptime()`: returns the server uptime in seconds

## get_spawn_level


```lua
function core.get_spawn_level(x: number, z: number)
  -> y: number
```

 * `core.get_spawn_level(x, z)`
     * Returns a player spawn y coordinate for the provided (x, z)
       coordinates, or `nil` for an unsuitable spawn point.
     * For most mapgens a 'suitable spawn point' is one with y between
       `water_level` and `water_level + 16`, and in mgv7 well away from rivers,
       so `nil` will be returned for many (x, z) coordinates.
     * The spawn level returned is for a player spawn in unmodified terrain.
     * The spawn level is intentionally above terrain level to cope with
       full-node biome 'dust' nodes.

## get_timeofday


```lua
function core.get_timeofday()
  -> number
```

 * `core.get_timeofday()`: get time of day

## get_tool_wear_after_use


```lua
function core.get_tool_wear_after_use(uses: integer, initial_wear?: integer)
  -> integer
```

## get_translator


```lua
function core.get_translator(textdomain: string|nil)
  -> S: fun(str: string, ...string):string
  2. PS: fun(str: string, str_plural: string, n: number, ...string):string
```

`core.get_translator(textdomain)` is a simple wrapper around
`core.translate` and `core.translate_n`.  
After `local S, PS = core.get_translator(textdomain)`, we have
`S(str, ...)` equivalent to `core.translate(textdomain, str, ...)`, and
`PS(str, str_plural, n, ...)` to `core.translate_n(textdomain, str, str_plural, n, ...)`.  
It is intended to be used in the following way, so that it avoids verbose
repetitions of `core.translate`:

```lua
local S, PS = core.get_translator(textdomain)
S(str, ...)
```

As an extra commodity, if `textdomain` is nil, it is assumed to be "" instead.


## get_us_time


```lua
function core.get_us_time()
  -> number
```

 returns time with microsecond precision. May not return wall time.
 Unofficial note: I think you should use os.clock() for benchmarking instead

## get_value_noise


```lua
function core.get_value_noise(noiseparams: NoiseParams)
  -> ValueNoise
```

 * `core.get_value_noise(noiseparams)`
     * Return world-specific value noise.
     * The actual seed used is the noiseparams seed plus the world seed.
     * **Important**: Requires the mapgen environment to be initalized, do not use at load time.

## get_value_noise_map


```lua
function core.get_value_noise_map(noiseparams: NoiseParams, size: vector|{ x: number, y: number })
  -> ValueNoiseMap
```

## get_version


```lua
function core.get_version()
  -> core.get_version
```

## get_voxel_manip


```lua
function core.get_voxel_manip(p1?: vector, p2?: vector)
  -> VoxelManip
```

## get_worldpath


```lua
function core.get_worldpath()
  -> string
```

## global_exists


```lua
function core.global_exists(name: any)
  -> boolean
```

 * `core.global_exists(name)`
     * Checks if a global variable has been set, without triggering a warning.

@*param* `name` — unofficial note: yeah that's right, any

## handle_async


```lua
(async) function core.handle_async(f: function, callback: function, ...any)
```

 Unofficial note: async is quite painful, good luck
 The engine allows you to submit jobs to be ran in an isolated environment
 concurrently with normal server operation.
 A job consists of a function to be ran in the async environment, any amount of
 arguments (will be serialized) and a callback that will be called with the return
 value of the job function once it is finished.

 The async environment does *not* have access to the map, entities, players or any
 globals defined in the 'usual' environment. Consequently, functions like
 `core.get_node()` or `core.get_player_by_name()` simply do not exist in it.

 Arguments and return values passed through this can contain certain userdata
 objects that will be seamlessly copied (not shared) to the async environment.
 This allows you easy interoperability for delegating work to jobs.

 * `core.handle_async(func, callback, ...)`:
     * Queue the function `func` to be ran in an async environment.
       Note that there are multiple persistent workers and any of them may
       end up running a given job. The engine will scale the amount of
       worker threads automatically.
     * When `func` returns the callback is called (in the normal environment)
       with all of the return values as arguments.
     * Optional: Variable number of arguments that are passed to `func`

 ### List of APIs available in an async environment

 Classes:

 * `AreaStore`
 * `ItemStack`
 * `ValueNoise`
 * `ValueNoiseMap`
 * `PseudoRandom`
 * `PcgRandom`
 * `SecureRandom`
 * `VoxelArea`
 * `VoxelManip`
     * only if transferred into environment; can't read/write to map
 * `Settings`

 Class instances that can be transferred between environments:

 * `ItemStack`
 * `ValueNoise`
 * `ValueNoiseMap`
 * `VoxelManip`

 Functions:

 * Standalone helpers such as logging, filesystem, encoding,
   hashing or compression APIs
 * `core.register_portable_metatable`
 * IPC

 Variables:

 * `core.settings`
 * `core.registered_items`, `registered_nodes`, `registered_tools`,
   `registered_craftitems` and `registered_aliases`
     * with all functions and userdata values replaced by `true`, calling any
       callbacks here is obviously not possible

## handle_node_drops


```lua
function core.handle_node_drops(pos: vector, drops: string[], digger: PlayerRef)
```

 * `core.handle_node_drops(pos, drops, digger)`
     * `drops`: list of itemstrings
     * Handles drops from nodes after digging: Default action is to put them
       into digger's inventory.
     * Can be overridden to get different functionality (e.g. dropping items on
       ground)

## has_feature


```lua
function core.has_feature(arg: string|string[])
  -> boolean
  2. missing_features: table<string, boolean>
```

## hash_node_position


```lua
function core.hash_node_position(pos: vector)
  -> poshash
```

## hud_replace_builtin


```lua
function core.hud_replace_builtin(name: "breath"|"health"|"hotbar"|"minimap", hud_definition: HudDef)
```

 * `core.hud_replace_builtin(name, hud_definition)`
     * Replaces definition of a builtin hud element
     * `name`: `"breath"`, `"health"`, `"minimap"` or `"hotbar"`
     * `hud_definition`: definition to replace builtin definition

```lua
name:
    | "breath"
    | "health"
    | "minimap"
    | "hotbar"
```

## hypertext_escape


```lua
function core.hypertext_escape(string: string)
  -> string
```

 * `core.hypertext_escape(string)`: returns a string
     * escapes the characters "\", "<", and ">" to show text in a hypertext element.
     * not safe for use with tag attributes.
     * this function does not do formspec escaping, you will likely need to do
       `core.formspec_escape(core.hypertext_escape(string))` if the hypertext is
       not already being formspec escaped.

## inventorycube


```lua
function core.inventorycube(img1: string, img2: string, img3: string)
  -> string
```

## ipc_cas


```lua
function core.ipc_cas(key: string, old_value: any, new_value: any)
  -> success: boolean
```

 * `core.ipc_cas(key, old_value, new_value)`:
   * Write a value to the shared data area, but only if the previous value
     equals what was given.
     This operation is called Compare-and-Swap and can be used to implement
     synchronization between threads.
   * `key`: as above
   * `old_value`: value compared to using `==` (`nil` compares equal for non-existing keys)
   * `new_value`: value that will be set
   * returns: true on success, false otherwise

## ipc_get


```lua
function core.ipc_get(key: string)
```

 * `core.ipc_get(key)`:
   * Read a value from the shared data area.
   * `key`: string, should use the `"modname:thing"` convention to avoid conflicts.
   * returns an arbitrary Lua value, or `nil` if this key does not exist

## ipc_poll


```lua
function core.ipc_poll(key: string, timeout: number)
  -> success: boolean
```

 * `core.ipc_poll(key, timeout)`:
   * Do a blocking wait until a value (other than `nil`) is present at the key.
   * **IMPORTANT**: You usually don't need this function. Use this as a last resort
     if nothing else can satisfy your use case! None of the Lua environments the
     engine has are safe to block for extended periods, especially on the main
     thread any delays directly translate to lag felt by players.
   * `key`: as above
   * `timeout`: maximum wait time, in milliseconds (positive values only)
   * returns: true on success, false on timeout

## ipc_set


```lua
function core.ipc_set(key: string, value: any)
```

 * `core.ipc_set(key, value)`:
   * Write a value to the shared data area.
   * `key`: as above
   * `value`: an arbitrary Lua value, cannot be or contain userdata.

 Interacting with the shared data will perform an operation comparable to
 (de)serialization on each access.
 For that reason modifying references will not have any effect, as in this example:
 ```lua
 core.ipc_set("test:foo", {})
 core.ipc_get("test:foo").subkey = "value" -- WRONG!
 core.ipc_get("test:foo") -- returns an empty table
 ```

## is_area_protected


```lua
function core.is_area_protected(pos1: vector, pos2: vector, player_name: string, interval: number)
  -> boolean
```

 * `core.is_area_protected(pos1, pos2, player_name, interval)`
     * Returns the position of the first node that `player_name` may not modify
       in the specified cuboid between `pos1` and `pos2`.
     * Returns `false` if no protections were found.
     * Applies `is_protected()` to a 3D lattice of points in the defined volume.
       The points are spaced evenly throughout the volume and have a spacing
       similar to, but no larger than, `interval`.
     * All corners and edges of the defined volume are checked.
     * `interval` defaults to 4.
     * `interval` should be carefully chosen and maximized to avoid an excessive
       number of points being checked.
     * Like `core.is_protected`, this function may be extended or
       overwritten by mods to provide a faster implementation to check the
       cuboid for intersections.

## is_creative_enabled


```lua
function core.is_creative_enabled(name: string)
  -> boolean
```

 * `core.is_creative_enabled(name)`: returns boolean
     * Returning `true` means that Creative Mode is enabled for player `name`.
     * `name` will be `""` for non-players or if the player is unknown.
     * This function should be overridden by Creative Mode-related mods to
       implement a per-player Creative Mode.
     * By default, this function returns `true` if the setting
       `creative_mode` is `true` and `false` otherwise.

## is_nan


```lua
function core.is_nan(arg: any)
  -> boolean
```

## is_player


```lua
function core.is_player(obj: ObjectRef)
  -> boolean
```

 * `core.is_player(obj)`: boolean, whether `obj` is a player

## is_protected


```lua
function core.is_protected(pos: vector, name: string)
  -> boolean
```

 Unofficial note: Do NOT localize it, i know you want to, just don't
 * `core.is_protected(pos, name)`: returns boolean
     * Returning `true` restricts the player `name` from modifying (i.e. digging,
        placing) the node at position `pos`.
     * `name` will be `""` for non-players or unknown players.
     * This function should be overridden by protection mods. It is highly
       recommended to grant access to players with the `protection_bypass` privilege.
     * Cache and call the old version of this function if the position is
       not protected by the mod. This will allow using multiple protection mods.
     * Example:
       ```lua
       local old_is_protected = core.is_protected
       function core.is_protected(pos, name)
           if mymod:position_protected_from(pos, name) then
               return true
           end
           return old_is_protected(pos, name)
       end
       ```

## is_singleplayer


```lua
function core.is_singleplayer()
  -> boolean
```

## is_valid_player_name


```lua
function core.is_valid_player_name(name: string)
  -> boolean
```

 * `core.is_valid_player_name(name)`: boolean, whether the given name
   could be used as a player name (regardless of whether said player exists).

## is_yes


```lua
function core.is_yes(arg: any)
  -> boolean
```

## item_drop


```lua
function core.item_drop(itemstack: ItemStack, dropper?: PlayerRef, pos: vector)
```

 * `core.item_drop(itemstack, dropper, pos)`
     * Converts `itemstack` to an in-world Lua entity.
     * `itemstack` (`ItemStack`) is modified (cleared) on success.
       * In versions < 5.12.0, `itemstack` was cleared in all cases.
     * `dropper` (`ObjectRef`) is optional.
     * Returned values on success:
       1. leftover itemstack
       2. `ObjectRef` of the spawned object (provided since 5.12.0)

## item_eat


```lua
function core.item_eat(hp_change: number, replace_with_item?: string|table|ItemStack)
```

 * `core.item_eat(hp_change[, replace_with_item])`
     * Returns `function(itemstack, user, pointed_thing)` as a
       function wrapper for `core.do_item_eat`.
     * `replace_with_item` is the itemstring which is added to the inventory.
       If the player is eating a stack and `replace_with_item` doesn't fit onto
       the eaten stack, then the remainings go to a different spot, or are dropped.

## item_pickup


```lua
function core.item_pickup(itemstack: ItemStack, picker: PlayerRef, pointed_thing: pointed_thing, time_from_last_punch: number, ...any)
  -> ItemStack
```

 * `core.item_pickup(itemstack, picker, pointed_thing, time_from_last_punch, ...)`
     * Runs callbacks registered by `core.register_on_item_pickup` and adds
       the item to the picker's `"main"` inventory list.
     * Parameters are the same as in `on_pickup`.
     * Returns the leftover itemstack.

## item_place


```lua
function core.item_place(itemstack: ItemStack, placer: PlayerRef, pointed_thing: pointed_thing, param2?: number)
  -> ItemStack
  2. vector?
```

 * `core.item_place(itemstack, placer, pointed_thing[, param2])`
     * Wrapper that calls `core.item_place_node` if appropriate
     * Calls `on_rightclick` of `pointed_thing.under` if defined instead
     * **Note**: is not called when wielded item overrides `on_place`
     * `param2` overrides facedir and wallmounted `param2`
     * returns `itemstack, position`
       * `position`: the location the node was placed to. `nil` if nothing was placed.

## item_place_node


```lua
function core.item_place_node(itemstack: ItemStack, placer: PlayerRef, pointed_thing: pointed_thing, param2?: number, prevent_after_place?: boolean)
  -> ItemStack
  2. vector?
```

 * `core.item_place_node(itemstack, placer, pointed_thing[, param2, prevent_after_place])`
     * Place item as a node
     * `param2` overrides `facedir` and wallmounted `param2`
     * `prevent_after_place`: if set to `true`, `after_place_node` is not called
       for the newly placed node to prevent a callback and placement loop
     * returns `itemstack, position`
       * `position`: the location the node was placed to. `nil` if nothing was placed.

## item_place_object


```lua
function core.item_place_object(itemstack: any, placer: any, pointed_thing: any)
```

 * `core.item_place_object(itemstack, placer, pointed_thing)`
     * Place item as-is
     * returns the leftover itemstack
     * **Note**: This function is deprecated and will never be called.

## itemstring_with_color


```lua
function core.itemstring_with_color(item: string|table|ItemStack, colorstring: ColorString)
  -> string
```

 * `core.itemstring_with_color(item, colorstring)`: returns an item string
     * Creates an item string which contains static color information
       for hardware colorization. Use this method if you wish to colorize
       an item that does not own a palette. You can use the returned string
       as an output in a craft recipe.
     * `item`: the item stack which becomes colored. Can be in string,
       table and native form.
     * `colorstring`: the new color of the item stack

## itemstring_with_palette


```lua
function core.itemstring_with_palette(item: string|table|ItemStack, palette_index: number)
  -> string
```

 * `core.itemstring_with_palette(item, palette_index)`: returns an item
   string.
     * Creates an item string which contains palette index information
       for hardware colorization. You can use the returned string
       as an output in a craft recipe.
     * `item`: the item stack which becomes colored. Can be in string,
       table and native form.
     * `palette_index`: this index is added to the item stack

## kick_player


```lua
function core.kick_player(name: string, reason?: string, reconnect?: boolean)
  -> success: boolean
```

 * `core.kick_player(name[, reason[, reconnect]])`: disconnect a player with an optional
   reason.
     * Returns boolean indicating success (false if player nonexistent)
     * If `reconnect` is true, allow the user to reconnect.

## line_of_sight


```lua
function core.line_of_sight(pos1: vector, pos2: vector)
  -> boolean
  2. (MapNode|{ name: string, param1: number, param2: number })?
```

 Unofficial note: The annoying thing about this little function is that it is hardcoded to check specifically for "air", nothing else
 Though i am sure you can make it work out

 * `core.line_of_sight(pos1, pos2)`: returns `boolean, pos`
     * Checks if there is anything other than air between pos1 and pos2.
     * Returns false if something is blocking the sight.
     * Returns the position of the blocking node when `false`
     * `pos1`: First position
     * `pos2`: Second position

## load_area


```lua
function core.load_area(pos1: vector, pos2?: vector)
  -> nil
```

 * `core.load_area(pos1[, pos2])`
     * Load the mapblocks containing the area from `pos1` to `pos2`.
       `pos2` defaults to `pos1` if not specified.
     * This function does not trigger map generation.

## log


```lua
function core.log(loglevel: "action"|"error"|"info"|"none"|"verbose"...(+1), text: string)
  -> nil
```

```lua
loglevel:
    | "none"
    | "error"
    | "warning"
    | "action"
    | "info"
    | "verbose"
```

## luaentities


```lua
table<integer, luaentity>
```

## mkdir


```lua
function core.mkdir(path: string)
  -> success: boolean
```

## mod_channel_join


```lua
function core.mod_channel_join(channel_name: string)
  -> ModChannel
```

## mvdir


```lua
function core.mvdir(source: string, destination: string)
  -> success: boolean
```

## node_dig


```lua
function core.node_dig(pos: vector, node: MapNode|{ name: string, param1: number, param2: number }, digger: PlayerRef)
```

 * `core.node_dig(pos, node, digger)`
     * Checks if node can be dug, puts item into inventory, removes node
     * Calls functions registered by `core.registered_on_dignodes()`

## node_punch


```lua
function core.node_punch(pos: vector, node: MapNode|{ name: string, param1: number, param2: number }, puncher: PlayerRef, pointed_thing: pointed_thing)
```

 * `core.node_punch(pos, node, puncher, pointed_thing)`
     * Calls functions registered by `core.register_on_punchnode()`

## object_refs


```lua
table<integer, ObjectRef>
```

## objects_in_area


```lua
function core.objects_in_area(minp: vector, maxp: vector)
  -> function
```

 * `core.objects_in_area(min_pos, max_pos)`
     * returns an iterator of valid objects

## objects_inside_radius


```lua
function core.objects_inside_radius(center: vector, radius: number)
  -> function
```

 * `core.objects_inside_radius(center, radius)`
     * returns an iterator of valid objects
     * example: `for obj in core.objects_inside_radius(center, radius) do obj:punch(...) end`

## override_chatcommand


```lua
function core.override_chatcommand(name: string, redef: table)
```

@*param* `redef` — sorry no types

## override_item


```lua
function core.override_item(name: string, redefinition: table, del_fields: table)
```

 * `core.override_item(name, redefinition, del_fields)`
     * `redefinition` is a table of fields `[name] = new_value`,
       overwriting fields of or adding fields to the existing definition.
     * `del_fields` is a list of field names to be set
       to `nil` ("deleted from") the original definition.
     * Overrides fields of an item registered with register_node/tool/craftitem.
     * Note: Item must already be defined.
     * Example: `core.override_item("default:mese",
       {light_source=core.LIGHT_MAX}, {"sounds"})`:
       Overwrites the `light_source` field,
       removes the sounds from the definition of the mese block.

@*param* `redefinition` — sorry no types for this one :)

@*param* `del_fields` — sorry no types for this one :)

## parse_json


```lua
function core.parse_json(string: string, nullvalue?: any, return_error?: boolean)
  -> boolean?
```

 * `core.parse_json(string[, nullvalue, return_error])`: returns something
     * Convert a string containing JSON data into the Lua equivalent
     * `nullvalue`: returned in place of the JSON null; defaults to `nil`
     * On success returns a table, a string, a number, a boolean or `nullvalue`
     * On failure: If `return_error` is not set or is `false`,
       outputs an error message and returns `nil`.
       Otherwise returns `nil, err` (error message).
     * Example: `parse_json("[10, {\"a\":false}]")`, returns `{10, {a = false}}`

@*return* — |any, any?

## parse_relative_number


```lua
function core.parse_relative_number(arg: string, relative_to: vector)
```

 * `core.parse_relative_number(arg, relative_to)`: returns number or nil
     * Helper function for chat commands.
     * For parsing an optionally relative number of a chat command
       parameter, using the chat command tilde notation.
     * `arg`: String snippet containing the number; possible values:
         * `"<number>"`: return as number
         * `"~<number>"`: return `relative_to + <number>`
         * `"~"`: return `relative_to`
         * Anything else will return `nil`
     * `relative_to`: Number to which the `arg` number might be relative to
     * Examples:
         * `core.parse_relative_number("5", 10)` returns 5
         * `core.parse_relative_number("~5", 10)` returns 15
         * `core.parse_relative_number("~", 10)` returns 10

## place_node


```lua
function core.place_node(pos: vector, node: MapNode|{ name: string, param1: number, param2: number }, placer?: PlayerRef)
  -> nil
```

 * `core.place_node(pos, node[, placer])`
     * Place node with the same effects that a player would cause
     * `placer`: The ObjectRef that places the node (optional)

## place_schematic


```lua
function core.place_schematic(pos: vector, schematic: schematic, rotation?: "0"|"180"|"270"|"90"|"random", replacements: table<string, string>, force_placement: boolean, flags?: string)
  -> boolean?
```

 * `core.place_schematic(pos, schematic, rotation, replacements, force_placement, flags)`
     * Place the schematic specified by schematic (see [Schematic specifier]) at
       `pos`.
     * `rotation` can equal `"0"`, `"90"`, `"180"`, `"270"`, or `"random"`.
     * If the `rotation` parameter is omitted, the schematic is not rotated.
     * `replacements` = `{["old_name"] = "convert_to", ...}`
     * `force_placement` is a boolean indicating whether nodes other than `air`
       and `ignore` are replaced by the schematic.
     * Returns nil if the schematic could not be loaded.
     * **Warning**: Once you have loaded a schematic from a file, it will be
       cached. Future calls will always use the cached version and the
       replacement list defined for it, regardless of whether the file or the
       replacement list parameter have changed. The only way to load the file
       anew is to restart the server.
     * `flags` is a flag field with the available flags:
         * place_center_x
         * place_center_y
         * place_center_z

```lua
rotation:
    | "0"
    | "90"
    | "180"
    | "270"
    | "random"
```

## place_schematic_on_vmanip


```lua
function core.place_schematic_on_vmanip(vmanip: VoxelManip, pos: any, schematic: schematic, rotation?: "0"|"180"|"270"|"90"|"random", replacement: table<string, string>, force_placement: boolean, flags?: string)
  -> boolean?
```

 stylua: ignore
 * `core.place_schematic_on_vmanip(vmanip, pos, schematic, rotation, replacement, force_placement, flags)`:
     * This function is analogous to core.place_schematic, but places a
       schematic onto the specified VoxelManip object `vmanip` instead of the
       map.
     * Returns false if any part of the schematic was cut-off due to the
       VoxelManip not containing the full area required, and true if the whole
       schematic was able to fit.
     * Returns nil if the schematic could not be loaded.
     * After execution, any external copies of the VoxelManip contents are
       invalidated.
     * `flags` is a flag field with the available flags:
         * place_center_x
         * place_center_y
         * place_center_z

```lua
rotation:
    | "0"
    | "90"
    | "180"
    | "270"
    | "random"
```

## player_exists


```lua
function core.player_exists(name: string)
  -> boolean
```

 * `core.player_exists(name)`: boolean, whether player exists
   (regardless of online status)

## pointed_thing_to_face_pos


```lua
function core.pointed_thing_to_face_pos(pointed_thing: pointed_thing)
  -> vector
```

## pos_to_string


```lua
function core.pos_to_string(pos: vector, decimal_places?: number)
  -> string
```

## protocol_versions


```lua
table<string, number>
```

## punch_node


```lua
function core.punch_node(pos: vector, puncher?: PlayerRef)
  -> nil
```

 * `core.punch_node(pos[, puncher])`
     * Punch node with the same effects that a player would cause
     * `puncher`: The ObjectRef that punches the node (optional)

## raillike_group


```lua
function core.raillike_group(name: string)
  -> number
```

 * `core.raillike_group(name)`: returns a rating
     * Returns rating of the connect_to_raillike group corresponding to name
     * If name is not yet the name of a connect_to_raillike group, a new group
       id is created, with that name.

## raycast


```lua
function
```

## read_schematic


```lua
function core.read_schematic(schematic?: any, options?: { write_yslice_prob: ("all"|"low"|"none")? })
  -> schematic?
```

 * `core.read_schematic(schematic, options)`
     * Returns a Lua table representing the schematic (see: [Schematic specifier])
     * `schematic` is the schematic to read (see: [Schematic specifier])
     * `options` is a table containing the following optional parameters:
         * `write_yslice_prob`: string value:
             * `none`: no `write_yslice_prob` table is inserted,
             * `low`: only probabilities that are not 254 or 255 are written in
               the `write_ylisce_prob` table,
             * `all`: write all probabilities to the `write_yslice_prob` table.
             * The default for this option is `all`.
             * Any invalid value will be interpreted as `all`.

@*param* `schematic` — unofficial note: i have no clue i'm sorry

## record_protection_violation


```lua
function core.record_protection_violation(pos: vector, name: string)
```

## register_abm


```lua
function core.register_abm(abmdef: ABMDef)
```

## register_alias


```lua
function core.register_alias(alias: string|"mapgen_apple"|"mapgen_cobble"|"mapgen_desert_sand"|"mapgen_desert_stone"...(+22), original_name: string)
```

 Also use this to set the 'mapgen aliases' needed in a game for the code mapgens.

```lua
--  Why is luanti mgv6 so mtg centric?
alias:
    | "mapgen_stone"
    | "mapgen_water_source"
    | "mapgen_river_water_source"
    | "mapgen_lava_source"
    | "mapgen_cobble"
    | "mapgen_dirt"
    | "mapgen_dirt_with_grass"
    | "mapgen_sand"
    | "mapgen_tree"
    | "mapgen_leaves"
    | "mapgen_apple"
    | "mapgen_cobble"
    | "mapgen_gravel"
    | "mapgen_desert_stone"
    | "mapgen_desert_sand"
    | "mapgen_dirt_with_snow"
    | "mapgen_snowblock"
    | "mapgen_snow"
    | "mapgen_ice"
    | "mapgen_jungletree"
    | "mapgen_jungleleaves"
    | "mapgen_pine_tree"
    | "mapgen_pine_needles"
    | "mapgen_stair_cobble"
    | "mapgen_mossycobble"
    | "mapgen_stair_desert_stone"
    | "mapgen_singlenode"
```

## register_alias_force


```lua
function core.register_alias_force(alias: string|"mapgen_apple"|"mapgen_cobble"|"mapgen_desert_sand"|"mapgen_desert_stone"...(+22), original_name: string)
```

```lua
--  Why is luanti mgv6 so mtg centric?
alias:
    | "mapgen_stone"
    | "mapgen_water_source"
    | "mapgen_river_water_source"
    | "mapgen_lava_source"
    | "mapgen_cobble"
    | "mapgen_dirt"
    | "mapgen_dirt_with_grass"
    | "mapgen_sand"
    | "mapgen_tree"
    | "mapgen_leaves"
    | "mapgen_apple"
    | "mapgen_cobble"
    | "mapgen_gravel"
    | "mapgen_desert_stone"
    | "mapgen_desert_sand"
    | "mapgen_dirt_with_snow"
    | "mapgen_snowblock"
    | "mapgen_snow"
    | "mapgen_ice"
    | "mapgen_jungletree"
    | "mapgen_jungleleaves"
    | "mapgen_pine_tree"
    | "mapgen_pine_needles"
    | "mapgen_stair_cobble"
    | "mapgen_mossycobble"
    | "mapgen_stair_desert_stone"
    | "mapgen_singlenode"
```

## register_allow_player_inventory_action


```lua
function core.register_allow_player_inventory_action(f: fun(player: PlayerRef, action: "move"|"put"|"take", inventory: InvRef, inventory_info: inventory_info):number)
```

 * `core.register_allow_player_inventory_action(function(player, action, inventory, inventory_info))`
     * Determines how much of a stack may be taken, put or moved to a
       player inventory.
     * Function arguments: see `core.register_on_player_inventory_action`
     * Return a numeric value to limit the amount of items to be taken, put or
       moved. A value of `-1` for `take` will make the source stack infinite.

## register_async_dofile


```lua
function core.register_async_dofile(path: string)
```

 * `core.register_async_dofile(path)`:
     * Register a path to a Lua file to be imported when an async environment
       is initialized. You can use this to preload code which you can then call
       later using `core.handle_async()`.

## register_authentication_handler


```lua
function core.register_authentication_handler(auth_handler_def: table)
```

 How many people do you think, have interacted with this function
 Have *wanted* to interact with this function...

 i think that number is like, 5?

 anyway docs:
 * Registers an auth handler that overrides the builtin one.
 * This function can be called by a single mod once only.

@*param* `auth_handler_def` — you know what you are doing, i am sorry but no types

## register_biome


```lua
function core.register_biome(biome_def: BiomeDef)
```

## register_can_bypass_userlimit


```lua
function core.register_can_bypass_userlimit(f: fun(name: string, ip: string))
```

 * `core.register_can_bypass_userlimit(function(name, ip))`
     * Called when `name` user connects with `ip`.
     * Return `true` to by pass the player limit

## register_chatcommand


```lua
function core.register_chatcommand(chatcommand_def: ChatCommandDef)
```

## register_craft


```lua
function core.register_craft(craft_recipe: CraftRecipe)
```

## register_craft_predict


```lua
function core.register_craft_predict(f: fun(itemstack: ItemStack, player: PlayerRef, old_crafting_grid: table, craft_inv: InvRef):ItemStack?)
```

 * `core.register_craft_predict(function(itemstack, player, old_craft_grid, craft_inv))`
     * The same as before, except that it is called before the player crafts, to
       make craft prediction, and it should not change anything.

## register_craftitem


```lua
function core.register_craftitem(name: string, itemdef: ItemDef)
```

 * Note: you must pass a clean table that hasn't already been used for
   another registration to this function, as it will be modified.

## register_decoration


```lua
function core.register_decoration(decoration_def: DecorationDef)
```

## register_entity


```lua
function core.register_entity(name: string, entity_def: EntityDef)
```

## register_globalstep


```lua
function core.register_globalstep(f: fun(dtime: number):nil)
  -> nil
```

 * Called every server step, usually interval of 0.1s.
 * `dtime` is the time since last execution in seconds.

## register_lbm


```lua
function core.register_lbm(lbmdef: LBMDef)
```

## register_mapgen_script


```lua
function core.register_mapgen_script(path: string)
```

 Mapgen environment
 ------------------

 The engine runs the map generator on separate threads, each of these also has
 a Lua environment. Its primary purpose is to allow mods to operate on newly
 generated parts of the map to e.g. generate custom structures.
 Internally it is referred to as "emerge environment".

 Refer to [Async environment] for the usual disclaimer on what environment isolation entails.

 The map generator threads, which also contain the above mentioned Lua environment,
 are initialized after all mods have been loaded by the server. After that the
 registered scripts (not all mods!) - see below - are run during initialization of
 the mapgen environment. After that only callbacks happen. The mapgen env
 does not have a global step or timer.

 * `core.register_mapgen_script(path)`:
     * Register a path to a Lua file to be imported when a mapgen environment
       is initialized. Run in order of registration.
 ### List of APIs available in the mapgen env

 Classes:

 * `AreaStore`
 * `ItemStack`
 * `ValueNoise`
 * `ValueNoiseMap`
 * `PseudoRandom`
 * `PcgRandom`
 * `SecureRandom`
 * `VoxelArea`
 * `VoxelManip`
     * only given by callbacks; cannot access rest of map
 * `Settings`

 Functions:

 * Standalone helpers such as logging, filesystem, encoding,
   hashing or compression APIs
 * `core.get_biome_id`, `get_biome_name`, `get_heat`, `get_humidity`,
   `get_biome_data`, `get_mapgen_object`, `get_mapgen_params`, `get_mapgen_edges`,
   `get_mapgen_setting`, `get_noiseparams`, `get_decoration_id` and more
 * `core.get_node`, `set_node`, `find_node_near`, `find_nodes_in_area`,
   `spawn_tree` and similar
     * these only operate on the current chunk (if inside a callback)
 * IPC

 Variables:

 * `core.settings`
 * `core.registered_items`, `registered_nodes`, `registered_tools`,
   `registered_craftitems` and `registered_aliases`
     * with all functions and userdata values replaced by `true`, calling any
       callbacks here is obviously not possible
 * `core.registered_biomes`, `registered_ores`, `registered_decorations`

 Note that node metadata does not exist in the mapgen env, we suggest deferring
 setting any metadata you need to the `on_generated` callback in the regular env.
 You can use the gennotify mechanism to transfer this information.

## register_node


```lua
function core.register_node(name: string, node_def: NodeDef)
```

## register_on_auth_fail


```lua
function core.register_on_auth_fail(f: fun(name: string, ip: string))
```

 * Deprecated: use `core.register_on_authplayer(name, ip, is_success)` instead.

## register_on_authplayer


```lua
function core.register_on_authplayer(f: fun(name: string, ip: string, is_success: boolean))
```

 * `core.register_on_authplayer(function(name, ip, is_success))`
     * Called when a client attempts to log into an account.
     * `name`: The name of the account being authenticated.
     * `ip`: The IP address of the client
     * `is_success`: Whether the client was successfully authenticated
     * For newly registered accounts, `is_success` will always be true

## register_on_chat_message


```lua
function core.register_on_chat_message(f: fun(name: string, message: string):boolean?)
```

 * `core.register_on_chat_message(function(name, message))`
     * Called always when a player says something
     * Return `true` to mark the message as handled, which means that it will
       not be sent to other players.

## register_on_chatcommand


```lua
function core.register_on_chatcommand(f: fun(name: string, command: string, params: string))
```

 * `core.register_on_chatcommand(function(name, command, params))`
     * Called always when a chatcommand is triggered, before `core.registered_chatcommands`
       is checked to see if the command exists, but after the input is parsed.
     * Return `true` to mark the command as handled, which means that the default
       handlers will be prevented.

## register_on_cheat


```lua
function core.register_on_cheat(f: fun(ObjectRef: ObjectRef, cheat: cheat_type))
```

 * `core.register_on_cheat(function(ObjectRef, cheat))`
     * Called when a player cheats
     * `cheat`: `{type=<cheat_type>}`, where `<cheat_type>` is one of:
         * `moved_too_fast`
         * `interacted_too_far`
         * `interacted_with_self`
         * `interacted_while_dead`
         * `finished_unknown_dig`
         * `dug_unbreakable`
         * `dug_too_fast`

## register_on_craft


```lua
function core.register_on_craft(f: fun(itemstack: ItemStack, player: PlayerRef, old_crafting_grid: table, craft_inv: InvRef):ItemStack?)
```

 * `core.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv))`
     * Called when `player` crafts something
     * `itemstack` is the output
     * `old_craft_grid` contains the recipe (Note: the one in the inventory is
       cleared).
     * `craft_inv` is the inventory with the crafting grid
     * Return either an `ItemStack`, to replace the output, or `nil`, to not
       modify it.

## register_on_dieplayer


```lua
function core.register_on_dieplayer(f: fun(ObjectRef: ObjectRef, reason: PlayerHPChangeReason))
```

 * `core.register_on_dieplayer(function(ObjectRef, reason))`
     * Called when a player dies
     * `reason`: a PlayerHPChangeReason table, see register_on_player_hpchange
     * For customizing the death screen, see `core.show_death_screen`.

## register_on_dignode


```lua
function core.register_on_dignode(f: fun(pos: vector, oldnode: MapNode|{ name: string, param1: number, param2: number }, digger: ObjectRef):nil)
  -> nil
```

 * `core.register_on_dignode(function(pos, oldnode, digger))`
     * Called when a node has been dug.
     * **Not recommended**; Use `on_destruct` or `after_dig_node` in node
       definition whenever possible.

## register_on_generated


```lua
function core.register_on_generated(f: fun(minp: vector, maxp: vector, blockseed: number):nil)
```

 Unofficial note: not actually deprecated but PLEASE use the mapgen env, use this only for prototyping/when you absolutely need to

## register_on_item_eat


```lua
function core.register_on_item_eat(f: fun(hp_change: number, replace_with_item?: ItemStack, itemstack: ItemStack, user: PlayerRef, pointed_thing: pointed_thing):ItemStack?)
```

 * `core.register_on_item_eat(function(hp_change, replace_with_item, itemstack, user, pointed_thing))`
     * Called when an item is eaten, by `core.item_eat`
     * Return `itemstack` to cancel the default item eat response (i.e.: hp increase).

## register_on_item_pickup


```lua
function core.register_on_item_pickup(f: fun(itemstack: ItemStack, picker: PlayerRef, pointed_thing: pointed_thing, time_from_last_punch: number, ...any):ItemStack?)
```

 * `core.register_on_item_pickup(function(itemstack, picker, pointed_thing, time_from_last_punch,  ...))`
     * Called by `core.item_pickup` before an item is picked up.
     * Function is added to `core.registered_on_item_pickups`.
     * Oldest functions are called first.
     * Parameters are the same as in the `on_pickup` callback.
     * Return an itemstack to cancel the default item pick-up response (i.e.: adding
       the item into inventory).

## register_on_joinplayer


```lua
function core.register_on_joinplayer(f: fun(ObjectRef: ObjectRef, last_login: string))
```

## register_on_leaveplayer


```lua
function core.register_on_leaveplayer(f: fun(ObjectRef: ObjectRef, timed_out: string))
```

## register_on_liquid_transformed


```lua
function core.register_on_liquid_transformed(f: fun(pos_list: vector[], node_list: MapNode|{ name: string, param1: number, param2: number }[]))
```

 * `core.register_on_liquid_transformed(function(pos_list, node_list))`
     * Called after liquid nodes (`liquidtype ~= "none"`) are modified by the
       engine's liquid transformation process.
     * `pos_list` is an array of all modified positions.
     * `node_list` is an array of the old node that was previously at the position
       with the corresponding index in pos_list.

## register_on_mapblocks_changed


```lua
function core.register_on_mapblocks_changed(f: fun(modified_blocks: table<number, boolean>, modified_block_count: number))
```

 * `core.register_on_mapblocks_changed(function(modified_blocks, modified_block_count))`
     * Called soon after any nodes or node metadata have been modified. No
       modifications will be missed, but there may be false positives.
     * Will never be called more than once per server step.
     * `modified_blocks` is the set of modified mapblock position hashes. These
       are in the same format as those produced by `core.hash_node_position`,
       and can be converted to positions with `core.get_position_from_hash`.
       The set is a table where the keys are hashes and the values are `true`.
     * `modified_block_count` is the number of entries in the set.
     * Note: callbacks must be registered at mod load time.

## register_on_modchannel_message


```lua
function core.register_on_modchannel_message(f: fun(channel_name: string, sender: string|PlayerRef, message: string))
```

## register_on_mods_loaded


```lua
function core.register_on_mods_loaded(f: fun():nil)
  -> nil
```

 * Called after mods have finished loading and before the media is cached or the
   aliases handled.

## register_on_newplayer


```lua
function core.register_on_newplayer(f: fun(ObjectRef: ObjectRef):nil)
```

## register_on_placenode


```lua
function core.register_on_placenode(f: fun(pos: vector, newnode: MapNode|{ name: string, param1: number, param2: number }, placer: ObjectRef, oldnode: MapNode|{ name: string, param1: number, param2: number }, itemstack: ItemStack, pointed_thing: pointed_thing):boolean?)
  -> nil
```

 * `core.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing))`
     * Called when a node has been placed
     * If return `true` no item is taken from `itemstack`
     * `placer` may be any valid ObjectRef or nil.
     * **Not recommended**; use `on_construct` or `after_place_node` in node
       definition whenever possible.

## register_on_player_hpchange


```lua
function core.register_on_player_hpchange(f: fun(player: ObjectRef, hp_change: number, reason: PlayerHPChangeReason):number?, modifier?: boolean)
```

 * `core.register_on_player_hpchange(function(player, hp_change, reason), modifier)`
     * Called when the player gets damaged or healed
     * When `hp == 0`, damage doesn't trigger this callback.
     * When `hp == hp_max`, healing does still trigger this callback.
     * `player`: ObjectRef of the player
     * `hp_change`: the amount of change. Negative when it is damage.
       * Historically, the new HP value was clamped to [0, 65535] before
         calculating the HP change. This clamping has been removed as of
         version 5.10.0
     * `reason`: a PlayerHPChangeReason table.
         * The `type` field will have one of the following values:
             * `set_hp`: A mod or the engine called `set_hp` without
                         giving a type - use this for custom damage types.
             * `punch`: Was punched. `reason.object` will hold the puncher, or nil if none.
             * `fall`
             * `node_damage`: `damage_per_second` from a neighboring node.
                              `reason.node` will hold the node name or nil.
                              `reason.node_pos` will hold the position of the node
             * `drown`
             * `respawn`
         * Any of the above types may have additional fields from mods.
         * `reason.from` will be `mod` or `engine`.
     * `modifier`: when true, the function should return the actual `hp_change`.
        Note: modifiers only get a temporary `hp_change` that can be modified by later modifiers.
        Modifiers can return true as a second argument to stop the execution of further functions.
        Non-modifiers receive the final HP change calculated by the modifiers.

## register_on_player_inventory_action


```lua
function core.register_on_player_inventory_action(f: fun(player: PlayerRef, action: "move"|"put"|"take", inventory: InvRef, inventory_info: inventory_info):nil)
```

## register_on_player_receive_fields


```lua
function core.register_on_player_receive_fields(f: fun(player: PlayerRef, formname: string, fields: formspec_fields):boolean?)
```

 * `core.register_on_player_receive_fields(function(player, formname, fields))`
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
       closed the form by mouse click, keypress or through a `button_exit[]`
       element.
     * Special case: `["try_quit"]="true"` is sent when the user tries to
       close the formspec, but the formspec used `allow_close[false]`.
     * Special case: `["key_enter"]="true"` is sent when the user pressed
       the Enter key and the focus was either nowhere (causing the formspec
       to be closed) or on a button. If the focus was on a text field,
       additionally, the index `key_enter_field` contains the name of the
       text field. See also: `field_close_on_enter`.
 * Newest functions are called first
 * If function returns `true`, remaining functions are not called

## register_on_prejoinplayer


```lua
function core.register_on_prejoinplayer(f: fun(name: string, ip: string))
```

## register_on_priv_grant


```lua
function core.register_on_priv_grant(f: fun(name: string, granter?: PlayerRef, priv: string))
```

 * `core.register_on_priv_grant(function(name, granter, priv))`
     * Called when `granter` grants the priv `priv` to `name`.
     * Note that the callback will be called twice if it's done by a player,
       once with granter being the player name, and again with granter being nil.

## register_on_priv_revoke


```lua
function core.register_on_priv_revoke(f: fun(name: string, revoker?: PlayerRef, priv: string))
```

 * `core.register_on_priv_revoke(function(name, revoker, priv))`
     * Called when `revoker` revokes the priv `priv` from `name`.
     * Note that the callback will be called twice if it's done by a player,
       once with revoker being the player name, and again with revoker being nil.

## register_on_protection_violation


```lua
function core.register_on_protection_violation(f: fun(pos: vector, name: string))
```

 * `core.register_on_protection_violation(function(pos, name))`
     * Called by `builtin` and mods when a player violates protection at a
       position (eg, digs a node or punches a protected entity).
     * The registered functions can be called using
       `core.record_protection_violation`.
     * The provided function should check that the position is protected by the
       mod calling this function before it prints a message, if it does, to
       allow for multiple protection mods.

## register_on_punchnode


```lua
function core.register_on_punchnode(f: fun(pos: vector, node: MapNode|{ name: string, param1: number, param2: number }, puncher: ObjectRef, pointed_thing: pointed_thing):nil)
  -> nil
```

 * `core.register_on_punchnode(function(pos, node, puncher, pointed_thing))`
     * Called when a node is punched

## register_on_punchplayer


```lua
function core.register_on_punchplayer(f: fun(player: ObjectRef, hitter: ObjectRef, time_from_last_punch?: number, tool_capabilities?: tool_capabilities, dir: vector, damage: number):boolean?)
```

 * `core.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage))`
     * Called when a player is punched
     * Note: This callback is invoked even if the punched player is dead.
     * `player`: ObjectRef - Player that was punched
     * `hitter`: ObjectRef - Player that hit. Can be nil.
     * `time_from_last_punch`: Meant for disallowing spamming of clicks
       (can be nil).
     * `tool_capabilities`: Capability table of used item (can be nil)
     * `dir`: Unit vector of direction of punch. Always defined. Points from
       the puncher to the punched.
     * `damage`: Number that represents the damage calculated by the engine
     * should return `true` to prevent the default damage mechanism

## register_on_respawnplayer


```lua
function core.register_on_respawnplayer(f: fun(ObjectRef: ObjectRef))
```

## register_on_rightclickplayer


```lua
function core.register_on_rightclickplayer(f: fun(player: ObjectRef, clicker: ObjectRef))
```

 * `core.register_on_rightclickplayer(function(player, clicker))`
     * Called when the 'place/use' key was used while pointing a player
       (not necessarily an actual rightclick)
     * `player`: ObjectRef - Player that is acted upon
     * `clicker`: ObjectRef - Object that acted upon `player`, may or may not be a player

## register_on_shutdown


```lua
function core.register_on_shutdown(f: fun():nil)
  -> nil
```

 * Called before server shutdown
 * Players that were kicked by the shutdown procedure are still fully accessible
  in `core.get_connected_players()`.
 * **Warning**: If the server terminates abnormally (i.e. crashes), the
   registered callbacks **will likely not be run**. Data should be saved at
   semi-frequent intervals as well as on server shutdown.

## register_portable_metatable


```lua
function core.register_portable_metatable(name: string, mt: table)
```

 * `core.register_portable_metatable(name, mt)`:
     * Register a metatable that should be preserved when Lua data is transferred
       between environments (via IPC or `handle_async`).
     * `name` is a string that identifies the metatable. It is recommended to
       follow the `modname:name` convention for this identifier.
     * `mt` is the metatable to register.
     * Note that the same metatable can be registered under multiple names,
       but multiple metatables must not be registered under the same name.
     * You must register the metatable in both the main environment
       and the async environment for this mechanism to work.

## register_privilege


```lua
function core.register_privilege(name: string, def: PrivDef)
```

## register_schematic


```lua
function core.register_schematic(schem_def: table)
```

@*param* `schem_def` — sorry no types :(

## register_tool


```lua
function core.register_tool(name: string, itemdef: ItemDef)
```

 * Note: you must pass a clean table that hasn't already been used for
   another registration to this function, as it will be modified.

## registered_abms


```lua
ABMDef[]
```

## registered_aliases


```lua
table<string, string>
```

## registered_allow_player_inventory_actions


```lua
function[]
```

## registered_biomes


```lua
table<string|integer, BiomeDef>
```

## registered_can_bypass_userlimit


```lua
function[]
```

## registered_chatcommands


```lua
table<string, ChatCommandDef>
```

## registered_craft_predicts


```lua
function[]
```

## registered_craftitems


```lua
table<string, ItemDef>
```

## registered_decorations


```lua
table<string|integer, DecorationDef>
```

## registered_entities


```lua
table<string, EntityDef>
```

## registered_globalsteps


```lua
function[]
```

## registered_items


```lua
table<string, ItemDef>
```

## registered_lbms


```lua
LBMDef[]
```

## registered_nodes


```lua
table<string, NodeDef>
```

## registered_on_authplayers


```lua
function[]
```

## registered_on_chat_messages


```lua
function[]
```

## registered_on_chatcommands


```lua
function[]
```

## registered_on_cheats


```lua
function[]
```

## registered_on_crafts


```lua
function[]
```

## registered_on_dieplayers


```lua
function[]
```

## registered_on_dignodes


```lua
function[]
```

## registered_on_generateds


```lua
function[]
```

## registered_on_item_eats


```lua
function[]
```

## registered_on_item_pickups


```lua
function[]
```

## registered_on_joinplayers


```lua
function[]
```

## registered_on_leaveplayers


```lua
function[]
```

## registered_on_liquid_transformed


```lua
function[]
```

## registered_on_mapblocks_changed


```lua
function[]
```

## registered_on_modchannel_message


```lua
function[]
```

## registered_on_mods_loaded


```lua
function[]
```

## registered_on_newplayers


```lua
function[]
```

## registered_on_placenodes


```lua
function[]
```

## registered_on_player_inventory_actions


```lua
function[]
```

## registered_on_player_receive_fields


```lua
function[]
```

## registered_on_prejoinplayers


```lua
function[]
```

## registered_on_priv_grant


```lua
function[]
```

## registered_on_priv_revoke


```lua
function[]
```

## registered_on_protection_violation


```lua
function[]
```

## registered_on_punchnodes


```lua
function[]
```

## registered_on_punchplayers


```lua
function[]
```

## registered_on_respawnplayers


```lua
function[]
```

## registered_on_rightclickplayers


```lua
function[]
```

## registered_on_shutdown


```lua
function[]
```

## registered_ores


```lua
table<string|integer, OreDef>
```

## registered_privileges


```lua
table<string, PrivDef>
```

## registered_tools


```lua
table<string, ItemDef>
```

## remove_detached_inventory


```lua
function core.remove_detached_inventory(name: string)
  -> boolean
```

## remove_node


```lua
function core.remove_node(pos: vector)
```

 * `core.bulk_swap_node({pos1, pos2, pos3, ...}, node)`
     * Equivalent to `core.swap_node` but in bulk.

## remove_player


```lua
function core.remove_player(name: string)
  -> 0|1|2
```

 * `core.remove_player(name)`: remove player from database (if they are not
   connected).
     * As auth data is not removed, `core.player_exists` will continue to
       return true. Call the below method as well if you want to remove auth
       data too.
     * Returns a code (0: successful, 1: no such player, 2: player is connected)

```lua
return #1:
    | 0
    | 1
    | 2
```

## remove_player_auth


```lua
function core.remove_player_auth(name: string)
  -> success: boolean
```

 * `core.remove_player_auth(name)`: remove player authentication data
     * Returns boolean indicating success (false if player nonexistent)

## request_http_api


```lua
function core.request_http_api()
  -> HTTPApiTable?
```

 * `core.request_http_api()`:
     * returns `HTTPApiTable` containing http functions if the calling mod has
       been granted access by being listed in the `secure.http_mods` or
       `secure.trusted_mods` setting, otherwise returns `nil`.
     * The returned table contains the functions `fetch`, `fetch_async` and
       `fetch_async_get` described below.
     * Only works at init time and must be called from the mod's main scope
       (not from a function).
     * Function only exists if Luanti server was built with cURL support.
     * **DO NOT ALLOW ANY OTHER MODS TO ACCESS THE RETURNED TABLE, STORE IT IN
       A LOCAL VARIABLE!**

## request_insecure_environment


```lua
function core.request_insecure_environment()
  -> table
```

 Unofficial note: This is one of the best features of luanti (no need to ask "is this mod safe?????"), but also a pain when you need it, and when it would be a lot more performant if you had it tbh
 * `core.request_insecure_environment()`: returns an environment containing
   insecure functions if the calling mod has been listed as trusted in the
   `secure.trusted_mods` setting or security is disabled, otherwise returns
   `nil`.
     * Only works at init time and must be called from the mod's main scope
       (ie: the init.lua of the mod, not from another Lua file or within a function).
     * **DO NOT ALLOW ANY OTHER MODS TO ACCESS THE RETURNED ENVIRONMENT, STORE
       IT IN A LOCAL VARIABLE!**

## request_shutdown


```lua
function core.request_shutdown(message?: string, reconnect?: boolean, delay?: number)
```

 * `core.request_shutdown([message],[reconnect],[delay])`: request for
   server shutdown. Will display `message` to clients.
     * `reconnect` == true displays a reconnect button
     * `delay` adds an optional delay (in seconds) before shutdown.
       Negative delay cancels the current active shutdown.
       Zero delay triggers an immediate shutdown.

## rgba


```lua
function core.rgba(red: number, green: number, blue: number, alpha?: number)
  -> string
```

 * `core.rgba(red, green, blue[, alpha])`: returns a string
     * Each argument is an 8 Bit unsigned integer
     * Returns the ColorString from rgb or rgba values
     * Example: `core.rgba(10, 20, 30, 40)`, returns `"#0A141E28"`

## rmdir


```lua
function core.rmdir(path: string, recursive?: boolean)
  -> success: boolean
```

## rollback_get_node_actions


```lua
function core.rollback_get_node_actions(pos: vector, range: number, seconds: number, limit: number)
  -> { [1]: PlayerRef, [2]: vector, [3]: number, [4]: MapNode|{ name: string, param1: number, param2: number }, [5]: MapNode|{ name: string, param1: number, param2: number } }[]
```

 * `core.rollback_get_node_actions(pos, range, seconds, limit)`:
   returns `{{actor, pos, time, oldnode, newnode}, ...}`
     * Find who has done something to a node, or near a node
     * `actor`: `"player:<name>"`, also `"liquid"`.

## rollback_revert_actions_by


```lua
function core.rollback_revert_actions_by(actor: string, seconds: number)
  -> boolean
  2. log_messages: string[]
```

 * `core.rollback_revert_actions_by(actor, seconds)`: returns
   `boolean, log_messages`.
     * Revert latest actions of someone
     * `actor`: `"player:<name>"`, also `"liquid"`.

## rotate_and_place


```lua
function core.rotate_and_place(itemstack: ItemStack, placer: PlayerRef, pointed_thing: pointed_thing, infinitestacks?: boolean, orient_flags?: { invert_wall: boolean?, force_wall: boolean?, force_ceiling: boolean?, force_floor: boolean?, force_facedir: boolean? }, prevent_after_place?: boolean)
  -> integer
```

 * `core.rotate_and_place(itemstack, placer, pointed_thing[, infinitestacks,
   orient_flags, prevent_after_place])`
     * Attempt to predict the desired orientation of the facedir-capable node
       defined by `itemstack`, and place it accordingly (on-wall, on the floor,
       or hanging from the ceiling).
     * `infinitestacks`: if `true`, the itemstack is not changed. Otherwise the
       stacks are handled normally.
     * `orient_flags`: Optional table containing extra tweaks to the placement code:
         * `invert_wall`:   if `true`, place wall-orientation on the ground and
           ground-orientation on the wall.
         * `force_wall`:    if `true`, always place the node in wall orientation.
         * `force_ceiling`: if `true`, always place on the ceiling.
         * `force_floor`:   if `true`, always place the node on the floor.
         * `force_facedir`: if `true`, forcefully reset the facedir to north
           when placing on the floor or ceiling.
         * The first four options are mutually-exclusive; the last in the list
           takes precedence over the first.
     * `prevent_after_place` is directly passed to `core.item_place_node`
     * Returns the new itemstack after placement

## rotate_node


```lua
function core.rotate_node(itemstack: ItemStack, placer: PlayerRef, pointed_thing: pointed_thing)
  -> nil
```

 * `core.rotate_node(itemstack, placer, pointed_thing)`
     * calls `rotate_and_place()` with `infinitestacks` set according to the state
       of the creative mode setting, checks for "sneak" to set the `invert_wall`
       parameter and `prevent_after_place` set to `true`

## safe_file_write


```lua
function core.safe_file_write(path: string, content: string)
  -> success: boolean
```

 * `core.safe_file_write(path, content)`: returns boolean indicating success
     * Replaces contents of file at path with new contents in a safe (atomic)
       way. Use this instead of below code when writing e.g. database files:
       `local f = io.open(path, "wb"); f:write(content); f:close()`

## save_gen_notify


```lua
function core.save_gen_notify(id: string, data: any)
```

 * `core.save_gen_notify(id, data)`
     * Saves data for retrieval using the gennotify mechanism (see [Mapgen objects]).
     * Data is bound to the chunk that is currently being processed, so this function
       only makes sense inside the `on_generated` callback.
     * `id`: user-defined ID (a string)
       By convention these should be the mod name with an optional
       colon and specifier added, e.g. `"default"` or `"default:dungeon_loot"`
     * `data`: any Lua object (will be serialized, no userdata allowed)
     * returns `true` if the data was remembered. That is if `core.set_gen_notify`
       was called with the same user-defined ID before.

## send_join_message


```lua
function core.send_join_message(player_name: string)
```

 * `core.send_join_message(player_name)`
     * This function can be overridden by mods to change the join message.

## send_leave_message


```lua
function core.send_leave_message(player_name: string, timed_out: boolean)
```

 * `core.send_leave_message(player_name, timed_out)`
     * This function can be overridden by mods to change the leave message.

## serialize


```lua
function core.serialize(table: any)
  -> string
```

 * `core.serialize(table)`: returns a string
     * Convert a value into string form readable by `core.deserialize`.
     * Supports tables, strings, numbers, booleans and `nil`.
     * Support for dumping function bytecode is **deprecated**.
     * Note: To obtain a human-readable representation of a value, use `dump` instead.
     * Example: `serialize({foo="bar"})`, returns `'return { ["foo"] = "bar" }'`

## serialize_schematic


```lua
function core.serialize_schematic(schematic: schematic, format: "lua"|"mts", options?: { lua_use_comments: boolean?, lua_num_indent_spaces: number? })
```

 * `core.serialize_schematic(schematic, format, options)`
     * Return the serialized schematic specified by schematic
       (see [Schematic specifier])
     * in the `format` of either "mts" or "lua".
     * "mts" - a string containing the binary MTS data used in the MTS file
       format.
     * "lua" - a string containing Lua code representing the schematic in table
       format.
     * `options` is a table containing the following optional parameters:
         * If `lua_use_comments` is true and `format` is "lua", the Lua code
           generated will have (X, Z) position comments for every X row
           generated in the schematic data for easier reading.
         * If `lua_num_indent_spaces` is a nonzero number and `format` is "lua",
           the Lua code generated will use that number of spaces as indentation
           instead of a tab character.

```lua
format:
    | "mts"
    | "lua"
```

## set_gen_notify


```lua
function core.set_gen_notify(flags: string, deco_ids: string[], custom_ids: string[])
```

 Unofficial Note: The types are a guess xD i have no idea how this works
 * `core.set_gen_notify(flags, [deco_ids], [custom_ids])`
     * Set the types of on-generate notifications that should be collected.
     * `flags`: flag field, see [`gennotify`] for available generation notification types.
     * The following parameters are optional:
     * `deco_ids` is a list of IDs of decorations which notification
       is requested for.
     * `custom_ids` is a list of user-defined IDs (strings) which are
       requested. By convention these should be the mod name with an optional
       colon and specifier added, e.g. `"default"` or `"default:dungeon_loot"`

## set_mapgen_setting


```lua
function core.set_mapgen_setting(name: string, value: string, override_meta?: boolean)
  -> nil
```

 * `core.set_mapgen_setting(name, value, [override_meta])`
     * Sets a mapgen param to `value`, and will take effect if the corresponding
       mapgen setting is not already present in map_meta.txt.
     * `override_meta` is an optional boolean (default: `false`). If this is set
       to true, the setting will become the active setting regardless of the map
       metafile contents.
     * Note: to set the seed, use `"seed"`, not `"fixed_map_seed"`.

## set_mapgen_setting_noiseparams


```lua
function core.set_mapgen_setting_noiseparams(name: string, value: NoiseParams, override_meta?: boolean)
```

 * `core.set_mapgen_setting_noiseparams(name, value, [override_meta])`
     * Same as above, except value is a NoiseParams table.

## set_node


```lua
function core.set_node(pos: vector, node: MapNodeOpt|{ name: string, param1: number?, param2: number? })
```

 * `core.set_node(pos, node)`
     * Set node at position `pos`.
     * Any existing metadata is deleted.
     * `node`: table `{name=string, param1=number, param2=number}`
       If param1 or param2 is omitted, it's set to `0`.
     * e.g. `core.set_node({x=0, y=10, z=0}, {name="default:wood"})`

## set_noiseparams


```lua
function core.set_noiseparams(name: string, noiseparams: NoiseParams, set_default?: boolean)
  -> nil
```

 * `core.set_noiseparams(name, noiseparams, set_default)`
     * Sets the noiseparams setting of `name` to the noiseparams table specified
       in `noiseparams`.
     * `set_default` is an optional boolean (default: `true`) that specifies
       whether the setting should be applied to the default config or current
       active config.

## set_timeofday


```lua
function core.set_timeofday(val: number)
```

## settings


```lua
Settings
```

 ### Format

 The settings have the format `key = value`. Example:

     foo = example text
     bar = """
     Multiline
     value
     """

## sha1


```lua
function core.sha1(data: string, raw?: boolean)
  -> string
```

 Unofficial note: you could be mining bitcoin rn /joke

@*param* `raw` — raw bytes instead of hex digits, default: false

## sha256


```lua
function core.sha256(data: string, raw?: boolean)
  -> string
```

@*param* `raw` — raw bytes instead of hex digits, default: false

## show_death_screen


```lua
function core.show_death_screen(player: PlayerRef, reason: PlayerHPChangeReason)
```

 * `core.show_death_screen(player, reason)`
     * Called when the death screen should be shown.
     * `player` is an ObjectRef, `reason` is a PlayerHPChangeReason table or nil.
     * By default, this shows a simple formspec with the option to respawn.
       Respawning is done via `ObjectRef:respawn`.
     * You can override this to show a custom death screen.
     * For general death handling, use `core.register_on_dieplayer` instead.

## show_formspec


```lua
function core.show_formspec(playername: string, formname: string, formspec: string)
  -> nil
```

 * `core.show_formspec(playername, formname, formspec)`
     * `playername`: name of player to show formspec
     * `formname`: name passed to `on_player_receive_fields` callbacks.
         * It should follow the `"modname:<whatever>"` naming convention.
         * If empty: Shows a custom, temporary inventory formspec.
             * An inventory formspec shown this way will also be updated if
               `ObjectRef:set_inventory_formspec` is called.
             * Use `ObjectRef:set_inventory_formspec` to change the player's
               inventory formspec for future opens.
             * Supported if server AND client are both of version >= 5.13.0.
     * `formspec`: formspec to display
     * See also: `core.register_on_player_receive_fields`

## sound_fade


```lua
function core.sound_fade(handle: sound_handle, step: number, gain: number)
```

 * `core.sound_fade(handle, step, gain)`
     * `handle` is a handle returned by `core.sound_play`
     * `step` determines how fast a sound will fade.
       The gain will change by this much per second,
       until it reaches the target gain.
       Note: Older versions used a signed step. This is deprecated, but old
       code will still work. (the client uses abs(step) to correct it)
     * `gain` the target gain for the fade.
       Fading to zero will delete the sound.

## sound_play


```lua
function core.sound_play(spec: SimpleSoundSpec, parameters: sound_params, ephemeral: boolean)
  -> sound_handle?
```

 Unofficial note: i made ephemeral NOT be optional because it's a good idea to explicitely set it (most of the time you don't use that, so set it to true)
 * `core.sound_play(spec, parameters, [ephemeral])`: returns a handle
     * `spec` is a `SimpleSoundSpec`
     * `parameters` is a sound parameter table
     * `ephemeral` is a boolean (default: false)
       Ephemeral sounds will not return a handle and can't be stopped or faded.
       It is recommend to use this for short sounds that happen in response to
       player actions (e.g. door closing).

## sound_stop


```lua
function core.sound_stop(handle: sound_handle)
```

 * `core.sound_stop(handle)`
     * `handle` is a handle returned by `core.sound_play`

## spawn_falling_node


```lua
function core.spawn_falling_node(pos: vector)
  -> boolean
```

 * `core.spawn_falling_node(pos)`
     * Change node into falling node
     * Returns `true` and the ObjectRef of the spawned entity if successful, `false` on failure

## spawn_tree


```lua
function core.spawn_tree(pos: vector, lsystem: lsystem)
  -> nil
```

## spawn_tree_on_vmanip


```lua
function core.spawn_tree_on_vmanip(vmanip: VoxelManip, pos: vector, treedef: lsystem)
  -> nil
```

## string_to_area


```lua
function core.string_to_area(str: string, relative_to?: vector)
  -> vector?
  2. vector?
```

returns two positions
Converts a string representing an area box into two positions
X1, Y1, ... Z2 are coordinates
relative_to: Optional. If set to a position, each coordinate can use the tilde notation for relative positions
"~": Relative coordinate
"~<number>": Relative coordinate plus <number>
Example: core.string_to_area("(1,2,3) (~5,~-5,~)", {x=10,y=10,z=10}) returns {x=1,y=2,z=3}, {x=15,y=5,z=10}


@*param* `str` — (X1, Y1, Z1) (X2, Y2, Z2)

## string_to_pos


```lua
function core.string_to_pos(string: string)
  -> vector
```

## strip_background_colors


```lua
function core.strip_background_colors(str: string)
  -> string
```

 Removes background colors added by get_background_escape_sequence.

## strip_colors


```lua
function core.strip_colors(str: string)
  -> string
```

 Removes all color escape sequences.

## strip_foreground_colors


```lua
function core.strip_foreground_colors(str: string)
  -> string
```

 Removes foreground colors added by get_color_escape_sequence.

## strip_param2_color


```lua
function core.strip_param2_color(param2: number, paramtype2: string)
  -> number?
```

## swap_node


```lua
function core.swap_node(pos: vector, node: MapNodeOpt|{ name: string, param1: number?, param2: number? })
```

 * `core.swap_node(pos, node)`
     * Swap node at position with another.
     * This keeps the metadata intact and will not run con-/destructor callbacks.

## time_to_day_night_ratio


```lua
function core.time_to_day_night_ratio(time_of_day: string)
  -> number
```

## translate


```lua
function core.translate(textdomain: string, str: string, ...string)
```

* `core.translate(textdomain, str, ...)` translates the string `str` with
  the given `textdomain` for disambiguation. The textdomain must match the
  textdomain specified in the translation file in order to get the string
  translated. This can be used so that a string is translated differently in
  different contexts.
  It is advised to use the name of the mod as textdomain whenever possible, to
  avoid clashes with other mods.
  This function must be given a number of arguments equal to the number of
  arguments the translated string expects.
  Arguments are literal strings -- they will not be translated.


## translate_n


```lua
function core.translate_n(textdomain: string, str: string, str_plural: string, n: number, ...string)
```

* `core.translate_n(textdomain, str, str_plural, n, ...)` translates the
  string `str` with the given `textdomain` for disambiguaion. The value of
  `n`, which must be a nonnegative integer, is used to decide whether to use
  the singular or the plural version of the string. Depending on the locale of
  the client, the choice between singular and plural might be more complicated,
  but the choice will be done automatically using the value of `n`.

  You can read https://www.gnu.org/software/gettext/manual/html_node/Plural-forms.html
  for more details on the differences of plurals between languages.

  Also note that plurals are only handled in .po or .mo files, and not in .tr files.


For instance, suppose we want to greet players when they join and provide a
command that shows the amount of time since the player joined. We can do the
following:

```lua
local S, PS = core.get_translator("hello")
core.register_on_joinplayer(function(player)
    local name = player:get_player_name()
    core.chat_send_player(name, S("Hello @1, how are you today?", name))
end)
core.register_chatcommand("playtime", {
    func = function(name)
        local last_login = core.get_auth_handler().get_auth(name).last_login
        local playtime = math.floor((last_login-os.time())/60)
        return true, PS(
            "You have been playing for @1 minute.",
            "You have been playing for @1 minutes.",
            minutes, tostring(minutes))
    end,
})

```
When someone called "CoolGuy" joins the game with an old client or a client
that does not have localization enabled, they will see `Hello CoolGuy, how are
you today?`. If they use the `/playtime` command, they will see `You have been
playing for 1 minute` or (for example) `You have been playing for 4 minutes.`

However, if we have for instance a translation file named `hello.de.po`
containing the following:

```po
msgid ""
msgstr ""
"Plural-Forms: nplurals=2; plural=(n != 1);\n"

msgid "Hello @1, how are you today?"
msgstr "Hallo @1, wie geht es dir heute?"

msgid "You have been playing for @1 minute."
msgid_plural "You have been playing for @1 minutes."
msgstr[0] "Du spielst seit @1 Minute."
msgstr[1] "Du spielst seit @1 Minuten."
```

and CoolGuy has set a German locale, they will see `Hallo CoolGuy, wie geht es
dir heute?` when they join, and the `/playtime` command will show them `Du
spielst seit 1 Minute.` or (for example) `Du spielst seit 4 Minuten.`


## unban_player_or_ip


```lua
function core.unban_player_or_ip(ip_or_name: string)
```

 * `core.unban_player_or_ip(ip_or_name)`: remove ban record matching
   IP address or name

## unregister_biome


```lua
function core.unregister_biome(name: string)
```

 * Unregisters the biome from the engine, and deletes the entry with key
   `name` from `core.registered_biomes`.
 * Warning: This alters the biome to biome ID correspondences, so any
   decorations or ores using the 'biomes' field must afterwards be cleared
   and re-registered.

## unregister_chatcommand


```lua
function core.unregister_chatcommand(name: string)
```

## unregister_item


```lua
function core.unregister_item(name: string)
```

## urlencode


```lua
function core.urlencode(str: string)
  -> string
```

 * `core.urlencode(str)`: Encodes reserved URI characters by a
   percent sign followed by two hex digits. See
   [RFC 3986, section 2.3](https://datatracker.ietf.org/doc/html/rfc3986#section-2.3).

## wallmounted_to_dir


```lua
function core.wallmounted_to_dir(wallmounted: number)
  -> vector
```

## wrap_text


```lua
function core.wrap_text(str: string, limit: integer, as_table?: boolean)
  -> string
```

## write_json


```lua
function core.write_json(data: any, styled?: boolean)
  -> string
```

 * `core.write_json(data[, styled])`: returns a string or `nil` and an error
   message.
     * Convert a Lua table into a JSON string
     * styled: Outputs in a human-readable format if this is set, defaults to
       false.
     * Unserializable things like functions and userdata will cause an error.
     * **Warning**: JSON is more strict than the Lua table format.
         1. You can only use strings and positive integers of at least one as
            keys.
         2. You cannot mix string and integer keys.
            This is due to the fact that JSON has two distinct array and object
            values.
     * Example: `write_json({10, {a = false}})`,
       returns `'[10, {"a": false}]'`

## yaw_to_dir


```lua
function core.yaw_to_dir(yaw: number)
  -> vector
```


---

# core.CONTENT_AIR


```lua
content_id
```


---

# core.CONTENT_IGNORE


```lua
content_id
```


---

# core.CONTENT_UNKNOWN


```lua
content_id
```


---

# core.EMERGE_CANCELLED


---

# core.EMERGE_CANCELLED


```lua
core.EMERGE_CANCELLED
```


---

# core.EMERGE_ERRORED


---

# core.EMERGE_ERRORED


```lua
core.EMERGE_ERRORED
```


---

# core.EMERGE_FROM_DISK


---

# core.EMERGE_FROM_DISK


```lua
core.EMERGE_FROM_DISK
```


---

# core.EMERGE_FROM_MEMORY


```lua
core.EMERGE_FROM_MEMORY
```


---

# core.EMERGE_FROM_MEMORY


---

# core.EMERGE_GENERATED


```lua
core.EMERGE_GENERATED
```


---

# core.EMERGE_GENERATED


---

# core.add_entity


```lua
function core.add_entity(pos: vector, name: string, staticdata?: string)
  -> luaentity?
```


```lua
function
```


```lua
function
```


---

# core.add_item


```lua
function core.add_item(pos: vector, item: ItemStack)
  -> luaentity?
```


---

# core.add_node


```lua
function
```


---

# core.add_particle


```lua
function core.add_particle(particle_def: Particle)
```


---

# core.add_particlespawner


```lua
function core.add_particlespawner(particlespawner_def: ParticleSpawner)
  -> -1|ParticleSpawner_id
```


---

# core.after


```lua
function core.after(time: number, f: function, ...any)
  -> job
```


---

# core.ban_player


```lua
function core.ban_player(name: string)
  -> success: boolean
```


---

# core.bulk_set_node


```lua
function core.bulk_set_node(posarr: vector[], node: MapNodeOpt|{ name: string, param1: number?, param2: number? })
```


---

# core.bulk_swap_node


```lua
function core.bulk_swap_node(posarr: vector[], node: MapNodeOpt|{ name: string, param1: number?, param2: number? })
```


---

# core.calculate_knockback


```lua
function core.calculate_knockback(player: PlayerRef, hitter: ObjectRef, time_from_last_punch: number, tool_capabilities: vector, dir: vector, distance: number, damage: any)
```


---

# core.cancel_shutdown_requests


```lua
function core.cancel_shutdown_requests()
```


---

# core.chat_send_all


```lua
function core.chat_send_all(text: string)
  -> nil
```


---

# core.chat_send_player


```lua
function core.chat_send_player(name: string, text: string)
  -> nil
```


---

# core.check_for_falling


```lua
function core.check_for_falling(pos: vector)
```


---

# core.check_single_for_falling


```lua
function core.check_single_for_falling(pos: vector)
```


```lua
function core.check_single_for_falling(p: any)
  -> unknown|nil
```


---

# core.clear_craft


```lua
function core.clear_craft(recipe: CraftRecipe)
```


---

# core.clear_objects


```lua
function core.clear_objects(opt?: "full"|"quick")
```


---

# core.clear_registered_biomes


```lua
function core.clear_registered_biomes()
  -> nil
```


---

# core.clear_registered_decorations


```lua
function core.clear_registered_decorations()
```


---

# core.clear_registered_ores


```lua
function core.clear_registered_ores()
```


---

# core.clear_registered_schematics


```lua
function core.clear_registered_schematics()
```


---

# core.close_formspec


```lua
function core.close_formspec(playername: string, formname: string)
  -> nil
```


---

# core.colorize


```lua
function core.colorize(color: ColorString, message: string)
  -> string
```


---

# core.colorspec_to_bytes


```lua
function core.colorspec_to_bytes(colorspec: ColorSpec)
  -> string
```


---

# core.colorspec_to_colorstring


```lua
function core.colorspec_to_colorstring(colorspec: ColorSpec)
  -> ColorString
```


---

# core.colorspec_to_table


```lua
function core.colorspec_to_table(colorspec: ColorSpec)
  -> { r: number, g: number, b: number, a: number }
```


---

# core.compare_block_status


```lua
function core.compare_block_status(pos: vector, condition: string|"active"|"emerging"|"loaded"|"unknown")
  -> boolean?
```


---

# core.compress


```lua
function core.compress(data: string, method: "deflate"|"zstd", ...any)
  -> string
```


---

# core.cpdir


```lua
function core.cpdir(source: string, destination: string)
  -> success: boolean
```


---

# core.create_detached_inventory


```lua
function core.create_detached_inventory(name: string, callbacks: nil, player_name?: string)
  -> InvRef
```


---

# core.create_schematic


```lua
function core.create_schematic(p1: vector, p2: vector, probabilities: { pos: vector, prob: number }[], filename: string, slice_prob_list: { ypos: number, prob: number }[])
```


---

# core.debug


```lua
function core.debug(...any)
  -> nil
```


---

# core.decode_base64


```lua
function core.decode_base64(string: string)
  -> string
```


---

# core.decompress


```lua
function core.decompress(compressed_data: string, method: "deflate"|"zstd", ...nil)
  -> string
```


---

# core.delete_area


```lua
function core.delete_area(pos1: vector, pos2: vector)
  -> nil
```


---

# core.delete_particlespawner


```lua
function core.delete_particlespawner(id: ParticleSpawner_id, player?: PlayerRef)
```


---

# core.deserialize


```lua
function core.deserialize(string: string, safe?: boolean)
  -> any
```


---

# core.dig_node


```lua
function core.dig_node(pos: vector, digger?: PlayerRef)
  -> boolean
```


---

# core.dir_to_facedir


```lua
function core.dir_to_facedir(dir: vector, is6d?: boolean)
  -> number
```


---

# core.dir_to_fourdir


```lua
function core.dir_to_fourdir(dir: vector)
  -> number
```


---

# core.dir_to_wallmounted


```lua
function core.dir_to_wallmounted(dir: vector)
  -> number
```


---

# core.dir_to_yaw


```lua
function core.dir_to_yaw(dir: vector)
  -> number
```


---

# core.disconnect_player


```lua
function core.disconnect_player(name: string, reason?: string, reconnect?: boolean)
```


---

# core.dynamic_add_media


```lua
(async) function core.dynamic_add_media(options: { filename: string?, filepath: string?, filedata: string?, to_player: string?, ephemeral: boolean? }, callback: function)
```


---

# core.emerge_area


```lua
(async) function core.emerge_area(pos1: vector, pos2: vector, callback: fun(blockpos: vector, action: core.EMERGE_CANCELLED|core.EMERGE_ERRORED|core.EMERGE_FROM_DISK|core.EMERGE_FROM_MEMORY|core.EMERGE_GENERATED, calls_remaining: number, param?: any), param?: any)
```


---

# core.encode_base64


```lua
function core.encode_base64(string: string)
  -> string
```


---

# core.encode_png


```lua
function core.encode_png(width: integer, height: integer, data: string|ColorSpec[], compression?: integer)
  -> string
```


---

# core.error_handler


```lua
function core.error_handler(err: any, level: any)
  -> string
```


---

# core.explode_scrollbar_event


```lua
function core.explode_scrollbar_event(string: string)
  -> { type: "CHG"|"DCL"|"INV", value: number? }
```


---

# core.explode_table_event


```lua
function core.explode_table_event(string: string)
  -> { type: "CHG"|"DCL"|"INV", row: number?, column: number? }
```


---

# core.explode_textlist_event


```lua
function core.explode_textlist_event(string: string)
  -> { type: "CHG"|"DCL"|"INV", index: number? }
```


---

# core.facedir_to_dir


```lua
function core.facedir_to_dir(facedir: number)
  -> vector
```


---

# core.features


```lua
function core.features()
  -> core.features
```


---

# core.features

## abm_min_max_y


```lua
boolean?
```

 ABM supports min_y and max_y fields in definition (5.5.0)

## abm_without_neighbors


```lua
boolean?
```

 ABM supports field without_neighbors (5.10.0)

## add_entity_with_staticdata


```lua
boolean?
```

 add_entity supports passing initial staticdata to on_activate
 (0.4.16)

## after_order_expiry_registration


```lua
boolean?
```

 core.after guarantees that coexisting jobs are executed primarily
 in order of expiry and secondarily in order of registration (5.9.0)

## area_store_custom_ids


```lua
boolean?
```

 Unique Area ID for AreaStoreinsert_area (0.4.14)

## area_store_persistent_ids


```lua
boolean?
```

 Whether AreaStore's IDs are kept on save/load (5.1.0)

## biome_weights


```lua
boolean?
```

 biomes have a weight parameter (5.11.0)

## blocking_pointability_type


```lua
boolean?
```

 Nodes `pointable` property can be `"blocking"` (5.9.0)

## bulk_lbms


```lua
boolean?
```

 Bulk LBM support (5.10.0)

## compress_zstd


```lua
boolean?
```

 "zstd" method for compress/decompress (5.7.0)

## degrotate_240_steps


```lua
boolean?
```

 degrotate param2 rotates in units of 1.5° instead of 2°
 thus changing the range of values from 0-179 to 0-240 (5.5.0)

## direct_velocity_on_players


```lua
boolean?
```

 Whether get_velocity() and add_velocity() can be used on players (5.4.0)

## dynamic_add_media_filepath


```lua
boolean?
```

 dynamic_add_media supports `filename` and `filedata` parameters (5.9.0)

## dynamic_add_media_startup


```lua
boolean?
```

 dynamic_add_media can be called at startup when leaving callback as `nil` (5.9.0)

## dynamic_add_media_table


```lua
boolean?
```

 dynamic_add_media supports passing a table with options (5.5.0)

## formspec_version_element


```lua
boolean?
```

 Whether formspec_version[<version>] may be used (5.1.0)

## get_all_craft_recipes_works


```lua
boolean?
```

 0.4.7

## get_light_data_buffer


```lua
boolean?
```

 VoxelManipget_light_data accepts an optional buffer argument (5.7.0)

## get_sky_as_table


```lua
boolean?
```

 allows get_sky to return a table instead of separate values (5.6.0)

## glasslike_framed


```lua
boolean?
```

 0.4.7

## hotbar_hud_element


```lua
boolean?
```

 The predefined hotbar is a Lua HUD element of type `hotbar` (5.10.0)

## httpfetch_additional_methods


```lua
boolean?
```

 The HTTP API supports the HEAD and PATCH methods (5.12.0)

## httpfetch_binary_data


```lua
boolean?
```

 Specifies whether binary data can be uploaded or downloaded using
 the HTTP API (5.1.0)

## hud_def_type_field


```lua
boolean?
```

 In HUD definitions the field `type` is used and `hud_elem_type` is deprecated (5.9.0)

## item_meta_range


```lua
boolean?
```

 Overridable pointing range using the itemstack meta key `"range"` (5.9.0)

## item_specific_pointabilities


```lua
boolean?
```

 Availability of the `pointabilities` property in the item definition (5.9.0)

## lsystem_decoration_type


```lua
boolean?
```

 L-system decoration type (5.9.0)

## mod_storage_on_disk


```lua
boolean?
```

 When using a mod storage backend that is not "files" or "dummy",
 the amount of data in mod storage is not constrained by
 the amount of RAM available. (5.7.0)

## moveresult_new_pos


```lua
boolean?
```

 "new_pos" field in entity moveresult (5.9.0)

## no_chat_message_prediction


```lua
boolean?
```

 Chat messages are no longer predicted (0.4.16)

## no_legacy_abms


```lua
boolean?
```

 Tree and grass ABMs are no longer done from C++ (0.4.8)

## node_interaction_actor


```lua
boolean?
```

 Allow passing an optional "actor" ObjectRef to the following functions
 core.place_node, core.dig_node, core.punch_node (5.9.0)

## nodebox_as_selectionbox


```lua
boolean?
```

 0.4.7

## object_independent_selectionbox


```lua
boolean?
```

 Object selectionbox is settable independently from collisionbox
 (5.0.0)

## object_step_has_moveresult


```lua
boolean?
```

 Whether Collision info is available to an objects' on_step (5.3.0)

## object_use_texture_alpha


```lua
boolean?
```

 The transparency channel of textures can optionally be used on
 objects (ie players and lua entities) (5.0.0)

## override_item_remove_fields


```lua
boolean?
```

 Allow removing definition fields in `core.override_item` (5.9.0)

## particle_blend_clip


```lua
boolean?
```

 Particles can specify a "clip" blend mode (5.11.0)

## particlespawner_tweenable


```lua
boolean?
```

 particlespawners support texpools and animation of properties,
 particle textures support smooth fade and scale animations, and
 sprite-sheet particle animations can by synced to the lifetime
 of individual particles (5.6.0)

## pathfinder_works


```lua
boolean?
```

 Whether core.find_path is functional (5.2.0)

## physics_overrides_v2


```lua
boolean?
```

 New fields for set_physics_override speed_climb, speed_crouch,
 liquid_fluidity, liquid_fluidity_smooth, liquid_sink,
 acceleration_default, acceleration_air (5.8.0)

## random_state_restore


```lua
boolean?
```

 PseudoRandom and PcgRandom state is restorable
 PseudoRandom has get_state method
 PcgRandom has get_state and set_state methods (5.9.0)

## remove_item_match_meta


```lua
boolean?
```

 The `match_meta` optional parameter is available for `InvRefremove_item()` (5.12.0)

## sound_params_start_time


```lua
boolean?
```

 Sound parameter tables support start_time (5.8.0)

## texture_names_parens


```lua
boolean?
```

 Texture grouping is possible using parentheses (0.4.11)

## use_texture_alpha


```lua
boolean?
```

 The transparency channel of textures can optionally be used on
 nodes (0.4.7)

## use_texture_alpha_string_modes


```lua
boolean?
```

 nodedef's use_texture_alpha accepts new string modes (5.4.0)

## wallmounted_rotate


```lua
boolean?
```

 wallmounted nodes mounted at floor or ceiling may additionally
 be rotated by 90° with special param2 values (5.9.0)


---

# core.find_node_near


```lua
function core.find_node_near(pos: any, radius: number, nodenames: string|string[], search_center?: boolean)
  -> vector?
```


---

# core.find_nodes_in_area


```lua
function core.find_nodes_in_area(pos1: vector, pos2: vector, nodenames: string|string[], grouped?: boolean)
  -> table<string, vector[]>|vector[]
  2. table<string, number>?
```


---

# core.find_nodes_in_area_under_air


```lua
function core.find_nodes_in_area_under_air(pos1: vector, pos2: vector, nodenames: string|string[])
  -> vector[]
```


---

# core.find_nodes_with_meta


```lua
function core.find_nodes_with_meta(pos1: vector, pos2: vector)
  -> vector[]
```


---

# core.find_path


```lua
function core.find_path(pos1: vector, pos2: vector, searchdistance: number, max_jump: number, max_drop: number, algo: "A*"|"A*_noprefetch"|"Dijkstra")
  -> vector[]?
```


---

# core.fix_light


```lua
function core.fix_light(pos1: vector, pos2: vector)
  -> boolean
```


---

# core.forceload_block


```lua
function core.forceload_block(pos: vector, transient?: boolean, limit?: number)
```


---

# core.forceload_free_block


```lua
function core.forceload_free_block(pos: vector, transient?: boolean)
```


---

# core.format_chat_message


```lua
function core.format_chat_message(name: string, message: string)
  -> nil
```


---

# core.formspec_escape


```lua
function core.formspec_escape(string: string)
  -> string
```


---

# core.fourdir_to_dir


```lua
function core.fourdir_to_dir(fourdir: number)
  -> vector
```


---

# core.generate_decorations


```lua
function core.generate_decorations(vm: VoxelManip, pos1?: vector, pos2?: vector)
```


---

# core.generate_ores


```lua
function core.generate_ores(vm: VoxelManip, pos1?: vector, pos2?: vector)
```


---

# core.get_all_craft_recipes


```lua
function core.get_all_craft_recipes(query_item: string)
  -> { method: "cooking"|"fuel"|"normal", width: number, items: ItemStack[], output: string }[]?
```


---

# core.get_artificial_light


```lua
function core.get_artificial_light(param1: number)
  -> number
```


---

# core.get_background_escape_sequence


```lua
function core.get_background_escape_sequence(color: ColorString)
  -> string
```


---

# core.get_ban_description


```lua
function core.get_ban_description(ip_or_name: string)
  -> string
```


---

# core.get_ban_list


```lua
function core.get_ban_list()
  -> string
```


---

# core.get_biome_data


```lua
function core.get_biome_data(pos: vector)
  -> { biome: number, heat: number, humidity: number }?
```


---

# core.get_biome_id


```lua
function core.get_biome_id(biome_name: string)
  -> number
```


---

# core.get_biome_name


```lua
function core.get_biome_name(biome_id: number)
  -> string?
```


---

# core.get_color_escape_sequence


```lua
function core.get_color_escape_sequence(color: ColorString)
  -> string
```


---

# core.get_connected_players


```lua
function core.get_connected_players()
  -> PlayerRef[]
```


---

# core.get_content_id


```lua
function core.get_content_id(name: string)
  -> content_id
```


---

# core.get_craft_recipe


```lua
function core.get_craft_recipe(output: string)
  -> { method: "cooking"|"fuel"|"normal", width: number, items: ItemStack[]? }?
```


---

# core.get_craft_result


```lua
function core.get_craft_result(input: { method: "cooking"|"fuel"|"normal", width: number, items: ItemStack[] })
  -> { item: ItemStack, time: number?, replacements: ItemStack[] }?
  2. ItemStack?
```


---

# core.get_current_modname


```lua
function core.get_current_modname()
  -> string
```


---

# core.get_day_count


```lua
function core.get_day_count()
  -> number
```


---

# core.get_decoration_id


```lua
function core.get_decoration_id(decoration_name: string)
```


---

# core.get_dig_params


```lua
function core.get_dig_params(groups: table<string, integer>, tool_capabilities: tool_capabilities, wear?: integer)
  -> table
```


---

# core.get_dir_list


```lua
function core.get_dir_list(path: string, is_dir: true|false|nil)
```


---

# core.get_game_info


```lua
function core.get_game_info()
  -> { id: string, title: string, author: string, path: string }
```


---

# core.get_gametime


```lua
function core.get_gametime()
  -> number?
```


---

# core.get_gen_notify


```lua
function core.get_gen_notify()
  -> string
  2. table<string, vector>
  3. table<string, any>
```


---

# core.get_heat


```lua
function core.get_heat(pos: vector)
  -> number?
```


---

# core.get_hit_params


```lua
function core.get_hit_params(groups: table<string, integer>, tool_capabilities?: tool_capabilities, time_from_last_punch?: number, wear?: integer)
  -> table
```


---

# core.get_humidity


```lua
function core.get_humidity(pos: vector)
  -> number?
```


---

# core.get_inventory_location


```lua
function core.get_inventory_location(location: inventory_location)
  -> InvRef
```


---

# core.get_item_group


```lua
function core.get_item_group(name: string, group: string)
  -> integer
```


---

# core.get_mapgen_edges


```lua
function core.get_mapgen_edges(mapgen_limit?: number, chunksize?: number)
```


---

# core.get_mapgen_object


```lua
function core.get_mapgen_object(objectname: string)
```


---

# core.get_mapgen_setting


```lua
function core.get_mapgen_setting(name: string)
  -> string
```


---

# core.get_mapgen_setting_noiseparams


```lua
function core.get_mapgen_setting_noiseparams(name: string)
  -> NoiseParams
```


---

# core.get_meta


```lua
function core.get_meta(pos: vector)
  -> NodeMetaRef
```


---

# core.get_mod_storage


```lua
function core.get_mod_storage()
  -> StorageRef
```


---

# core.get_modnames


```lua
function core.get_modnames()
  -> string[]
```


---

# core.get_modpath


```lua
function core.get_modpath(modname: string)
  -> string
```


---

# core.get_name_from_content_id


```lua
function core.get_name_from_content_id(content_id: content_id)
  -> string
```


---

# core.get_natural_light


```lua
function core.get_natural_light(pos: vector, timeofday?: number)
  -> light_level?
```


---

# core.get_node


```lua
function core.get_node(pos: vector)
  -> MapNode|{ name: string, param1: number, param2: number }
```


---

# core.get_node_boxes


```lua
function core.get_node_boxes(box_type: "collision_box"|"node_box"|"selection_box", pos: vector, node?: MapNode|{ name: string, param1: number, param2: number })
  -> number[][]
```


---

# core.get_node_drops


```lua
function core.get_node_drops(node: string|MapNodeOpt|{ name: string, param1: number?, param2: number? }, toolname?: string, tool?: ItemStack, digger?: ObjectRef, pos?: vector)
  -> string[]
```


---

# core.get_node_group


```lua
function core.get_node_group(name: any, group: any)
```


---

# core.get_node_light


```lua
function core.get_node_light(pos: vector, timeofday?: number)
  -> light_level?
```


---

# core.get_node_or_nil


```lua
function core.get_node_or_nil(pos: vector)
  -> (MapNode|{ name: string, param1: number, param2: number })?
```


---

# core.get_node_raw


```lua
function core.get_node_raw(x: number, y: number, z: number)
  -> content_id
  2. param1: number
  3. param2: number
  4. pos_ok: boolean
```


---

# core.get_node_timer


```lua
function core.get_node_timer(pos: vector)
  -> NodeTimerRef
```


---

# core.get_noiseparams


```lua
function core.get_noiseparams(name: string)
  -> NoiseParams
```


---

# core.get_objects_in_area


```lua
function core.get_objects_in_area(minp: vector, maxp: vector)
  -> ObjectRef[]
```


---

# core.get_objects_inside_radius


```lua
function core.get_objects_inside_radius(center: vector, radius: number)
  -> ObjectRef[]
```


---

# core.get_perlin


```lua
function core.get_perlin(noiseparams: NoiseParams)
  -> ValueNoise
```


---

# core.get_perlin_noise_map


```lua
function core.get_perlin_noise_map(noiseparams: NoiseParams, size: vector|{ x: number, y: number })
  -> ValueNoiseMap
```


---

# core.get_player_by_name


```lua
function core.get_player_by_name(name: string)
  -> PlayerRef
```


---

# core.get_player_information


```lua
function core.get_player_information(player_name: string)
  -> player_information
```


---

# core.get_player_window_information


```lua
function core.get_player_window_information(player_name: string)
  -> Client: window_information?
```


---

# core.get_pointed_thing_position


```lua
function core.get_pointed_thing_position(pointed_thing: pointed_thing, above: boolean)
  -> vector
```


---

# core.get_position_from_hash


```lua
function core.get_position_from_hash(hash: poshash)
  -> vector
```


---

# core.get_server_max_lag


```lua
function core.get_server_max_lag()
  -> number?
```


---

# core.get_server_status


```lua
function core.get_server_status(name: string, joined: boolean)
  -> string?
```


---

# core.get_server_uptime


```lua
function core.get_server_uptime()
  -> number
```


---

# core.get_spawn_level


```lua
function core.get_spawn_level(x: number, z: number)
  -> y: number
```


---

# core.get_timeofday


```lua
function core.get_timeofday()
  -> number
```


---

# core.get_tool_wear_after_use


```lua
function core.get_tool_wear_after_use(uses: integer, initial_wear?: integer)
  -> integer
```


---

# core.get_translator


```lua
function core.get_translator(textdomain: string|nil)
  -> S: fun(str: string, ...string):string
  2. PS: fun(str: string, str_plural: string, n: number, ...string):string
```


---

# core.get_us_time


```lua
function core.get_us_time()
  -> number
```


---

# core.get_value_noise


```lua
function core.get_value_noise(noiseparams: NoiseParams)
  -> ValueNoise
```


---

# core.get_value_noise_map


```lua
function core.get_value_noise_map(noiseparams: NoiseParams, size: vector|{ x: number, y: number })
  -> ValueNoiseMap
```


---

# core.get_version


```lua
function core.get_version()
  -> core.get_version
```


---

# core.get_version

## hash


```lua
string
```

 Full git version (only set if available), eg, "1.2.3-dev-01234567-dirty".

## is_dev


```lua
boolean
```

 Boolean value indicating whether it's a development build

## project


```lua
"Luanti"
```

These annotations are only made for luanti, so the project name is forced

## proto_max


```lua
number
```

 The maximum supported protocol version

## proto_min


```lua
number
```

 The minimum supported protocol version

## string


```lua
string
```

These annotations are made for 5.13.0 (and above i guess? or even below?)


---

# core.get_voxel_manip


```lua
function core.get_voxel_manip(p1?: vector, p2?: vector)
  -> VoxelManip
```


---

# core.get_worldpath


```lua
function core.get_worldpath()
  -> string
```


---

# core.global_exists


```lua
function core.global_exists(name: any)
  -> boolean
```


---

# core.handle_async


```lua
(async) function core.handle_async(f: function, callback: function, ...any)
```


---

# core.handle_node_drops


```lua
function core.handle_node_drops(pos: vector, drops: string[], digger: PlayerRef)
```


---

# core.has_feature


```lua
function core.has_feature(arg: string|string[])
  -> boolean
  2. missing_features: table<string, boolean>
```


---

# core.hash_node_position


```lua
function core.hash_node_position(pos: vector)
  -> poshash
```


---

# core.hud_replace_builtin


```lua
function core.hud_replace_builtin(name: "breath"|"health"|"hotbar"|"minimap", hud_definition: HudDef)
```


---

# core.hypertext_escape


```lua
function core.hypertext_escape(string: string)
  -> string
```


---

# core.inventorycube


```lua
function core.inventorycube(img1: string, img2: string, img3: string)
  -> string
```


---

# core.ipc_cas


```lua
function core.ipc_cas(key: string, old_value: any, new_value: any)
  -> success: boolean
```


---

# core.ipc_get


```lua
function core.ipc_get(key: string)
```


---

# core.ipc_poll


```lua
function core.ipc_poll(key: string, timeout: number)
  -> success: boolean
```


---

# core.ipc_set


```lua
function core.ipc_set(key: string, value: any)
```


---

# core.is_area_protected


```lua
function core.is_area_protected(pos1: vector, pos2: vector, player_name: string, interval: number)
  -> boolean
```


---

# core.is_creative_enabled


```lua
function core.is_creative_enabled(name: string)
  -> boolean
```


---

# core.is_nan


```lua
function core.is_nan(arg: any)
  -> boolean
```


---

# core.is_player


```lua
function core.is_player(obj: ObjectRef)
  -> boolean
```


---

# core.is_protected


```lua
function core.is_protected(pos: vector, name: string)
  -> boolean
```


---

# core.is_singleplayer


```lua
function core.is_singleplayer()
  -> boolean
```


---

# core.is_valid_player_name


```lua
function core.is_valid_player_name(name: string)
  -> boolean
```


---

# core.is_yes


```lua
function core.is_yes(arg: any)
  -> boolean
```


---

# core.item_drop


```lua
function core.item_drop(itemstack: ItemStack, dropper?: PlayerRef, pos: vector)
```


---

# core.item_eat


```lua
function core.item_eat(hp_change: number, replace_with_item?: string|table|ItemStack)
```


---

# core.item_pickup


```lua
function core.item_pickup(itemstack: ItemStack, picker: PlayerRef, pointed_thing: pointed_thing, time_from_last_punch: number, ...any)
  -> ItemStack
```


---

# core.item_place


```lua
function core.item_place(itemstack: ItemStack, placer: PlayerRef, pointed_thing: pointed_thing, param2?: number)
  -> ItemStack
  2. vector?
```


---

# core.item_place_node


```lua
function core.item_place_node(itemstack: ItemStack, placer: PlayerRef, pointed_thing: pointed_thing, param2?: number, prevent_after_place?: boolean)
  -> ItemStack
  2. vector?
```


---

# core.item_place_object


```lua
function core.item_place_object(itemstack: any, placer: any, pointed_thing: any)
```


---

# core.itemstring_with_color


```lua
function core.itemstring_with_color(item: string|table|ItemStack, colorstring: ColorString)
  -> string
```


---

# core.itemstring_with_palette


```lua
function core.itemstring_with_palette(item: string|table|ItemStack, palette_index: number)
  -> string
```


---

# core.kick_player


```lua
function core.kick_player(name: string, reason?: string, reconnect?: boolean)
  -> success: boolean
```


---

# core.line_of_sight


```lua
function core.line_of_sight(pos1: vector, pos2: vector)
  -> boolean
  2. (MapNode|{ name: string, param1: number, param2: number })?
```


---

# core.load_area


```lua
function core.load_area(pos1: vector, pos2?: vector)
  -> nil
```


---

# core.log


```lua
function core.log(loglevel: "action"|"error"|"info"|"none"|"verbose"...(+1), text: string)
  -> nil
```


```lua
function core.log(text: string)
  -> nil
```


---

# core.luaentities


```lua
table<integer, luaentity>
```


---

# core.mkdir


```lua
function core.mkdir(path: string)
  -> success: boolean
```


---

# core.mod_channel_join


```lua
function core.mod_channel_join(channel_name: string)
  -> ModChannel
```


---

# core.mvdir


```lua
function core.mvdir(source: string, destination: string)
  -> success: boolean
```


---

# core.node_dig


```lua
function core.node_dig(pos: vector, node: MapNode|{ name: string, param1: number, param2: number }, digger: PlayerRef)
```


---

# core.node_punch


```lua
function core.node_punch(pos: vector, node: MapNode|{ name: string, param1: number, param2: number }, puncher: PlayerRef, pointed_thing: pointed_thing)
```


---

# core.object_refs


```lua
table<integer, ObjectRef>
```


---

# core.objects_in_area


```lua
function core.objects_in_area(minp: vector, maxp: vector)
  -> function
```


---

# core.objects_inside_radius


```lua
function core.objects_inside_radius(center: vector, radius: number)
  -> function
```


---

# core.override_chatcommand


```lua
function core.override_chatcommand(name: string, redef: table)
```


---

# core.override_item


```lua
function core.override_item(name: string, redefinition: table, del_fields: table)
```


---

# core.parse_json


```lua
function core.parse_json(string: string, nullvalue?: any, return_error?: boolean)
  -> boolean?
```


---

# core.parse_relative_number


```lua
function core.parse_relative_number(arg: string, relative_to: vector)
```


---

# core.place_node


```lua
function core.place_node(pos: vector, node: MapNode|{ name: string, param1: number, param2: number }, placer?: PlayerRef)
  -> nil
```


---

# core.place_schematic


```lua
function core.place_schematic(pos: vector, schematic: schematic, rotation?: "0"|"180"|"270"|"90"|"random", replacements: table<string, string>, force_placement: boolean, flags?: string)
  -> boolean?
```


---

# core.place_schematic_on_vmanip


```lua
function core.place_schematic_on_vmanip(vmanip: VoxelManip, pos: any, schematic: schematic, rotation?: "0"|"180"|"270"|"90"|"random", replacement: table<string, string>, force_placement: boolean, flags?: string)
  -> boolean?
```


---

# core.player_exists


```lua
function core.player_exists(name: string)
  -> boolean
```


---

# core.pointed_thing_to_face_pos


```lua
function core.pointed_thing_to_face_pos(pointed_thing: pointed_thing)
  -> vector
```


---

# core.pos_to_string


```lua
function core.pos_to_string(pos: vector, decimal_places?: number)
  -> string
```


---

# core.protocol_versions


```lua
table<string, number>
```


---

# core.punch_node


```lua
function core.punch_node(pos: vector, puncher?: PlayerRef)
  -> nil
```


---

# core.raillike_group


```lua
function core.raillike_group(name: string)
  -> number
```


---

# core.raycast


```lua
function
```


---

# core.read_schematic


```lua
function core.read_schematic(schematic?: any, options?: { write_yslice_prob: ("all"|"low"|"none")? })
  -> schematic?
```


---

# core.record_protection_violation


```lua
function core.record_protection_violation(pos: vector, name: string)
```


---

# core.register_abm


```lua
function core.register_abm(abmdef: ABMDef)
```


---

# core.register_alias


```lua
function core.register_alias(alias: string|"mapgen_apple"|"mapgen_cobble"|"mapgen_desert_sand"|"mapgen_desert_stone"...(+22), original_name: string)
```


---

# core.register_alias_force


```lua
function core.register_alias_force(alias: string|"mapgen_apple"|"mapgen_cobble"|"mapgen_desert_sand"|"mapgen_desert_stone"...(+22), original_name: string)
```


---

# core.register_allow_player_inventory_action


```lua
function core.register_allow_player_inventory_action(f: fun(player: PlayerRef, action: "move"|"put"|"take", inventory: InvRef, inventory_info: inventory_info):number)
```


---

# core.register_async_dofile


```lua
function core.register_async_dofile(path: string)
```


---

# core.register_authentication_handler


```lua
function core.register_authentication_handler(auth_handler_def: table)
```


---

# core.register_biome


```lua
function core.register_biome(biome_def: BiomeDef)
```


---

# core.register_can_bypass_userlimit


```lua
function core.register_can_bypass_userlimit(f: fun(name: string, ip: string))
```


---

# core.register_chatcommand


```lua
function core.register_chatcommand(chatcommand_def: ChatCommandDef)
```


---

# core.register_craft


```lua
function core.register_craft(craft_recipe: CraftRecipe)
```


---

# core.register_craft_predict


```lua
function core.register_craft_predict(f: fun(itemstack: ItemStack, player: PlayerRef, old_crafting_grid: table, craft_inv: InvRef):ItemStack?)
```


---

# core.register_craftitem


```lua
function core.register_craftitem(name: string, itemdef: ItemDef)
```


---

# core.register_decoration


```lua
function core.register_decoration(decoration_def: DecorationDef)
```


---

# core.register_entity


```lua
function core.register_entity(name: string, entity_def: EntityDef)
```


---

# core.register_globalstep


```lua
function core.register_globalstep(f: fun(dtime: number):nil)
  -> nil
```


---

# core.register_lbm


```lua
function core.register_lbm(lbmdef: LBMDef)
```


---

# core.register_mapgen_script


```lua
function core.register_mapgen_script(path: string)
```


---

# core.register_node


```lua
function core.register_node(name: string, node_def: NodeDef)
```


---

# core.register_on_auth_fail


```lua
function core.register_on_auth_fail(f: fun(name: string, ip: string))
```


---

# core.register_on_authplayer


```lua
function core.register_on_authplayer(f: fun(name: string, ip: string, is_success: boolean))
```


---

# core.register_on_chat_message


```lua
function core.register_on_chat_message(f: fun(name: string, message: string):boolean?)
```


---

# core.register_on_chatcommand


```lua
function core.register_on_chatcommand(f: fun(name: string, command: string, params: string))
```


---

# core.register_on_cheat


```lua
function core.register_on_cheat(f: fun(ObjectRef: ObjectRef, cheat: cheat_type))
```


---

# core.register_on_craft


```lua
function core.register_on_craft(f: fun(itemstack: ItemStack, player: PlayerRef, old_crafting_grid: table, craft_inv: InvRef):ItemStack?)
```


---

# core.register_on_dieplayer


```lua
function core.register_on_dieplayer(f: fun(ObjectRef: ObjectRef, reason: PlayerHPChangeReason))
```


---

# core.register_on_dignode


```lua
function core.register_on_dignode(f: fun(pos: vector, oldnode: MapNode|{ name: string, param1: number, param2: number }, digger: ObjectRef):nil)
  -> nil
```


---

# core.register_on_generated


```lua
function core.register_on_generated(f: fun(minp: vector, maxp: vector, blockseed: number):nil)
```


```lua
(async) function core.register_on_generated(f: fun(vmanip: VoxelManip, minp: vector, maxp: vector, blockseed: number):nil)
```


---

# core.register_on_item_eat


```lua
function core.register_on_item_eat(f: fun(hp_change: number, replace_with_item?: ItemStack, itemstack: ItemStack, user: PlayerRef, pointed_thing: pointed_thing):ItemStack?)
```


---

# core.register_on_item_pickup


```lua
function core.register_on_item_pickup(f: fun(itemstack: ItemStack, picker: PlayerRef, pointed_thing: pointed_thing, time_from_last_punch: number, ...any):ItemStack?)
```


---

# core.register_on_joinplayer


```lua
function core.register_on_joinplayer(f: fun(ObjectRef: ObjectRef, last_login: string))
```


---

# core.register_on_leaveplayer


```lua
function core.register_on_leaveplayer(f: fun(ObjectRef: ObjectRef, timed_out: string))
```


---

# core.register_on_liquid_transformed


```lua
function core.register_on_liquid_transformed(f: fun(pos_list: vector[], node_list: MapNode|{ name: string, param1: number, param2: number }[]))
```


---

# core.register_on_mapblocks_changed


```lua
function core.register_on_mapblocks_changed(f: fun(modified_blocks: table<number, boolean>, modified_block_count: number))
```


---

# core.register_on_modchannel_message


```lua
function core.register_on_modchannel_message(f: fun(channel_name: string, sender: string|PlayerRef, message: string))
```


---

# core.register_on_mods_loaded


```lua
function core.register_on_mods_loaded(f: fun():nil)
  -> nil
```


---

# core.register_on_newplayer


```lua
function core.register_on_newplayer(f: fun(ObjectRef: ObjectRef):nil)
```


---

# core.register_on_placenode


```lua
function core.register_on_placenode(f: fun(pos: vector, newnode: MapNode|{ name: string, param1: number, param2: number }, placer: ObjectRef, oldnode: MapNode|{ name: string, param1: number, param2: number }, itemstack: ItemStack, pointed_thing: pointed_thing):boolean?)
  -> nil
```


---

# core.register_on_player_hpchange


```lua
function core.register_on_player_hpchange(f: fun(player: ObjectRef, hp_change: number, reason: PlayerHPChangeReason):number?, modifier?: boolean)
```


---

# core.register_on_player_inventory_action


```lua
function core.register_on_player_inventory_action(f: fun(player: PlayerRef, action: "move"|"put"|"take", inventory: InvRef, inventory_info: inventory_info):nil)
```


---

# core.register_on_player_receive_fields


```lua
function core.register_on_player_receive_fields(f: fun(player: PlayerRef, formname: string, fields: formspec_fields):boolean?)
```


---

# core.register_on_prejoinplayer


```lua
function core.register_on_prejoinplayer(f: fun(name: string, ip: string))
```


---

# core.register_on_priv_grant


```lua
function core.register_on_priv_grant(f: fun(name: string, granter?: PlayerRef, priv: string))
```


---

# core.register_on_priv_revoke


```lua
function core.register_on_priv_revoke(f: fun(name: string, revoker?: PlayerRef, priv: string))
```


---

# core.register_on_protection_violation


```lua
function core.register_on_protection_violation(f: fun(pos: vector, name: string))
```


---

# core.register_on_punchnode


```lua
function core.register_on_punchnode(f: fun(pos: vector, node: MapNode|{ name: string, param1: number, param2: number }, puncher: ObjectRef, pointed_thing: pointed_thing):nil)
  -> nil
```


---

# core.register_on_punchplayer


```lua
function core.register_on_punchplayer(f: fun(player: ObjectRef, hitter: ObjectRef, time_from_last_punch?: number, tool_capabilities?: tool_capabilities, dir: vector, damage: number):boolean?)
```


---

# core.register_on_respawnplayer


```lua
function core.register_on_respawnplayer(f: fun(ObjectRef: ObjectRef))
```


---

# core.register_on_rightclickplayer


```lua
function core.register_on_rightclickplayer(f: fun(player: ObjectRef, clicker: ObjectRef))
```


---

# core.register_on_shutdown


```lua
function core.register_on_shutdown(f: fun():nil)
  -> nil
```


---

# core.register_portable_metatable


```lua
function core.register_portable_metatable(name: string, mt: table)
```


---

# core.register_privilege


```lua
function core.register_privilege(name: string, def: PrivDef)
```


---

# core.register_schematic


```lua
function core.register_schematic(schem_def: table)
```


---

# core.register_tool


```lua
function core.register_tool(name: string, itemdef: ItemDef)
```


---

# core.registered_abms


```lua
ABMDef[]
```


---

# core.registered_aliases


```lua
table<string, string>
```


---

# core.registered_allow_player_inventory_actions


```lua
function[]
```


---

# core.registered_biomes


```lua
table<string|integer, BiomeDef>
```


---

# core.registered_can_bypass_userlimit


```lua
function[]
```


---

# core.registered_chatcommands


```lua
table<string, ChatCommandDef>
```


---

# core.registered_craft_predicts


```lua
function[]
```


---

# core.registered_craftitems


```lua
table<string, ItemDef>
```


---

# core.registered_decorations


```lua
table<string|integer, DecorationDef>
```


---

# core.registered_entities


```lua
table<string, EntityDef>
```


---

# core.registered_globalsteps


```lua
function[]
```


---

# core.registered_items


```lua
table<string, ItemDef>
```


---

# core.registered_lbms


```lua
LBMDef[]
```


---

# core.registered_nodes


```lua
table<string, NodeDef>
```


---

# core.registered_on_authplayers


```lua
function[]
```


---

# core.registered_on_chat_messages


```lua
function[]
```


---

# core.registered_on_chatcommands


```lua
function[]
```


---

# core.registered_on_cheats


```lua
function[]
```


---

# core.registered_on_crafts


```lua
function[]
```


---

# core.registered_on_dieplayers


```lua
function[]
```


---

# core.registered_on_dignodes


```lua
function[]
```


---

# core.registered_on_generateds


```lua
function[]
```


---

# core.registered_on_item_eats


```lua
function[]
```


---

# core.registered_on_item_pickups


```lua
function[]
```


---

# core.registered_on_joinplayers


```lua
function[]
```


---

# core.registered_on_leaveplayers


```lua
function[]
```


---

# core.registered_on_liquid_transformed


```lua
function[]
```


---

# core.registered_on_mapblocks_changed


```lua
function[]
```


---

# core.registered_on_modchannel_message


```lua
function[]
```


---

# core.registered_on_mods_loaded


```lua
function[]
```


---

# core.registered_on_newplayers


```lua
function[]
```


---

# core.registered_on_placenodes


```lua
function[]
```


---

# core.registered_on_player_inventory_actions


```lua
function[]
```


---

# core.registered_on_player_receive_fields


```lua
function[]
```


---

# core.registered_on_prejoinplayers


```lua
function[]
```


---

# core.registered_on_priv_grant


```lua
function[]
```


---

# core.registered_on_priv_revoke


```lua
function[]
```


---

# core.registered_on_protection_violation


```lua
function[]
```


---

# core.registered_on_punchnodes


```lua
function[]
```


---

# core.registered_on_punchplayers


```lua
function[]
```


---

# core.registered_on_respawnplayers


```lua
function[]
```


---

# core.registered_on_rightclickplayers


```lua
function[]
```


---

# core.registered_on_shutdown


```lua
function[]
```


---

# core.registered_ores


```lua
table<string|integer, OreDef>
```


---

# core.registered_privileges


```lua
table<string, PrivDef>
```


---

# core.registered_tools


```lua
table<string, ItemDef>
```


---

# core.remove_detached_inventory


```lua
function core.remove_detached_inventory(name: string)
  -> boolean
```


---

# core.remove_node


```lua
function core.remove_node(pos: vector)
```


---

# core.remove_player


```lua
function core.remove_player(name: string)
  -> 0|1|2
```


---

# core.remove_player_auth


```lua
function core.remove_player_auth(name: string)
  -> success: boolean
```


---

# core.request_http_api


```lua
function core.request_http_api()
  -> HTTPApiTable?
```


---

# core.request_insecure_environment


```lua
function core.request_insecure_environment()
  -> table
```


---

# core.request_shutdown


```lua
function core.request_shutdown(message?: string, reconnect?: boolean, delay?: number)
```


---

# core.rgba


```lua
function core.rgba(red: number, green: number, blue: number, alpha?: number)
  -> string
```


---

# core.rmdir


```lua
function core.rmdir(path: string, recursive?: boolean)
  -> success: boolean
```


---

# core.rollback_get_node_actions


```lua
function core.rollback_get_node_actions(pos: vector, range: number, seconds: number, limit: number)
  -> { [1]: PlayerRef, [2]: vector, [3]: number, [4]: MapNode|{ name: string, param1: number, param2: number }, [5]: MapNode|{ name: string, param1: number, param2: number } }[]
```


---

# core.rollback_revert_actions_by


```lua
function core.rollback_revert_actions_by(actor: string, seconds: number)
  -> boolean
  2. log_messages: string[]
```


---

# core.rotate_and_place


```lua
function core.rotate_and_place(itemstack: ItemStack, placer: PlayerRef, pointed_thing: pointed_thing, infinitestacks?: boolean, orient_flags?: { invert_wall: boolean?, force_wall: boolean?, force_ceiling: boolean?, force_floor: boolean?, force_facedir: boolean? }, prevent_after_place?: boolean)
  -> integer
```


---

# core.rotate_node


```lua
function core.rotate_node(itemstack: ItemStack, placer: PlayerRef, pointed_thing: pointed_thing)
  -> nil
```


---

# core.safe_file_write


```lua
function core.safe_file_write(path: string, content: string)
  -> success: boolean
```


---

# core.save_gen_notify


```lua
function core.save_gen_notify(id: string, data: any)
```


---

# core.send_join_message


```lua
function core.send_join_message(player_name: string)
```


---

# core.send_leave_message


```lua
function core.send_leave_message(player_name: string, timed_out: boolean)
```


---

# core.serialize


```lua
function core.serialize(table: any)
  -> string
```


---

# core.serialize_schematic


```lua
function core.serialize_schematic(schematic: schematic, format: "lua"|"mts", options?: { lua_use_comments: boolean?, lua_num_indent_spaces: number? })
```


---

# core.set_gen_notify


```lua
function core.set_gen_notify(flags: string, deco_ids: string[], custom_ids: string[])
```


---

# core.set_mapgen_setting


```lua
function core.set_mapgen_setting(name: string, value: string, override_meta?: boolean)
  -> nil
```


---

# core.set_mapgen_setting_noiseparams


```lua
function core.set_mapgen_setting_noiseparams(name: string, value: NoiseParams, override_meta?: boolean)
```


---

# core.set_node


```lua
function core.set_node(pos: vector, node: MapNodeOpt|{ name: string, param1: number?, param2: number? })
```


---

# core.set_noiseparams


```lua
function core.set_noiseparams(name: string, noiseparams: NoiseParams, set_default?: boolean)
  -> nil
```


---

# core.set_timeofday


```lua
function core.set_timeofday(val: number)
```


---

# core.settings


```lua
Settings
```


---

# core.sha1


```lua
function core.sha1(data: string, raw?: boolean)
  -> string
```


---

# core.sha256


```lua
function core.sha256(data: string, raw?: boolean)
  -> string
```


---

# core.show_death_screen


```lua
function core.show_death_screen(player: PlayerRef, reason: PlayerHPChangeReason)
```


---

# core.show_formspec


```lua
function core.show_formspec(playername: string, formname: string, formspec: string)
  -> nil
```


---

# core.sound_fade


```lua
function core.sound_fade(handle: sound_handle, step: number, gain: number)
```


---

# core.sound_play


```lua
function core.sound_play(spec: SimpleSoundSpec, parameters: sound_params, ephemeral: boolean)
  -> sound_handle?
```


---

# core.sound_stop


```lua
function core.sound_stop(handle: sound_handle)
```


---

# core.spawn_falling_node


```lua
function core.spawn_falling_node(pos: vector)
  -> boolean
```


```lua
function core.spawn_falling_node(pos: any)
  -> boolean
  2. unknown|nil
```


---

# core.spawn_tree


```lua
function core.spawn_tree(pos: vector, lsystem: lsystem)
  -> nil
```


---

# core.spawn_tree_on_vmanip


```lua
function core.spawn_tree_on_vmanip(vmanip: VoxelManip, pos: vector, treedef: lsystem)
  -> nil
```


---

# core.string_to_area


```lua
function core.string_to_area(str: string, relative_to?: vector)
  -> vector?
  2. vector?
```


---

# core.string_to_pos


```lua
function core.string_to_pos(string: string)
  -> vector
```


---

# core.strip_background_colors


```lua
function core.strip_background_colors(str: string)
  -> string
```


---

# core.strip_colors


```lua
function core.strip_colors(str: string)
  -> string
```


---

# core.strip_foreground_colors


```lua
function core.strip_foreground_colors(str: string)
  -> string
```


---

# core.strip_param2_color


```lua
function core.strip_param2_color(param2: number, paramtype2: string)
  -> number?
```


---

# core.swap_node


```lua
function core.swap_node(pos: vector, node: MapNodeOpt|{ name: string, param1: number?, param2: number? })
```


---

# core.time_to_day_night_ratio


```lua
function core.time_to_day_night_ratio(time_of_day: string)
  -> number
```


---

# core.translate


```lua
function core.translate(textdomain: string, str: string, ...string)
```


---

# core.translate_n


```lua
function core.translate_n(textdomain: string, str: string, str_plural: string, n: number, ...string)
```


---

# core.unban_player_or_ip


```lua
function core.unban_player_or_ip(ip_or_name: string)
```


---

# core.unregister_biome


```lua
function core.unregister_biome(name: string)
```


---

# core.unregister_chatcommand


```lua
function core.unregister_chatcommand(name: string)
```


---

# core.unregister_item


```lua
function core.unregister_item(name: string)
```


---

# core.urlencode


```lua
function core.urlencode(str: string)
  -> string
```


---

# core.wallmounted_to_dir


```lua
function core.wallmounted_to_dir(wallmounted: number)
  -> vector
```


---

# core.wrap_text


```lua
function core.wrap_text(str: string, limit: integer, as_table?: boolean)
  -> string
```


---

# core.write_json


```lua
function core.write_json(data: any, styled?: boolean)
  -> string
```


---

# core.yaw_to_dir


```lua
function core.yaw_to_dir(yaw: number)
  -> vector
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

# custom.node_defs._falling_node

## gravity


```lua
(vector.Vector)?
```


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

# detached_inventory_callbacks

## allow_move


```lua
fun(inv: InvRef, from_list: ItemStack[], from_index: number, to_list: ItemStack[], to_index: number, count: number, player: PlayerRef)?
```

## allow_put


```lua
fun(inv: InvRef, listname: string, index: number, stack: ItemStack, player: PlayerRef)?
```

## allow_take


```lua
fun(inv: InvRef, listname: string, index: number, stack: ItemStack, player: PlayerRef)?
```

## on_move


```lua
fun(inv: InvRef, from_list: ItemStack[], from_index: number, to_list: ItemStack[], to_index: number, count: number, player: PlayerRef)?
```

## on_put


```lua
fun(inv: InvRef, listname: string, index: number, stack: ItemStack, player: PlayerRef)?
```

## on_take


```lua
fun(inv: InvRef, listname: string, index: number, stack: ItemStack, player: PlayerRef)?
```


---

# dofile


```lua
function dofile(filename?: string)
  -> ...any
```


---

# dump


```lua
function dump(value: any, indent: string)
  -> string
```


---

# dump2


```lua
function dump2(obj: any, name?: string, dumped?: table)
  -> string
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

## split


```lua
function string.split(str: string, separator: string, include_empty?: boolean, max_splits?: integer, sep_is_pattern?: boolean)
  -> string[]
```

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

# formspec_fields


---

# function


---

# gcoptions


---

# gen_notify

## cave_begin


```lua
vector?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## cave_end


```lua
vector?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## custom


```lua
table<string, any>
```

## dungeon


```lua
vector?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## large_cave_begin


```lua
vector?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## large_cave_end


```lua
vector?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## temple


```lua
vector?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it



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

# hb


```lua
table
```


---

# hb.change_hudbar


```lua
function hb.change_hudbar(player: any, identifier: any, new_value: any, new_max_value: any, new_icon: any, new_bgicon: any, new_bar: any, new_label: any, new_text_color: any)
  -> boolean
```


---

# hb.get_hudbar_identifiers


```lua
function hb.get_hudbar_identifiers()
  -> table
```


---

# hb.get_hudbar_position_index


```lua
function hb.get_hudbar_position_index(identifier: any)
  -> integer
```


---

# hb.get_hudbar_state


```lua
function hb.get_hudbar_state(player: any, identifier: any)
  -> table|nil
```


---

# hb.get_hudtable


```lua
function hb.get_hudtable(identifier: any)
  -> unknown
```


---

# hb.hide_hudbar


```lua
function hb.hide_hudbar(player: any, identifier: any)
  -> boolean
```


---

# hb.hudbars_count


```lua
integer
```


```lua
integer
```


---

# hb.hudtables


```lua
table
```


---

# hb.init_hudbar


```lua
function hb.init_hudbar(player: any, identifier: any, start_value: any, start_max: any, start_hidden: any)
  -> boolean
```


---

# hb.load_setting


```lua
function hb.load_setting(sname: any, stype: any, defaultval: any, valid_values: any)
  -> number|unknown
```


---

# hb.players


```lua
table
```


---

# hb.register_hudbar


```lua
function hb.register_hudbar(identifier: any, text_color: any, label: any, textures: any, default_start_value: any, default_start_max: any, default_start_hidden: any, format_string: any, format_string_config: any)
```


---

# hb.registered_slots


```lua
table
```


---

# hb.settings


```lua
table
```


---

# hb.settings.alignment_pattern


```lua
number|unknown
```


---

# hb.settings.autohide_breath


```lua
number|unknown
```


---

# hb.settings.bar_type


```lua
number|unknown
```


---

# hb.settings.forceload_default_hudbars


```lua
number|unknown
```


---

# hb.settings.hide_labels


```lua
number|unknown
```


---

# hb.settings.max_bar_length


```lua
integer
```


---

# hb.settings.pos_left


```lua
table
```


---

# hb.settings.pos_left.x


```lua
number|unknown
```


---

# hb.settings.pos_left.y


```lua
number|unknown
```


---

# hb.settings.pos_right


```lua
table
```


---

# hb.settings.pos_right.x


```lua
number|unknown
```


---

# hb.settings.pos_right.y


```lua
number|unknown
```


---

# hb.settings.sorting


```lua
table
```


```lua
table
```


---

# hb.settings.sorting_reverse


```lua
table
```


```lua
table
```


---

# hb.settings.start_offset_left


```lua
table
```


---

# hb.settings.start_offset_left.x


```lua
number|unknown
```


```lua
number|unknown
```


---

# hb.settings.start_offset_left.y


```lua
number|unknown
```


```lua
number|unknown
```


---

# hb.settings.start_offset_right


```lua
table
```


---

# hb.settings.start_offset_right.x


```lua
number|unknown
```


```lua
number|unknown
```


---

# hb.settings.start_offset_right.y


```lua
number|unknown
```


```lua
number|unknown
```


---

# hb.settings.statbar_length


```lua
integer
```


---

# hb.settings.tick


```lua
number|unknown
```


---

# hb.settings.vmargin


```lua
number|unknown
```


---

# hb.unhide_hudbar


```lua
function hb.unhide_hudbar(player: any, identifier: any)
  -> boolean
```


---

# hb.value_to_barlength


```lua
function hb.value_to_barlength(value: any, max: any)
  -> integer
```


---

# hookmask


---

# infowhat


---

# integer


---

# inventory_info

## move


```lua
{ from_list: string, to_list: string, from_index: number, to_index: number, count: number }?
```

## put


```lua
{ listname: string, index: string, stack: ItemStack }
```

## take


```lua
{ listname: string, index: string, stack: ItemStack }
```


---

# inventory_location

## name


```lua
string?
```

## pos


```lua
vector?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## type


```lua
"detached"|"node"|"player"
```


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

# item_alias


---

# iter


```lua
function iter(minx: number, miny: number, minz: number, maxx: number, maxy: number, maxz: number)
  -> function
```


---

# iterp


```lua
function iterp(minp: vector, maxp: vector)
  -> function
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

# job

## cancel


```lua
fun()
```

 * `job:cancel()`
     * Cancels the job function from being called


---

# light


---

# light_level


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

# loglevel


---

# lsystem

## angle


```lua
number
```

in degrees

## axiom


```lua
string
```

## fruit


```lua
string
```

fruit node name

## fruit_chance


```lua
number
```

## iterations


```lua
number
```

max # of iterations, usually 2 - 5

## leaves


```lua
string
```

leaves node name

## leaves2


```lua
string
```

secondary leaves node name

## leaves2_chance


```lua
number
```

chance to replace leaves with leaves2

## random_level


```lua
number
```

factor to lower number of iterations, usually 0 - 3

## rules_a


```lua
string
```

## rules_b


```lua
string
```

## rules_d


```lua
string
```

## seed


```lua
number
```

## thin_branches


```lua
boolean
```

## trunk


```lua
string
```

trunk node name


---

# luaentity

## get_staticdata


```lua
fun(self: luaentity)
```

## name


```lua
string
```

## object


```lua
ObjectRef
```

 `ObjectRef`
 -----------

 Moving things in the game are generally these.
 This is basically a reference to a C++ `ServerActiveObject`.

 ### Advice on handling `ObjectRefs`

 When you receive an `ObjectRef` as a callback argument or from another API
 function, it is possible to store the reference somewhere and keep it around.
 It will keep functioning until the object is unloaded or removed.

 However, doing this is **NOT** recommended - `ObjectRefs` should be "let go"
 of as soon as control is returned from Lua back to the engine.

 Doing so is much less error-prone and you will never need to wonder if the
 object you are working with still exists.

 If this is not feasible, you can test whether an `ObjectRef` is still valid
 via `object:is_valid()`.

 Getters may be called for invalid objects and will return nothing then.
 All other methods should not be called on invalid objects.

 ### Attachments

 It is possible to attach objects to other objects (`set_attach` method).

 When an object is attached, it is positioned relative to the parent's position
 and rotation. `get_pos` and `get_rotation` will always return the parent's
 values and changes via their setter counterparts are ignored.

 To change position or rotation call `set_attach` again with the new values.

 **Note**: Just like model dimensions, the relative position in `set_attach`
 must be multiplied by 10 compared to world positions.

 It is also possible to attach to a bone of the parent object. In that case the
 child will follow movement and rotation of that bone.


## on_activate


```lua
fun(self: luaentity, staticdata: string, dtime_s: number)
```

## on_attach_child


```lua
fun(self: luaentity, child: ObjectRef)
```

## on_deactivate


```lua
fun(self: luaentity, removal: boolean)
```

 * `on_deactivate(self, removal)`
     * Called when the object is about to get removed or unloaded.
     * `removal`: boolean indicating whether the object is about to get removed.
       Calling `object:remove()` on an active object will call this with `removal=true`.
       The mapblock the entity resides in being unloaded will call this with `removal=false`.
     * Note that this won't be called if the object hasn't been activated in the first place.
       In particular, `core.clear_objects({mode = "full"})` won't call this,
       whereas `core.clear_objects({mode = "quick"})` might call this.

## on_death


```lua
fun(self: luaentity, killer?: ObjectRef)
```

## on_detach


```lua
fun(self: luaentity, parent: ObjectRef)
```

## on_detach_child


```lua
fun(self: luaentity, child: ObjectRef)
```

## on_punch


```lua
fun(self: luaentity, puncher?: ObjectRef, time_from_last_punch?: number, tool_capabilities?: tool_capabilities, dir: vector, damage: number):boolean
```

## on_rightclick


```lua
fun(self: luaentity, clicker: ObjectRef)
```

## on_step


```lua
fun(self: luaentity, dtime: number, moveresult: moveresult)
```


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

# math.factorial


```lua
function math.factorial(x: number)
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

# math.hypot


```lua
function math.hypot(x: number, y: number)
  -> number
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

# math.round


```lua
function math.round(x: number)
  -> number
```


---

# math.sign


```lua
function math.sign(x: number, tolerance?: number)
  -> number
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

## factorial


```lua
function math.factorial(x: number)
  -> number
```

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


## hypot


```lua
function math.hypot(x: number, y: number)
  -> number
```

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

## round


```lua
function math.round(x: number)
  -> number
```

## sign


```lua
function math.sign(x: number, tolerance?: number)
  -> number
```

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

## CONTENT_AIR


```lua
content_id
```

## CONTENT_IGNORE


```lua
content_id
```

## CONTENT_UNKNOWN


```lua
content_id
```

 HACK:

## EMERGE_CANCELLED


```lua
core.EMERGE_CANCELLED
```

## EMERGE_ERRORED


```lua
core.EMERGE_ERRORED
```

## EMERGE_FROM_DISK


```lua
core.EMERGE_FROM_DISK
```

## EMERGE_FROM_MEMORY


```lua
core.EMERGE_FROM_MEMORY
```

## EMERGE_GENERATED


```lua
core.EMERGE_GENERATED
```

## add_entity


```lua
function core.add_entity(pos: vector, name: string, staticdata?: string)
  -> luaentity?
```

 * `core.add_entity(pos, name, [staticdata])`: Spawn Lua-defined entity at
   position.
     * Returns `ObjectRef`, or `nil` if failed
     * Entities with `static_save = true` can be added also
       to unloaded and non-generated blocks.

## add_item


```lua
function core.add_item(pos: vector, item: ItemStack)
  -> luaentity?
```

 * `core.add_item(pos, item)`: Spawn item
     * Returns `ObjectRef`, or `nil` if failed
     * Items can be added also to unloaded and non-generated blocks.

## add_node


```lua
function
```

 Alias to core.set_node
 Unofficial note: I think you should be strict and only use `core.set_node`

## add_particle


```lua
function core.add_particle(particle_def: Particle)
```

 Unofficial note: Prefer not doing 100 000 particles in a single globalstep
 Because that will make the network scream, with no way to debug it
 Instead, invest time into particlespawners, invest time into creating an issue on luanti github, invest time into creating a client side mod

## add_particlespawner


```lua
function core.add_particlespawner(particlespawner_def: ParticleSpawner)
  -> -1|ParticleSpawner_id
```

 * Add a `ParticleSpawner`, an object that spawns an amount of particles
   over `time` seconds.
 * Returns an `id`, and -1 if adding didn't succeed

```lua
--  Unofficial note: Intentionally obscured type, i'll let you know a secret... it's a number, but don't act like it's a number
return #1:
    | -1
```

## after


```lua
function core.after(time: number, f: function, ...any)
  -> job
```

 * `core.after(time, func, ...)`: returns job table to use as below.
     * Call the function `func` after `time` seconds, may be fractional
     * Optional: Variable number of arguments that are passed to `func`
     * Jobs set for earlier times are executed earlier. If multiple jobs expire
       at exactly the same time, then they are executed in registration order.
     * `time` is a lower bound. The job is executed in the first server-step that
       started at least `time` seconds after the last time a server-step started,
       measured with globalstep dtime.
     * If `time` is `0`, the job is executed in the next step.

## ban_player


```lua
function core.ban_player(name: string)
  -> success: boolean
```

 * `core.ban_player(name)`: ban the IP of a currently connected player
     * Returns boolean indicating success

## bulk_set_node


```lua
function core.bulk_set_node(posarr: vector[], node: MapNodeOpt|{ name: string, param1: number?, param2: number? })
```

## bulk_swap_node


```lua
function core.bulk_swap_node(posarr: vector[], node: MapNodeOpt|{ name: string, param1: number?, param2: number? })
```

 * `core.bulk_swap_node({pos1, pos2, pos3, ...}, node)`
     * Equivalent to `core.swap_node` but in bulk.

## calculate_knockback


```lua
function core.calculate_knockback(player: PlayerRef, hitter: ObjectRef, time_from_last_punch: number, tool_capabilities: vector, dir: vector, distance: number, damage: any)
```

 * `core.calculate_knockback(player, hitter, time_from_last_punch,
   tool_capabilities, dir, distance, damage)`
     * Returns the amount of knockback applied on the punched player.
     * Arguments are equivalent to `register_on_punchplayer`, except the following:
         * `distance`: distance between puncher and punched player
     * This function can be overridden by mods that wish to modify this behavior.
     * You may want to cache and call the old function to allow multiple mods to
       change knockback behavior.

## cancel_shutdown_requests


```lua
function core.cancel_shutdown_requests()
```

 * `core.cancel_shutdown_requests()`: cancel current delayed shutdown

## chat_send_all


```lua
function core.chat_send_all(text: string)
  -> nil
```

## chat_send_player


```lua
function core.chat_send_player(name: string, text: string)
  -> nil
```

## check_for_falling


```lua
function core.check_for_falling(pos: vector)
```

 * `core.check_for_falling(pos)`
     * causes an unsupported `group:falling_node` node to fall and causes an
       unattached `group:attached_node` node to fall.
     * spread these updates to neighbors and can cause a cascade
       of nodes to fall.

## check_single_for_falling


```lua
function core.check_single_for_falling(pos: vector)
```

 Unofficial note: You can override this one for your own custom cool falling blocks
 * `core.check_single_for_falling(pos)`
     * causes an unsupported `group:falling_node` node to fall and causes an
       unattached `group:attached_node` node to fall.
     * does not spread these updates to neighbors.

## clear_craft


```lua
function core.clear_craft(recipe: CraftRecipe)
```

## clear_objects


```lua
function core.clear_objects(opt?: "full"|"quick")
```

 * `core.clear_objects([options])`
     * Clear all objects in the environment
     * Takes an optional table as an argument with the field `mode`.
         * mode = `"full"`: Load and go through every mapblock, clearing
                             objects (default).
         * mode = `"quick"`: Clear objects immediately in loaded mapblocks,
                             clear objects in unloaded mapblocks only when the
                             mapblocks are next activated.

```lua
opt:
    | "full"
    | "quick"
```

## clear_registered_biomes


```lua
function core.clear_registered_biomes()
  -> nil
```

 * `core.clear_registered_biomes()`
     * Clears all biomes currently registered.
     * Warning: Clearing and re-registering biomes alters the biome to biome ID
       correspondences, so any decorations or ores using the 'biomes' field must
       afterwards be cleared and re-registered.

## clear_registered_decorations


```lua
function core.clear_registered_decorations()
```

## clear_registered_ores


```lua
function core.clear_registered_ores()
```

## clear_registered_schematics


```lua
function core.clear_registered_schematics()
```

## close_formspec


```lua
function core.close_formspec(playername: string, formname: string)
  -> nil
```

 * `core.close_formspec(playername, formname)`
     * `playername`: name of player to close formspec
     * `formname`: has to exactly match the one given in `show_formspec`, or the
       formspec will not close.
     * calling `show_formspec(playername, formname, "")` is equal to this
       expression.
     * to close a formspec regardless of the formname, call
       `core.close_formspec(playername, "")`.
       **USE THIS ONLY WHEN ABSOLUTELY NECESSARY!**

## colorize


```lua
function core.colorize(color: ColorString, message: string)
  -> string
```

 Equivalent to: core.get_color_escape_sequence(color) .. message .. core.get_color_escape_sequence("#ffffff")
 (Unofficial note: this is mostly for formspec UI elements)

## colorspec_to_bytes


```lua
function core.colorspec_to_bytes(colorspec: ColorSpec)
  -> string
```

 Layout: RGBA

## colorspec_to_colorstring


```lua
function core.colorspec_to_colorstring(colorspec: ColorSpec)
  -> ColorString
```

 Colorspec to hex basically

## colorspec_to_table


```lua
function core.colorspec_to_table(colorspec: ColorSpec)
  -> { r: number, g: number, b: number, a: number }
```

## compare_block_status


```lua
function core.compare_block_status(pos: vector, condition: string|"active"|"emerging"|"loaded"|"unknown")
  -> boolean?
```

 * `core.compare_block_status(pos, condition)`
     * Checks whether the mapblock at position `pos` is in the wanted condition.
     * `condition` may be one of the following values:
         * `"unknown"`: not in memory
         * `"emerging"`: in the queue for loading from disk or generating
         * `"loaded"`: in memory but inactive (no ABMs are executed)
         * `"active"`: in memory and active
         * Other values are reserved for future functionality extensions
     * Return value, the comparison status:
         * `false`: Mapblock does not fulfill the wanted condition
         * `true`: Mapblock meets the requirement
         * `nil`: Unsupported `condition` value

```lua
condition:
    | "unknown"
    | "emerging"
    | "loaded"
    | "active"
```

## compress


```lua
function core.compress(data: string, method: "deflate"|"zstd", ...any)
  -> string
```

 * `core.compress(data, method, ...)`: returns `compressed_data`
     * Compress a string of data.
     * `method` is a string identifying the compression method to be used.
     * Supported compression methods:
         * Deflate (zlib): `"deflate"`
         * Zstandard: `"zstd"`
     * `...` indicates method-specific arguments. Currently defined arguments
       are:
         * Deflate: `level` - Compression level, `0`-`9` or `nil`.
         * Zstandard: `level` - Compression level. Integer or `nil`. Default `3`.
         Note any supported Zstandard compression level could be used here,
         but these are subject to change between Zstandard versions.

```lua
method:
    | "zstd"
    | "deflate"
```

## cpdir


```lua
function core.cpdir(source: string, destination: string)
  -> success: boolean
```

## create_detached_inventory


```lua
function core.create_detached_inventory(name: string, callbacks: nil, player_name?: string)
  -> InvRef
```

## create_schematic


```lua
function core.create_schematic(p1: vector, p2: vector, probabilities: { pos: vector, prob: number }[], filename: string, slice_prob_list: { ypos: number, prob: number }[])
```

 * `core.create_schematic(p1, p2, probability_list, filename, slice_prob_list)`
     * Create a schematic from the volume of map specified by the box formed by
       p1 and p2.
     * Apply the specified probability and per-node force-place to the specified
       nodes according to the `probability_list`.
         * `probability_list` is an array of tables containing two fields, `pos`
           and `prob`.
             * `pos` is the 3D vector specifying the absolute coordinates of the
               node being modified,
             * `prob` is an integer value from `0` to `255` that encodes
               probability and per-node force-place. Probability has levels
               0-127, then 128 may be added to encode per-node force-place.
               For probability stated as 0-255, divide by 2 and round down to
               get values 0-127, then add 128 to apply per-node force-place.
             * If there are two or more entries with the same pos value, the
               last entry is used.
             * If `pos` is not inside the box formed by `p1` and `p2`, it is
               ignored.
             * If `probability_list` equals `nil`, no probabilities are applied.
     * Apply the specified probability to the specified horizontal slices
       according to the `slice_prob_list`.
         * `slice_prob_list` is an array of tables containing two fields, `ypos`
           and `prob`.
             * `ypos` indicates the y position of the slice with a probability
               applied, the lowest slice being `ypos = 0`.
             * If slice probability list equals `nil`, no slice probabilities
               are applied.
     * Saves schematic in the Luanti Schematic format to filename.

@*param* `probabilities` — unwanted commentary: wow that seems inefficient, good luck!

## debug


```lua
function core.debug(...any)
  -> nil
```

 Unofficial note: I made it deprecated because this should NOT be in any production code, and you should use something better tbh, like dbg.pp (from lars's dbg mod)
 * Equivalent to `core.log(table.concat({...}, "\t"))`

## decode_base64


```lua
function core.decode_base64(string: string)
  -> string
```

 * `core.decode_base64(string)`: returns string or nil on failure
     * Padding characters are only supported starting at version 5.4.0, where
       5.5.0 and newer perform proper checks.
     * Decodes a string encoded in base64.

## decompress


```lua
function core.decompress(compressed_data: string, method: "deflate"|"zstd", ...nil)
  -> string
```

 * `core.decompress(compressed_data, method, ...)`: returns data
     * Decompress a string of data using the algorithm specified by `method`.
     * See documentation on `core.compress()` for supported compression
       methods.
     * `...` indicates method-specific arguments. Currently, no methods use this

```lua
method:
    | "zstd"
    | "deflate"
```

## delete_area


```lua
function core.delete_area(pos1: vector, pos2: vector)
  -> nil
```

 * `core.delete_area(pos1, pos2)`
     * delete all mapblocks in the area from pos1 to pos2, inclusive

## delete_particlespawner


```lua
function core.delete_particlespawner(id: ParticleSpawner_id, player?: PlayerRef)
```

 * `core.delete_particlespawner(id, player)`
     * Delete `ParticleSpawner` with `id` (return value from
       `core.add_particlespawner`).
     * If playername is specified, only deletes on the player's client,
       otherwise on all clients.

## deserialize


```lua
function core.deserialize(string: string, safe?: boolean)
  -> any
```

 * `core.deserialize(string[, safe])`: returns a table
     * Convert a string returned by `core.serialize` into a table
     * `string` is loaded in an empty sandbox environment.
     * Will load functions if `safe` is `false` or omitted.
       Although these functions cannot directly access the global environment,
       they could bypass this restriction with maliciously crafted Lua bytecode
       if mod security is disabled.
     * Will silently strip functions embedded via calls to `loadstring`
       (typically bytecode dumped by `core.serialize`) if `safe` is `true`.
       You should not rely on this if possible.
       * Example: `core.deserialize("return loadstring('')", true)` will be `nil`.
     * This function should not be used on untrusted data, regardless of the
      value of `safe`. It is fine to serialize then deserialize user-provided
      data, but directly providing user input to deserialize is always unsafe.
     * Example: `deserialize('return { ["foo"] = "bar" }')`,
       returns `{foo="bar"}`
     * Example: `deserialize('print("foo")')`, returns `nil`
       (function call fails), returns
       `error:[string "print("foo")"]:1: attempt to call global 'print' (a nil value)`

## dig_node


```lua
function core.dig_node(pos: vector, digger?: PlayerRef)
  -> boolean
```

 * `core.dig_node(pos[, digger])`
     * Dig node with the same effects that a player would cause
     * `digger`: The ObjectRef that digs the node (optional)
     * Returns `true` if successful, `false` on failure (e.g. protected location)

## dir_to_facedir


```lua
function core.dir_to_facedir(dir: vector, is6d?: boolean)
  -> number
```

## dir_to_fourdir


```lua
function core.dir_to_fourdir(dir: vector)
  -> number
```

## dir_to_wallmounted


```lua
function core.dir_to_wallmounted(dir: vector)
  -> number
```

## dir_to_yaw


```lua
function core.dir_to_yaw(dir: vector)
  -> number
```

## disconnect_player


```lua
function core.disconnect_player(name: string, reason?: string, reconnect?: boolean)
```

 * `core.disconnect_player(name[, reason[, reconnect]])`: disconnect a player with an
   optional reason, this will not prefix with 'Kicked: ' like kick_player.
   If no reason is given, it will default to 'Disconnected.'
     * Returns boolean indicating success (false if player nonexistent)

## dynamic_add_media


```lua
(async) function core.dynamic_add_media(options: { filename: string?, filepath: string?, filedata: string?, to_player: string?, ephemeral: boolean? }, callback: function)
```

 * `core.dynamic_add_media(options, callback)`
     * `options`: table containing the following parameters
         * `filename`: name the media file will be usable as
                       (optional if `filepath` present)
         * `filepath`: path to the file on the filesystem [*]
         * `filedata`: the data of the file to be sent [*]
         * `to_player`: name of the player the media should be sent to instead of
                        all players (optional)
         * `ephemeral`: boolean that marks the media as ephemeral,
                        it will not be cached on the client (optional, default false)
         * Exactly one of the parameters marked [*] must be specified.
     * `callback`: function with arguments `name`, which is a player name
     * Pushes the specified media file to client(s). (details below)
       The file must be a supported image, sound or model format.
       Dynamically added media is not persisted between server restarts.
     * Returns false on error, true if the request was accepted
     * The given callback will be called for every player as soon as the
       media is available on the client.
     * Details/Notes:
       * If `ephemeral`=false and `to_player` is unset the file is added to the media
         sent to clients on startup, this means the media will appear even on
         old clients if they rejoin the server.
       * If `ephemeral`=false the file must not be modified, deleted, moved or
         renamed after calling this function.
       * Regardless of any use of `ephemeral`, adding media files with the same
         name twice is not possible/guaranteed to work. An exception to this is the
         use of `to_player` to send the same, already existent file to multiple
         chosen players.
       * You can also call this at startup time. In that case `callback` MUST
         be `nil` and you cannot use `ephemeral` or `to_player`, as these logically
         do not make sense.
     * Clients will attempt to fetch files added this way via remote media,
       this can make transfer of bigger files painless (if set up). Nevertheless
       it is advised not to use dynamic media for big media files.

## emerge_area


```lua
(async) function core.emerge_area(pos1: vector, pos2: vector, callback: fun(blockpos: vector, action: core.EMERGE_CANCELLED|core.EMERGE_ERRORED|core.EMERGE_FROM_DISK|core.EMERGE_FROM_MEMORY|core.EMERGE_GENERATED, calls_remaining: number, param?: any), param?: any)
```

 * `core.emerge_area(pos1, pos2, [callback], [param])`
     * Queue all blocks in the area from `pos1` to `pos2`, inclusive, to be
       asynchronously fetched from memory, loaded from disk, or if inexistent,
       generates them.
     * If `callback` is a valid Lua function, this will be called for each block
       emerged.
     * The function signature of callback is:
       `function EmergeAreaCallback(blockpos, action, calls_remaining, param)`
         * `blockpos` is the *block* coordinates of the block that had been
           emerged.
         * `action` could be one of the following constant values:
             * `core.EMERGE_CANCELLED`
             * `core.EMERGE_ERRORED`
             * `core.EMERGE_FROM_MEMORY`
             * `core.EMERGE_FROM_DISK`
             * `core.EMERGE_GENERATED`
         * `calls_remaining` is the number of callbacks to be expected after
           this one.
         * `param` is the user-defined parameter passed to emerge_area (or
           nil if the parameter was absent).

## encode_base64


```lua
function core.encode_base64(string: string)
  -> string
```

 * `core.encode_base64(string)`: returns string encoded in base64
     * Encodes a string in base64.

## encode_png


```lua
function core.encode_png(width: integer, height: integer, data: string|ColorSpec[], compression?: integer)
  -> string
```

 Unofficial note: shhh.... but you can do this in `core.handle_async` instead, get like a really good Promise library
 Unofficial note: shh... but you can also use it real-time and it's real cool
 Unofficial note: you can do "[png:"..core.encode_base64(core.encode_png(...)) to have a png
 Unofficial note: Can we do jpeg XL next?
 * `core.encode_png(width, height, data, [compression])`: Encode a PNG
   image and return it in string form.
     * `width`: Width of the image
     * `height`: Height of the image
     * `data`: Image data, one of:
         * array table of ColorSpec, length must be width*height
         * string with raw RGBA pixels, length must be width*height*4
     * `compression`: Optional zlib compression level, number in range 0 to 9.
   The data is one-dimensional, starting in the upper left corner of the image
   and laid out in scanlines going from left to right, then top to bottom.
   You can use `colorspec_to_bytes` to generate raw RGBA values.
   Palettes are not supported at the moment.
   You may use this to procedurally generate textures during server init.

## error_handler


```lua
function core.error_handler(err: any, level: any)
  -> string
```

 When an error occurs that is not caught, Luanti calls the function
 `core.error_handler` with the error object as its first argument. The second
 argument is the stack level where the error occurred. The return value is the
 error string that should be shown. By default this is a backtrace from
 `debug.traceback`. If the error object is not a string, it is first converted
 with `tostring` before being displayed. This means that you can use tables as
 error objects so long as you give them `__tostring` metamethods.

 You can override `core.error_handler`. You should call the previous handler
 with the correct stack level in your implementation.

## explode_scrollbar_event


```lua
function core.explode_scrollbar_event(string: string)
  -> { type: "CHG"|"DCL"|"INV", value: number? }
```

## explode_table_event


```lua
function core.explode_table_event(string: string)
  -> { type: "CHG"|"DCL"|"INV", row: number?, column: number? }
```

 * `core.explode_table_event(string)`: returns a table
     * returns e.g. `{type="CHG", row=1, column=2}`
     * `type` is one of:
         * `"INV"`: no row selected
         * `"CHG"`: selected
         * `"DCL"`: double-click

## explode_textlist_event


```lua
function core.explode_textlist_event(string: string)
  -> { type: "CHG"|"DCL"|"INV", index: number? }
```

 * `core.explode_table_event(string)`: returns a table
     * returns e.g. `{type="CHG", row=1, column=2}`
     * `type` is one of:
         * `"INV"`: no row selected
         * `"CHG"`: selected
         * `"DCL"`: double-click

## facedir_to_dir


```lua
function core.facedir_to_dir(facedir: number)
  -> vector
```

## features


```lua
function core.features()
  -> core.features
```

## find_node_near


```lua
function core.find_node_near(pos: any, radius: number, nodenames: string|string[], search_center?: boolean)
  -> vector?
```

 Unofficial note: I think this function is a lot laggier than the alternatives
 If you are simply trying to check if a node is in a big area, use `core.find_nodes_in_area`
 Anyway, someone will need to fact check me on that claim! Anyway: The actual docs:
 But you can notice that it doesn't have that pesky volume limit, so it's implemented differently

 * `core.find_node_near(pos, radius, nodenames, [search_center])`: returns
   pos or `nil`.
     * `radius`: using a maximum metric
     * `nodenames`: e.g. `{"ignore", "group:tree"}` or `"default:dirt"`
     * `search_center` is an optional boolean (default: `false`)
       If true `pos` is also checked for the nodes

## find_nodes_in_area


```lua
function core.find_nodes_in_area(pos1: vector, pos2: vector, nodenames: string|string[], grouped?: boolean)
  -> table<string, vector[]>|vector[]
  2. table<string, number>?
```

 * `core.find_nodes_in_area(pos1, pos2, nodenames, [grouped])`
     * `pos1` and `pos2` are the min and max positions of the area to search.
     * `nodenames`: e.g. `{"ignore", "group:tree"}` or `"default:dirt"`
     * If `grouped` is true the return value is a table indexed by node name
       which contains lists of positions.
     * If `grouped` is false or absent the return values are as follows:
       first value: Table with all node positions
       second value: Table with the count of each node with the node name
       as index
     * Area volume is limited to 150,000,000 nodes

## find_nodes_in_area_under_air


```lua
function core.find_nodes_in_area_under_air(pos1: vector, pos2: vector, nodenames: string|string[])
  -> vector[]
```

 * `core.find_nodes_in_area_under_air(pos1, pos2, nodenames)`: returns a
   list of positions.
     * `nodenames`: e.g. `{"ignore", "group:tree"}` or `"default:dirt"`
     * Return value: Table with all node positions with a node air above
     * Area volume is limited to 150,000,000 nodes

## find_nodes_with_meta


```lua
function core.find_nodes_with_meta(pos1: vector, pos2: vector)
  -> vector[]
```

 * `core.find_nodes_with_meta(pos1, pos2)`
     * Get a table of positions of nodes that have metadata within a region
       {pos1, pos2}.

## find_path


```lua
function core.find_path(pos1: vector, pos2: vector, searchdistance: number, max_jump: number, max_drop: number, algo: "A*"|"A*_noprefetch"|"Dijkstra")
  -> vector[]?
```

 * `core.find_path(pos1, pos2, searchdistance, max_jump, max_drop, algorithm)`
     * returns table containing path that can be walked on
     * returns a table of 3D points representing a path from `pos1` to `pos2` or
       `nil` on failure.
     * Reasons for failure:
         * No path exists at all
         * No path exists within `searchdistance` (see below)
         * Start or end pos is buried in land
     * `pos1`: start position
     * `pos2`: end position
     * `searchdistance`: maximum distance from the search positions to search in.
       In detail: Path must be completely inside a cuboid. The minimum
       `searchdistance` of 1 will confine search between `pos1` and `pos2`.
       Larger values will increase the size of this cuboid in all directions
     * `max_jump`: maximum height difference to consider walkable
     * `max_drop`: maximum height difference to consider droppable
     * `algorithm`: One of `"A*_noprefetch"` (default), `"A*"`, `"Dijkstra"`.
       Difference between `"A*"` and `"A*_noprefetch"` is that
       `"A*"` will pre-calculate the cost-data, the other will calculate it
       on-the-fly

```lua
algo:
    | "A*_noprefetch"
    | "A*"
    | "Dijkstra"
```

## fix_light


```lua
function core.fix_light(pos1: vector, pos2: vector)
  -> boolean
```

 * `core.fix_light(pos1, pos2)`: returns `true`/`false`
     * resets the light in a cuboid-shaped part of
       the map and removes lighting bugs.
     * Loads the area if it is not loaded.
     * `pos1` is the corner of the cuboid with the least coordinates
       (in node coordinates), inclusive.
     * `pos2` is the opposite corner of the cuboid, inclusive.
     * The actual updated cuboid might be larger than the specified one,
       because only whole map blocks can be updated.
       The actual updated area consists of those map blocks that intersect
       with the given cuboid.
     * However, the neighborhood of the updated area might change
       as well, as light can spread out of the cuboid, also light
       might be removed.
     * returns `false` if the area is not fully generated,
       `true` otherwise

## forceload_block


```lua
function core.forceload_block(pos: vector, transient?: boolean, limit?: number)
```

 * `core.forceload_block(pos[, transient[, limit]])`
     * forceloads the position `pos`.
     * this means that the mapblock containing `pos` will always be kept in the
       `"active"` state, regardless of nearby players or server settings.
     * returns `true` if area could be forceloaded
     * If `transient` is `false` or absent, the forceload will be persistent
       (saved between server runs). If `true`, the forceload will be transient
       (not saved between server runs).
     * `limit` is an optional limit on the number of blocks that can be
       forceloaded at once. If `limit` is negative, there is no limit. If it is
       absent, the limit is the value of the setting `"max_forceloaded_blocks"`.
       If the call would put the number of blocks over the limit, the call fails.

## forceload_free_block


```lua
function core.forceload_free_block(pos: vector, transient?: boolean)
```

 * `core.forceload_free_block(pos[, transient])`
     * stops forceloading the position `pos`
     * If `transient` is `false` or absent, frees a persistent forceload.
       If `true`, frees a transient forceload.

## format_chat_message


```lua
function core.format_chat_message(name: string, message: string)
  -> nil
```

 * `core.format_chat_message(name, message)`
     * Used by the server to format a chat message, based on the setting `chat_message_format`.
       Refer to the documentation of the setting for a list of valid placeholders.
     * Takes player name and message, and returns the formatted string to be sent to players.
     * Can be redefined by mods if required, for things like colored names or messages.
     * **Only** the first occurrence of each placeholder will be replaced.

## formspec_escape


```lua
function core.formspec_escape(string: string)
  -> string
```

 escapes the characters "[", "]", "", "," and ";", which cannot be used in formspecs.

## fourdir_to_dir


```lua
function core.fourdir_to_dir(fourdir: number)
  -> vector
```

## generate_decorations


```lua
function core.generate_decorations(vm: VoxelManip, pos1?: vector, pos2?: vector)
```

 * `core.generate_decorations(vm, pos1, pos2)`
     * Generate all registered decorations within the VoxelManip `vm` and in the
       area from `pos1` to `pos2`.
     * `pos1` and `pos2` are optional and default to mapchunk minp and maxp.

## generate_ores


```lua
function core.generate_ores(vm: VoxelManip, pos1?: vector, pos2?: vector)
```

 * `core.generate_ores(vm, pos1, pos2)`
     * Generate all registered ores within the VoxelManip `vm` and in the area
       from `pos1` to `pos2`.
     * `pos1` and `pos2` are optional and default to mapchunk minp and maxp.

## get_all_craft_recipes


```lua
function core.get_all_craft_recipes(query_item: string)
  -> { method: "cooking"|"fuel"|"normal", width: number, items: ItemStack[], output: string }[]?
```

 * `core.get_all_craft_recipes(query item)`: returns a table or `nil`
     * returns indexed table with all registered recipes for query item (node)
       or `nil` if no recipe was found.
     * recipe entry table:
         * `method`: 'normal' or 'cooking' or 'fuel'
         * `width`: 0-3, 0 means shapeless recipe
         * `items`: indexed [1-9] table with recipe items
         * `output`: string with item name and quantity
     * Example result for `"default:gold_ingot"` with two recipes:
       ```lua
       {
           {
               method = "cooking", width = 3,
               output = "default:gold_ingot", items = {"default:gold_lump"}
           },
           {
               method = "normal", width = 1,
               output = "default:gold_ingot 9", items = {"default:goldblock"}
           }
       }
       ```

## get_artificial_light


```lua
function core.get_artificial_light(param1: number)
  -> number
```

 * `core.get_artificial_light(param1)`
     * Calculates the artificial light (light from e.g. torches) value from the
       `param1` value.
     * `param1`: The param1 value of a `paramtype = "light"` node.
     * Returns a number between `0` and `15`
     * Currently it's the same as `math.floor(param1 / 16)`, except that it
       ensures compatibility.

## get_background_escape_sequence


```lua
function core.get_background_escape_sequence(color: ColorString)
  -> string
```

 The escape sequence sets the background of the whole text element to color. Only defined for item descriptions and tooltips.

## get_ban_description


```lua
function core.get_ban_description(ip_or_name: string)
  -> string
```

 * `core.get_ban_description(ip_or_name)`: returns list of bans matching
   IP address or name formatted as string

## get_ban_list


```lua
function core.get_ban_list()
  -> string
```

 * `core.get_ban_list()`: returns a list of all bans formatted as string

## get_biome_data


```lua
function core.get_biome_data(pos: vector)
  -> { biome: number, heat: number, humidity: number }?
```

 * `core.get_biome_data(pos)`
     * Returns a table containing:
         * `biome` the biome id of the biome at that position
         * `heat` the heat at the position
         * `humidity` the humidity at the position
     * Or returns `nil` on failure.

## get_biome_id


```lua
function core.get_biome_id(biome_name: string)
  -> number
```

 * `core.get_biome_id(biome_name)`
     * Returns the biome id, as used in the biomemap Mapgen object and returned
       by `core.get_biome_data(pos)`, for a given biome_name string.

## get_biome_name


```lua
function core.get_biome_name(biome_id: number)
  -> string?
```

 * `core.get_biome_name(biome_id)`
     * Returns the biome name string for the provided biome id, or `nil` on
       failure.
     * If no biomes have been registered, such as in mgv6, returns `default`.

## get_color_escape_sequence


```lua
function core.get_color_escape_sequence(color: ColorString)
  -> string
```

 The escape sequence sets the text color to color
 (Unofficial note: this is mostly for formspec UI elements)

## get_connected_players


```lua
function core.get_connected_players()
  -> PlayerRef[]
```

 * `core.get_connected_players()`: returns list of `ObjectRefs`

## get_content_id


```lua
function core.get_content_id(name: string)
  -> content_id
```

 * `core.get_content_id(name)`: returns an integer
     * Gets the internal content ID of `name`

## get_craft_recipe


```lua
function core.get_craft_recipe(output: string)
  -> { method: "cooking"|"fuel"|"normal", width: number, items: ItemStack[]? }?
```

 * `core.get_craft_recipe(output)`: returns input
     * returns last registered recipe for output item (node)
     * `output` is a node or item type such as `"default:torch"`
     * `input.method` = `"normal"` or `"cooking"` or `"fuel"`
     * `input.width` = for example `3`
     * `input.items` = for example
       `{stack1, stack2, stack3, stack4, stack 5, stack 6, stack 7, stack 8, stack 9}`
         * `input.items` = `nil` if no recipe found

## get_craft_result


```lua
function core.get_craft_result(input: { method: "cooking"|"fuel"|"normal", width: number, items: ItemStack[] })
  -> { item: ItemStack, time: number?, replacements: ItemStack[] }?
  2. ItemStack?
```

 * `core.get_craft_result(input)`: returns `output, decremented_input`
     * `input.method` = `"normal"` or `"cooking"` or `"fuel"`
     * `input.width` = for example `3`
     * `input.items` = for example
       `{stack1, stack2, stack3, stack4, stack 5, stack 6, stack 7, stack 8, stack 9}`
     * `output.item` = `ItemStack`, if unsuccessful: empty `ItemStack`
     * `output.time` = a number, if unsuccessful: `0`
     * `output.replacements` = List of replacement `ItemStack`s that couldn't be
       placed in `decremented_input.items`. Replacements can be placed in
       `decremented_input` if the stack of the replaced item has a count of 1.
     * `decremented_input` = like `input`

## get_current_modname


```lua
function core.get_current_modname()
  -> string
```

 Returns currently loading mod's name WHEN LOADING A MOD

## get_day_count


```lua
function core.get_day_count()
  -> number
```

 * `core.get_day_count()`: returns number days elapsed since world was
   created.
     * Time changes are accounted for.

## get_decoration_id


```lua
function core.get_decoration_id(decoration_name: string)
```

## get_dig_params


```lua
function core.get_dig_params(groups: table<string, integer>, tool_capabilities: tool_capabilities, wear?: integer)
  -> table
```

## get_dir_list


```lua
function core.get_dir_list(path: string, is_dir: true|false|nil)
```

 * `core.get_dir_list(path, [is_dir])`: returns list of entry names
     * is_dir is one of:
         * nil: return all entries,
         * true: return only subdirectory names, or
         * false: return only file names.

```lua
is_dir:
    | true
    | false
```

## get_game_info


```lua
function core.get_game_info()
  -> { id: string, title: string, author: string, path: string }
```

 Unofficial: Path is the root directory of the game, useful if you are looking for it

## get_gametime


```lua
function core.get_gametime()
  -> number?
```

 * `core.get_gametime()`: returns the time, in seconds, since the world was
   created. The time is not available (`nil`) before the first server step.

## get_gen_notify


```lua
function core.get_gen_notify()
  -> string
  2. table<string, vector>
  3. table<string, any>
```

 Unofficial Note: The types are a guess xD i have no idea how this works

## get_heat


```lua
function core.get_heat(pos: vector)
  -> number?
```

 Unofficial note: this relates to the biome heat, idk override it and make your own custom mapgen if you dare
 * `core.get_heat(pos)`
     * Returns the heat at the position, or `nil` on failure.

## get_hit_params


```lua
function core.get_hit_params(groups: table<string, integer>, tool_capabilities?: tool_capabilities, time_from_last_punch?: number, wear?: integer)
  -> table
```

## get_humidity


```lua
function core.get_humidity(pos: vector)
  -> number?
```

 Unofficial note: this relates to the biome humidity, idk override it and make your own custom mapgen if you dare
 * `core.get_humidity(pos)`
     * Returns the humidity at the position, or `nil` on failure.

## get_inventory_location


```lua
function core.get_inventory_location(location: inventory_location)
  -> InvRef
```

 `core.get_inventory(location)`: returns an `InvRef`

 * `location` = e.g.
     * `{type="player", name="celeron55"}`
     * `{type="node", pos={x=, y=, z=}}`
     * `{type="detached", name="creative"}`

## get_item_group


```lua
function core.get_item_group(name: string, group: string)
  -> integer
```

 * `core.get_item_group(name, group)`: returns a rating
     * Get rating of a group of an item. (`0` means: not in group)

## get_mapgen_edges


```lua
function core.get_mapgen_edges(mapgen_limit?: number, chunksize?: number)
```

 * `core.get_mapgen_edges([mapgen_limit[, chunksize]])`
     * Returns the minimum and maximum possible generated node positions
       in that order.
     * `mapgen_limit` is an optional number. If it is absent, its value is that
       of the *active* mapgen setting `"mapgen_limit"`.
     * `chunksize` is an optional number. If it is absent, its value is that
       of the *active* mapgen setting `"chunksize"`.

## get_mapgen_object


```lua
function core.get_mapgen_object(objectname: string)
```

## get_mapgen_setting


```lua
function core.get_mapgen_setting(name: string)
  -> string
```

 * `core.get_mapgen_setting(name)`
     * Gets the *active* mapgen setting (or nil if none exists) in string
       format with the following order of precedence:
         1) Settings loaded from map_meta.txt or overrides set during mod
            execution.
         2) Settings set by mods without a metafile override
         3) Settings explicitly set in the user config file, minetest.conf
         4) Settings set as the user config default

## get_mapgen_setting_noiseparams


```lua
function core.get_mapgen_setting_noiseparams(name: string)
  -> NoiseParams
```

 * `core.get_mapgen_setting_noiseparams(name)`
     * Same as above, but returns the value as a NoiseParams table if the
       setting `name` exists and is a valid NoiseParams.

## get_meta


```lua
function core.get_meta(pos: vector)
  -> NodeMetaRef
```

## get_mod_storage


```lua
function core.get_mod_storage()
  -> StorageRef
```

 * `core.get_mod_storage()`:
     * returns reference to mod private `StorageRef`
     * must be called during mod load time

## get_modnames


```lua
function core.get_modnames()
  -> string[]
```

## get_modpath


```lua
function core.get_modpath(modname: string)
  -> string
```

## get_name_from_content_id


```lua
function core.get_name_from_content_id(content_id: content_id)
  -> string
```

 * `core.get_name_from_content_id(content_id)`: returns a string
     * Gets the name of the content with that content ID

## get_natural_light


```lua
function core.get_natural_light(pos: vector, timeofday?: number)
  -> light_level?
```

 * `core.get_natural_light(pos[, timeofday])`
     * Figures out the sunlight (or moonlight) value at pos at the given time of
       day.
     * `pos`: The position of the node
     * `timeofday`: `nil` for current time, `0` for night, `0.5` for day
     * Returns a number between `0` and `15` or `nil`
     * This function tests 203 nodes in the worst case, which happens very
       unlikely

## get_node


```lua
function core.get_node(pos: vector)
  -> MapNode|{ name: string, param1: number, param2: number }
```

 * `core.get_node(pos)`
     * Returns the node at the given position as table in the same format as `set_node`.
     * This function never returns `nil` and instead returns
       `{name="ignore", param1=0, param2=0}` for unloaded areas.

## get_node_boxes


```lua
function core.get_node_boxes(box_type: "collision_box"|"node_box"|"selection_box", pos: vector, node?: MapNode|{ name: string, param1: number, param2: number })
  -> number[][]
```

 * `core.get_node_boxes(box_type, pos, [node])`
     * `box_type` must be `"node_box"`, `"collision_box"` or `"selection_box"`.
     * `pos` must be a node position.
     * `node` can be a table in the form `{name=string, param1=number, param2=number}`.
       If `node` is `nil`, the actual node at `pos` is used instead.
     * Resolves any facedir-rotated boxes, connected boxes and the like into
       actual boxes.
     * Returns a list of boxes in the form
       `{{x1, y1, z1, x2, y2, z2}, {x1, y1, z1, x2, y2, z2}, ...}`. Coordinates
       are relative to `pos`.
     * See also: [Node boxes](file:///home/et/.minetest/games/spacea/dev/lsp_definitions/luanti/%23node-boxes)

```lua
box_type:
    | "node_box"
    | "collision_box"
    | "selection_box"
```

## get_node_drops


```lua
function core.get_node_drops(node: string|MapNodeOpt|{ name: string, param1: number?, param2: number? }, toolname?: string, tool?: ItemStack, digger?: ObjectRef, pos?: vector)
  -> string[]
```

## get_node_group


```lua
function core.get_node_group(name: any, group: any)
```

 * `core.get_node_group(name, group)`: returns a rating
     * Deprecated: An alias for the former.

## get_node_light


```lua
function core.get_node_light(pos: vector, timeofday?: number)
  -> light_level?
```

 Unofficial note: NOO!!! THE LAIGHT!!! NOT THE LAIGHT!!!

 * `core.get_node_light(pos[, timeofday])`
     * Gets the light value at the given position. Note that the light value
       "inside" the node at the given position is returned, so you usually want
       to get the light value of a neighbor.
     * `pos`: The position where to measure the light.
     * `timeofday`: `nil` for current time, `0` for night, `0.5` for day
     * Returns a number between `0` and `15` or `nil`
     * `nil` is returned e.g. when the map isn't loaded at `pos`

## get_node_or_nil


```lua
function core.get_node_or_nil(pos: vector)
  -> (MapNode|{ name: string, param1: number, param2: number })?
```

 * `core.get_node_or_nil(pos)`
     * Same as `get_node` but returns `nil` for unloaded areas.
     * Note that even loaded areas can contain "ignore" nodes.

## get_node_raw


```lua
function core.get_node_raw(x: number, y: number, z: number)
  -> content_id
  2. param1: number
  3. param2: number
  4. pos_ok: boolean
```

 * `core.get_node_raw(x, y, z)`
     * Same as `get_node` but a faster low-level API
     * Returns `content_id`, `param1`, `param2`, and `pos_ok`
     * The `content_id` can be mapped to a name using `core.get_name_from_content_id()`
     * If `pos_ok` is false, the area is unloaded and `content_id == core.CONTENT_IGNORE`

## get_node_timer


```lua
function core.get_node_timer(pos: vector)
  -> NodeTimerRef
```

## get_noiseparams


```lua
function core.get_noiseparams(name: string)
  -> NoiseParams
```

## get_objects_in_area


```lua
function core.get_objects_in_area(minp: vector, maxp: vector)
  -> ObjectRef[]
```

 * `core.get_objects_in_area(min_pos, max_pos)`
     * returns a list of ObjectRefs
     * `min_pos` and `max_pos` are the min and max positions of the area to search
     * **Warning**: The same warning as for `core.get_objects_inside_radius` applies.
       Use `core.objects_in_area` instead to iterate only valid objects.

## get_objects_inside_radius


```lua
function core.get_objects_inside_radius(center: vector, radius: number)
  -> ObjectRef[]
```

 * `core.get_objects_inside_radius(center, radius)`
     * returns a list of ObjectRefs
     * `radius`: using a Euclidean metric
     * **Warning**: Any kind of interaction with the environment or other APIs
       can cause later objects in the list to become invalid while you're iterating it.
       (e.g. punching an entity removes its children)
       It is recommended to use `core.objects_inside_radius` instead, which
       transparently takes care of this possibility.

## get_perlin


```lua
function core.get_perlin(noiseparams: NoiseParams)
  -> ValueNoise
```

## get_perlin_noise_map


```lua
function core.get_perlin_noise_map(noiseparams: NoiseParams, size: vector|{ x: number, y: number })
  -> ValueNoiseMap
```

## get_player_by_name


```lua
function core.get_player_by_name(name: string)
  -> PlayerRef
```

 * `core.get_player_by_name(name)`: Get an `ObjectRef` to a player
     * Returns nothing in case of error (player offline, doesn't exist, ...).

## get_player_information


```lua
function core.get_player_information(player_name: string)
  -> player_information
```

## get_player_window_information


```lua
function core.get_player_window_information(player_name: string)
  -> Client: window_information?
```

@*return* `Client` — must have version 5.7+

## get_pointed_thing_position


```lua
function core.get_pointed_thing_position(pointed_thing: pointed_thing, above: boolean)
  -> vector
```

 * `core.get_pointed_thing_position(pointed_thing, above)`
     * Returns the position of a `pointed_thing` or `nil` if the `pointed_thing`
       does not refer to a node or entity.
     * If the optional `above` parameter is true and the `pointed_thing` refers
       to a node, then it will return the `above` position of the `pointed_thing`.

## get_position_from_hash


```lua
function core.get_position_from_hash(hash: poshash)
  -> vector
```

 * `core.get_position_from_hash(hash)`: returns a position
     * Inverse transform of `core.hash_node_position`

## get_server_max_lag


```lua
function core.get_server_max_lag()
  -> number?
```

 * `core.get_server_max_lag()`: returns the current maximum lag
   of the server in seconds or nil if server is not fully loaded yet

## get_server_status


```lua
function core.get_server_status(name: string, joined: boolean)
  -> string?
```

 Unofficial note: This is really cool i didn't know this
 * `core.get_server_status(name, joined)`
     * Returns the server status string when a player joins or when the command
       `/status` is called. Returns `nil` or an empty string when the message is
       disabled.
     * `joined`: Boolean value, indicates whether the function was called when
       a player joined.
     * This function may be overwritten by mods to customize the status message.

## get_server_uptime


```lua
function core.get_server_uptime()
  -> number
```

 * `core.get_server_uptime()`: returns the server uptime in seconds

## get_spawn_level


```lua
function core.get_spawn_level(x: number, z: number)
  -> y: number
```

 * `core.get_spawn_level(x, z)`
     * Returns a player spawn y coordinate for the provided (x, z)
       coordinates, or `nil` for an unsuitable spawn point.
     * For most mapgens a 'suitable spawn point' is one with y between
       `water_level` and `water_level + 16`, and in mgv7 well away from rivers,
       so `nil` will be returned for many (x, z) coordinates.
     * The spawn level returned is for a player spawn in unmodified terrain.
     * The spawn level is intentionally above terrain level to cope with
       full-node biome 'dust' nodes.

## get_timeofday


```lua
function core.get_timeofday()
  -> number
```

 * `core.get_timeofday()`: get time of day

## get_tool_wear_after_use


```lua
function core.get_tool_wear_after_use(uses: integer, initial_wear?: integer)
  -> integer
```

## get_translator


```lua
function core.get_translator(textdomain: string|nil)
  -> S: fun(str: string, ...string):string
  2. PS: fun(str: string, str_plural: string, n: number, ...string):string
```

`core.get_translator(textdomain)` is a simple wrapper around
`core.translate` and `core.translate_n`.  
After `local S, PS = core.get_translator(textdomain)`, we have
`S(str, ...)` equivalent to `core.translate(textdomain, str, ...)`, and
`PS(str, str_plural, n, ...)` to `core.translate_n(textdomain, str, str_plural, n, ...)`.  
It is intended to be used in the following way, so that it avoids verbose
repetitions of `core.translate`:

```lua
local S, PS = core.get_translator(textdomain)
S(str, ...)
```

As an extra commodity, if `textdomain` is nil, it is assumed to be "" instead.


## get_us_time


```lua
function core.get_us_time()
  -> number
```

 returns time with microsecond precision. May not return wall time.
 Unofficial note: I think you should use os.clock() for benchmarking instead

## get_value_noise


```lua
function core.get_value_noise(noiseparams: NoiseParams)
  -> ValueNoise
```

 * `core.get_value_noise(noiseparams)`
     * Return world-specific value noise.
     * The actual seed used is the noiseparams seed plus the world seed.
     * **Important**: Requires the mapgen environment to be initalized, do not use at load time.

## get_value_noise_map


```lua
function core.get_value_noise_map(noiseparams: NoiseParams, size: vector|{ x: number, y: number })
  -> ValueNoiseMap
```

## get_version


```lua
function core.get_version()
  -> core.get_version
```

## get_voxel_manip


```lua
function core.get_voxel_manip(p1?: vector, p2?: vector)
  -> VoxelManip
```

## get_worldpath


```lua
function core.get_worldpath()
  -> string
```

## global_exists


```lua
function core.global_exists(name: any)
  -> boolean
```

 * `core.global_exists(name)`
     * Checks if a global variable has been set, without triggering a warning.

@*param* `name` — unofficial note: yeah that's right, any

## handle_async


```lua
(async) function core.handle_async(f: function, callback: function, ...any)
```

 Unofficial note: async is quite painful, good luck
 The engine allows you to submit jobs to be ran in an isolated environment
 concurrently with normal server operation.
 A job consists of a function to be ran in the async environment, any amount of
 arguments (will be serialized) and a callback that will be called with the return
 value of the job function once it is finished.

 The async environment does *not* have access to the map, entities, players or any
 globals defined in the 'usual' environment. Consequently, functions like
 `core.get_node()` or `core.get_player_by_name()` simply do not exist in it.

 Arguments and return values passed through this can contain certain userdata
 objects that will be seamlessly copied (not shared) to the async environment.
 This allows you easy interoperability for delegating work to jobs.

 * `core.handle_async(func, callback, ...)`:
     * Queue the function `func` to be ran in an async environment.
       Note that there are multiple persistent workers and any of them may
       end up running a given job. The engine will scale the amount of
       worker threads automatically.
     * When `func` returns the callback is called (in the normal environment)
       with all of the return values as arguments.
     * Optional: Variable number of arguments that are passed to `func`

 ### List of APIs available in an async environment

 Classes:

 * `AreaStore`
 * `ItemStack`
 * `ValueNoise`
 * `ValueNoiseMap`
 * `PseudoRandom`
 * `PcgRandom`
 * `SecureRandom`
 * `VoxelArea`
 * `VoxelManip`
     * only if transferred into environment; can't read/write to map
 * `Settings`

 Class instances that can be transferred between environments:

 * `ItemStack`
 * `ValueNoise`
 * `ValueNoiseMap`
 * `VoxelManip`

 Functions:

 * Standalone helpers such as logging, filesystem, encoding,
   hashing or compression APIs
 * `core.register_portable_metatable`
 * IPC

 Variables:

 * `core.settings`
 * `core.registered_items`, `registered_nodes`, `registered_tools`,
   `registered_craftitems` and `registered_aliases`
     * with all functions and userdata values replaced by `true`, calling any
       callbacks here is obviously not possible

## handle_node_drops


```lua
function core.handle_node_drops(pos: vector, drops: string[], digger: PlayerRef)
```

 * `core.handle_node_drops(pos, drops, digger)`
     * `drops`: list of itemstrings
     * Handles drops from nodes after digging: Default action is to put them
       into digger's inventory.
     * Can be overridden to get different functionality (e.g. dropping items on
       ground)

## has_feature


```lua
function core.has_feature(arg: string|string[])
  -> boolean
  2. missing_features: table<string, boolean>
```

## hash_node_position


```lua
function core.hash_node_position(pos: vector)
  -> poshash
```

## hud_replace_builtin


```lua
function core.hud_replace_builtin(name: "breath"|"health"|"hotbar"|"minimap", hud_definition: HudDef)
```

 * `core.hud_replace_builtin(name, hud_definition)`
     * Replaces definition of a builtin hud element
     * `name`: `"breath"`, `"health"`, `"minimap"` or `"hotbar"`
     * `hud_definition`: definition to replace builtin definition

```lua
name:
    | "breath"
    | "health"
    | "minimap"
    | "hotbar"
```

## hypertext_escape


```lua
function core.hypertext_escape(string: string)
  -> string
```

 * `core.hypertext_escape(string)`: returns a string
     * escapes the characters "\", "<", and ">" to show text in a hypertext element.
     * not safe for use with tag attributes.
     * this function does not do formspec escaping, you will likely need to do
       `core.formspec_escape(core.hypertext_escape(string))` if the hypertext is
       not already being formspec escaped.

## inventorycube


```lua
function core.inventorycube(img1: string, img2: string, img3: string)
  -> string
```

## ipc_cas


```lua
function core.ipc_cas(key: string, old_value: any, new_value: any)
  -> success: boolean
```

 * `core.ipc_cas(key, old_value, new_value)`:
   * Write a value to the shared data area, but only if the previous value
     equals what was given.
     This operation is called Compare-and-Swap and can be used to implement
     synchronization between threads.
   * `key`: as above
   * `old_value`: value compared to using `==` (`nil` compares equal for non-existing keys)
   * `new_value`: value that will be set
   * returns: true on success, false otherwise

## ipc_get


```lua
function core.ipc_get(key: string)
```

 * `core.ipc_get(key)`:
   * Read a value from the shared data area.
   * `key`: string, should use the `"modname:thing"` convention to avoid conflicts.
   * returns an arbitrary Lua value, or `nil` if this key does not exist

## ipc_poll


```lua
function core.ipc_poll(key: string, timeout: number)
  -> success: boolean
```

 * `core.ipc_poll(key, timeout)`:
   * Do a blocking wait until a value (other than `nil`) is present at the key.
   * **IMPORTANT**: You usually don't need this function. Use this as a last resort
     if nothing else can satisfy your use case! None of the Lua environments the
     engine has are safe to block for extended periods, especially on the main
     thread any delays directly translate to lag felt by players.
   * `key`: as above
   * `timeout`: maximum wait time, in milliseconds (positive values only)
   * returns: true on success, false on timeout

## ipc_set


```lua
function core.ipc_set(key: string, value: any)
```

 * `core.ipc_set(key, value)`:
   * Write a value to the shared data area.
   * `key`: as above
   * `value`: an arbitrary Lua value, cannot be or contain userdata.

 Interacting with the shared data will perform an operation comparable to
 (de)serialization on each access.
 For that reason modifying references will not have any effect, as in this example:
 ```lua
 core.ipc_set("test:foo", {})
 core.ipc_get("test:foo").subkey = "value" -- WRONG!
 core.ipc_get("test:foo") -- returns an empty table
 ```

## is_area_protected


```lua
function core.is_area_protected(pos1: vector, pos2: vector, player_name: string, interval: number)
  -> boolean
```

 * `core.is_area_protected(pos1, pos2, player_name, interval)`
     * Returns the position of the first node that `player_name` may not modify
       in the specified cuboid between `pos1` and `pos2`.
     * Returns `false` if no protections were found.
     * Applies `is_protected()` to a 3D lattice of points in the defined volume.
       The points are spaced evenly throughout the volume and have a spacing
       similar to, but no larger than, `interval`.
     * All corners and edges of the defined volume are checked.
     * `interval` defaults to 4.
     * `interval` should be carefully chosen and maximized to avoid an excessive
       number of points being checked.
     * Like `core.is_protected`, this function may be extended or
       overwritten by mods to provide a faster implementation to check the
       cuboid for intersections.

## is_creative_enabled


```lua
function core.is_creative_enabled(name: string)
  -> boolean
```

 * `core.is_creative_enabled(name)`: returns boolean
     * Returning `true` means that Creative Mode is enabled for player `name`.
     * `name` will be `""` for non-players or if the player is unknown.
     * This function should be overridden by Creative Mode-related mods to
       implement a per-player Creative Mode.
     * By default, this function returns `true` if the setting
       `creative_mode` is `true` and `false` otherwise.

## is_nan


```lua
function core.is_nan(arg: any)
  -> boolean
```

## is_player


```lua
function core.is_player(obj: ObjectRef)
  -> boolean
```

 * `core.is_player(obj)`: boolean, whether `obj` is a player

## is_protected


```lua
function core.is_protected(pos: vector, name: string)
  -> boolean
```

 Unofficial note: Do NOT localize it, i know you want to, just don't
 * `core.is_protected(pos, name)`: returns boolean
     * Returning `true` restricts the player `name` from modifying (i.e. digging,
        placing) the node at position `pos`.
     * `name` will be `""` for non-players or unknown players.
     * This function should be overridden by protection mods. It is highly
       recommended to grant access to players with the `protection_bypass` privilege.
     * Cache and call the old version of this function if the position is
       not protected by the mod. This will allow using multiple protection mods.
     * Example:
       ```lua
       local old_is_protected = core.is_protected
       function core.is_protected(pos, name)
           if mymod:position_protected_from(pos, name) then
               return true
           end
           return old_is_protected(pos, name)
       end
       ```

## is_singleplayer


```lua
function core.is_singleplayer()
  -> boolean
```

## is_valid_player_name


```lua
function core.is_valid_player_name(name: string)
  -> boolean
```

 * `core.is_valid_player_name(name)`: boolean, whether the given name
   could be used as a player name (regardless of whether said player exists).

## is_yes


```lua
function core.is_yes(arg: any)
  -> boolean
```

## item_drop


```lua
function core.item_drop(itemstack: ItemStack, dropper?: PlayerRef, pos: vector)
```

 * `core.item_drop(itemstack, dropper, pos)`
     * Converts `itemstack` to an in-world Lua entity.
     * `itemstack` (`ItemStack`) is modified (cleared) on success.
       * In versions < 5.12.0, `itemstack` was cleared in all cases.
     * `dropper` (`ObjectRef`) is optional.
     * Returned values on success:
       1. leftover itemstack
       2. `ObjectRef` of the spawned object (provided since 5.12.0)

## item_eat


```lua
function core.item_eat(hp_change: number, replace_with_item?: string|table|ItemStack)
```

 * `core.item_eat(hp_change[, replace_with_item])`
     * Returns `function(itemstack, user, pointed_thing)` as a
       function wrapper for `core.do_item_eat`.
     * `replace_with_item` is the itemstring which is added to the inventory.
       If the player is eating a stack and `replace_with_item` doesn't fit onto
       the eaten stack, then the remainings go to a different spot, or are dropped.

## item_pickup


```lua
function core.item_pickup(itemstack: ItemStack, picker: PlayerRef, pointed_thing: pointed_thing, time_from_last_punch: number, ...any)
  -> ItemStack
```

 * `core.item_pickup(itemstack, picker, pointed_thing, time_from_last_punch, ...)`
     * Runs callbacks registered by `core.register_on_item_pickup` and adds
       the item to the picker's `"main"` inventory list.
     * Parameters are the same as in `on_pickup`.
     * Returns the leftover itemstack.

## item_place


```lua
function core.item_place(itemstack: ItemStack, placer: PlayerRef, pointed_thing: pointed_thing, param2?: number)
  -> ItemStack
  2. vector?
```

 * `core.item_place(itemstack, placer, pointed_thing[, param2])`
     * Wrapper that calls `core.item_place_node` if appropriate
     * Calls `on_rightclick` of `pointed_thing.under` if defined instead
     * **Note**: is not called when wielded item overrides `on_place`
     * `param2` overrides facedir and wallmounted `param2`
     * returns `itemstack, position`
       * `position`: the location the node was placed to. `nil` if nothing was placed.

## item_place_node


```lua
function core.item_place_node(itemstack: ItemStack, placer: PlayerRef, pointed_thing: pointed_thing, param2?: number, prevent_after_place?: boolean)
  -> ItemStack
  2. vector?
```

 * `core.item_place_node(itemstack, placer, pointed_thing[, param2, prevent_after_place])`
     * Place item as a node
     * `param2` overrides `facedir` and wallmounted `param2`
     * `prevent_after_place`: if set to `true`, `after_place_node` is not called
       for the newly placed node to prevent a callback and placement loop
     * returns `itemstack, position`
       * `position`: the location the node was placed to. `nil` if nothing was placed.

## item_place_object


```lua
function core.item_place_object(itemstack: any, placer: any, pointed_thing: any)
```

 * `core.item_place_object(itemstack, placer, pointed_thing)`
     * Place item as-is
     * returns the leftover itemstack
     * **Note**: This function is deprecated and will never be called.

## itemstring_with_color


```lua
function core.itemstring_with_color(item: string|table|ItemStack, colorstring: ColorString)
  -> string
```

 * `core.itemstring_with_color(item, colorstring)`: returns an item string
     * Creates an item string which contains static color information
       for hardware colorization. Use this method if you wish to colorize
       an item that does not own a palette. You can use the returned string
       as an output in a craft recipe.
     * `item`: the item stack which becomes colored. Can be in string,
       table and native form.
     * `colorstring`: the new color of the item stack

## itemstring_with_palette


```lua
function core.itemstring_with_palette(item: string|table|ItemStack, palette_index: number)
  -> string
```

 * `core.itemstring_with_palette(item, palette_index)`: returns an item
   string.
     * Creates an item string which contains palette index information
       for hardware colorization. You can use the returned string
       as an output in a craft recipe.
     * `item`: the item stack which becomes colored. Can be in string,
       table and native form.
     * `palette_index`: this index is added to the item stack

## kick_player


```lua
function core.kick_player(name: string, reason?: string, reconnect?: boolean)
  -> success: boolean
```

 * `core.kick_player(name[, reason[, reconnect]])`: disconnect a player with an optional
   reason.
     * Returns boolean indicating success (false if player nonexistent)
     * If `reconnect` is true, allow the user to reconnect.

## line_of_sight


```lua
function core.line_of_sight(pos1: vector, pos2: vector)
  -> boolean
  2. (MapNode|{ name: string, param1: number, param2: number })?
```

 Unofficial note: The annoying thing about this little function is that it is hardcoded to check specifically for "air", nothing else
 Though i am sure you can make it work out

 * `core.line_of_sight(pos1, pos2)`: returns `boolean, pos`
     * Checks if there is anything other than air between pos1 and pos2.
     * Returns false if something is blocking the sight.
     * Returns the position of the blocking node when `false`
     * `pos1`: First position
     * `pos2`: Second position

## load_area


```lua
function core.load_area(pos1: vector, pos2?: vector)
  -> nil
```

 * `core.load_area(pos1[, pos2])`
     * Load the mapblocks containing the area from `pos1` to `pos2`.
       `pos2` defaults to `pos1` if not specified.
     * This function does not trigger map generation.

## log


```lua
function core.log(loglevel: "action"|"error"|"info"|"none"|"verbose"...(+1), text: string)
  -> nil
```

```lua
loglevel:
    | "none"
    | "error"
    | "warning"
    | "action"
    | "info"
    | "verbose"
```

## luaentities


```lua
table<integer, luaentity>
```

## mkdir


```lua
function core.mkdir(path: string)
  -> success: boolean
```

## mod_channel_join


```lua
function core.mod_channel_join(channel_name: string)
  -> ModChannel
```

## mvdir


```lua
function core.mvdir(source: string, destination: string)
  -> success: boolean
```

## node_dig


```lua
function core.node_dig(pos: vector, node: MapNode|{ name: string, param1: number, param2: number }, digger: PlayerRef)
```

 * `core.node_dig(pos, node, digger)`
     * Checks if node can be dug, puts item into inventory, removes node
     * Calls functions registered by `core.registered_on_dignodes()`

## node_punch


```lua
function core.node_punch(pos: vector, node: MapNode|{ name: string, param1: number, param2: number }, puncher: PlayerRef, pointed_thing: pointed_thing)
```

 * `core.node_punch(pos, node, puncher, pointed_thing)`
     * Calls functions registered by `core.register_on_punchnode()`

## object_refs


```lua
table<integer, ObjectRef>
```

## objects_in_area


```lua
function core.objects_in_area(minp: vector, maxp: vector)
  -> function
```

 * `core.objects_in_area(min_pos, max_pos)`
     * returns an iterator of valid objects

## objects_inside_radius


```lua
function core.objects_inside_radius(center: vector, radius: number)
  -> function
```

 * `core.objects_inside_radius(center, radius)`
     * returns an iterator of valid objects
     * example: `for obj in core.objects_inside_radius(center, radius) do obj:punch(...) end`

## override_chatcommand


```lua
function core.override_chatcommand(name: string, redef: table)
```

@*param* `redef` — sorry no types

## override_item


```lua
function core.override_item(name: string, redefinition: table, del_fields: table)
```

 * `core.override_item(name, redefinition, del_fields)`
     * `redefinition` is a table of fields `[name] = new_value`,
       overwriting fields of or adding fields to the existing definition.
     * `del_fields` is a list of field names to be set
       to `nil` ("deleted from") the original definition.
     * Overrides fields of an item registered with register_node/tool/craftitem.
     * Note: Item must already be defined.
     * Example: `core.override_item("default:mese",
       {light_source=core.LIGHT_MAX}, {"sounds"})`:
       Overwrites the `light_source` field,
       removes the sounds from the definition of the mese block.

@*param* `redefinition` — sorry no types for this one :)

@*param* `del_fields` — sorry no types for this one :)

## parse_json


```lua
function core.parse_json(string: string, nullvalue?: any, return_error?: boolean)
  -> boolean?
```

 * `core.parse_json(string[, nullvalue, return_error])`: returns something
     * Convert a string containing JSON data into the Lua equivalent
     * `nullvalue`: returned in place of the JSON null; defaults to `nil`
     * On success returns a table, a string, a number, a boolean or `nullvalue`
     * On failure: If `return_error` is not set or is `false`,
       outputs an error message and returns `nil`.
       Otherwise returns `nil, err` (error message).
     * Example: `parse_json("[10, {\"a\":false}]")`, returns `{10, {a = false}}`

@*return* — |any, any?

## parse_relative_number


```lua
function core.parse_relative_number(arg: string, relative_to: vector)
```

 * `core.parse_relative_number(arg, relative_to)`: returns number or nil
     * Helper function for chat commands.
     * For parsing an optionally relative number of a chat command
       parameter, using the chat command tilde notation.
     * `arg`: String snippet containing the number; possible values:
         * `"<number>"`: return as number
         * `"~<number>"`: return `relative_to + <number>`
         * `"~"`: return `relative_to`
         * Anything else will return `nil`
     * `relative_to`: Number to which the `arg` number might be relative to
     * Examples:
         * `core.parse_relative_number("5", 10)` returns 5
         * `core.parse_relative_number("~5", 10)` returns 15
         * `core.parse_relative_number("~", 10)` returns 10

## place_node


```lua
function core.place_node(pos: vector, node: MapNode|{ name: string, param1: number, param2: number }, placer?: PlayerRef)
  -> nil
```

 * `core.place_node(pos, node[, placer])`
     * Place node with the same effects that a player would cause
     * `placer`: The ObjectRef that places the node (optional)

## place_schematic


```lua
function core.place_schematic(pos: vector, schematic: schematic, rotation?: "0"|"180"|"270"|"90"|"random", replacements: table<string, string>, force_placement: boolean, flags?: string)
  -> boolean?
```

 * `core.place_schematic(pos, schematic, rotation, replacements, force_placement, flags)`
     * Place the schematic specified by schematic (see [Schematic specifier]) at
       `pos`.
     * `rotation` can equal `"0"`, `"90"`, `"180"`, `"270"`, or `"random"`.
     * If the `rotation` parameter is omitted, the schematic is not rotated.
     * `replacements` = `{["old_name"] = "convert_to", ...}`
     * `force_placement` is a boolean indicating whether nodes other than `air`
       and `ignore` are replaced by the schematic.
     * Returns nil if the schematic could not be loaded.
     * **Warning**: Once you have loaded a schematic from a file, it will be
       cached. Future calls will always use the cached version and the
       replacement list defined for it, regardless of whether the file or the
       replacement list parameter have changed. The only way to load the file
       anew is to restart the server.
     * `flags` is a flag field with the available flags:
         * place_center_x
         * place_center_y
         * place_center_z

```lua
rotation:
    | "0"
    | "90"
    | "180"
    | "270"
    | "random"
```

## place_schematic_on_vmanip


```lua
function core.place_schematic_on_vmanip(vmanip: VoxelManip, pos: any, schematic: schematic, rotation?: "0"|"180"|"270"|"90"|"random", replacement: table<string, string>, force_placement: boolean, flags?: string)
  -> boolean?
```

 stylua: ignore
 * `core.place_schematic_on_vmanip(vmanip, pos, schematic, rotation, replacement, force_placement, flags)`:
     * This function is analogous to core.place_schematic, but places a
       schematic onto the specified VoxelManip object `vmanip` instead of the
       map.
     * Returns false if any part of the schematic was cut-off due to the
       VoxelManip not containing the full area required, and true if the whole
       schematic was able to fit.
     * Returns nil if the schematic could not be loaded.
     * After execution, any external copies of the VoxelManip contents are
       invalidated.
     * `flags` is a flag field with the available flags:
         * place_center_x
         * place_center_y
         * place_center_z

```lua
rotation:
    | "0"
    | "90"
    | "180"
    | "270"
    | "random"
```

## player_exists


```lua
function core.player_exists(name: string)
  -> boolean
```

 * `core.player_exists(name)`: boolean, whether player exists
   (regardless of online status)

## pointed_thing_to_face_pos


```lua
function core.pointed_thing_to_face_pos(pointed_thing: pointed_thing)
  -> vector
```

## pos_to_string


```lua
function core.pos_to_string(pos: vector, decimal_places?: number)
  -> string
```

## protocol_versions


```lua
table<string, number>
```

## punch_node


```lua
function core.punch_node(pos: vector, puncher?: PlayerRef)
  -> nil
```

 * `core.punch_node(pos[, puncher])`
     * Punch node with the same effects that a player would cause
     * `puncher`: The ObjectRef that punches the node (optional)

## raillike_group


```lua
function core.raillike_group(name: string)
  -> number
```

 * `core.raillike_group(name)`: returns a rating
     * Returns rating of the connect_to_raillike group corresponding to name
     * If name is not yet the name of a connect_to_raillike group, a new group
       id is created, with that name.

## raycast


```lua
function
```

## read_schematic


```lua
function core.read_schematic(schematic?: any, options?: { write_yslice_prob: ("all"|"low"|"none")? })
  -> schematic?
```

 * `core.read_schematic(schematic, options)`
     * Returns a Lua table representing the schematic (see: [Schematic specifier])
     * `schematic` is the schematic to read (see: [Schematic specifier])
     * `options` is a table containing the following optional parameters:
         * `write_yslice_prob`: string value:
             * `none`: no `write_yslice_prob` table is inserted,
             * `low`: only probabilities that are not 254 or 255 are written in
               the `write_ylisce_prob` table,
             * `all`: write all probabilities to the `write_yslice_prob` table.
             * The default for this option is `all`.
             * Any invalid value will be interpreted as `all`.

@*param* `schematic` — unofficial note: i have no clue i'm sorry

## record_protection_violation


```lua
function core.record_protection_violation(pos: vector, name: string)
```

## register_abm


```lua
function core.register_abm(abmdef: ABMDef)
```

## register_alias


```lua
function core.register_alias(alias: string|"mapgen_apple"|"mapgen_cobble"|"mapgen_desert_sand"|"mapgen_desert_stone"...(+22), original_name: string)
```

 Also use this to set the 'mapgen aliases' needed in a game for the code mapgens.

```lua
--  Why is luanti mgv6 so mtg centric?
alias:
    | "mapgen_stone"
    | "mapgen_water_source"
    | "mapgen_river_water_source"
    | "mapgen_lava_source"
    | "mapgen_cobble"
    | "mapgen_dirt"
    | "mapgen_dirt_with_grass"
    | "mapgen_sand"
    | "mapgen_tree"
    | "mapgen_leaves"
    | "mapgen_apple"
    | "mapgen_cobble"
    | "mapgen_gravel"
    | "mapgen_desert_stone"
    | "mapgen_desert_sand"
    | "mapgen_dirt_with_snow"
    | "mapgen_snowblock"
    | "mapgen_snow"
    | "mapgen_ice"
    | "mapgen_jungletree"
    | "mapgen_jungleleaves"
    | "mapgen_pine_tree"
    | "mapgen_pine_needles"
    | "mapgen_stair_cobble"
    | "mapgen_mossycobble"
    | "mapgen_stair_desert_stone"
    | "mapgen_singlenode"
```

## register_alias_force


```lua
function core.register_alias_force(alias: string|"mapgen_apple"|"mapgen_cobble"|"mapgen_desert_sand"|"mapgen_desert_stone"...(+22), original_name: string)
```

```lua
--  Why is luanti mgv6 so mtg centric?
alias:
    | "mapgen_stone"
    | "mapgen_water_source"
    | "mapgen_river_water_source"
    | "mapgen_lava_source"
    | "mapgen_cobble"
    | "mapgen_dirt"
    | "mapgen_dirt_with_grass"
    | "mapgen_sand"
    | "mapgen_tree"
    | "mapgen_leaves"
    | "mapgen_apple"
    | "mapgen_cobble"
    | "mapgen_gravel"
    | "mapgen_desert_stone"
    | "mapgen_desert_sand"
    | "mapgen_dirt_with_snow"
    | "mapgen_snowblock"
    | "mapgen_snow"
    | "mapgen_ice"
    | "mapgen_jungletree"
    | "mapgen_jungleleaves"
    | "mapgen_pine_tree"
    | "mapgen_pine_needles"
    | "mapgen_stair_cobble"
    | "mapgen_mossycobble"
    | "mapgen_stair_desert_stone"
    | "mapgen_singlenode"
```

## register_allow_player_inventory_action


```lua
function core.register_allow_player_inventory_action(f: fun(player: PlayerRef, action: "move"|"put"|"take", inventory: InvRef, inventory_info: inventory_info):number)
```

 * `core.register_allow_player_inventory_action(function(player, action, inventory, inventory_info))`
     * Determines how much of a stack may be taken, put or moved to a
       player inventory.
     * Function arguments: see `core.register_on_player_inventory_action`
     * Return a numeric value to limit the amount of items to be taken, put or
       moved. A value of `-1` for `take` will make the source stack infinite.

## register_async_dofile


```lua
function core.register_async_dofile(path: string)
```

 * `core.register_async_dofile(path)`:
     * Register a path to a Lua file to be imported when an async environment
       is initialized. You can use this to preload code which you can then call
       later using `core.handle_async()`.

## register_authentication_handler


```lua
function core.register_authentication_handler(auth_handler_def: table)
```

 How many people do you think, have interacted with this function
 Have *wanted* to interact with this function...

 i think that number is like, 5?

 anyway docs:
 * Registers an auth handler that overrides the builtin one.
 * This function can be called by a single mod once only.

@*param* `auth_handler_def` — you know what you are doing, i am sorry but no types

## register_biome


```lua
function core.register_biome(biome_def: BiomeDef)
```

## register_can_bypass_userlimit


```lua
function core.register_can_bypass_userlimit(f: fun(name: string, ip: string))
```

 * `core.register_can_bypass_userlimit(function(name, ip))`
     * Called when `name` user connects with `ip`.
     * Return `true` to by pass the player limit

## register_chatcommand


```lua
function core.register_chatcommand(chatcommand_def: ChatCommandDef)
```

## register_craft


```lua
function core.register_craft(craft_recipe: CraftRecipe)
```

## register_craft_predict


```lua
function core.register_craft_predict(f: fun(itemstack: ItemStack, player: PlayerRef, old_crafting_grid: table, craft_inv: InvRef):ItemStack?)
```

 * `core.register_craft_predict(function(itemstack, player, old_craft_grid, craft_inv))`
     * The same as before, except that it is called before the player crafts, to
       make craft prediction, and it should not change anything.

## register_craftitem


```lua
function core.register_craftitem(name: string, itemdef: ItemDef)
```

 * Note: you must pass a clean table that hasn't already been used for
   another registration to this function, as it will be modified.

## register_decoration


```lua
function core.register_decoration(decoration_def: DecorationDef)
```

## register_entity


```lua
function core.register_entity(name: string, entity_def: EntityDef)
```

## register_globalstep


```lua
function core.register_globalstep(f: fun(dtime: number):nil)
  -> nil
```

 * Called every server step, usually interval of 0.1s.
 * `dtime` is the time since last execution in seconds.

## register_lbm


```lua
function core.register_lbm(lbmdef: LBMDef)
```

## register_mapgen_script


```lua
function core.register_mapgen_script(path: string)
```

 Mapgen environment
 ------------------

 The engine runs the map generator on separate threads, each of these also has
 a Lua environment. Its primary purpose is to allow mods to operate on newly
 generated parts of the map to e.g. generate custom structures.
 Internally it is referred to as "emerge environment".

 Refer to [Async environment] for the usual disclaimer on what environment isolation entails.

 The map generator threads, which also contain the above mentioned Lua environment,
 are initialized after all mods have been loaded by the server. After that the
 registered scripts (not all mods!) - see below - are run during initialization of
 the mapgen environment. After that only callbacks happen. The mapgen env
 does not have a global step or timer.

 * `core.register_mapgen_script(path)`:
     * Register a path to a Lua file to be imported when a mapgen environment
       is initialized. Run in order of registration.
 ### List of APIs available in the mapgen env

 Classes:

 * `AreaStore`
 * `ItemStack`
 * `ValueNoise`
 * `ValueNoiseMap`
 * `PseudoRandom`
 * `PcgRandom`
 * `SecureRandom`
 * `VoxelArea`
 * `VoxelManip`
     * only given by callbacks; cannot access rest of map
 * `Settings`

 Functions:

 * Standalone helpers such as logging, filesystem, encoding,
   hashing or compression APIs
 * `core.get_biome_id`, `get_biome_name`, `get_heat`, `get_humidity`,
   `get_biome_data`, `get_mapgen_object`, `get_mapgen_params`, `get_mapgen_edges`,
   `get_mapgen_setting`, `get_noiseparams`, `get_decoration_id` and more
 * `core.get_node`, `set_node`, `find_node_near`, `find_nodes_in_area`,
   `spawn_tree` and similar
     * these only operate on the current chunk (if inside a callback)
 * IPC

 Variables:

 * `core.settings`
 * `core.registered_items`, `registered_nodes`, `registered_tools`,
   `registered_craftitems` and `registered_aliases`
     * with all functions and userdata values replaced by `true`, calling any
       callbacks here is obviously not possible
 * `core.registered_biomes`, `registered_ores`, `registered_decorations`

 Note that node metadata does not exist in the mapgen env, we suggest deferring
 setting any metadata you need to the `on_generated` callback in the regular env.
 You can use the gennotify mechanism to transfer this information.

## register_node


```lua
function core.register_node(name: string, node_def: NodeDef)
```

## register_on_auth_fail


```lua
function core.register_on_auth_fail(f: fun(name: string, ip: string))
```

 * Deprecated: use `core.register_on_authplayer(name, ip, is_success)` instead.

## register_on_authplayer


```lua
function core.register_on_authplayer(f: fun(name: string, ip: string, is_success: boolean))
```

 * `core.register_on_authplayer(function(name, ip, is_success))`
     * Called when a client attempts to log into an account.
     * `name`: The name of the account being authenticated.
     * `ip`: The IP address of the client
     * `is_success`: Whether the client was successfully authenticated
     * For newly registered accounts, `is_success` will always be true

## register_on_chat_message


```lua
function core.register_on_chat_message(f: fun(name: string, message: string):boolean?)
```

 * `core.register_on_chat_message(function(name, message))`
     * Called always when a player says something
     * Return `true` to mark the message as handled, which means that it will
       not be sent to other players.

## register_on_chatcommand


```lua
function core.register_on_chatcommand(f: fun(name: string, command: string, params: string))
```

 * `core.register_on_chatcommand(function(name, command, params))`
     * Called always when a chatcommand is triggered, before `core.registered_chatcommands`
       is checked to see if the command exists, but after the input is parsed.
     * Return `true` to mark the command as handled, which means that the default
       handlers will be prevented.

## register_on_cheat


```lua
function core.register_on_cheat(f: fun(ObjectRef: ObjectRef, cheat: cheat_type))
```

 * `core.register_on_cheat(function(ObjectRef, cheat))`
     * Called when a player cheats
     * `cheat`: `{type=<cheat_type>}`, where `<cheat_type>` is one of:
         * `moved_too_fast`
         * `interacted_too_far`
         * `interacted_with_self`
         * `interacted_while_dead`
         * `finished_unknown_dig`
         * `dug_unbreakable`
         * `dug_too_fast`

## register_on_craft


```lua
function core.register_on_craft(f: fun(itemstack: ItemStack, player: PlayerRef, old_crafting_grid: table, craft_inv: InvRef):ItemStack?)
```

 * `core.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv))`
     * Called when `player` crafts something
     * `itemstack` is the output
     * `old_craft_grid` contains the recipe (Note: the one in the inventory is
       cleared).
     * `craft_inv` is the inventory with the crafting grid
     * Return either an `ItemStack`, to replace the output, or `nil`, to not
       modify it.

## register_on_dieplayer


```lua
function core.register_on_dieplayer(f: fun(ObjectRef: ObjectRef, reason: PlayerHPChangeReason))
```

 * `core.register_on_dieplayer(function(ObjectRef, reason))`
     * Called when a player dies
     * `reason`: a PlayerHPChangeReason table, see register_on_player_hpchange
     * For customizing the death screen, see `core.show_death_screen`.

## register_on_dignode


```lua
function core.register_on_dignode(f: fun(pos: vector, oldnode: MapNode|{ name: string, param1: number, param2: number }, digger: ObjectRef):nil)
  -> nil
```

 * `core.register_on_dignode(function(pos, oldnode, digger))`
     * Called when a node has been dug.
     * **Not recommended**; Use `on_destruct` or `after_dig_node` in node
       definition whenever possible.

## register_on_generated


```lua
function core.register_on_generated(f: fun(minp: vector, maxp: vector, blockseed: number):nil)
```

 Unofficial note: not actually deprecated but PLEASE use the mapgen env, use this only for prototyping/when you absolutely need to

## register_on_item_eat


```lua
function core.register_on_item_eat(f: fun(hp_change: number, replace_with_item?: ItemStack, itemstack: ItemStack, user: PlayerRef, pointed_thing: pointed_thing):ItemStack?)
```

 * `core.register_on_item_eat(function(hp_change, replace_with_item, itemstack, user, pointed_thing))`
     * Called when an item is eaten, by `core.item_eat`
     * Return `itemstack` to cancel the default item eat response (i.e.: hp increase).

## register_on_item_pickup


```lua
function core.register_on_item_pickup(f: fun(itemstack: ItemStack, picker: PlayerRef, pointed_thing: pointed_thing, time_from_last_punch: number, ...any):ItemStack?)
```

 * `core.register_on_item_pickup(function(itemstack, picker, pointed_thing, time_from_last_punch,  ...))`
     * Called by `core.item_pickup` before an item is picked up.
     * Function is added to `core.registered_on_item_pickups`.
     * Oldest functions are called first.
     * Parameters are the same as in the `on_pickup` callback.
     * Return an itemstack to cancel the default item pick-up response (i.e.: adding
       the item into inventory).

## register_on_joinplayer


```lua
function core.register_on_joinplayer(f: fun(ObjectRef: ObjectRef, last_login: string))
```

## register_on_leaveplayer


```lua
function core.register_on_leaveplayer(f: fun(ObjectRef: ObjectRef, timed_out: string))
```

## register_on_liquid_transformed


```lua
function core.register_on_liquid_transformed(f: fun(pos_list: vector[], node_list: MapNode|{ name: string, param1: number, param2: number }[]))
```

 * `core.register_on_liquid_transformed(function(pos_list, node_list))`
     * Called after liquid nodes (`liquidtype ~= "none"`) are modified by the
       engine's liquid transformation process.
     * `pos_list` is an array of all modified positions.
     * `node_list` is an array of the old node that was previously at the position
       with the corresponding index in pos_list.

## register_on_mapblocks_changed


```lua
function core.register_on_mapblocks_changed(f: fun(modified_blocks: table<number, boolean>, modified_block_count: number))
```

 * `core.register_on_mapblocks_changed(function(modified_blocks, modified_block_count))`
     * Called soon after any nodes or node metadata have been modified. No
       modifications will be missed, but there may be false positives.
     * Will never be called more than once per server step.
     * `modified_blocks` is the set of modified mapblock position hashes. These
       are in the same format as those produced by `core.hash_node_position`,
       and can be converted to positions with `core.get_position_from_hash`.
       The set is a table where the keys are hashes and the values are `true`.
     * `modified_block_count` is the number of entries in the set.
     * Note: callbacks must be registered at mod load time.

## register_on_modchannel_message


```lua
function core.register_on_modchannel_message(f: fun(channel_name: string, sender: string|PlayerRef, message: string))
```

## register_on_mods_loaded


```lua
function core.register_on_mods_loaded(f: fun():nil)
  -> nil
```

 * Called after mods have finished loading and before the media is cached or the
   aliases handled.

## register_on_newplayer


```lua
function core.register_on_newplayer(f: fun(ObjectRef: ObjectRef):nil)
```

## register_on_placenode


```lua
function core.register_on_placenode(f: fun(pos: vector, newnode: MapNode|{ name: string, param1: number, param2: number }, placer: ObjectRef, oldnode: MapNode|{ name: string, param1: number, param2: number }, itemstack: ItemStack, pointed_thing: pointed_thing):boolean?)
  -> nil
```

 * `core.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack, pointed_thing))`
     * Called when a node has been placed
     * If return `true` no item is taken from `itemstack`
     * `placer` may be any valid ObjectRef or nil.
     * **Not recommended**; use `on_construct` or `after_place_node` in node
       definition whenever possible.

## register_on_player_hpchange


```lua
function core.register_on_player_hpchange(f: fun(player: ObjectRef, hp_change: number, reason: PlayerHPChangeReason):number?, modifier?: boolean)
```

 * `core.register_on_player_hpchange(function(player, hp_change, reason), modifier)`
     * Called when the player gets damaged or healed
     * When `hp == 0`, damage doesn't trigger this callback.
     * When `hp == hp_max`, healing does still trigger this callback.
     * `player`: ObjectRef of the player
     * `hp_change`: the amount of change. Negative when it is damage.
       * Historically, the new HP value was clamped to [0, 65535] before
         calculating the HP change. This clamping has been removed as of
         version 5.10.0
     * `reason`: a PlayerHPChangeReason table.
         * The `type` field will have one of the following values:
             * `set_hp`: A mod or the engine called `set_hp` without
                         giving a type - use this for custom damage types.
             * `punch`: Was punched. `reason.object` will hold the puncher, or nil if none.
             * `fall`
             * `node_damage`: `damage_per_second` from a neighboring node.
                              `reason.node` will hold the node name or nil.
                              `reason.node_pos` will hold the position of the node
             * `drown`
             * `respawn`
         * Any of the above types may have additional fields from mods.
         * `reason.from` will be `mod` or `engine`.
     * `modifier`: when true, the function should return the actual `hp_change`.
        Note: modifiers only get a temporary `hp_change` that can be modified by later modifiers.
        Modifiers can return true as a second argument to stop the execution of further functions.
        Non-modifiers receive the final HP change calculated by the modifiers.

## register_on_player_inventory_action


```lua
function core.register_on_player_inventory_action(f: fun(player: PlayerRef, action: "move"|"put"|"take", inventory: InvRef, inventory_info: inventory_info):nil)
```

## register_on_player_receive_fields


```lua
function core.register_on_player_receive_fields(f: fun(player: PlayerRef, formname: string, fields: formspec_fields):boolean?)
```

 * `core.register_on_player_receive_fields(function(player, formname, fields))`
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
       closed the form by mouse click, keypress or through a `button_exit[]`
       element.
     * Special case: `["try_quit"]="true"` is sent when the user tries to
       close the formspec, but the formspec used `allow_close[false]`.
     * Special case: `["key_enter"]="true"` is sent when the user pressed
       the Enter key and the focus was either nowhere (causing the formspec
       to be closed) or on a button. If the focus was on a text field,
       additionally, the index `key_enter_field` contains the name of the
       text field. See also: `field_close_on_enter`.
 * Newest functions are called first
 * If function returns `true`, remaining functions are not called

## register_on_prejoinplayer


```lua
function core.register_on_prejoinplayer(f: fun(name: string, ip: string))
```

## register_on_priv_grant


```lua
function core.register_on_priv_grant(f: fun(name: string, granter?: PlayerRef, priv: string))
```

 * `core.register_on_priv_grant(function(name, granter, priv))`
     * Called when `granter` grants the priv `priv` to `name`.
     * Note that the callback will be called twice if it's done by a player,
       once with granter being the player name, and again with granter being nil.

## register_on_priv_revoke


```lua
function core.register_on_priv_revoke(f: fun(name: string, revoker?: PlayerRef, priv: string))
```

 * `core.register_on_priv_revoke(function(name, revoker, priv))`
     * Called when `revoker` revokes the priv `priv` from `name`.
     * Note that the callback will be called twice if it's done by a player,
       once with revoker being the player name, and again with revoker being nil.

## register_on_protection_violation


```lua
function core.register_on_protection_violation(f: fun(pos: vector, name: string))
```

 * `core.register_on_protection_violation(function(pos, name))`
     * Called by `builtin` and mods when a player violates protection at a
       position (eg, digs a node or punches a protected entity).
     * The registered functions can be called using
       `core.record_protection_violation`.
     * The provided function should check that the position is protected by the
       mod calling this function before it prints a message, if it does, to
       allow for multiple protection mods.

## register_on_punchnode


```lua
function core.register_on_punchnode(f: fun(pos: vector, node: MapNode|{ name: string, param1: number, param2: number }, puncher: ObjectRef, pointed_thing: pointed_thing):nil)
  -> nil
```

 * `core.register_on_punchnode(function(pos, node, puncher, pointed_thing))`
     * Called when a node is punched

## register_on_punchplayer


```lua
function core.register_on_punchplayer(f: fun(player: ObjectRef, hitter: ObjectRef, time_from_last_punch?: number, tool_capabilities?: tool_capabilities, dir: vector, damage: number):boolean?)
```

 * `core.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage))`
     * Called when a player is punched
     * Note: This callback is invoked even if the punched player is dead.
     * `player`: ObjectRef - Player that was punched
     * `hitter`: ObjectRef - Player that hit. Can be nil.
     * `time_from_last_punch`: Meant for disallowing spamming of clicks
       (can be nil).
     * `tool_capabilities`: Capability table of used item (can be nil)
     * `dir`: Unit vector of direction of punch. Always defined. Points from
       the puncher to the punched.
     * `damage`: Number that represents the damage calculated by the engine
     * should return `true` to prevent the default damage mechanism

## register_on_respawnplayer


```lua
function core.register_on_respawnplayer(f: fun(ObjectRef: ObjectRef))
```

## register_on_rightclickplayer


```lua
function core.register_on_rightclickplayer(f: fun(player: ObjectRef, clicker: ObjectRef))
```

 * `core.register_on_rightclickplayer(function(player, clicker))`
     * Called when the 'place/use' key was used while pointing a player
       (not necessarily an actual rightclick)
     * `player`: ObjectRef - Player that is acted upon
     * `clicker`: ObjectRef - Object that acted upon `player`, may or may not be a player

## register_on_shutdown


```lua
function core.register_on_shutdown(f: fun():nil)
  -> nil
```

 * Called before server shutdown
 * Players that were kicked by the shutdown procedure are still fully accessible
  in `core.get_connected_players()`.
 * **Warning**: If the server terminates abnormally (i.e. crashes), the
   registered callbacks **will likely not be run**. Data should be saved at
   semi-frequent intervals as well as on server shutdown.

## register_portable_metatable


```lua
function core.register_portable_metatable(name: string, mt: table)
```

 * `core.register_portable_metatable(name, mt)`:
     * Register a metatable that should be preserved when Lua data is transferred
       between environments (via IPC or `handle_async`).
     * `name` is a string that identifies the metatable. It is recommended to
       follow the `modname:name` convention for this identifier.
     * `mt` is the metatable to register.
     * Note that the same metatable can be registered under multiple names,
       but multiple metatables must not be registered under the same name.
     * You must register the metatable in both the main environment
       and the async environment for this mechanism to work.

## register_privilege


```lua
function core.register_privilege(name: string, def: PrivDef)
```

## register_schematic


```lua
function core.register_schematic(schem_def: table)
```

@*param* `schem_def` — sorry no types :(

## register_tool


```lua
function core.register_tool(name: string, itemdef: ItemDef)
```

 * Note: you must pass a clean table that hasn't already been used for
   another registration to this function, as it will be modified.

## registered_abms


```lua
ABMDef[]
```

## registered_aliases


```lua
table<string, string>
```

## registered_allow_player_inventory_actions


```lua
function[]
```

## registered_biomes


```lua
table<string|integer, BiomeDef>
```

## registered_can_bypass_userlimit


```lua
function[]
```

## registered_chatcommands


```lua
table<string, ChatCommandDef>
```

## registered_craft_predicts


```lua
function[]
```

## registered_craftitems


```lua
table<string, ItemDef>
```

## registered_decorations


```lua
table<string|integer, DecorationDef>
```

## registered_entities


```lua
table<string, EntityDef>
```

## registered_globalsteps


```lua
function[]
```

## registered_items


```lua
table<string, ItemDef>
```

## registered_lbms


```lua
LBMDef[]
```

## registered_nodes


```lua
table<string, NodeDef>
```

## registered_on_authplayers


```lua
function[]
```

## registered_on_chat_messages


```lua
function[]
```

## registered_on_chatcommands


```lua
function[]
```

## registered_on_cheats


```lua
function[]
```

## registered_on_crafts


```lua
function[]
```

## registered_on_dieplayers


```lua
function[]
```

## registered_on_dignodes


```lua
function[]
```

## registered_on_generateds


```lua
function[]
```

## registered_on_item_eats


```lua
function[]
```

## registered_on_item_pickups


```lua
function[]
```

## registered_on_joinplayers


```lua
function[]
```

## registered_on_leaveplayers


```lua
function[]
```

## registered_on_liquid_transformed


```lua
function[]
```

## registered_on_mapblocks_changed


```lua
function[]
```

## registered_on_modchannel_message


```lua
function[]
```

## registered_on_mods_loaded


```lua
function[]
```

## registered_on_newplayers


```lua
function[]
```

## registered_on_placenodes


```lua
function[]
```

## registered_on_player_inventory_actions


```lua
function[]
```

## registered_on_player_receive_fields


```lua
function[]
```

## registered_on_prejoinplayers


```lua
function[]
```

## registered_on_priv_grant


```lua
function[]
```

## registered_on_priv_revoke


```lua
function[]
```

## registered_on_protection_violation


```lua
function[]
```

## registered_on_punchnodes


```lua
function[]
```

## registered_on_punchplayers


```lua
function[]
```

## registered_on_respawnplayers


```lua
function[]
```

## registered_on_rightclickplayers


```lua
function[]
```

## registered_on_shutdown


```lua
function[]
```

## registered_ores


```lua
table<string|integer, OreDef>
```

## registered_privileges


```lua
table<string, PrivDef>
```

## registered_tools


```lua
table<string, ItemDef>
```

## remove_detached_inventory


```lua
function core.remove_detached_inventory(name: string)
  -> boolean
```

## remove_node


```lua
function core.remove_node(pos: vector)
```

 * `core.bulk_swap_node({pos1, pos2, pos3, ...}, node)`
     * Equivalent to `core.swap_node` but in bulk.

## remove_player


```lua
function core.remove_player(name: string)
  -> 0|1|2
```

 * `core.remove_player(name)`: remove player from database (if they are not
   connected).
     * As auth data is not removed, `core.player_exists` will continue to
       return true. Call the below method as well if you want to remove auth
       data too.
     * Returns a code (0: successful, 1: no such player, 2: player is connected)

```lua
return #1:
    | 0
    | 1
    | 2
```

## remove_player_auth


```lua
function core.remove_player_auth(name: string)
  -> success: boolean
```

 * `core.remove_player_auth(name)`: remove player authentication data
     * Returns boolean indicating success (false if player nonexistent)

## request_http_api


```lua
function core.request_http_api()
  -> HTTPApiTable?
```

 * `core.request_http_api()`:
     * returns `HTTPApiTable` containing http functions if the calling mod has
       been granted access by being listed in the `secure.http_mods` or
       `secure.trusted_mods` setting, otherwise returns `nil`.
     * The returned table contains the functions `fetch`, `fetch_async` and
       `fetch_async_get` described below.
     * Only works at init time and must be called from the mod's main scope
       (not from a function).
     * Function only exists if Luanti server was built with cURL support.
     * **DO NOT ALLOW ANY OTHER MODS TO ACCESS THE RETURNED TABLE, STORE IT IN
       A LOCAL VARIABLE!**

## request_insecure_environment


```lua
function core.request_insecure_environment()
  -> table
```

 Unofficial note: This is one of the best features of luanti (no need to ask "is this mod safe?????"), but also a pain when you need it, and when it would be a lot more performant if you had it tbh
 * `core.request_insecure_environment()`: returns an environment containing
   insecure functions if the calling mod has been listed as trusted in the
   `secure.trusted_mods` setting or security is disabled, otherwise returns
   `nil`.
     * Only works at init time and must be called from the mod's main scope
       (ie: the init.lua of the mod, not from another Lua file or within a function).
     * **DO NOT ALLOW ANY OTHER MODS TO ACCESS THE RETURNED ENVIRONMENT, STORE
       IT IN A LOCAL VARIABLE!**

## request_shutdown


```lua
function core.request_shutdown(message?: string, reconnect?: boolean, delay?: number)
```

 * `core.request_shutdown([message],[reconnect],[delay])`: request for
   server shutdown. Will display `message` to clients.
     * `reconnect` == true displays a reconnect button
     * `delay` adds an optional delay (in seconds) before shutdown.
       Negative delay cancels the current active shutdown.
       Zero delay triggers an immediate shutdown.

## rgba


```lua
function core.rgba(red: number, green: number, blue: number, alpha?: number)
  -> string
```

 * `core.rgba(red, green, blue[, alpha])`: returns a string
     * Each argument is an 8 Bit unsigned integer
     * Returns the ColorString from rgb or rgba values
     * Example: `core.rgba(10, 20, 30, 40)`, returns `"#0A141E28"`

## rmdir


```lua
function core.rmdir(path: string, recursive?: boolean)
  -> success: boolean
```

## rollback_get_node_actions


```lua
function core.rollback_get_node_actions(pos: vector, range: number, seconds: number, limit: number)
  -> { [1]: PlayerRef, [2]: vector, [3]: number, [4]: MapNode|{ name: string, param1: number, param2: number }, [5]: MapNode|{ name: string, param1: number, param2: number } }[]
```

 * `core.rollback_get_node_actions(pos, range, seconds, limit)`:
   returns `{{actor, pos, time, oldnode, newnode}, ...}`
     * Find who has done something to a node, or near a node
     * `actor`: `"player:<name>"`, also `"liquid"`.

## rollback_revert_actions_by


```lua
function core.rollback_revert_actions_by(actor: string, seconds: number)
  -> boolean
  2. log_messages: string[]
```

 * `core.rollback_revert_actions_by(actor, seconds)`: returns
   `boolean, log_messages`.
     * Revert latest actions of someone
     * `actor`: `"player:<name>"`, also `"liquid"`.

## rotate_and_place


```lua
function core.rotate_and_place(itemstack: ItemStack, placer: PlayerRef, pointed_thing: pointed_thing, infinitestacks?: boolean, orient_flags?: { invert_wall: boolean?, force_wall: boolean?, force_ceiling: boolean?, force_floor: boolean?, force_facedir: boolean? }, prevent_after_place?: boolean)
  -> integer
```

 * `core.rotate_and_place(itemstack, placer, pointed_thing[, infinitestacks,
   orient_flags, prevent_after_place])`
     * Attempt to predict the desired orientation of the facedir-capable node
       defined by `itemstack`, and place it accordingly (on-wall, on the floor,
       or hanging from the ceiling).
     * `infinitestacks`: if `true`, the itemstack is not changed. Otherwise the
       stacks are handled normally.
     * `orient_flags`: Optional table containing extra tweaks to the placement code:
         * `invert_wall`:   if `true`, place wall-orientation on the ground and
           ground-orientation on the wall.
         * `force_wall`:    if `true`, always place the node in wall orientation.
         * `force_ceiling`: if `true`, always place on the ceiling.
         * `force_floor`:   if `true`, always place the node on the floor.
         * `force_facedir`: if `true`, forcefully reset the facedir to north
           when placing on the floor or ceiling.
         * The first four options are mutually-exclusive; the last in the list
           takes precedence over the first.
     * `prevent_after_place` is directly passed to `core.item_place_node`
     * Returns the new itemstack after placement

## rotate_node


```lua
function core.rotate_node(itemstack: ItemStack, placer: PlayerRef, pointed_thing: pointed_thing)
  -> nil
```

 * `core.rotate_node(itemstack, placer, pointed_thing)`
     * calls `rotate_and_place()` with `infinitestacks` set according to the state
       of the creative mode setting, checks for "sneak" to set the `invert_wall`
       parameter and `prevent_after_place` set to `true`

## safe_file_write


```lua
function core.safe_file_write(path: string, content: string)
  -> success: boolean
```

 * `core.safe_file_write(path, content)`: returns boolean indicating success
     * Replaces contents of file at path with new contents in a safe (atomic)
       way. Use this instead of below code when writing e.g. database files:
       `local f = io.open(path, "wb"); f:write(content); f:close()`

## save_gen_notify


```lua
function core.save_gen_notify(id: string, data: any)
```

 * `core.save_gen_notify(id, data)`
     * Saves data for retrieval using the gennotify mechanism (see [Mapgen objects]).
     * Data is bound to the chunk that is currently being processed, so this function
       only makes sense inside the `on_generated` callback.
     * `id`: user-defined ID (a string)
       By convention these should be the mod name with an optional
       colon and specifier added, e.g. `"default"` or `"default:dungeon_loot"`
     * `data`: any Lua object (will be serialized, no userdata allowed)
     * returns `true` if the data was remembered. That is if `core.set_gen_notify`
       was called with the same user-defined ID before.

## send_join_message


```lua
function core.send_join_message(player_name: string)
```

 * `core.send_join_message(player_name)`
     * This function can be overridden by mods to change the join message.

## send_leave_message


```lua
function core.send_leave_message(player_name: string, timed_out: boolean)
```

 * `core.send_leave_message(player_name, timed_out)`
     * This function can be overridden by mods to change the leave message.

## serialize


```lua
function core.serialize(table: any)
  -> string
```

 * `core.serialize(table)`: returns a string
     * Convert a value into string form readable by `core.deserialize`.
     * Supports tables, strings, numbers, booleans and `nil`.
     * Support for dumping function bytecode is **deprecated**.
     * Note: To obtain a human-readable representation of a value, use `dump` instead.
     * Example: `serialize({foo="bar"})`, returns `'return { ["foo"] = "bar" }'`

## serialize_schematic


```lua
function core.serialize_schematic(schematic: schematic, format: "lua"|"mts", options?: { lua_use_comments: boolean?, lua_num_indent_spaces: number? })
```

 * `core.serialize_schematic(schematic, format, options)`
     * Return the serialized schematic specified by schematic
       (see [Schematic specifier])
     * in the `format` of either "mts" or "lua".
     * "mts" - a string containing the binary MTS data used in the MTS file
       format.
     * "lua" - a string containing Lua code representing the schematic in table
       format.
     * `options` is a table containing the following optional parameters:
         * If `lua_use_comments` is true and `format` is "lua", the Lua code
           generated will have (X, Z) position comments for every X row
           generated in the schematic data for easier reading.
         * If `lua_num_indent_spaces` is a nonzero number and `format` is "lua",
           the Lua code generated will use that number of spaces as indentation
           instead of a tab character.

```lua
format:
    | "mts"
    | "lua"
```

## set_gen_notify


```lua
function core.set_gen_notify(flags: string, deco_ids: string[], custom_ids: string[])
```

 Unofficial Note: The types are a guess xD i have no idea how this works
 * `core.set_gen_notify(flags, [deco_ids], [custom_ids])`
     * Set the types of on-generate notifications that should be collected.
     * `flags`: flag field, see [`gennotify`] for available generation notification types.
     * The following parameters are optional:
     * `deco_ids` is a list of IDs of decorations which notification
       is requested for.
     * `custom_ids` is a list of user-defined IDs (strings) which are
       requested. By convention these should be the mod name with an optional
       colon and specifier added, e.g. `"default"` or `"default:dungeon_loot"`

## set_mapgen_setting


```lua
function core.set_mapgen_setting(name: string, value: string, override_meta?: boolean)
  -> nil
```

 * `core.set_mapgen_setting(name, value, [override_meta])`
     * Sets a mapgen param to `value`, and will take effect if the corresponding
       mapgen setting is not already present in map_meta.txt.
     * `override_meta` is an optional boolean (default: `false`). If this is set
       to true, the setting will become the active setting regardless of the map
       metafile contents.
     * Note: to set the seed, use `"seed"`, not `"fixed_map_seed"`.

## set_mapgen_setting_noiseparams


```lua
function core.set_mapgen_setting_noiseparams(name: string, value: NoiseParams, override_meta?: boolean)
```

 * `core.set_mapgen_setting_noiseparams(name, value, [override_meta])`
     * Same as above, except value is a NoiseParams table.

## set_node


```lua
function core.set_node(pos: vector, node: MapNodeOpt|{ name: string, param1: number?, param2: number? })
```

 * `core.set_node(pos, node)`
     * Set node at position `pos`.
     * Any existing metadata is deleted.
     * `node`: table `{name=string, param1=number, param2=number}`
       If param1 or param2 is omitted, it's set to `0`.
     * e.g. `core.set_node({x=0, y=10, z=0}, {name="default:wood"})`

## set_noiseparams


```lua
function core.set_noiseparams(name: string, noiseparams: NoiseParams, set_default?: boolean)
  -> nil
```

 * `core.set_noiseparams(name, noiseparams, set_default)`
     * Sets the noiseparams setting of `name` to the noiseparams table specified
       in `noiseparams`.
     * `set_default` is an optional boolean (default: `true`) that specifies
       whether the setting should be applied to the default config or current
       active config.

## set_timeofday


```lua
function core.set_timeofday(val: number)
```

## settings


```lua
Settings
```

 ### Format

 The settings have the format `key = value`. Example:

     foo = example text
     bar = """
     Multiline
     value
     """

## sha1


```lua
function core.sha1(data: string, raw?: boolean)
  -> string
```

 Unofficial note: you could be mining bitcoin rn /joke

@*param* `raw` — raw bytes instead of hex digits, default: false

## sha256


```lua
function core.sha256(data: string, raw?: boolean)
  -> string
```

@*param* `raw` — raw bytes instead of hex digits, default: false

## show_death_screen


```lua
function core.show_death_screen(player: PlayerRef, reason: PlayerHPChangeReason)
```

 * `core.show_death_screen(player, reason)`
     * Called when the death screen should be shown.
     * `player` is an ObjectRef, `reason` is a PlayerHPChangeReason table or nil.
     * By default, this shows a simple formspec with the option to respawn.
       Respawning is done via `ObjectRef:respawn`.
     * You can override this to show a custom death screen.
     * For general death handling, use `core.register_on_dieplayer` instead.

## show_formspec


```lua
function core.show_formspec(playername: string, formname: string, formspec: string)
  -> nil
```

 * `core.show_formspec(playername, formname, formspec)`
     * `playername`: name of player to show formspec
     * `formname`: name passed to `on_player_receive_fields` callbacks.
         * It should follow the `"modname:<whatever>"` naming convention.
         * If empty: Shows a custom, temporary inventory formspec.
             * An inventory formspec shown this way will also be updated if
               `ObjectRef:set_inventory_formspec` is called.
             * Use `ObjectRef:set_inventory_formspec` to change the player's
               inventory formspec for future opens.
             * Supported if server AND client are both of version >= 5.13.0.
     * `formspec`: formspec to display
     * See also: `core.register_on_player_receive_fields`

## sound_fade


```lua
function core.sound_fade(handle: sound_handle, step: number, gain: number)
```

 * `core.sound_fade(handle, step, gain)`
     * `handle` is a handle returned by `core.sound_play`
     * `step` determines how fast a sound will fade.
       The gain will change by this much per second,
       until it reaches the target gain.
       Note: Older versions used a signed step. This is deprecated, but old
       code will still work. (the client uses abs(step) to correct it)
     * `gain` the target gain for the fade.
       Fading to zero will delete the sound.

## sound_play


```lua
function core.sound_play(spec: SimpleSoundSpec, parameters: sound_params, ephemeral: boolean)
  -> sound_handle?
```

 Unofficial note: i made ephemeral NOT be optional because it's a good idea to explicitely set it (most of the time you don't use that, so set it to true)
 * `core.sound_play(spec, parameters, [ephemeral])`: returns a handle
     * `spec` is a `SimpleSoundSpec`
     * `parameters` is a sound parameter table
     * `ephemeral` is a boolean (default: false)
       Ephemeral sounds will not return a handle and can't be stopped or faded.
       It is recommend to use this for short sounds that happen in response to
       player actions (e.g. door closing).

## sound_stop


```lua
function core.sound_stop(handle: sound_handle)
```

 * `core.sound_stop(handle)`
     * `handle` is a handle returned by `core.sound_play`

## spawn_falling_node


```lua
function core.spawn_falling_node(pos: vector)
  -> boolean
```

 * `core.spawn_falling_node(pos)`
     * Change node into falling node
     * Returns `true` and the ObjectRef of the spawned entity if successful, `false` on failure

## spawn_tree


```lua
function core.spawn_tree(pos: vector, lsystem: lsystem)
  -> nil
```

## spawn_tree_on_vmanip


```lua
function core.spawn_tree_on_vmanip(vmanip: VoxelManip, pos: vector, treedef: lsystem)
  -> nil
```

## string_to_area


```lua
function core.string_to_area(str: string, relative_to?: vector)
  -> vector?
  2. vector?
```

returns two positions
Converts a string representing an area box into two positions
X1, Y1, ... Z2 are coordinates
relative_to: Optional. If set to a position, each coordinate can use the tilde notation for relative positions
"~": Relative coordinate
"~<number>": Relative coordinate plus <number>
Example: core.string_to_area("(1,2,3) (~5,~-5,~)", {x=10,y=10,z=10}) returns {x=1,y=2,z=3}, {x=15,y=5,z=10}


@*param* `str` — (X1, Y1, Z1) (X2, Y2, Z2)

## string_to_pos


```lua
function core.string_to_pos(string: string)
  -> vector
```

## strip_background_colors


```lua
function core.strip_background_colors(str: string)
  -> string
```

 Removes background colors added by get_background_escape_sequence.

## strip_colors


```lua
function core.strip_colors(str: string)
  -> string
```

 Removes all color escape sequences.

## strip_foreground_colors


```lua
function core.strip_foreground_colors(str: string)
  -> string
```

 Removes foreground colors added by get_color_escape_sequence.

## strip_param2_color


```lua
function core.strip_param2_color(param2: number, paramtype2: string)
  -> number?
```

## swap_node


```lua
function core.swap_node(pos: vector, node: MapNodeOpt|{ name: string, param1: number?, param2: number? })
```

 * `core.swap_node(pos, node)`
     * Swap node at position with another.
     * This keeps the metadata intact and will not run con-/destructor callbacks.

## time_to_day_night_ratio


```lua
function core.time_to_day_night_ratio(time_of_day: string)
  -> number
```

## translate


```lua
function core.translate(textdomain: string, str: string, ...string)
```

* `core.translate(textdomain, str, ...)` translates the string `str` with
  the given `textdomain` for disambiguation. The textdomain must match the
  textdomain specified in the translation file in order to get the string
  translated. This can be used so that a string is translated differently in
  different contexts.
  It is advised to use the name of the mod as textdomain whenever possible, to
  avoid clashes with other mods.
  This function must be given a number of arguments equal to the number of
  arguments the translated string expects.
  Arguments are literal strings -- they will not be translated.


## translate_n


```lua
function core.translate_n(textdomain: string, str: string, str_plural: string, n: number, ...string)
```

* `core.translate_n(textdomain, str, str_plural, n, ...)` translates the
  string `str` with the given `textdomain` for disambiguaion. The value of
  `n`, which must be a nonnegative integer, is used to decide whether to use
  the singular or the plural version of the string. Depending on the locale of
  the client, the choice between singular and plural might be more complicated,
  but the choice will be done automatically using the value of `n`.

  You can read https://www.gnu.org/software/gettext/manual/html_node/Plural-forms.html
  for more details on the differences of plurals between languages.

  Also note that plurals are only handled in .po or .mo files, and not in .tr files.


For instance, suppose we want to greet players when they join and provide a
command that shows the amount of time since the player joined. We can do the
following:

```lua
local S, PS = core.get_translator("hello")
core.register_on_joinplayer(function(player)
    local name = player:get_player_name()
    core.chat_send_player(name, S("Hello @1, how are you today?", name))
end)
core.register_chatcommand("playtime", {
    func = function(name)
        local last_login = core.get_auth_handler().get_auth(name).last_login
        local playtime = math.floor((last_login-os.time())/60)
        return true, PS(
            "You have been playing for @1 minute.",
            "You have been playing for @1 minutes.",
            minutes, tostring(minutes))
    end,
})

```
When someone called "CoolGuy" joins the game with an old client or a client
that does not have localization enabled, they will see `Hello CoolGuy, how are
you today?`. If they use the `/playtime` command, they will see `You have been
playing for 1 minute` or (for example) `You have been playing for 4 minutes.`

However, if we have for instance a translation file named `hello.de.po`
containing the following:

```po
msgid ""
msgstr ""
"Plural-Forms: nplurals=2; plural=(n != 1);\n"

msgid "Hello @1, how are you today?"
msgstr "Hallo @1, wie geht es dir heute?"

msgid "You have been playing for @1 minute."
msgid_plural "You have been playing for @1 minutes."
msgstr[0] "Du spielst seit @1 Minute."
msgstr[1] "Du spielst seit @1 Minuten."
```

and CoolGuy has set a German locale, they will see `Hallo CoolGuy, wie geht es
dir heute?` when they join, and the `/playtime` command will show them `Du
spielst seit 1 Minute.` or (for example) `Du spielst seit 4 Minuten.`


## unban_player_or_ip


```lua
function core.unban_player_or_ip(ip_or_name: string)
```

 * `core.unban_player_or_ip(ip_or_name)`: remove ban record matching
   IP address or name

## unregister_biome


```lua
function core.unregister_biome(name: string)
```

 * Unregisters the biome from the engine, and deletes the entry with key
   `name` from `core.registered_biomes`.
 * Warning: This alters the biome to biome ID correspondences, so any
   decorations or ores using the 'biomes' field must afterwards be cleared
   and re-registered.

## unregister_chatcommand


```lua
function core.unregister_chatcommand(name: string)
```

## unregister_item


```lua
function core.unregister_item(name: string)
```

## urlencode


```lua
function core.urlencode(str: string)
  -> string
```

 * `core.urlencode(str)`: Encodes reserved URI characters by a
   percent sign followed by two hex digits. See
   [RFC 3986, section 2.3](https://datatracker.ietf.org/doc/html/rfc3986#section-2.3).

## wallmounted_to_dir


```lua
function core.wallmounted_to_dir(wallmounted: number)
  -> vector
```

## wrap_text


```lua
function core.wrap_text(str: string, limit: integer, as_table?: boolean)
  -> string
```

## write_json


```lua
function core.write_json(data: any, styled?: boolean)
  -> string
```

 * `core.write_json(data[, styled])`: returns a string or `nil` and an error
   message.
     * Convert a Lua table into a JSON string
     * styled: Outputs in a human-readable format if this is set, defaults to
       false.
     * Unserializable things like functions and userdata will cause an error.
     * **Warning**: JSON is more strict than the Lua table format.
         1. You can only use strings and positive integers of at least one as
            keys.
         2. You cannot mix string and integer keys.
            This is due to the fact that JSON has two distinct array and object
            values.
     * Example: `write_json({10, {a = false}})`,
       returns `'[10, {"a": false}]'`

## yaw_to_dir


```lua
function core.yaw_to_dir(yaw: number)
  -> vector
```


---

# minetest


```lua
core
```


---

# module


```lua
function module(name: string, ...any)
```


---

# moveresult

## collides


```lua
boolean
```

## collisions


```lua
collision[]
```

## standing_on_object


```lua
boolean
```

## touching_ground


```lua
boolean
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

# particle_spawner_float_range


---

# particle_spawner_tween_float_range

## [integer]


```lua
number|{ min: number, max: number, bias: number? }
```

## reps


```lua
number?
```

## start


```lua
number?
```

## style


```lua
("flicker"|"fwd"|"pulse"|"rev")?
```


---

# particle_spawner_tween_vec2

## [integer]


```lua
{ x: number, y: number }
```

## reps


```lua
number?
```

## start


```lua
number?
```

## style


```lua
("flicker"|"fwd"|"pulse"|"rev")?
```


---

# particle_spawner_tween_vec3

## [integer]


```lua
vector
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## reps


```lua
number?
```

## start


```lua
number?
```

## style


```lua
("flicker"|"fwd"|"pulse"|"rev")?
```


---

# particle_spawner_tween_vec3_range

## [integer]


```lua
number|vector|{ min: number|vector, max: number|vector, bias: number? }
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## reps


```lua
number?
```

## start


```lua
number?
```

## style


```lua
("flicker"|"fwd"|"pulse"|"rev")?
```


---

# particle_spawner_vec3_range


---

# pcall


```lua
function pcall(f: fun(...any):...unknown, arg1?: any, ...any)
  -> success: boolean
  2. result: any
  3. ...any
```


---

# player_information

## address


```lua
string
```

 IP address of client

## avg_jitter


```lua
number?
```

 average packet time jitter

## avg_rtt


```lua
number?
```

 average round trip time

## connection_uptime


```lua
number
```

 seconds since client connected

## formspec_version


```lua
number
```

 supported formspec version

## ip_version


```lua
number
```

 IPv4 / IPv6

## lang_code


```lua
string
```

 Language code used for translation

## max_jitter


```lua
number?
```

 maximum packet time jitter

## max_rtt


```lua
number?
```

 maximum round trip time

## min_jitter


```lua
number?
```

 minimum packet time jitter

## min_rtt


```lua
number?
```

 minimum round trip time

## protocol_version


```lua
number
```

 protocol version used by client

## version_string


```lua
string
```

 The version information is provided by the client and may be spoofed
 or inconsistent in engine forks. You must not use this for checking
 feature availability of clients. Instead, do use the fields
 `protocol_version` and `formspec_version` where it matters.
 Use `core.protocol_versions` to map Luanti versions to protocol versions.
 This version string is only suitable for analysis purposes.
 full version string


---

# pointed_thing

## above


```lua
vector?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## box_id


```lua
integer?
```

 Only raycast supports this
 * `pointed_thing.box_id`: The ID of the pointed selection box (counting starts
   from 1).

## intersection_normal


```lua
vector?
```

 Only raycast supports this
 * `pointed_thing.intersection_normal`: Unit vector, points outwards of the
   selected selection box. This specifies which face is pointed at.
   Is a null vector `vector.zero()` when the pointer is inside the selection box.
   For entities with rotated selection boxes, this will be rotated properly
   by the entity's rotation - it will always be in absolute world space.

## intersection_point


```lua
vector?
```

 Only raycast supports this
 * `pointed_thing.intersection_point`: The absolute world coordinates of the
   point on the selection box which is pointed at. May be in the selection box
   if the pointer is in the box too.

## ref


```lua
ObjectRef?
```

 `ObjectRef`
 -----------

 Moving things in the game are generally these.
 This is basically a reference to a C++ `ServerActiveObject`.

 ### Advice on handling `ObjectRefs`

 When you receive an `ObjectRef` as a callback argument or from another API
 function, it is possible to store the reference somewhere and keep it around.
 It will keep functioning until the object is unloaded or removed.

 However, doing this is **NOT** recommended - `ObjectRefs` should be "let go"
 of as soon as control is returned from Lua back to the engine.

 Doing so is much less error-prone and you will never need to wonder if the
 object you are working with still exists.

 If this is not feasible, you can test whether an `ObjectRef` is still valid
 via `object:is_valid()`.

 Getters may be called for invalid objects and will return nothing then.
 All other methods should not be called on invalid objects.

 ### Attachments

 It is possible to attach objects to other objects (`set_attach` method).

 When an object is attached, it is positioned relative to the parent's position
 and rotation. `get_pos` and `get_rotation` will always return the parent's
 values and changes via their setter counterparts are ignored.

 To change position or rotation call `set_attach` again with the new values.

 **Note**: Just like model dimensions, the relative position in `set_attach`
 must be multiplied by 10 compared to world positions.

 It is also possible to attach to a bone of the parent object. In that case the
 child will follow movement and rotation of that bone.


## type


```lua
"node"|"nothing"|"object"
```

## under


```lua
vector?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it



---

# popenmode


---

# poshash


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

# s.default_jump


```lua
number
```


---

# s.entities


```lua
Spacea.Entities
```


---

# s.entities.get_eyepos


```lua
function Spacea.Entities.get_eyepos(object: ObjectRef)
  -> vector
```


---

# s.f


```lua
Functional
```


---

# s.f.curry


```lua
function Functional.curry(f: any, ...any)
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
function Functional.math.add(a: any, b: any)
  -> unknown
```


---

# s.f.math.div


```lua
function Functional.math.div(a: any, b: any)
  -> unknown
```


---

# s.f.math.mul


```lua
function Functional.math.mul(a: any, b: any)
  -> unknown
```


---

# s.f.math.sub


```lua
function Functional.math.sub(a: any, b: any)
  -> unknown
```


---

# s.foreach


```lua
function s.foreach(t: <T>[], f: fun(v: <T>, i: integer))
```


---

# s.foreachp


```lua
function s.foreachp(t: table<any, any>, f: fun(v: any, k: any))
```


---

# s.get_or_load_node


```lua
function s.get_or_load_node(pos: vector)
  -> MapNode|{ name: string, param1: number, param2: number }
```


---

# s.globalstep_with_timer


```lua
function s.globalstep_with_timer(timer_max: number, f: fun(dtime: number))
  -> nil
```


---

# s.gravity


```lua
number
```


---

# s.is_air


```lua
function s.is_air(name: any)
  -> boolean
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

# s.mapgen


```lua
table
```


---

# s.mapgen.noises


```lua
table
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

# s.player.respawn_player


```lua
function s.player.respawn_player(player_ref: PlayerRef, attempts?: integer)
  -> boolean?
```


---

# s.settings


```lua
table
```


---

# s.settings.cloud_transparency


```lua
string
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

# schematic


---

# seekwhence


---

# select


```lua
function select(index: integer|"#", ...any)
  -> any
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

# sound_handle


---

# sound_params

## exclude_player


```lua
string?
```

## fade


```lua
number?
```

## gain


```lua
number?
```

## loop


```lua
boolean?
```

## max_hear_distance


```lua
number?
```

## object


```lua
ObjectRef?
```

 `ObjectRef`
 -----------

 Moving things in the game are generally these.
 This is basically a reference to a C++ `ServerActiveObject`.

 ### Advice on handling `ObjectRefs`

 When you receive an `ObjectRef` as a callback argument or from another API
 function, it is possible to store the reference somewhere and keep it around.
 It will keep functioning until the object is unloaded or removed.

 However, doing this is **NOT** recommended - `ObjectRefs` should be "let go"
 of as soon as control is returned from Lua back to the engine.

 Doing so is much less error-prone and you will never need to wonder if the
 object you are working with still exists.

 If this is not feasible, you can test whether an `ObjectRef` is still valid
 via `object:is_valid()`.

 Getters may be called for invalid objects and will return nothing then.
 All other methods should not be called on invalid objects.

 ### Attachments

 It is possible to attach objects to other objects (`set_attach` method).

 When an object is attached, it is positioned relative to the parent's position
 and rotation. `get_pos` and `get_rotation` will always return the parent's
 values and changes via their setter counterparts are ignored.

 To change position or rotation call `set_attach` again with the new values.

 **Note**: Just like model dimensions, the relative position in `set_attach`
 must be multiplied by 10 compared to world positions.

 It is also possible to attach to a bone of the parent object. In that case the
 child will follow movement and rotation of that bone.


## pitch


```lua
number?
```

## pos


```lua
vector?
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## start_time


```lua
number?
```

## to_player


```lua
string?
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

## split


```lua
function string.split(str: string, separator: string, include_empty?: boolean, max_splits?: integer, sep_is_pattern?: boolean)
  -> string[]
```

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

# string.split


```lua
function string.split(str: string, separator: string, include_empty?: boolean, max_splits?: integer, sep_is_pattern?: boolean)
  -> string[]
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

## split


```lua
function string.split(str: string, separator: string, include_empty?: boolean, max_splits?: integer, sep_is_pattern?: boolean)
  -> string[]
```

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


---

# table


```lua
tablelib
```


---

# table.concat


```lua
function table.concat(list: table, sep?: string, i?: integer, j?: integer)
  -> string
```


---

# table.copy


```lua
function table.copy(table: table)
  -> table
```


---

# table.copy_with_metatables


```lua
function table.copy_with_metatables(table: table)
  -> table
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
function table.indexof(list: table<integer, any>, val: any)
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
  -> nil
```


---

# table.key_value_swap


```lua
function table.key_value_swap(t: table)
  -> table
```


---

# table.keyof


```lua
function table.keyof(table: table, val: any)
  -> any
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
function table.shuffle(table: table, from?: integer, to?: integer, random_func?: fun(int1: integer, int2: integer):integer)
  -> nil
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
function table.copy(table: table)
  -> table
```

## copy_with_metatables


```lua
function table.copy_with_metatables(table: table)
  -> table
```

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
function table.indexof(list: table<integer, any>, val: any)
  -> integer
```

 If it's not found it will return -1, list must not have negative indeces and any non-numerical indeces are ignored

## insert


```lua
function table.insert(list: table, pos: integer, value: any)
```


Inserts element `value` at position `pos` in `list`.

[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-table.insert"])

## insert_all


```lua
function table.insert_all(table: table, other_table: table)
  -> nil
```

## key_value_swap


```lua
function table.key_value_swap(t: table)
  -> table
```

## keyof


```lua
function table.keyof(table: table, val: any)
  -> any
```

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
function table.shuffle(table: table, from?: integer, to?: integer, random_func?: fun(int1: integer, int2: integer):integer)
  -> nil
```

@*param* `random_func` — Should return a random int, by default math.random

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

# textdomain


---

# thread


---

# tonumber


```lua
function tonumber(e: any)
  -> number?
```


---

# tool_capabilities

## damage_groups


```lua
table<string, integer>?
```

## full_punch_interval


```lua
number?
```

## groupcaps


```lua
table<string, { times: number[]?, uses: number?, maxlevel: number? }>?
```

## max_drop_level


```lua
number?
```

## punch_attack_uses


```lua
integer?
```

 Amount of uses this tool has for attacking players and entities
 by punching them (0 = infinite uses).
 For compatibility, this is automatically set from the first
 suitable groupcap using the formula "uses * 3^(maxlevel - 1)".
 It is recommend to set this explicitly instead of relying on the
 fallback behavior.


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


```lua
function type(v: any)
  -> type: "boolean"|"function"|"nil"|"number"|"string"...(+3)
```


---

# type


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
vectorlib
```


---

# vector

## abs


```lua
function vector.abs(v: vector)
  -> vector
```

 Returns a vector with absolute values for each component

## add


```lua
function vector.add(v: vector, x: number|vector)
  -> vector
```

## angle


```lua
function vector.angle(v1: vector, v2: vector)
  -> number
```

 Returns the angle between v1 and v2 in radians

@*return* — in radians

## apply


```lua
function vector.apply(v: vector, func: fun(n: number):number, ...any)
  -> vector
```

 Applies `func` to each component

@*param* `...` — Optional arguments passed to `func`

## ceil


```lua
function vector.ceil(v: vector)
  -> vector
```

Returns a vector, each dimension rounded up.

## check


```lua
function vector.check(v: vector)
  -> boolean
```

 Checks if `v` is a vector, returns false even for tables like {x=,y=,z=}, has to be created with a vector function

## combine


```lua
function vector.combine(v: vector, w: vector, func: fun(x: number, y: number):number)
  -> vector
```

 Returns a vector where the function `func` has combined both components of `v` and `w` for each component

## copy


```lua
function vector.copy(v: vector)
  -> vector
```

 Returns a copy of the vector `v`.

## cross


```lua
function vector.cross(v1: vector, v2: vector)
  -> vector
```

 Returns the cross product

## dir_to_rotation


```lua
function vector.dir_to_rotation(direction: vector, up?: vector)
  -> vector
```

Returns a rotation vector for direction pointing forward using up as the up vector.
If up is omitted, the roll of the returned vector defaults to zero.
Otherwise direction and up need to be vectors in a 90 degree angle to each other.


## direction


```lua
function vector.direction(p1: vector, p2: vector)
  -> vector
```

Returns a vector of length 1 with direction p1 to p2.
If p1 and p2 are identical, returns (0, 0, 0).


## distance


```lua
function vector.distance(p1: vector, p2: vector)
  -> number
```

Returns zero or a positive number, the distance between p1 and p2.


## divide


```lua
function vector.divide(v: vector, x: number)
  -> vector
```

## dot


```lua
function vector.dot(v1: vector, v2: vector)
  -> number
```

 Returns the dot product

## equals


```lua
function vector.equals(v1: vector, v2: vector)
  -> boolean
```

 Returns true if the vectors are identical, false if not

## floor


```lua
function vector.floor(v: vector)
  -> vector
```

Returns a vector, each dimension rounded down.

## from_string


```lua
function vector.from_string(s: string, init?: number)
  -> v: vector?
  2. np: number?
```

Returns v, np, where v is a vector read from the given string s and np is the next position in the string after the vector.
Returns nil on failure.


@*param* `s` — Has to begin with a substring of the form `"(x, y, z)"`. Additional spaces, leaving away commas, and adding an additional comma to the end is allowed.

@*param* `init` — Starts looking for the vector at this string index

## in_area


```lua
function vector.in_area(pos: vector, min: vector, max: vector)
  -> boolean
```

 Checks if `pos` is inside an area formed by `min` and `max`
 `min` and `max` are inclusive
 If min is bigger than max on some axis, function always returns false.
 You can use vector.sort if you have two vectors and don't know which are the minimum and the maximum.

## length


```lua
function vector.length(v: vector)
  -> number
```

 Returns zero or a positive number, the length of vector v.

## multiply


```lua
function vector.multiply(v: vector, x: number)
  -> vector
```

## new


```lua
function vector.new(a: number, b?: number, c?: number)
  -> vector
```

 Returns a new vector `(a, b, c)`

## normalize


```lua
function vector.normalize(v: vector)
  -> vector
```

 Returns a vector of length 1 with direction of vector v.
 If v has zero length, returns (0, 0, 0).

## offset


```lua
function vector.offset(v: vector, x: number, y: number, z: number)
  -> vector
```

 Returns the sum of vectors `v` and `(x,y,z)`

## random_direction


```lua
function vector.random_direction()
  -> vector
```

 Returns a new vector of length 1, pointing into a direction chosen uniformly at random.

## random_in_area


```lua
function vector.random_in_area(min: vector, max: vector)
  -> vector
```

Returns a random integer position in area formed by min and max
min and max are inclusive.
You can use vector.sort if you have two vectors and don't know which are the minimum and the maximum.


## rotate


```lua
function vector.rotate(v: vector, r: vector)
  -> vector
```

Applies the rotation r to v and returns the result.
vector.rotate(vector.new(0, 0, 1), r) and vector.rotate(vector.new(0, 1, 0), r) return vectors pointing forward and up relative to an entity's rotation r.


@*param* `r` — Rotation vector {x=<pitch>, y=<yaw>, z=<roll>}

## rotate_around_axis


```lua
function vector.rotate_around_axis(v1: vector, v2: vector, a: number)
  -> vector
```

 Returns v1 rotated around axis v2 by a radians according to the right hand rule.

@*param* `a` — radians

## round


```lua
function vector.round(v: vector)
  -> vector
```

Returns a vector, each dimension rounded to the nearest integer.
 At a multiple of 0.5, rounds away from zero.

## sign


```lua
function vector.sign(v: vector, tolerance?: number)
  -> vector
```

 Returns a vector where `math.sign` was called for each component

## sort


```lua
function vector.sort(v1: vector, v2: vector)
  -> vector
  2. vector
```

 Returns in order minp, maxp vectors of the cuboid defined by v1, v2.
 (Unofficial note: In other words, the first vector that gets returned will be smaller than the second, yknow it sorts them)

## subtract


```lua
function vector.subtract(v: vector, x: number|vector)
  -> vector
```

## to_string


```lua
function vector.to_string(v: vector)
  -> string
```

 Returns a string of the form `"(x, y, z)"`
 `tostring(v)` does the same

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

## zero


```lua
function vector.zero()
  -> vector
```

 Returns a new vector `(0, 0, 0)`


---

# vector.Schur

## x


```lua
vector
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## y


```lua
vector
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it


## z


```lua
vector
```

 Unofficial notes:
 Please treat vectors like they are immutable as much as you can, unless for performance reasons, in that case get rid of that metatable
 Example:
local x_coords = {}
local y_coords = {}
local z_coords = {}

local vec_t = {}

....

vec_t.x = x_coords[n]
vec_t.y = y_coords[n]
vec_t.z = z_coords[n]

This will probably drastically reduce on garbage collector use, as vectors are HORRIBLE for it



---

# vector.abs


```lua
function vector.abs(v: vector)
  -> vector
```


---

# vector.add


```lua
function vector.add(v: vector, x: number|vector)
  -> vector
```


---

# vector.angle


```lua
function vector.angle(v1: vector, v2: vector)
  -> number
```


---

# vector.apply


```lua
function vector.apply(v: vector, func: fun(n: number):number, ...any)
  -> vector
```


---

# vector.ceil


```lua
function vector.ceil(v: vector)
  -> vector
```


---

# vector.check


```lua
function vector.check(v: vector)
  -> boolean
```


---

# vector.combine


```lua
function vector.combine(v: vector, w: vector, func: fun(x: number, y: number):number)
  -> vector
```


---

# vector.copy


```lua
function vector.copy(v: vector)
  -> vector
```


---

# vector.cross


```lua
function vector.cross(v1: vector, v2: vector)
  -> vector
```


---

# vector.dir_to_rotation


```lua
function vector.dir_to_rotation(direction: vector, up?: vector)
  -> vector
```


---

# vector.direction


```lua
function vector.direction(p1: vector, p2: vector)
  -> vector
```


---

# vector.distance


```lua
function vector.distance(p1: vector, p2: vector)
  -> number
```


---

# vector.divide


```lua
function vector.divide(v: vector, x: number)
  -> vector
```


```lua
function vector.divide(v: vector, x: vector)
  -> vector.Schur
```


---

# vector.dot


```lua
function vector.dot(v1: vector, v2: vector)
  -> number
```


---

# vector.equals


```lua
function vector.equals(v1: vector, v2: vector)
  -> boolean
```


---

# vector.floor


```lua
function vector.floor(v: vector)
  -> vector
```


---

# vector.from_string


```lua
function vector.from_string(s: string, init?: number)
  -> v: vector?
  2. np: number?
```


---

# vector.in_area


```lua
function vector.in_area(pos: vector, min: vector, max: vector)
  -> boolean
```


---

# vector.length


```lua
function vector.length(v: vector)
  -> number
```


---

# vector.multiply


```lua
function vector.multiply(v: vector, x: number)
  -> vector
```


```lua
function vector.multiply(v: vector, x: vector)
  -> vector.Schur
```


---

# vector.new


```lua
function vector.new(a: number, b?: number, c?: number)
  -> vector
```


```lua
function vector.new(a: vector)
  -> vector
```


```lua
function vector.new()
  -> vector
```


---

# vector.normalize


```lua
function vector.normalize(v: vector)
  -> vector
```


---

# vector.offset


```lua
function vector.offset(v: vector, x: number, y: number, z: number)
  -> vector
```


---

# vector.random_direction


```lua
function vector.random_direction()
  -> vector
```


---

# vector.random_in_area


```lua
function vector.random_in_area(min: vector, max: vector)
  -> vector
```


---

# vector.rotate


```lua
function vector.rotate(v: vector, r: vector)
  -> vector
```


---

# vector.rotate_around_axis


```lua
function vector.rotate_around_axis(v1: vector, v2: vector, a: number)
  -> vector
```


---

# vector.round


```lua
function vector.round(v: vector)
  -> vector
```


---

# vector.sign


```lua
function vector.sign(v: vector, tolerance?: number)
  -> vector
```


---

# vector.sort


```lua
function vector.sort(v1: vector, v2: vector)
  -> vector
  2. vector
```


---

# vector.subtract


```lua
function vector.subtract(v: vector, x: number|vector)
  -> vector
```


---

# vector.to_string


```lua
function vector.to_string(v: vector)
  -> string
```


---

# vector.zero


```lua
function vector.zero()
  -> vector
```


---

# vectorlib

## abs


```lua
function vector.abs(v: vector)
  -> vector
```

 Returns a vector with absolute values for each component

## add


```lua
function vector.add(v: vector, x: number|vector)
  -> vector
```

## angle


```lua
function vector.angle(v1: vector, v2: vector)
  -> number
```

 Returns the angle between v1 and v2 in radians

@*return* — in radians

## apply


```lua
function vector.apply(v: vector, func: fun(n: number):number, ...any)
  -> vector
```

 Applies `func` to each component

@*param* `...` — Optional arguments passed to `func`

## ceil


```lua
function vector.ceil(v: vector)
  -> vector
```

Returns a vector, each dimension rounded up.

## check


```lua
function vector.check(v: vector)
  -> boolean
```

 Checks if `v` is a vector, returns false even for tables like {x=,y=,z=}, has to be created with a vector function

## combine


```lua
function vector.combine(v: vector, w: vector, func: fun(x: number, y: number):number)
  -> vector
```

 Returns a vector where the function `func` has combined both components of `v` and `w` for each component

## copy


```lua
function vector.copy(v: vector)
  -> vector
```

 Returns a copy of the vector `v`.

## cross


```lua
function vector.cross(v1: vector, v2: vector)
  -> vector
```

 Returns the cross product

## dir_to_rotation


```lua
function vector.dir_to_rotation(direction: vector, up?: vector)
  -> vector
```

Returns a rotation vector for direction pointing forward using up as the up vector.
If up is omitted, the roll of the returned vector defaults to zero.
Otherwise direction and up need to be vectors in a 90 degree angle to each other.


## direction


```lua
function vector.direction(p1: vector, p2: vector)
  -> vector
```

Returns a vector of length 1 with direction p1 to p2.
If p1 and p2 are identical, returns (0, 0, 0).


## distance


```lua
function vector.distance(p1: vector, p2: vector)
  -> number
```

Returns zero or a positive number, the distance between p1 and p2.


## divide


```lua
function vector.divide(v: vector, x: number)
  -> vector
```

## dot


```lua
function vector.dot(v1: vector, v2: vector)
  -> number
```

 Returns the dot product

## equals


```lua
function vector.equals(v1: vector, v2: vector)
  -> boolean
```

 Returns true if the vectors are identical, false if not

## floor


```lua
function vector.floor(v: vector)
  -> vector
```

Returns a vector, each dimension rounded down.

## from_string


```lua
function vector.from_string(s: string, init?: number)
  -> v: vector?
  2. np: number?
```

Returns v, np, where v is a vector read from the given string s and np is the next position in the string after the vector.
Returns nil on failure.


@*param* `s` — Has to begin with a substring of the form `"(x, y, z)"`. Additional spaces, leaving away commas, and adding an additional comma to the end is allowed.

@*param* `init` — Starts looking for the vector at this string index

## in_area


```lua
function vector.in_area(pos: vector, min: vector, max: vector)
  -> boolean
```

 Checks if `pos` is inside an area formed by `min` and `max`
 `min` and `max` are inclusive
 If min is bigger than max on some axis, function always returns false.
 You can use vector.sort if you have two vectors and don't know which are the minimum and the maximum.

## length


```lua
function vector.length(v: vector)
  -> number
```

 Returns zero or a positive number, the length of vector v.

## multiply


```lua
function vector.multiply(v: vector, x: number)
  -> vector
```

## new


```lua
function vector.new(a: number, b?: number, c?: number)
  -> vector
```

 Returns a new vector `(a, b, c)`

## normalize


```lua
function vector.normalize(v: vector)
  -> vector
```

 Returns a vector of length 1 with direction of vector v.
 If v has zero length, returns (0, 0, 0).

## offset


```lua
function vector.offset(v: vector, x: number, y: number, z: number)
  -> vector
```

 Returns the sum of vectors `v` and `(x,y,z)`

## random_direction


```lua
function vector.random_direction()
  -> vector
```

 Returns a new vector of length 1, pointing into a direction chosen uniformly at random.

## random_in_area


```lua
function vector.random_in_area(min: vector, max: vector)
  -> vector
```

Returns a random integer position in area formed by min and max
min and max are inclusive.
You can use vector.sort if you have two vectors and don't know which are the minimum and the maximum.


## rotate


```lua
function vector.rotate(v: vector, r: vector)
  -> vector
```

Applies the rotation r to v and returns the result.
vector.rotate(vector.new(0, 0, 1), r) and vector.rotate(vector.new(0, 1, 0), r) return vectors pointing forward and up relative to an entity's rotation r.


@*param* `r` — Rotation vector {x=<pitch>, y=<yaw>, z=<roll>}

## rotate_around_axis


```lua
function vector.rotate_around_axis(v1: vector, v2: vector, a: number)
  -> vector
```

 Returns v1 rotated around axis v2 by a radians according to the right hand rule.

@*param* `a` — radians

## round


```lua
function vector.round(v: vector)
  -> vector
```

Returns a vector, each dimension rounded to the nearest integer.
 At a multiple of 0.5, rounds away from zero.

## sign


```lua
function vector.sign(v: vector, tolerance?: number)
  -> vector
```

 Returns a vector where `math.sign` was called for each component

## sort


```lua
function vector.sort(v1: vector, v2: vector)
  -> vector
  2. vector
```

 Returns in order minp, maxp vectors of the cuboid defined by v1, v2.
 (Unofficial note: In other words, the first vector that gets returned will be smaller than the second, yknow it sorts them)

## subtract


```lua
function vector.subtract(v: vector, x: number|vector)
  -> vector
```

## to_string


```lua
function vector.to_string(v: vector)
  -> string
```

 Returns a string of the form `"(x, y, z)"`
 `tostring(v)` does the same

## zero


```lua
function vector.zero()
  -> vector
```

 Returns a new vector `(0, 0, 0)`


---

# warn


```lua
function warn(message: string, ...any)
```


---

# wear_bar_params

## blend


```lua
"constant"|"linear"
```

## color_stops


```lua
table<number, ColorSpec>
```


---

# window_information

## max_formspec_size


```lua
{ x: number, y: number }
```

 Estimated maximum formspec size before Luanti will start shrinking the
 formspec to fit. For a fullscreen formspec, use this formspec size and
 `padding[0,0]`. `bgcolor[;true]` is also recommended.

## real_gui_scaling


```lua
number
```

 GUI Scaling multiplier
 Equal to the setting `gui_scaling` multiplied by `dpi / 96`

## real_hud_scaling


```lua
number
```

 HUD Scaling multiplier
 Equal to the setting `hud_scaling` multiplied by `dpi / 96`

## size


```lua
{ x: integer, y: integer }
```

 Current size of the in-game render target (pixels).

 This is usually the window size, but may be smaller in certain situations,
 such as side-by-side mode.

## touch_controls


```lua
boolean
```

Requires 5.9.0 on android


---

# xpcall


```lua
function xpcall(f: fun(...any):...unknown, msgh: function, arg1?: any, ...any)
  -> success: boolean
  2. result: any
  3. ...any
```