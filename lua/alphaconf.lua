local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
local version = vim.version()

simple = {
    [[ ###################### ]],
    [[   .-^-.        Sealed  ]],
    [[  '"'|`"`        Cloud  ]],
    [[     j           Route  ]],
    [[ ###################### ]],
}

dashboard.section.header.val = simple

dashboard.section.buttons.val = {
    dashboard.button( "e", "?  > New file"  , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "w", "?  > Workspaces", ":Telescope projects<CR>"),
    dashboard.button( "r", "?  > Recent"    , ":Telescope oldfiles<CR>"),
    dashboard.button( "q", "?  > Quit NVIM" , ":qa<CR>"),
}


dashboard.section.footer.val = {
    "  Kogasa is the best girl of all time.",
    string.format(
        "** Running on Neovim v.%s.%s.%s %s **",
        version.major,
        version.minor,
        version.patch,
        version.api_prerelease and ' (Nightly)' or '(Stable)'
    )
}

alpha.setup(dashboard.opts)
