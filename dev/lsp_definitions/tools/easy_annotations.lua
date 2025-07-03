---@diagnostic disable: undefined-global
--[[
Zero-Clause BSD
=============

Permission to use, copy, modify, and/or distribute this software for
any purpose with or without fee is hereby granted.

THE SOFTWARE IS PROVIDED “AS IS” AND THE AUTHOR DISCLAIMS ALL
WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE
FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY
DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
]]
-- by frog (:
-- use with neovim by doing :source %

-- love neovim for that
-- like geniuenly, HOW COOL IS THAT??????????????????? that i can just DO THAT?

local comment = '--'

local type_aliases = {
    -- Default
    n = 'number',
    i = 'integer',
    t = 'table',
    a = 'any',
    s = 'string',
    b = 'boolean',
    T = 'table?',
    I = 'integer?',
    N = 'number?',
    S = 'string?',
    B = 'boolean?',

    -- Custom, put your own here
    v = 'vector',
    V = 'vector?',
    c = 'ColorString',
    C = 'ColorString?',
    m = 'MapNode',
    M = 'MapNodeOpt',

    X = 'nil',
}

local annotation_aliases = {
    ['n'] = '---@nodiscard',
}

local trigger = comment .. 'A#'

local function process_annotations(annotations, function_def)
    local mode = 'annotations'

    local result = {}

    local function_arguments = vim.split(
        function_def:sub(
            assert(function_def:find '%(', 'Line below an easy annotation must be a function') + 1,
            assert(function_def:find '%)', 'Line below an easy annotation must be a function') - 1
        ),
        ',',
        { plain = true, trimempty = true }
    )
    for k, v in pairs(function_arguments) do
        function_arguments[k] = vim.trim(v)
    end

    local current_arg = 1
    for i = 1, #annotations do
        local char = annotations:sub(i, i)
        if char == '-' then
            if mode == 'annotations' then
                mode = 'types'
            else
                mode = 'return'
            end
        else
            if mode == 'types' then
                local type = assert(type_aliases[char], char .. ' is not a valid type alias')
                local arg = function_arguments[current_arg]
                result[#result + 1] = '---@param ' .. arg .. ' ' .. type
                current_arg = current_arg + 1
            elseif mode == 'annotations' then
                result[#result + 1] = annotation_aliases[char]
            elseif mode == 'return' then
                local type = assert(type_aliases[char], char .. ' is not a valid type alias')
                result[#result + 1] = '---@return ' .. type
            end
        end
    end
    return result
end

-- Can do :An
pcall(vim.api.nvim_del_user_command, 'Annotations')
vim.api.nvim_create_user_command('Annotations', function()
    ---@type string[]
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    for i, line in pairs(lines) do
        if vim.startswith(line, trigger) then
            local new_annotations = process_annotations(line:sub(#trigger), lines[i + 1])
            -- new_annotations[#new_annotations + 1] = lines[i + 1]
            vim.api.nvim_buf_set_lines(0, i - 1, i, true, new_annotations)
        end
    end
end, {})

-- oh and also this is not a plugin, just something you :source sometimes
-- yeah i know lame
