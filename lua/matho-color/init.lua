local M = { }

-- comment
local palette = {
    fg_main = "#b0b0b0",
    fg_01 = "#dddddd",
    fg_02 = "#f0f0f0",
    bg_main = "none",
    green = "#93b595",
    blue = "#81a5b8",
    purple = "#a893b5",
    orange = "#c9b181",
    red = "#ba848c",
}

local hl = { }

hl.syntax = {
    Normal = { fg = palette.fg_main },
    String = { fg = palette.fg_main },
    Character = { fg = palette.fg_main },
    Number = { fg = palette.fg_main },
    Float = { fg = palette.fg_main },
    Boolean = { fg = palette.fg_main },
    Type = { fg = palette.fg_main },
    Structure = { fg = palette.fg_main },
    StorageClass = { fg = palette.fg_main },
    Identifier = { fg = palette.fg_main },
    Constant = { fg = palette.fg_main },
    PreProc = { fg = palette.fg_main },
    PreCondit = { fg = palette.fg_main },
    Include = { fg = palette.fg_main },
    Keyword = { fg = palette.fg_main },
    Define = { fg = palette.fg_main },
    Typedef = { fg = palette.fg_main },
    Exception = { fg = palette.fg_main },
    Conditional = { fg = palette.fg_main },
    Repeat = { fg = palette.fg_main },
    Statement = { fg = palette.fg_main },
    Macro = { fg = palette.fg_main },
    Error = { fg = palette.fg_main },
    Label = { fg = palette.fg_main },
    Special = { fg = palette.fg_main },
    SpecialChar = { fg = palette.fg_main },
    Function = { fg = palette.fg_main },
    Operator = { fg = palette.fg_main },
    Title = { fg = palette.fg_main },
    Tag = { fg = palette.fg_main },
    Delimiter = { fg = palette.fg_main },
    Comment = { fg = palette.fg_main },
    SpecialComment = { fg = palette.fg_main },
    Todo = { fg = palette.fg_main },
}

-- comment
hl.treesitter = {
    ["@variable"] = { fg = palette.fg_main },
    ["@constant"] = { fg = palette.fg_main },
    ["@module"] = { fg = palette.fg_main },
    ["@label"] = { fg = palette.fg_main },
    ["@string"] = { fg = palette.green },
    ["@character"] = { fg = palette.green },
    ["@boolean"] = { fg = palette.fg_main },
    ["@number"] = { fg = palette.orange },
    ["@type"] = { fg = palette.fg_02 },
    ["@attribute"] = { fg = palette.fg_01 },
    ["@function"] = { fg = palette.fg_02 },
    ["@constructor"] = { fg = palette.fg_main },
    ["@operator"] = { fg = palette.fg_01 },
    ["@keyword"] = { fg = palette.purple },
    ["@punctuation"] = { fg = palette.fg_01 },
    ["@comment"] = { fg = palette.orange },
    ["@markup"] = { fg = palette.fg_main },
    ["@diff"] = { fg = palette.fg_main },
    ["@tag"] = { fg = palette.fg_main },
}

local function set_highlights(highlights)
    for hl_group, hl_settings in pairs(highlights) do
        local hl_command = string.format("highlight %s guifg=%s guibg=%s guisp=%s gui=%s",
            hl_group,
            hl_settings.fg or "none",
            hl_settings.bg or "none",
            hl_settings.sp or "none",
            hl_settings.fmt or "none"
        )
        vim.api.nvim_command(hl_command)
    end
end


function M.setup()
    vim.g.colors_name = "matho-color"

    set_highlights(hl.syntax)
    set_highlights(hl.treesitter)
end

return M
