vim.g.colors_name = "matho-tonsky"

local textPalette = {
    background = "#191919",
    fg_main = "#bbbbbb",

    delimiter = "#7c7c7c",
    variable = "#9e9e9e",
    functionDef = "#8cb4d1",
    exit = "#ce3b5e",

    character = "#a1bf85",
    number = "#b2a3d1",

    comment = "#d37967",
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
