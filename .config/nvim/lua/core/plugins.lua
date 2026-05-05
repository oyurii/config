local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ 
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim", "s1n7ax/nvim-window-picker"
        }
    },
    {'nvim-treesitter/nvim-treesitter'},
    {'neovim/nvim-lspconfig'},
    {'joshdick/onedark.vim'},
    {'terrortylor/nvim-comment'},
    {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'}, {'hrsh7th/cmp-cmdline'}, {'hrsh7th/nvim-cmp'}, {'hrsh7th/cmp-nvim-lsp-signature-help'},
    {"williamboman/mason.nvim", build = ":MasonUpdate"},
    {'nvim-telescope/telescope.nvim'},
    {'jose-elias-alvarez/null-ls.nvim'},
    {"windwp/nvim-autopairs"},
    {
        "lervag/vimtex",
        ft = { "tex" }, -- Завантажувати лише для файлів .tex
        config = function()
            vim.g.vimtex_enabled = 1
            vim.g.tex_flavor = "latex"
            -- vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_view_method = 'general'
            vim.g.vimtex_view_general_viewer = 'okular'
            vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
            vim.g.vimtex_quickfix_mode = 0
        end,
    },
    {'windwp/nvim-autopairs'},
    {'windwp/nvim-ts-autotag'},
    {"akinsho/bufferline.nvim", dependencies = {'nvim-tree/nvim-web-devicons'}},
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = {{'nvim-tree/nvim-web-devicons'}}
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons', 'linrongbin16/lsp-progress.nvim'
        }
    },
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    {'lewis6991/gitsigns.nvim'},
    {"echasnovski/mini.icons"},
    {
        "olrtg/nvim-emmet",
        config = function()
            vim.keymap.set({ "n", "v" }, '<M-z>', require('nvim-emmet').wrap_with_abbreviation)
        end,
    },
    {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {'c7im/nvim-lammps-syntax', ft = 'lammps'},
    {
        "c7im/nvim-spell-manager",
        config = function()
            require("spell_manager").setup({
                modes = {
                    { "en_us", "uk" },
                    -- { "en_us", "ru" },
                    {}, -- OFF
                },
                key_cycle = "<F7>",
                key_delete = "zd",
            })
        end
    },
    -- {
    --     "yetone/avante.nvim",
    --     event = "VeryLazy",
    --     build = "make",
    --     -- dependencies = {
    --         -- "nvim-lua/plenary.nvim",
    --         -- "MunifTanjim/nui.nvim",
    --         -- "nvim-tree/nvim-web-devicons",
    --     -- },
    --     opts = {
    --         provider = "ollama",
    --         providers = {
    --             ollama = {
    --                 endpoint = "http://127.0.0.1:11434",
    --                 -- model = "mistral",
    --                 -- model = "qwen2.5-coder:7b",
    --                 -- model = "qwen2.5:7b",
    --                 model = "llama3.1",
    --                 -- model = "gpt-oss",
    --                 parse_curl_args = function(opts, code_opts)
    --                     return {
    --                         url = opts.endpoint .. "/api/chat",
    --                         headers = {
    --                             ["Content-Type"] = "application/json",
    --                         },
    --                         body = {
    --                             model = opts.model,
    --                             messages = code_opts.messages or {},
    --                             stream = true,
    --                             options = {
    --                                 num_thread = 8,           -- Використати всі 8 ядер
    --                                 num_ctx = 1024,           -- Зменшити контекст для швидкості
    --                                 num_gpu = 0,              -- Якщо немає GPU
    --                                 num_predict = 256,        -- Обмежити довжину відповіді
    --                                 temperature = 0.2,
    --                                 top_k = 40,
    --                                 top_p = 0.9,
    --                                 repeat_penalty = 1.1,
    --                             },
    --                         },
    --                     }
    --                 end,
    --                 parse_response_data = function(data_stream, event_state, opts)
    --                     if data_stream:match('"done":true') then
    --                         return nil
    --                     end
    --                     local json = vim.json.decode(data_stream)
    --                     if json.message and json.message.content then
    --                         return json.message.content
    --                     end
    --                     return nil
    --                 end,
    --             },
    --         },
    --     },
    -- },
    {
        "David-Kunz/gen.nvim",
        opts = {
            model = "llama3.1",
            display_mode = "vertical-split", 
            show_prompt = true,
            show_model = true,
            no_auto_close = true,
        },

        config = function(_, opts)
            local gen = require("gen")
            gen.setup(opts)

            -- Власні промпти (можна перевизначати або додавати нові)
            gen.prompts.Create_Commit_Message_For_Code = {
                prompt = "Create commit message for this code:\n$text",
            }

            gen.prompts.Create_Commit_Message_For_Diff = {
                prompt = "Create commit message for this diff:\n$text",
            }

            -- Гарячі клавіші (всі з <leader><leader> — якщо у тебе leader = " ", то буде ,,)
            local map = vim.keymap.set
            local opts_noremap = { noremap = true, silent = true }

            -- Загальний Gen (вибір промпту)
            map({ "n", "v" }, "<leader><leader>ll", ":Gen<CR>", opts_noremap)

            -- Зміна моделі
            map("n", "<leader><leader>LL", function()
                gen.select_model()
            end, opts_noremap)

            -- Чат-режим
            map({ "n", "v" }, "<leader><leader>lc", function()
                gen.exec(gen.prompts.Chat)
            end, opts_noremap)

            -- Підсумок виділеного тексту / поточного буфера
            map({ "n", "v" }, "<leader><leader>ls", function()
                gen.exec(gen.prompts.Summarize)
            end, opts_noremap)

            -- Створити commit message з коду
            map({ "n", "v" }, "<leader><leader>lg", function()
                gen.exec(gen.prompts.Create_Commit_Message_For_Code)
            end, opts_noremap)

            -- Просто запитати щось у моделі
            map({ "n", "v" }, "<leader><leader>la", function()
                gen.exec(gen.prompts.Ask)
            end, opts_noremap)

            -- Рев’ю коду
            map({ "n", "v" }, "<leader><leader>lr", function()
                gen.exec(gen.prompts.Review_Code)
            end, opts_noremap)

            -- Поліпшити / відрефакторити код
            map({ "n", "v" }, "<leader><leader>le", function()
                gen.exec(gen.prompts.Enhance_Code)
            end, opts_noremap)

            -- Додаткові популярні промпти, які часто додають:
            -- gen.prompts.Enhance_Grammar = { prompt = "Improve grammar and wording: $text" }
            -- gen.prompts.Fix_Bugs        = { prompt = "Fix bugs in following code: $text" }
        end,
    },
    {
        "rmagatti/auto-session",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("auto-session").setup({
                auto_save_enabled = false,
                auto_restore_enabled = false,
                auto_session_enabled = true,
                auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
                log_level = "error",

                session_lens = {
                    load_on_setup = true,
                    theme_conf = { border = true },
                    previewer = false,
                    mappings = {
                        delete_session = { "i", "<C-D>" },  -- 🔥 ось це важливо
                        alternate_session = { "i", "<C-S>" },
                        copy_session = { "i", "<C-Y>" },
                    },
                },
            })

            require("telescope").load_extension("session-lens")
        end,
    },
});

