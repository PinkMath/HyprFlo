local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  return
end

local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
  return
end

local cmp_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_lsp_ok then
  return
end

mason.setup()

local capabilities = cmp_nvim_lsp.default_capabilities()

local servers = {
  -- Lua / Neovim
  "lua_ls",

  -- Frontend / fullstack
  "ts_ls",
  "html",
  "cssls",
  "tailwindcss",
  "emmet_language_server",
  "jsonls",

  -- Backend
  "pyright",
  "gopls",
  "rust_analyzer",
  "intelephense",

  -- Config / shell / DevOps
  "bashls",
  "dockerls",
  "docker_compose_language_service",
  "yamlls",
}

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(event)
    local bufnr = event.buf

    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, {
        buffer = bufnr,
        noremap = true,
        silent = true,
        desc = desc,
      })
    end

    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gr", vim.lsp.buf.references, "References")
    map("n", "gi", vim.lsp.buf.implementation, "Implementation")
    map("n", "K", vim.lsp.buf.hover, "Hover documentation")
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>d", vim.diagnostic.open_float, "Show diagnostic")
    map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
    map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
  end,
})

-- Default config for every LSP server
vim.lsp.config("*", {
  capabilities = capabilities,
})

-- Lua-specific config
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
      },
    },
  },
})

-- TypeScript / JavaScript
vim.lsp.config("ts_ls", {})

-- HTML
vim.lsp.config("html", {})

-- CSS
vim.lsp.config("cssls", {})

-- Tailwind CSS
vim.lsp.config("tailwindcss", {})

-- Emmet
vim.lsp.config("emmet_language_server", {
  filetypes = {
    "html",
    "css",
    "scss",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "svelte",
    "vue",
    "php",
  },
})

-- JSON
vim.lsp.config("jsonls", {})

-- Python
vim.lsp.config("pyright", {})

-- Go
vim.lsp.config("gopls", {})

-- Rust
vim.lsp.config("rust_analyzer", {})

-- PHP
vim.lsp.config("intelephense", {})

-- Bash
vim.lsp.config("bashls", {})

-- Dockerfile
vim.lsp.config("dockerls", {})

-- Docker Compose
vim.lsp.config("docker_compose_language_service", {})

-- YAML
vim.lsp.config("yamlls", {})

-- Enable servers
vim.lsp.enable(servers)

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<C-e>"] = cmp.mapping.abort(),
  }),

  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
})
