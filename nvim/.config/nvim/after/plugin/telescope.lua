local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[P]roject [F]iles'})
vim.keymap.set('n', '<C-p>', builtin.git_files, {desc = 'Git files'})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>vrc', function()
    builtin.find_files({
        hidden = true,
        prompt_title = "< VimRC >",
        cwd = "$HOME/.dotfiles",
    })
end)
