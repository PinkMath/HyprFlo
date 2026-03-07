-- plugins/lsp.lua
local mason = require("mason")
local mason_lsp = require("mason-lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local cmp = require("cmp")
local luasnip = require("luasnip")

-- Setup Mason
mason.setup()
mason_lsp.setup({
    ensure_installed = {
        "lua_ls", "ts_ls", "cssls", "tailwindcss", "html", "pyright", "clangd",
        "gopls", "rust_analyzer", "jsonls", "bashls", "dockerls", "yamlls",
        "emmet_ls", "svelte", "vuels",
    },
})

-- LSP capabilities & on_attach
local capabilities = cmp_nvim_lsp.default_capabilities()
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, opts)
end

-- Setup nvim-cmp
cmp.setup({
    snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
            else fallback() end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then luasnip.jump(-1)
            else fallback() end
        end, { "i", "s" }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping.abort(),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
    }),
})

-- Modern vim.lsp.config setup
local lsp = vim.lsp.config

-- Servers
local servers = {
    "lua_ls", "ts_ls", "cssls", "tailwindcss", "html", "pyright", "clangd",
    "gopls", "rust_analyzer", "jsonls", "bashls", "dockerls", "yamlls",
    "emmet_ls", "svelte", "vuels",
}

for _, server in ipairs(servers) do
    lsp[server] = {
        capabilities = capabilities,
        on_attach = on_attach,
    }
end

-- Lua specific settings
lsp["lua_ls"].settings = {
    Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false },
    },
}

-- HTML5 LuaSnip snippet
luasnip.add_snippets("html", {
    luasnip.snippet("html5", {
        luasnip.text_node({
            "<!DOCTYPE html>",
            "<html lang=\"en\">",
            "    <head>",
            "        <meta charset=\"UTF-8\">",
            "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">",
            "        <title>Document</title>",
            "    </head>",
            "    <body>",
        }),
        luasnip.insert_node(0),  -- Cursor will start here inside <body>
        luasnip.text_node({
            "    </body>",
            "</html>",
        }),
    }),
})

-- Diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
