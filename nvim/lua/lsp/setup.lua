
--- reference : https://zhuanlan.zhihu.com/p/444836713
--
local lsp_installer = require "nvim-lsp-installer"

-- 安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- { key: 语言 value: 配置文件 }
local servers = {
  pyright = require "lsp_config/pyright", -- /lua/lsp/config/pyright.lua
  bashls = require "lsp_config/bashls", -- /lua/lsp/config/bashls.lua
  sumneko_lua = require "lsp_config/lua", -- /lua/lsp/config/lua.lua
}


-- 自动安装 LanguageServers
for name, _ in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end


lsp_installer.on_server_ready(function(server)
    local config = servers[server.name]
    if config == nil then
        return
    end
    if config.on_setup then
        config.on_setup(server)
    else
        server:setup({})
    end
end)
