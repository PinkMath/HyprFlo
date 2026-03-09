-- safely load nvim-lint
local ok, lint = pcall(require, "lint")
if not ok then
  return
end

-- linter mapping
lint.linters_by_ft = {
  lua = {"luac"},
  python = {"ruff"},

  sh = {"shellcheck"},
  bash = {"shellcheck"},
  zsh = {"shellcheck"},

  c = {"cppcheck"},
  cpp = {"cppcheck"},

  rust = {"cargo"},

  javascript = {"eslint_d"},
  javascriptreact = {"eslint_d"},
  typescript = {"eslint_d"},
  typescriptreact = {"eslint_d"},

  css = {"stylelint"},
  scss = {"stylelint"},

  html = {"htmlhint"},

  json = {"jsonlint"},
  yaml = {"yamllint"},
  markdown = {"markdownlint"},

  dockerfile = {"hadolint"},
  cmake = {"cmakelint"},
  sql = {"sqlfluff"},
}

-- function to run lint
local function try_lint()
  lint.try_lint()
end

-- autocmd group
local lint_augroup = vim.api.nvim_create_augroup("linting", { clear = true })

vim.api.nvim_create_autocmd({
  "BufEnter",
  "BufWritePost",
  "InsertLeave",
}, {
  group = lint_augroup,
  callback = try_lint,
})

-- Some linters require a file to be saved to disk, others support linting stdin input.
-- For such linters you could also define a more aggressive autocmd,
-- for example on the InsertLeave or TextChanged events.
-- To get the filetype of a buffer you can run := vim.bo.filetype.

-- lints on close, see autocmd
