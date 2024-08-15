local chatgpt = require("chatgpt")

if os.getenv("OPENAI_API_KEY") then
    vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>ChatGPT<CR>", { desc = "AI Chat" })
    vim.keymap.set({ "n", "v" }, "<leader>ap", "<cmd>ChatGPTActAs<CR>", { desc = "AI Act As" })
    vim.keymap.set({ "n", "v" }, "<leader>ae", "<cmd>ChatGPTEditWithInstructions<CR>", { desc = "AI Edit" })

    vim.keymap.set({ "n", "v" }, "<leader>ag", "<cmd>ChatGPTRun grammar_correction<CR>",
        { desc = "AI Grammar Correction" })
    vim.keymap.set({ "n", "v" }, "<leader>ak", "<cmd>ChatGPTRun keywords<CR>", { desc = "AI Keywords" })
    vim.keymap.set({ "n", "v" }, "<leader>as", "<cmd>ChatGPTRun summarize<CR>", { desc = "AI Summarize" })
    vim.keymap.set({ "n", "v" }, "<leader>af", "<cmd>ChatGPTRun fix_bugs<CR>", { desc = "AI Fix Bugs" })
    vim.keymap.set({ "n", "v" }, "<leader>ax", "<cmd>ChatGPTRun explain_code<CR>", { desc = "AI Explain Code" })
    vim.keymap.set({ "n", "v" }, "<leader>ao", "<cmd>ChatGPTRun optimize_code<CR>", { desc = "AI Optimize Code" })
    vim.keymap.set({ "n", "v" }, "<leader>ad", "<cmd>ChatGPTRun docstring<CR>", { desc = "AI Generate Docstring" })
    vim.keymap.set({ "n", "v" }, "<leader>at", "<cmd>ChatGPTRun add_tests<CR>", { desc = "AI Add Tests" })
    vim.keymap.set({ "n", "v" }, "<leader>al", "<cmd>ChatGPTRun code_readability_analysis<CR>",
        { desc = "AI Code Readability Analysis" })
end
