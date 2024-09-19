require("venv-selector").setup({
    auto_refresh = true
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.keymap.set("n", "<leader>lv", ":VenvSelect<cr>", { desc = "List available Python venvs." })
    end,
})
