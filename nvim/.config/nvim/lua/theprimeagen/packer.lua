-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- colors
    "Mofiqul/dracula.nvim",
    {
        "rose-pine/neovim",
        name = "rose-pine",
    },
    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-tree/nvim-web-devicons", optional = true },
        },
    },
    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = false,
        config = function()
            require("nvim-treesitter.config").setup({
                ensure_installed = { "vimdoc", "javascript", "typescript", "python", "c", "cpp", "lua", "rust" },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        lazy = false,
    },
    -- harpoon
    "ThePrimeagen/harpoon",
    -- undotree
    "mbbill/undotree",
    -- git
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    -- comments
    "numToStr/Comment.nvim",
    -- lsp
    {
        "williamboman/mason.nvim",
        lazy = false,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
    },
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
    },
})
