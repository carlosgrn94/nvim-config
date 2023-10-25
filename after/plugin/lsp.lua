local lsp_zero = require('lsp-zero')

function on_attach(client, bufnr) 
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
end

lsp_zero.on_attach(on_attach)
-- lsp_zero.on_attach(function(client, bufnr)
--	local opts = {buffer = bufnr, remap = false}
--	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
-- end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {'tsserver', 'eslint', 'denols'},
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
	}
})

local cmp = require('cmp')
cmp.setup({
	sources = {
		{name = 'path'},
		{name = 'nvim_lsp'},
		{name = 'nvim_lua'},
	},
	formatting = lsp_zero.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		-- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		-- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		-- ['<C-Space>'] = cmp.mapping.complete(),
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({select = false}),

		-- Ctrl+Space to trigger completion menu
		['<C-Space>'] = cmp.mapping.complete(),

		-- Navigate between snippet placeholder
		-- ['<C-f>'] = cmp_action.luasnip_jump_forward(),
		-- ['<C-b>'] = cmp_action.luasnip_jump_backward(),

		-- Scroll up and down in the completion documentation
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
	})
})

local nvim_lsp = require('lspconfig')
-- [[
-- Use denols for folders with a deno.lock file in the root
-- and tsserver for ones with package.json
-- ]]
nvim_lsp.denols.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.lock"),
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  single_file_support = false
}
