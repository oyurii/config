vim.g.mapleader = " "

-- NeoTree
--vim.keymap.set('n', '<leader>E', ':Neotree float reveal<CR>')
vim.keymap.set('n', '<F12>', ':Neotree left toggle reveal<CR>')
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>')
vim.keymap.set('n', '<F10>', ':q<CR>')
vim.keymap.set('n', '<c-F10>', ':qa<CR>')

vim.keymap.set("n", "<Tab>", "<C-w>p", { noremap = true })

vim.keymap.set('n', '<leader>bd', ':bp | bd #<CR>', { desc = 'Delete buffer and keep layout' })

-- Navigation
vim.keymap.set('n', '\\', ':CommentToggle<CR>')
-- Мапінги для переміщення по візуальних рядках
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "<Down>", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })
vim.keymap.set("n", "<Up>", "gk", { noremap = true, silent = true })

vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", { noremap = true, silent = true }) -- Переміщення рядків у нормальному режимі вниз
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", { noremap = true, silent = true }) -- Переміщення рядків у нормальному режимі вгору
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true }) -- Переміщення виділених рядків у візуальному режимі вниз
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true }) -- Переміщення виділених рядків у візуальному режимі вгору

-- Ctrl-a - Виділити все
-- vim.keymap.set('n', '<C-a>', '<Esc>gg<S-v><S-g>')
-- vim.keymap.set('v', '<C-a>', '<Esc>gg<S-v><S-g>')
-- vim.keymap.set('i', '<C-a>', '<Esc>gg<S-v><S-g>')

-- Розбивка вікон по вертикалі та горизонталі
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>')
vim.keymap.set('n', '<leader>wh', ':split<CR>')

-- Other
vim.keymap.set('n', '<Esc><Esc>', '<Esc>:w<CR>')
vim.keymap.set('v', '<Esc><Esc>', '<Esc>:w<CR>')
vim.keymap.set('i', '<Esc><Esc>', '<Esc>:w<CR>')
vim.keymap.set('n', '<F2>', '<Esc>:w<CR>')
vim.keymap.set('v', '<F2>', '<Esc>:w<CR>')
vim.keymap.set('i', '<F2>', '<Esc>:w<CR>')
-- Запуск файлу з очищенням терміналу
vim.keymap.set("n", "<F5>", "<Esc>:w<CR>:! ./%<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<F5>", "<Esc>:w<CR>:! ./%<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<F5>", "<Esc>:w<CR>:! ./%<CR>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>x', ':BufferLinePickClose<CR>')
vim.keymap.set('n', '<leader>X', ':BufferLineCloseRight<CR>')
vim.keymap.set('n', '<leader>s', ':BufferLineSortByTabs<CR>')
vim.keymap.set('i', 'jj', '<Esc>')
-- vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Tabs
vim.keymap.set('n', '<C-l>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<C-h>', ':BufferLineCyclePrev<CR>')

-- Terminal
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>')
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>')
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical size=40<CR>')

-- Мапінги для vimtex
vim.keymap.set("n", "<Esc>c", "<Esc>:w<CR>:VimtexCompile<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<Esc>c", "<Esc>:w<CR>:VimtexCompile<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<Esc>c", "<Esc>:w<CR>:VimtexCompile<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Esc>s", "<Esc>:VimtexView<CR>:term TERM=xterm-256color printf '\\033c'<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<Esc>s", "<Esc>:VimtexView<CR>:term TERM=xterm-256color printf '\\033c'<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<Esc>s", "<Esc>:VimtexView<CR>:term TERM=xterm-256color printf '\\033c'<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Esc>b", "<Esc>:VimtexErrors<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<Esc>b", "<Esc>:VimtexErrors<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<Esc>b", "<Esc>:VimtexErrors<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-g>", "<ESC><leader>lv", { noremap = true, silent = true })
vim.keymap.set("v", "<C-g>", "<ESC><leader>lv", { noremap = true, silent = true })
vim.keymap.set("i", "<C-g>", "<ESC><leader>lv", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>sb", ":AddShebang<CR>", { desc = "Insert Shebang" })

-- Автоматична генерація Beamer PDF після збереження .md файлу
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.md",
  group = vim.api.nvim_create_augroup("PandocBeamer", { clear = true }),
  callback = function()
    -- Якщо header.tex НЕ існує — просто нічого не робимо
    if vim.fn.filereadable("./header.tex") == 0 then
      return
    end

    local filename = vim.fn.expand("%")
    local base = vim.fn.expand("%:r")

    local cmd = string.format(
      "pandoc -t beamer --pdf-engine=lualatex -H ./header.tex -o %s.pdf %s",
      vim.fn.shellescape(base),
      vim.fn.shellescape(filename)
    )

    vim.fn.jobstart(cmd, {
      detach = true,
      on_exit = function(_, exit_code)
        if exit_code == 0 then
          vim.schedule(function()
            vim.notify("Beamer PDF успішно згенеровано: " .. base .. ".pdf", vim.log.levels.INFO)
          end)
        else
          vim.schedule(function()
            vim.notify("Помилка при генерації PDF (код: " .. exit_code .. ")", vim.log.levels.ERROR)
          end)
        end
      end,
    })
  end,
})

