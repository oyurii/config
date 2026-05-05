vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.HINT]  = " ",
            [vim.diagnostic.severity.INFO]  = " ",
        },
    },
})
require("neo-tree").setup({
    filesystem = {
        filtered_items = {
            visible = true, -- Скрытые файлы будут видны, а не скрыты
            hide_dotfiles = false, -- Не скрывать файлы, начинающиеся с "."
            hide_gitignored = false, -- Опционально: не показывать файлы из .gitignore
        },
    },
})
