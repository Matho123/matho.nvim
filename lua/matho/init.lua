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
        LineNr = { fg = textPalette.muted },
        CursorLineNr = { fg = textPalette.base, fmt = "bold" },
        CursorLine = { bg = "#1c1c1c" },
        Directory = { fg = textPalette.definition, fmt = "bold" },
        ModeMsg = { fg = textPalette.base },
        Search = { fg = textPalette.base, bg = uiPalette.searchDarker },
        MatchParen = { fg = textPalette.base, bg = uiPalette.searchDarker },
        Substitute = { fg = textPalette.base, bg = uiPalette.searchDarker },
        QuickFixLine = { fg = textPalette.base, bg = uiPalette.searchDarker },
        CurSearch = { fg = textPalette.background, bg = uiPalette.search },
        IncSearch = { fg = textPalette.background, bg = uiPalette.search },
        WildMenu = { fg = textPalette.background, bg = textPalette.special },
        StatusLine = { fg = textPalette.base, bg = "#202020" },
        MoreMsg = { fg = uiPalette.feedback },
        Question = { fg = uiPalette.feedback },
        netrwComment = { fg = uiPalette.muted },
        netrwClassify = { fg = textPalette.base },
        netrwQuickHelp = { fg = uiPalette.muted },
        Visual = { bg = "#393939" },
        Whitespace = { fg = "#303030" },
        gitcommitSummary = { fg = textPalette.base }
    }

    hl.syntax = {
        Normal = { fg = textPalette.base },
        Bold = { fmt = "bold" },
        Boolean = { fg = textPalette.constant },
        String = { fg = textPalette.character },
        Character = { fg = textPalette.character },
        Number = { fg = textPalette.constant },
        Float = { fg = textPalette.constant },
        Type = { fg = textPalette.base },
        Typedef = { fg = textPalette.base },
        Structure = { fg = textPalette.base },
        StorageClass = { fg = textPalette.base },
        Identifier = { fg = textPalette.base },
        Constant = { fg = textPalette.base },
        PreProc = { fg = textPalette.base },
        PreCondit = { fg = textPalette.base },
        Keyword = { fg = textPalette.muted },
        Define = { fg = textPalette.base },
        Exception = { fg = textPalette.base },
        Conditional = { fg = textPalette.base },
        Repeat = { fg = textPalette.base },
        Statement = { fg = textPalette.base },
        Label = { fg = textPalette.base },
        Include = { fg = textPalette.base },
        Macro = { fg = textPalette.base },
        Special = { fg = textPalette.constant },
        SpecialChar = { fg = textPalette.constant },
        Function = { fg = textPalette.definition },
        Operator = { fg = textPalette.muted },
        Title = { fg = textPalette.base, fmt = "bold" },
        Tag = { fg = textPalette.muted },
        Delimiter = { fg = textPalette.muted },
        Comment = { fg = textPalette.comment },
        SpecialComment = { fg = uiPalette.search },
        Todo = { fg = textPalette.base },
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
        ["@variable.builtin"] = hl.syntax.Identifier,
        ["@variable.parameter.builtin"] = hl.syntax.Identifier,
        ["@constant"] = hl.syntax.Constant,
        ["@constant.builtin"] = hl.syntax.Constant,
        ["@label"] = hl.syntax.Label,
        ["@string"] = hl.syntax.String,
        ["@character"] = hl.syntax.Character,
        ["@boolean"] = hl.syntax.Boolean,
        ["@number"] = hl.syntax.Number,
        ["@number.float"] = hl.syntax.Number,
        ["@type"] = hl.syntax.Type,
        ["@type.definition"] = { fg = textPalette.definition },
        ["@type.builtin"] = hl.syntax.Type,
        ["@attribute"] = { fg = textPalette.base },
        ["@function"] = hl.syntax.Function,
        ["@function.call"] = { fg = textPalette.base },
        ["@function.method.call"] = { fg = textPalette.base },
        ["@function.call.c"] = { fg = textPalette.base },
        ["@function.builtin"] = { fg = textPalette.base },
        ["@function.builtin.call"] = { fg = textPalette.base },
        ["@constructor"] = { fg = textPalette.base },
        ["@operator"] = hl.syntax.Operator,
        ["@keyword"] = hl.syntax.Keyword,
        ["@keyword.return"] = { fg = textPalette.exit },
        ["@punctuation"] = hl.syntax.Delimiter,
        ["@punctuation.delimiter"] = hl.syntax.Delimiter,
        ["@punctuation.bracket"] = hl.syntax.Delimiter,
        ["@comment"] = hl.syntax.Comment,
        ["@markup"] = { fg = textPalette.base },
        ["@diff"] = { fg = textPalette.base },
        ["@tag"] = hl.syntax.Tag,
        ["@tag.builtin"] = hl.syntax.Tag,
        ["@tag.delimiter"] = hl.syntax.Delimiter,
        ["@tag.attribute"] = { fg = textPalette.base },

        -- css
        ["@property.css"] = hl.syntax.String,
        ["@attribute.css"] = hl.syntax.String,
        ["@tag.css"] = hl.syntax.String,
        ["@type.css"] = hl.syntax.String,
        ["@punctuation.delimiter.css"] = hl.syntax.String,
    }

    hl.telescope = {
        TelescopeMatching = { fg = uiPalette.feedback, fmt = "bold" }
    }

    set_highlights(hl.common)
    set_highlights(hl.syntax)
    set_highlights(hl.treesitter)
    set_highlights(hl.telescope)
end


-- disable lsp semantic tokens highlighting
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
end

return M
