
--- reference : https://zhuanlan.zhihu.com/p/444836713
--
-- local lsp_installer = require "nvim-lsp-installer"

-- ref https://juejin.cn/post/7154005621887631396

-- 安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- { key: 语言 value: 配置文件 }
--old: local servers = {
--old:   pyright = require "lsp_config/pyright", -- /lua/lsp/config/pyright.lua
--old:   bashls = require "lsp_config/bashls", -- /lua/lsp/config/bashls.lua
--old:   sumneko_lua = require "lsp_config/lua", -- /lua/lsp/config/lua.lua
--old: }
--old: 
--old: 
--old: -- 自动安装 LanguageServers
--old: for name, _ in pairs(servers) do
--old:   local server_is_found, server = lsp_installer.get_server(name)
--old:   if server_is_found then
--old:     if not server:is_installed() then
--old:       print("Installing " .. name)
--old:       server:install()
--old:     end
--old:   end
--old: end
--old: 
--old: 
--old: lsp_installer.on_server_ready(function(server)
--old:     local config = servers[server.name]
--old:     if config == nil then
--old:         return
--old:     end
--old:     if config.on_setup then
--old:         config.on_setup(server)
--old:     else
--old:         server:setup({})
--old:     end
--old: end)

-- :h mason-default-settings
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
    "bashls",
    "jsonls",
    "pyright",
  },
})


-- local lspconfig = require('lspconfig')
-- 
-- require("mason-lspconfig").setup_handlers({
--    -- The first entry (without a key) will be the default handler
--    -- and will be called for each installed server that doesn't have
--    -- a dedicated handler.
--     function (server_name) -- default handler (optional)
--         require("lspconfig")[server_name].setup {}
--     end,
--    -- Next, you can provide targeted overrides for specific servers.
-- })
-- 
-- 作者：nshen
-- 链接：https://juejin.cn/post/7154005621887631396
-- 来源：稀土掘金
-- 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
