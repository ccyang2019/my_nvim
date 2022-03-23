vim.g.mapleader = " "
vim.g.maplocalleader = " "
local map = vim.api.nvim_set_keymap
local opt = {
  noremap = true,
  silent = true
}

local pluginKeys = {}
pluginKeys.maplsp_general = function(mapbuf)
  mapbuf("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
end
--bufferline
pluginKeys.mapbufline = function(mapbuf)
end


local utils_ok, utils = pcall(require, "utils")
if not utils_ok then
  return
end

local which_key = {
  setup = {
    plugins = {
      marks = true,      -- shows a list of your marks on ' and `
      registers = true,  -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
      },
      -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      spelling = { enabled = true, suggestions = 20 },
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },
    window = {
      border = "none", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 },
      padding = { 2, 2, 2, 2 },
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
    },
    -- hide mapping boilerplate
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    show_help = true,
  },

  opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  },
  vopts = {
    mode = "v",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  },
  -- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
  -- see https://neovim.io/doc/user/map.html#:map-cmd
  vmappings = {},
  mappings = {
    ["c"] = { ":BufferClose!<CR>", "Close Buffer" },
    --["e"] = { ":Telescope file_browser <CR>", "File Browser" },
    ["e"] = { ":NvimTreeToggle <CR>", "Toggle  nvimtree" },
    ["f"] = { ":Telescope find_files <CR>", "Find File" },
    ["h"] = { ":nohlsearch<CR>", "No Highlight" },
    b = {
      name = "Buffers",
      l = { ":Telescope buffers<CR>", "List Buffers" },
      b = { ":b#<cr>", "Previous" },
      d = { ":bd<cr>", "Delete" },
      f = { ":Telescope buffers <cr>", "Find" },
      n = { ":bn<cr>", "Next" },
      p = { ":bp<cr>", "Previous" },
    },
    p = {
      name = "Packer",
      c = { ":PackerCompile<cr>", "Compile" },
      i = { ":PackerInstall<cr>", "Install" },
      r = { ":lua require('lvim.utils').reload_lv_config()<cr>", "Reload" },
      s = { ":PackerSync<cr>", "Sync" },
      S = { ":PackerStatus<cr>", "Status" },
      u = { ":PackerUpdate<cr>", "Update" },
    },
    l = {
      name = "LSP",
      -- d = {
      --   ":Telescope lsp_document_diagnostics<cr>",
      --   "Document Diagnostics",
      -- },
      w = {
        ":Telescope diagnostics<cr>",
        "Workspace Diagnostics",
      },
      f = { ":lua vim.lsp.buf.formatting()<cr>", "Format" },
      i = { ":LspInfo<cr>", "Info" },
      I = { ":LspInstallInfo<cr>", "Installer Info" },
      r = { ":lua vim.lsp.buf.rename()<cr>", "Rename" },
      l = { ":lua vim.lsp.buf.reference()<cr>", "Reference" },
      d = { ":lua vim.lsp.buf.definition()<cr>", "Definition" },
      a = { ":Telescope lsp_code_actions<cr>", "Code Action" },
    },
    s = {
      name = "Search",
      b = { ":Telescope git_branches <cr>", "Checkout branch" },
      c = { ":Telescope colorscheme <cr>", "Colorscheme" },
      C = { ":Telescope commands <cr>", "Commands" },
      f = { ":Telescope find_files <cr>", "Find File" },
      h = { ":Telescope help_tags <cr>", "Find Help" },
      j = { ":Telescope jumplist <cr>", "Jumplist" },
      k = { ":Telescope keymaps <cr>", "Keymaps" },
      M = { ":Telescope man_pages <cr>", "Man Pages" },
      r = { ":Telescope oldfiles <cr>", "Open Recent File" },
      R = { ":Telescope registers <cr>", "Registers" },
      t = { ":Telescope live_grep <cr>", "Text" },
      n = { ":Telescope live_grep search_dirs={os.getenv('NOTES')} <cr>", "Notes" },
      p = {
        ":lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
        "Colorscheme with Preview",
      },
    },
    T = {
      name = "Treesitter",
      i = { ":TSConfigInfo<cr>", "Info" },
    },
    t = {
      name = "Diagnostics",
      t = { "<cmd>TroubleToggle<cr>", "trouble" },
      w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
      d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
      q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
      l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
      r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
      s = { "<cmd>TodoTelescope<cr>", "TODO Search" },
      a = { "<cmd>TodoLocList<cr>", "TODO LIST" },
    },
  },
}

