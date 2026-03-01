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
        "lua_ls",
        "ts_ls",
        "cssls",
        "tailwindcss",
        "html",
        "clangd",
        "pyright",
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

-- Lua
lsp["lua_ls"] = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
        },
    },
    capabilities = capabilities,
    on_attach = on_attach,
}

-- TypeScript / Node / React
lsp["ts_ls"] = {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json" },
    capabilities = capabilities,
    on_attach = on_attach,
}

-- CSS
lsp["cssls"] = {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- HTML
lsp["html"] = {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- TailwindCSS
lsp["tailwindcss"] = {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- Python
lsp["pyright"] = {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- C / C++
lsp["clangd"] = {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- Diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
