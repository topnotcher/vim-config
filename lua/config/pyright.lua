function get_venv_path()
	-- Try to get the virtual environment path (adjust logic if needed)
	local venv_path = os.getenv("VIRTUAL_ENV")
	if venv_path then
		return venv_path
	else
		return nil -- Or a default path if you have one
	end
end

require'lspconfig'.pyright.setup {
	settings = {
		python = {
			venv = get_venv_path(),
			analysis = {
				typeCheckingMode = "basic",
				autoImportCompletions = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
}
