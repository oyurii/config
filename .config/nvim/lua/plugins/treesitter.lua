------------------------------------------------------------
-- Treesitter config (scientific + web)
------------------------------------------------------------

require("nvim-treesitter.configs").setup({

  ----------------------------------------------------------
  -- Parsers (ONLY what you actually need)
  ----------------------------------------------------------
  ensure_installed = {
    -- Core
    "lua",

    -- Programming
    "python",
    "javascript",

    -- Web
    "html",
    "css",

    -- Data / config
    "json",
    "yaml",
    "sql",

    -- Markup / scientific text
    "markdown",
    "markdown_inline",
    "latex",
  },

  ----------------------------------------------------------
  -- Installation
  ----------------------------------------------------------
  sync_install = false,
  auto_install = true,

  ----------------------------------------------------------
  -- Highlighting
  ----------------------------------------------------------
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {
      "latex",      -- краще для math environments
      "markdown",   -- fenced blocks + latex inside
    },
  },

  ----------------------------------------------------------
  -- Indentation
  ----------------------------------------------------------
  indent = {
    enable = true,
    disable = { "yaml", "latex" }, -- YAML і LaTeX часто ламають індент
  },

  ----------------------------------------------------------
  -- Incremental selection (ДУЖЕ корисно)
  ----------------------------------------------------------
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      scope_incremental = "<TAB>",
      node_decremental = "<S-TAB>",
    },
  },
})

