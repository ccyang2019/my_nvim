local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
  use 'williamboman/nvim-lsp-installer'
  use({                                                                       
           "kyazdani42/nvim-tree.lua",                                               
          requires="kyazdani42/nvim-web-devicons"                                 
   })
end)

-- :PackerSync after this plugin setting is changed
