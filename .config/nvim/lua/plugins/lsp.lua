------------------------------------------------------------
-- LSP CONFIG (Neovim 0.11+)
-- NO deprecated lspconfig API
------------------------------------------------------------

-- Capabilities (for nvim-cmp)
local capabilities = vim.tbl_deep_extend(
  "force",
  vim.lsp.protocol.make_client_capabilities(),
  require("cmp_nvim_lsp").default_capabilities()
)

------------------------------------------------------------
-- Helper
------------------------------------------------------------
local function setup(server, opts)
  opts = opts or {}
  opts.capabilities = capabilities
  vim.lsp.config(server, opts)
end

------------------------------------------------------------
-- Filetypes (LAMMPS / Quantum ESPRESSO)
------------------------------------------------------------
vim.filetype.add({
  extension = {
    lmp = "lammps",
    ["in"] = "lammps",
    pw = "quantum_espresso",
    qe = "quantum_espresso",
  },
})

------------------------------------------------------------
-- Programming languages
------------------------------------------------------------

-- Python
setup("pyright")

-- JavaScript / TypeScript
setup("ts_ls")

-- Perl
setup("perlnavigator")

-- SQL
setup("sqlls")

------------------------------------------------------------
-- Web
------------------------------------------------------------

setup("html")
setup("cssls")

setup("emmet_ls", {
  filetypes = {
    "html",
    "css",
    "scss",
    "javascriptreact",
    "typescriptreact",
  },
})

------------------------------------------------------------
-- Markup / Scientific text
------------------------------------------------------------

-- Markdown
setup("marksman")

-- LaTeX
setup("texlab", {
  settings = {
    texlab = {
      build = {
        executable = "latexmk",
        args = {
          "-pdf",
          "-interaction=nonstopmode",
          "-synctex=1",
          "%f",
        },
      },
    },
  },
})

-- YAML
setup("yamlls")

-- JSON
setup("jsonls")

------------------------------------------------------------
-- Enable servers
------------------------------------------------------------
local servers = {
  "pyright",
  "ts_ls",
  "perlnavigator",
  "sqlls",
  "html",
  "cssls",
  "emmet_ls",
  "marksman",
  "texlab",
  "yamlls",
  "jsonls",
}

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end

------------------------------------------------------------
-- Diagnostics keymaps (global)
------------------------------------------------------------
vim.keymap.set("n", "<leader>lD", vim.diagnostic.open_float, { desc = "Line diagnostics" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>ld", vim.diagnostic.setloclist, { desc = "Diagnostics list" })

------------------------------------------------------------
-- LSP attach keymaps
------------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = ev.buf }

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>lf", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

