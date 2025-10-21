return { "ellisonleao/gruvbox.nvim",
priority = 1000,
opts = {
    bold = false,
    italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
    },
    transparent_mode = true
},
config = function(_, opts)
    require("gruvbox").setup(opts)
	vim.o.background = "dark"
	vim.cmd [[colorscheme gruvbox]]
end
}