-- список конфігів spelllang
local spell_modes = {
  { "en_us", "ru" },
  {},                           -- OFF
  { "en_us", "uk" },
}

local current = 0

vim.keymap.set("n", "<F7>", function()
  current = current % #spell_modes + 1
  local langs = spell_modes[current]

  if #langs == 0 then
    vim.opt.spell = false
    print("Spell OFF")
  else
    vim.opt.spell = true
    vim.opt.spelllang = langs
    print("Spell: " .. table.concat(langs, ", "))
  end
end, { desc = "Cycle spellcheck languages" })

-- Функція видалення слова з словника і оновлення spell
local function delete_word_from_spell()
    -- Отримуємо слово під курсором
    local word = vim.fn.expand("<cword>")

    -- Шлях до файлу доданих слів
    local addfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"

    -- Перевірка, чи файл існує
    if vim.fn.filereadable(addfile) == 1 then
        -- Зчитуємо всі слова
        local lines = vim.fn.readfile(addfile)

        -- Фільтруємо слово
        local new_lines = {}
        for _, l in ipairs(lines) do
            if l ~= word then
                table.insert(new_lines, l)
            end
        end

        -- Перезаписуємо файл
        vim.fn.writefile(new_lines, addfile)
    end

    -- Перегенеруємо .spl і перезавантажуємо словник
    vim.cmd("mkspell! " .. addfile)
    vim.o.spell = true

    print('Слово "' .. word .. '" видалено зі словника')
end

-- Прив'язка до клавіші zd у нормальному режимі
vim.keymap.set("n", "zd", delete_word_from_spell, { noremap = true, silent = true })

 -- Базові keybindings для avante
-- vim.keymap.set("n", "<leader>aa", ":AvanteAsk<CR>", { desc = "Avante: Ask AI" })
-- vim.keymap.set("n", "<leader>at", ":AvanteToggle<CR>", { desc = "Avante: Toggle" })
-- vim.keymap.set("n", "<leader>ac", ":AvanteClear<CR>", { desc = "Avante: Clear" })
-- vim.keymap.set("n", "<leader>ar", ":AvanteRefresh<CR>", { desc = "Avante: Refresh" })
-- vim.keymap.set("v", "<leader>ae", ":AvanteEdit<CR>", { desc = "Avante: Edit selection" })
--
-- -- Швидке перемикання AI моделей
-- vim.keymap.set("n", "<leader>am", function()
--     local models = { "llama3.1", "mistral", "gpt-oss" }
--     local current = require("avante.config").providers.ollama.model
--     local next_model = nil
--
--     for i, model in ipairs(models) do
--         if model == current then
--             next_model = models[(i % #models) + 1]
--             break
--         end
--     end
--
--     if next_model then
--         require("avante.config").providers.ollama.model = next_model
--         print("Switched to model: " .. next_model)
--     end
-- end, { desc = "Avante: Switch model" })
