return {
  'nvim-telescope/telescope.nvim',

  dependencies = { 'nvim-lua/plenary.nvim', { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },

  config = function()
	  require('telescope').setup {
		  extensions = {
			  fzf = {}
		  }
	  }

	  -- require('telescope').load_extensions('fzf')

	  local builtin = require('telescope.builtin')

	vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
  end
}
