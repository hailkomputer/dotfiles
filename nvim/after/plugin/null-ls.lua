local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
	null_ls.builtins.formatting.goimports_reviser,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.rustfmt,
	null_ls.builtins.formatting.terraform_fmt,
	null_ls.builtins.diagnostics.golangci_lint,
	null_ls.builtins.diagnostics.staticcheck,
	null_ls.builtins.diagnostics.tfsec,
}

null_ls.setup({ sources = sources })
