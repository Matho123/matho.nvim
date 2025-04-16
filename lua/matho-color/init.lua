local M = {}

-- comment
local palette = {
    fg_main = "#bbbbbb",
    darker1 = "#9e9e9e",
    darker2 = "#8b8b8b",
    darker3 = "#7c7c7c",

    background = "#191919",

    light_purple = "#bf8fb5",
    purple = "#a87da0",
    dark_purple = "#65435e",
    green = "#819B69",
    yellow = "#cfad70",
    red = "#de6e7c",
    blue = "#70a7cf",
}

local hl = {}

hl.common = {
    LineNr = { fg = "#616161" },
    CursorLineNr = { fg = palette.fg_main, fmt = "bold" },
    CursorLine = { bg = "#1c1c1c" },
    Directory = { fg = palette.fg_main, fmt = "bold" },
    ModeMsg = { fg = palette.fg_main, fmt = "bold" },
    Search = { fg = palette.fg_main, bg = palette.dark_purple },
    MatchParen = { fg = palette.fg_main, bg = palette.dark_purple },
    Substitute = { fg = palette.fg_main, bg = palette.dark_purple },
    QuickFixLine = { fg = palette.fg_main, bg = palette.dark_purple },
    CurSearch = { fg = palette.background, bg = palette.light_purple },
    IncSearch = { fg = palette.background, bg = palette.light_purple },
    WildMenu = { fg = palette.background, bg = palette.light_purple },
    StatusLine = { fg = palette.fg_main, bg = "#303030" },
    MoreMsg = { fg = palette.green, fmt = "bold" },
    Question = { fg = palette.green, fmt = "bold" },
    netrwComment = { fg = palette.darker2 },
    netrwQuickHelp = { fg = palette.darker2 },
}

hl.syntax = {
    Normal = { fg = palette.fg_main },
    Bold = { fmt = "bold" },
    Boolean = { fg = palette.fg_main, fmt = "italic" },
    String = { fg = palette.darker2, fmt = "italic" },
    Character = { fg = palette.darker2, fmt = "italic" },
    Number = { fg = palette.darker2 },
    Float = { fg = palette.darker2 },
    Type = { fg = palette.darker1 },
    Typedef = { fg = palette.darker1 },
    Structure = { fg = palette.fg_main },
    StorageClass = { fg = palette.fg_main },
    Identifier = { fg = palette.darker1 },
    Constant = { fg = palette.darker1, fmt = "bold" },
    PreProc = { fg = palette.fg_main },
    PreCondit = { fg = palette.fg_main },
    Keyword = { fg = palette.fg_main, fmt = "bold" },
    Define = { fg = palette.fg_main },
    Exception = { fg = palette.fg_main },
    Conditional = { fg = palette.fg_main },
    Repeat = { fg = palette.fg_main },
    Statement = { fg = palette.fg_main, fmt = "bold" },
    Label = { fg = palette.fg_main, fmt = "bold" },
    Include = { fg = palette.fg_main, fmt = "bold" },
    Macro = { fg = palette.fg_main },
    Special = { fg = palette.darker1, fmt = "bold" },
    SpecialChar = { fg = palette.darker1, fmt = "bold" },
    Function = { fg = palette.fg_main },
    Operator = { fg = palette.fg_main },
    Title = { fg = palette.fg_main, fmt = "bold" },
    Tag = { fg = palette.darker1, fmt = "bold" },
    Delimiter = { fg = palette.darker3 },
    Comment = { fg = palette.purple, fmt = "italic" },
    SpecialComment = { fg = palette.light_purple, fmt = "italic" },
    Todo = { fg = palette.fg_main },
    Error = { fg = palette.red },
    ErrorMsg = { fg = palette.red },
    DiagnosticError = { fg = palette.red },
    DiagnosticUnderlineError = { sp = palette.red, fmt = "undercurl" },
    DiagnosticWarn = { fg = palette.yellow },
    DiagnosticUnderlineWarn = { sp = palette.yellow, fmt = "undercurl" },
    DiagnosticInfo = { fg = palette.blue },
    DiagnosticUnderlineInfo = { sp = palette.blue, fmt = "undercurl" },
    DiagnosticHint = { fg = palette.blue },
    DiagnosticUnderlineHint = { sp = palette.blue, fmt = "undercurl" },
}

-- comment
hl.treesitter = {
    ["@variable"] = hl.syntax.Identifier,
    ["@constant"] = hl.syntax.Constant,
    ["@module"] = { fg = palette.darker2, fmt = "italic" },
    ["@label"] = hl.syntax.Label,
    ["@string"] = hl.syntax.String,
    ["@character"] = { fg = palette.blue },
    ["@boolean"] = hl.syntax.Boolean,
    ["@number"] = hl.syntax.Number,
    ["@type"] = hl.syntax.Type,
    ["@type.builtin"] = hl.syntax.Type,
    ["@attribute"] = { fg = palette.fg_main },
    ["@function"] = hl.syntax.Function,
    ["@constructor"] = { fg = palette.fg_main },
    ["@operator"] = hl.syntax.Statement,
    ["@keyword"] = hl.syntax.Keyword,
    ["@punctuation"] = hl.syntax.Delimiter,
    ["@comment"] = hl.syntax.Comment,
    ["@markup"] = { fg = palette.fg_main },
    ["@diff"] = { fg = palette.fg_main },
    ["@tag"] = hl.syntax.Tag,
    ["@tag.delimiter"] = hl.syntax.Delimiter,
    ["@tag.attribute"] = { fg = palette.darker1 },
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

    set_highlights(hl.common)
    set_highlights(hl.syntax)
    set_highlights(hl.treesitter)
end

return M
