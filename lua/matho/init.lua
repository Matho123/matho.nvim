local M = {}

--comment
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

function M.setup(textPalette, uiPalette)
    local hl = {}

    hl.common = {
        LineNr = { fg = "#616161" },
        CursorLineNr = { fg = textPalette.fg_main, fmt = "bold" },
        CursorLine = { bg = "#1c1c1c" },
        Directory = { fg = textPalette.fg_main, fmt = "bold" },
        ModeMsg = { fg = textPalette.fg_main, fmt = "bold" },
        Search = { fg = textPalette.fg_main, bg = uiPalette.searchDarker },
        MatchParen = { fg = textPalette.fg_main, bg = uiPalette.searchDarker },
        Substitute = { fg = textPalette.fg_main, bg = uiPalette.searchDarker },
        QuickFixLine = { fg = textPalette.fg_main, bg = uiPalette.searchDarker },
        CurSearch = { fg = textPalette.background, bg = uiPalette.search },
        IncSearch = { fg = textPalette.background, bg = uiPalette.search },
        WildMenu = { fg = textPalette.background, bg = textPalette.special },
        StatusLine = { fg = textPalette.fg_main, bg = "#202020" },
        MoreMsg = { fg = uiPalette.feedback, fmt = "bold" },
        Question = { fg = uiPalette.feedback, fmt = "bold" },
        netrwComment = { fg = uiPalette.muted },
        netrwClassify = { fg = textPalette.fg_main, fmt = "bold" },
        netrwQuickHelp = { fg = uiPalette.muted },
        Visual = { bg = "#393939" },
        Whitespace = { fg = "#303030" },
    }

    hl.syntax = {
        Normal = { fg = textPalette.fg_main },
        Bold = { fmt = "bold" },
        Boolean = { fg = textPalette.number },
        String = { fg = textPalette.character },
        Character = { fg = textPalette.character },
        Number = { fg = textPalette.number },
        Float = { fg = textPalette.number },
        Type = { fg = textPalette.variable },
        Typedef = { fg = textPalette.variable },
        Structure = { fg = textPalette.fg_main },
        StorageClass = { fg = textPalette.fg_main },
        Identifier = { fg = textPalette.variable },
        Constant = { fg = textPalette.variable },
        PreProc = { fg = textPalette.fg_main },
        PreCondit = { fg = textPalette.fg_main },
        Keyword = { fg = textPalette.fg_main, fmt = "bold" },
        Define = { fg = textPalette.fg_main },
        Exception = { fg = textPalette.fg_main },
        Conditional = { fg = textPalette.fg_main },
        Repeat = { fg = textPalette.fg_main },
        Statement = { fg = textPalette.fg_main, fmt = "bold" },
        Label = { fg = textPalette.fg_main, fmt = "bold" },
        Include = { fg = textPalette.fg_main, fmt = "bold" },
        Macro = { fg = textPalette.fg_main },
        Special = { fg = textPalette.variable, fmt = "bold" },
        SpecialChar = { fg = textPalette.number, fmt = "bold" },
        Function = { fg = textPalette.functionDef },
        Operator = { fg = textPalette.fg_main },
        Title = { fg = textPalette.fg_main, fmt = "bold" },
        Tag = { fg = textPalette.variable, fmt = "bold" },
        Delimiter = { fg = textPalette.delimiter },
        Comment = { fg = textPalette.comment },
        SpecialComment = { fg = uiPalette.search },
        Todo = { fg = textPalette.fg_main },
        Error = { fg = uiPalette.error },
        ErrorMsg = { fg = uiPalette.error },
        WarningMsg = { fg = uiPalette.warning },
        DiagnosticError = { fg = uiPalette.error },
        DiagnosticUnderlineError = { sp = uiPalette.error, fmt = "undercurl" },
        DiagnosticWarn = { fg = uiPalette.warning },
        DiagnosticUnderlineWarn = { sp = uiPalette.warning, fmt = "undercurl" },
        DiagnosticInfo = { fg = uiPalette.info },
        DiagnosticUnderlineInfo = { sp = uiPalette.info, fmt = "undercurl" },
        DiagnosticHint = { fg = uiPalette.info },
        DiagnosticUnderlineHint = { sp = uiPalette.info, fmt = "undercurl" },
        DiagnosticUnnecessary = { sp = uiPalette.info, fmt = "undercurl" },
    }

    -- comment
    hl.treesitter = {
        ["@variable"] = hl.syntax.Identifier,
        ["@constant"] = hl.syntax.Constant,
        ["@label"] = hl.syntax.Label,
        ["@string"] = hl.syntax.String,
        ["@character"] = hl.syntax.Character,
        ["@boolean"] = hl.syntax.Boolean,
        ["@number"] = hl.syntax.Number,
        ["@number.float"] = hl.syntax.Number,
        ["@type"] = hl.syntax.Type,
        ["@type.builtin"] = hl.syntax.Type,
        ["@attribute"] = { fg = textPalette.fg_main },
        ["@function"] = hl.syntax.Function,
        ["@function.call"] = { fg = textPalette.fg_main },
        ["@function.method.call"] = { fg = textPalette.fg_main },
        ["@function.call.c"] = { fg = textPalette.fg_main },
        ["@constructor"] = { fg = textPalette.fg_main },
        ["@operator"] = hl.syntax.Statement,
        ["@keyword"] = hl.syntax.Keyword,
        ["@keyword.return"] = { fg = textPalette.exit, fmt = "bold" },
        ["@punctuation"] = hl.syntax.Delimiter,
        ["@comment"] = hl.syntax.Comment,
        ["@markup"] = { fg = textPalette.fg_main },
        ["@diff"] = { fg = textPalette.fg_main },
        ["@tag"] = hl.syntax.Tag,
        ["@tag.delimiter"] = hl.syntax.Delimiter,
        ["@tag.attribute"] = { fg = textPalette.variable },

        -- css
        ["@property.css"] = hl.syntax.String,
        ["@attribute.css"] = hl.syntax.String,
        ["@tag.css"] = hl.syntax.String,
        ["@type.css"] = hl.syntax.String,
        ["@punctuation.delimiter.css"] = hl.syntax.String,
    }
    set_highlights(hl.common)
    set_highlights(hl.syntax)
    set_highlights(hl.treesitter)
end


-- disable lsp semantic tokens highlighting
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
end

return M
