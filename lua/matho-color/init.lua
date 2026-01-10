local M = {}

-- comment
local palette = {
    background = "#191919",
    fg_main = "#bbbbbb",

    delimiter = "#7c7c7c",
    variable = "#9e9e9e",
    functionDef = "#8d99c9",

    character = "#ad858f",
    number = "#9285ad",

    comment = "#ad5697",

    -- diagnostic / editor ui
    darker2 = "#8b8b8b",
    light_purple = "#aa80a2",
    dark_purple = "#65435e",
    blue = "#70a7cf",
    red = "#dd495a",
    orange = "#ce9652",
    green = "#819B69",
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
    StatusLine = { fg = palette.fg_main, bg = "#202020" },
    MoreMsg = { fg = palette.green, fmt = "bold" },
    Question = { fg = palette.green, fmt = "bold" },
    netrwComment = { fg = palette.darker2 },
    netrwClassify = { fg = palette.fg_main, fmt = "bold" },
    netrwQuickHelp = { fg = palette.darker2 },
    Visual = { bg = "#393939" },
    Whitespace = { fg = "#303030" },
}

hl.syntax = {
    Normal = { fg = palette.fg_main },
    Bold = { fmt = "bold" },
    Boolean = { fg = palette.number },
    String = { fg = palette.character },
    Character = { fg = palette.character },
    Number = { fg = palette.number },
    Float = { fg = palette.number },
    Type = { fg = palette.variable },
    Typedef = { fg = palette.variable },
    Structure = { fg = palette.fg_main },
    StorageClass = { fg = palette.fg_main },
    Identifier = { fg = palette.variable },
    Constant = { fg = palette.variable },
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
    Special = { fg = palette.variable, fmt = "bold" },
    SpecialChar = { fg = palette.number, fmt = "bold" },
    Function = { fg = palette.functionDef },
    Operator = { fg = palette.fg_main },
    Title = { fg = palette.fg_main, fmt = "bold" },
    Tag = { fg = palette.variable, fmt = "bold" },
    Delimiter = { fg = palette.delimiter },
    Comment = { fg = palette.comment },
    SpecialComment = { fg = palette.light_purple },
    Todo = { fg = palette.fg_main },
    Error = { fg = palette.red },
    ErrorMsg = { fg = palette.red },
    WarningMsg = { fg = palette.orange },
    DiagnosticError = { fg = palette.red },
    DiagnosticUnderlineError = { sp = palette.red, fmt = "undercurl" },
    DiagnosticWarn = { fg = palette.orange },
    DiagnosticUnderlineWarn = { sp = palette.orange, fmt = "undercurl" },
    DiagnosticInfo = { fg = palette.blue },
    DiagnosticUnderlineInfo = { sp = palette.blue, fmt = "undercurl" },
    DiagnosticHint = { fg = palette.blue },
    DiagnosticUnderlineHint = { sp = palette.blue, fmt = "undercurl" },
    DiagnosticUnnecessary = { sp = palette.blue, fmt = "undercurl" },
}

-- comment
hl.treesitter = {
    ["@variable"] = hl.syntax.Identifier,
    ["@constant"] = hl.syntax.Constant,
    ["@module"] = { fg = palette.darker2, fmt = "italic" },
    ["@label"] = hl.syntax.Label,
    ["@string"] = hl.syntax.String,
    ["@character"] = hl.syntax.Character,
    ["@boolean"] = hl.syntax.Boolean,
    ["@number"] = hl.syntax.Number,
    ["@number.float"] = hl.syntax.Number,
    ["@type"] = hl.syntax.Type,
    ["@type.builtin"] = hl.syntax.Type,
    ["@attribute"] = { fg = palette.fg_main },
    ["@function"] = hl.syntax.Function,
    ["@function.call"] = { fg = palette.fg_main },
    ["@function.call.c"] = { fg = palette.fg_main },
    ["@constructor"] = { fg = palette.fg_main },
    ["@operator"] = hl.syntax.Statement,
    ["@keyword"] = hl.syntax.Keyword,
    ["@punctuation"] = hl.syntax.Delimiter,
    ["@comment"] = hl.syntax.Comment,
    ["@markup"] = { fg = palette.fg_main },
    ["@diff"] = { fg = palette.fg_main },
    ["@tag"] = hl.syntax.Tag,
    ["@tag.delimiter"] = hl.syntax.Delimiter,
    ["@tag.attribute"] = { fg = palette.variable },

    -- css
    ["@property.css"] = hl.syntax.String,
    ["@attribute.css"] = hl.syntax.String,
    ["@tag.css"] = hl.syntax.String,
    ["@type.css"] = hl.syntax.String,
    ["@punctuation.delimiter.css"] = hl.syntax.String,
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


-- disable lsp semantic tokens
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
end

return M
