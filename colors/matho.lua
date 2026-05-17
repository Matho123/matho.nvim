vim.g.colors_name = "matho"

local textPalette = {
    background = "#000000",
    base = "#dddddd",
    muted = "#aaaaaa",
    definition = "#99c6fc",

    comment = "#e5cc8b",
    exit = "#b4d173",

    character = "#dd859b",
    constant = "#b69ee2",
}

local uiPalette = {
    muted = "#8b8b8b",
    search = "#aa80a2",
    searchDarker = "#65435e",
    cursorLine = "#1a1a1a",
    visual = "#393939",
    whitespace = "#303030",
    separator = "#404040",
    status = "#2a2a2a",
    info = "#70a7cf",
    error = "#f9455a",
    warning = "#ef982d",
    feedback = "#8eb56a",
}

require('matho').setup(textPalette, uiPalette)
