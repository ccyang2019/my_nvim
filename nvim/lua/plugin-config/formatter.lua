require("formatter").setup({
    filetype = {
        lua = {
            -- luafmt
            function()
            return {
                exe = "luafmt",
                args = {"--indent-count", 2, "--stdin"},
                stdin = true
            }
            end
        },
    }
})

-- format on save
vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.py, *.sh, *.js,*.rs,*.lua FormatWrite
augroup END
]],
  true
)
