local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

treesitter.setup({
  ensure_installed = {
    -- Core
    "lua",
    "vim",
    "vimdoc",

    -- Web/fullstack
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "scss",
    "svelte",
    "vue",

    -- Backend
    "python",
    "go",
    "rust",
    "php",

    -- Data/config
    "json",
    "jsonc",
    "yaml",
    "toml",
    "dockerfile",
    "bash",
    "sql",

    -- Docs
    "markdown",
    "markdown_inline",

    -- Git
    "gitignore",
    "gitcommit",
  },

  highlight = {
    enable = true,
  },

  indent = {
    enable = false,
  },
})
