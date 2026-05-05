vim.wo.number = true
vim.wo.relativenumber = true

vim.g.did_load_filetypes = 1
vim.g.formatoptions = "qrn1"
vim.opt.showmode = false
vim.opt.updatetime = 100
vim.wo.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.wo.linebreak = true
vim.opt.virtualedit = "block"
vim.opt.undofile = true
-- vim.opt.shell = "/bin/zsh"
vim.opt.shell = "/bin/sh"
-- vim.opt.virtualedit = "all" -- Дозволити курсору виходити за межі рядка
vim.opt.linebreak = true -- Увімкнути перенесення рядків на межі слів
vim.opt.wrap = true -- Увімкнути перенесення довгих рядків
vim.opt.cursorline = true -- Виділяти рядок з курсором
vim.opt.spell = true -- Перевіряти орфографію
vim.opt.spelllang = { "en_us", "uk" } -- Перевіряти орфографію англійської та української мов

-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = false 

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Shorter messages
vim.opt.shortmess:append("c")

-- Indent Settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- Fillchars
vim.opt.fillchars = {
    vert = "│",
    fold = "⠀",
    eob = " ", -- suppress ~ at EndOfBuffer
    -- diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸"
}

-- vim.cmd([[highlight clear LineNr]])
-- vim.cmd([[highlight clear SignColumn]])

-- Запам'ятовування позиції курсора
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

vim.api.nvim_create_user_command("AddShebang", function()
  local shebangs = {
    py = "#!/usr/bin/env python3",
    sh = "#!/usr/bin/env bash",
    bash = "#!/usr/bin/env bash",
    rb = "#!/usr/bin/env ruby",
    pl = "#!/usr/bin/env perl",
    lua = "#!/usr/bin/env lua",
    js = "#!/usr/bin/env node",
    php = "#!/usr/bin/env php",
  }

  local ext = vim.fn.expand("%:e")
  local shebang = shebangs[ext]

  if shebang then
    local first_line = vim.fn.getline(1)
    if first_line:find("^#!") then
      print("⚠️ Вже є shebang рядок.")
      return
    end
    vim.api.nvim_buf_set_lines(0, 0, 0, false, { shebang, "" })
    vim.cmd("normal! G") -- переміститись вниз
    vim.bo.modified = true
    print("✅ Додано shebang для ." .. ext)
  else
    print("❌ Немає правила для розширення: ." .. ext)
  end
end, {})

