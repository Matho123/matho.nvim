vim.g.colors_name = "matho"

local textPalette = {
    background = "#191919",
    base = "#cccccc",
    muted = "#999999",
    definition = "#80a7ce",

    exit = "#999999",

    character = "#b77787",
    constant = "#9682ba",

    comment = "#c69c75",
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
