local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- Chris@machine plugins
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
  use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
  use("numToStr/Comment.nvim") -- Easily comment stuff
  use("kyazdani42/nvim-web-devicons")
  use("kyazdani42/nvim-tree.lua")
  -- use("akinsho/bufferline.nvim")
  use("moll/vim-bbye")
  use("nvim-lualine/lualine.nvim")
  use("akinsho/toggleterm.nvim")
  use("ahmedkhalf/project.nvim")
  use("lewis6991/impatient.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("goolord/alpha-nvim")
  use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
  use("folke/which-key.nvim")

  -- My plugins
  use("tpope/vim-abolish")
  use("unblevable/quick-scope")
  use("filipdutescu/renamer.nvim")
  use("Shatur/neovim-session-manager")
  use("nvim-telescope/telescope-ui-select.nvim")
  use("tpope/vim-endwise")
  use("RRethy/vim-illuminate")
  use("ray-x/lsp_signature.nvim")
  use("tpope/vim-fugitive")
  use("inside/vim-search-pulse")
  use("ellisonleao/glow.nvim")
  use("machakann/vim-sandwich")
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use("wellle/targets.vim")
  use("sudormrfbin/cheatsheet.nvim")
  use("sindrets/diffview.nvim")
  use("chentoast/marks.nvim")
  use("folke/trouble.nvim")
  use("kevinhwang91/nvim-bqf")
  use("beauwilliams/focus.nvim")
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  })
  use({
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
    },
  })

  -- This needed me to install sqlite3 from homebrew x86. Then `mkdir -p ~/.local/share/nvim/databases/`
  -- use({ "tami5/sqlite.lua" })
  -- use("nvim-telescope/telescope-smart-history.nvim")
  -- use({
  -- 	"nvim-telescope/telescope-frecency.nvim",
  -- 	requires = { "tami5/sqlite.lua" },
  -- })

  -- Colorschemes
  use("rktjmp/lush.nvim")
  use("lunarvim/colorschemes") -- A bunch of colorschemes you can try out
  use("lunarvim/darkplus.nvim")
  use("bluz71/vim-moonfly-colors")
  use("tanvirtin/monokai.nvim")
  use("mhartington/oceanic-next")
  use("ChristianChiarulli/nvcode-color-schemes.vim")
  use("RRethy/nvim-base16")
  use("briones-gabriel/darcula-solid.nvim")
  use("shaunsingh/nord.nvim")
  use("romainl/Apprentice")
  use("shaunsingh/solarized.nvim")

  -- cmp pluginsplugin
  use("hrsh7th/nvim-cmp") -- The completion plugin
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completions
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")

  -- snippets
  use("L3MON4D3/LuaSnip") --snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  use("neovim/nvim-lspconfig") -- enable LSP
  use("williamboman/nvim-lsp-installer") -- simple to use language server installer
  use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
  use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  -- use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("nvim-treesitter/playground")
  use("JoosepAlviste/nvim-ts-context-commentstring")

  -- Git
  use("lewis6991/gitsigns.nvim")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
