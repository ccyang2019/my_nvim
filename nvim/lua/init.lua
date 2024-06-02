-- 基础配置
require("basic")
require("utils")
-- 快捷键映射
-- require("keybindings")
-- Packer插件管理
require("plugins")
-- 主题设置
--require("colorscheme")
-- 插件配置
require("plugin-config/whichkey")
require("plugin-config/nvim-tree")
require("plugin-config/telescope")
--require("plugin-config/indent-blankline")
--require("plugin-config.dashboard")
require("plugin-config/project")
require("plugin-config/toggleterm")
-- require("plugin-config/nvim-treesitter")
-- require("plugin-config/null-ls") => error
require('lspfuzzy').setup {} 

require("plugin-config/bufferline")
-- important to import after colorscheme
require("plugin-config/tokyonight")
require("plugin-config/lualine")
-- use lsp formater
-- require("plugin-config.formatter")
---- 内置LSP
require("lsp/setup")
----require("lsp/cmp") : obsolete
-- require("lsp/ui") : obsolete
--
--
-- IDE
-- require"fidget".setup{}
--require("packer").startup(function(use)
--    use { 'codota/tabnine-nvim', run = "./dl_binaries.sh" }
--end)
--
--require('tabnine').setup({
--    disable_auto_comment = true,
--    accept_keymap = "<Tab>",
--    dismiss_keymap = "<C-]>",
--    debounce_ms = 800,
--    suggestion_color = { gui = "#808080", cterm = 244 },
--    exclude_filetypes = { "TelescopePrompt" }
--})
