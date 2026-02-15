vim.g.colors_name = "matho"

local textPalette = {
    background = "none", -- can be "none"
    base = "#bbbbbb",
    muted = "#888888",
    definition = "#80a7ce",

    comment = "#c69c75",
    exit = "#83a598",

    character = "#b77787",
    constant = "#9682ba",

}

local uiPalette = {
    muted = "#8b8b8b",
    search = "#aa80a2",
    searchDarker = "#65435e",
    info = "#70a7cf",
    error = "#dd495a",
    warning = "#ce9652",
    feedback = "#819B69",
}

require('matho').setup(textPalette, uiPalette)
