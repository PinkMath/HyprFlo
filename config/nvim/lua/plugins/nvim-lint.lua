require('lint').linters_by_ft = { --some of these need to be installed from package manager
		  lua = {"luac"},
		  python = {"ruff"}, -- pip install ruff
		  sh = {"shellcheck"}, -- sudo pacman -S shellcheck
		  bash = {"shellcheck"},
		  zsh = {"shellcheck"},

		  -- sudo pacman -S cppcheck
		  c = {"cppcheck"},
		  cpp = {"cppcheck"},

		  rust = {"clippy"},

		  -- npm install -g eslint_d
		  javascript = {"eslint_d"},
		  javascriptreact = {"eslint_d"},
		  typescript = {"eslint_d"},
		  typescriptreact = {"eslint_d"},

		  css = {"stylelint"},
		  scss = {"stylelint"},

		  html = {"htmlhint"},

		  json = {"jsonlint"},
		  yaml = {"yamllint"}, -- sudo pacman -S yamllint
		  markdown = {"markdownlint"}, -- npm install -g markdownlint-cli

		  dockerfile = {"hadolint"}, -- yay -S hadolint | paru -S hadolint
		  cmake = {"cmakelint"},
}

-- Some linters require a file to be saved to disk, others support linting stdin input.
-- For such linters you could also define a more aggressive autocmd,
-- for example on the InsertLeave or TextChanged events.
-- To get the filetype of a buffer you can run := vim.bo.filetype.

-- lints on close, see autocmd