-- local function map(mode, lhs, rhs, opts)
--   local options = { noremap = true, silent = true }
--   if opts then
--     options = vim.tbl_extend("force", options, opts)
--   end
--   vim.api.nvim_set_keymap(mode, lhs, rhs, options)
-- end

utils.map("n", "H", ":bp<CR>")
utils.map("n", "L", ":bn<CR>")
utils.map("n", "<tab>", ":tabnext<CR>")
utils.map("n", "<S-tab>", ":tabprevious<CR>")
utils.map("n", "<C-h>", ":wincmd h<CR>")
utils.map("n", "<C-j>", ":wincmd j<CR>")
utils.map("n", "<C-k>", ":wincmd k<CR>")
utils.map("n", "<C-l>", ":wincmd l<CR>")
utils.map("t", "<Esc>", "<C-\\><C-n>")

-- 命令行下 Ctrl+j/k  上一个下一个
map("c", "<C-j>", "<C-n>", {
  noremap = false
})
map("c", "<C-k>", "<C-p>", {
  noremap = false
})

-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)

-- magic search
map("n", "/", "/\\v", {
  noremap = true,
  silent = false
})
map("v", "/", "/\\v", {
  noremap = true,
  silent = false
})

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 在visual mode 里粘贴不要复制
map("v", "p", '"_dP', opt)

-- 退出
map("n", "q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)
-- insert 模式下，跳到行首行尾
-- map("i", "<C-h>", "<ESC>I", opt)
-- map("i", "<C-l>", "<ESC>A", opt)

-- Terminal相关
-- map("n", "<leader>t", ":sp | terminal<CR>", opt)
-- map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

------------------------------------------------------------------
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt) -- close others
-- alt + hjkl  窗口之间跳转 (TODO: not work at office. can't find ALT key)
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- 左右比例控制
-- NOTE: <C-Left> and <C-Right> are used ? vim-surround?
-- <C-Down> and <C-Up> are used Mac OS system
map("n", "<A-Left>", ":vertical resize -2<CR>", opt)
map("n", "<A-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<A-Down>", ":resize +2<CR>", opt)
map("n", "<A-Up>", ":resize -2<CR>", opt)
-- 相等比例
map("n", "s=", "<C-w>=", opt)

map("n", "<TAB>",   ":BufferLineCycleNext <CR>", opt)
map("n", "<S-TAB>", ":BufferLineCyclePrev <CR>", opt)
-- hot key to open config file
map("n", "ec", ":e ${HOME}/.config/nvim/lua/init.lua <CR>", opt)

-- Custom vim-surrond setting
vim.g["surround_"..vim.fn.char2nr("r")] = "<font color=#FF0000>\r</font>" -- Red
vim.g["surround_"..vim.fn.char2nr("b")] = "<font color=#0000FF>\r</font>" -- Blue
vim.g["surround_"..vim.fn.char2nr("p")] = "<font color=#FF00FF>\r</font>" -- Pink
vim.g["surround_"..vim.fn.char2nr("g")] = "<font color=#00FF00>\r</font>" -- Green
vim.g["surround_"..vim.fn.char2nr("c")] = "<font color=#00FFFF>\r</font>" -- Cyan

local wk = require("which-key")
wk.setup(which_key.setup)

local opts = which_key.opts
local vopts = which_key.vopts

local mappings = which_key.mappings
local vmappings = which_key.vmappings

wk.register(mappings, opts)
wk.register(vmappings, vopts)

if which_key.on_config_done then
  which_key.on_config_done(wk)
end
return pluginKeys
