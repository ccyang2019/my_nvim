
-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("没有安装 packer.nvim")
  return
end


local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

   -- telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = {"nvim-lua/plenary.nvim"}
    })
    -- telescope extensions
    use "LinArcX/telescope-env.nvim"

 -- bufferline
    use({
      "akinsho/bufferline.nvim",
      requires = {"kyazdani42/nvim-web-devicons", "moll/vim-bbye"}
    })

  -- toggleterm
    use("akinsho/toggleterm.nvim")

  -- project
    use("ahmedkhalf/project.nvim")


  --- LSP
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
  use 'williamboman/nvim-lsp-installer'
  use("arkav/lualine-lsp-progress")
  use({                                                                       
           "kyazdani42/nvim-tree.lua",                                               
          requires="kyazdani42/nvim-web-devicons"                                 
   })
   use {
         'nvim-lualine/lualine.nvim',
          requires = { 'kyazdani42/nvim-web-devicons', opt = true }
   }
   -- https://github.com/ojroques/nvim-lspfuzzy
   use {
        'ojroques/nvim-lspfuzzy',
    requires = {
        {'junegunn/fzf'},
        {'junegunn/fzf.vim'},  -- to enable preview (optional)
    },
  }
  -- lsp ui
  --use("onsails/lspkind-nvim")
  --use("tami5/lspsaga.nvim" )
 -- treesitter
 use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
  })


end)

-- 每次保存 plugins.lua 自动安装插件
pcall(vim.cmd, [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- :PackerSync after this plugin setting is changed
