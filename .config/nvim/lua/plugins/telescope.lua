local telescope = require("telescope")
local builtin = require("telescope.builtin")

vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fw', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', builtin.buffers)
vim.keymap.set('n', '<leader>fh', builtin.help_tags)

vim.keymap.set('n', '<leader>gb', builtin.git_branches)
vim.keymap.set('n', '<leader>gc', builtin.git_commits)
vim.keymap.set('n', '<leader>gs', builtin.git_status)

vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols)
vim.keymap.set('n', 'gr', builtin.lsp_references, { silent = true })
vim.keymap.set('n', 'gd', builtin.lsp_definitions, { silent = true })

-- РОБОТА З СЕСІЯМИ
-- Відкрити список сесій: <CR> → відкрити; dd → видалити сесію
vim.keymap.set("n", "<leader>fs",
    require("telescope").extensions["session-lens"].search_session,
    { desc = "Sessions" }
)

-- Створити сесію з власним ім'ям
local session_dir = vim.fn.stdpath("data") .. "/sessions/"
vim.fn.mkdir(session_dir, "p")
vim.keymap.set("n", "<leader>ss", function()
    pcall(vim.cmd, "Neotree close") -- закрити neo-tree якщо він відкритий
    local name = vim.fn.input("Session name: ")
    if name ~= "" then
        vim.cmd("mksession! " .. session_dir .. name .. ".vim")
        print("Session saved as " .. name)
    end
end, { desc = "Save Session As" })

-- Перезаписати поточну сесію
vim.keymap.set("n", "<leader>su", function()
    pcall(vim.cmd, "Neotree close") -- закрити neo-tree якщо він відкритий
    local name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    vim.cmd("mksession! " .. session_dir .. name .. ".vim")
    print("Session updated")
end, { desc = "Update Session" })

