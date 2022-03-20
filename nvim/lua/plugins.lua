
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
   packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end
-- Use a protected call so we don't error out on first use
local status_ok, _ = pcall(require, "packer")
if not status_ok then
  vim.notify("没有安装 packer.nvim")
  return
end



local use = require('packer').use
require('packer').startup(function()
    -- #Packer
    use('wbthomason/packer.nvim')  -- Package manager

    -- #Edit/Coding
    use("github/copilot.vim")
    -- This plugin adds indentation guides to all lines (including empty lines).
    --  https://github.com/lukas-reineke/indent-blankline.nvim
    use "lukas-reineke/indent-blankline.nvim"
    -- This plugin provides a way to jump to the definition of a variable.
    use 'kana/vim-textobj-user'
    use 'kana/vim-textobj-line'
    -- edit jupyter notebook
    use 'GCBallesteros/iron.nvim'
    use 'GCBallesteros/jupytext.vim'
    use 'GCBallesteros/vim-textobj-hydrogen'
    -- markdown TOC, Vista
    use 'liuchengxu/vista.vim'
    use 'mzlogin/vim-markdown-toc'

    use({
        "ethanholz/nvim-lastplace",
        event = "BufRead",
        config = function()
        require("nvim-lastplace").setup({
            lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
            lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
            lastplace_open_folds = true,
        })
    end,
  })

    -- very powerful comment plugin
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- Lua
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            }
        end
    }
    -- TODO: put all keymaping in one file
    -- FIX: keymaping is not working

    -- #Utilities
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
          --  require("gitsigns").setup:w({ yadm = { enable = true } })
        end,
    })
    -- toggleterm
    use("akinsho/toggleterm.nvim")
    -- telescope : search
    use({
        "nvim-telescope/telescope.nvim",
        requires = {"nvim-lua/plenary.nvim"}
    })
    -- telescope extensions
    use "LinArcX/telescope-env.nvim"
    use({
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({})
        end,
    })
    -- #UI
    -- bufferline
    use({
      "akinsho/bufferline.nvim",
      requires = {"kyazdani42/nvim-web-devicons", "moll/vim-bbye"}
    })
    -- treesitter : hightlight
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    })
    -- project
    use("ahmedkhalf/project.nvim")
    -- line status
    use {
         'nvim-lualine/lualine.nvim',
          requires = { 'kyazdani42/nvim-web-devicons', opt = true }
     }
    -- use "casonadams/walh"
    use 'folke/tokyonight.nvim'
    -- use 'shaunsingh/nord.nvim'

    -- use "lukas-reineke/lsp-format.nvim"

    -- #LSP
    use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
    use 'williamboman/nvim-lsp-installer'
    use("arkav/lualine-lsp-progress")
    use({
           "kyazdani42/nvim-tree.lua",
          requires="kyazdani42/nvim-web-devicons"
    })
    -- https://github.com/ojroques/nvim-lspfuzzy
    use {
        'ojroques/nvim-lspfuzzy',
        requires = {
            {'junegunn/fzf'},
            {'junegunn/fzf.vim'},  -- to enable preview (optional)
        },
    }
    use "folke/trouble.nvim"
    use "jose-elias-alvarez/null-ls.nvim"

    -- lsp ui
    --use("onsails/lspkind-nvim")
    --use("tami5/lspsaga.nvim" )

    if packer_bootstrap then
        require("packer").sync()
    end
end)

-- 每次保存 plugins.lua 自动安装插件
pcall(vim.cmd, [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- :PackerSync after this plugin setting is changed
-- xcd

