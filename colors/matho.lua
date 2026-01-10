vim.g.colors_name = "matho"

local textPalette = {
    background = "#191919",
    fg_main = "#bbbbbb",

    delimiter = "#7c7c7c",
    variable = "#9e9e9e",
    functionDef = "#70a7cf",
    exit = "#af5993",

    character = "#ad858f",
    number = "#9285ad",

    comment = "#af5993",
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
