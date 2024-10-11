-- insert mode to normal mode
vim.keymap.set('i', 'jj', '<Esc>')

-- do not overwrite default register
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('n', 'X', '"_X')
vim.keymap.set('n', 's', '"_s')

-- Leader Key / default setting 
vim.api.nvim_set_var('mapleader', '\\')
-- vim.api.nvim_set_var('maplocalleader', '_')

-----------
-- Lesson section 14.1 example
-- vim.keymap.set('n', 'lhs', function() print("real lia function") end)
-- vim.keymap.set('n', '<Leader>l', function() print('Leader key worked too.') end)

-- section 14.1
--function testfunc()
--  print('i am test function')
--end
--vim.keymap.set('n', '<Leader>3', testfunc)
--
--function testparam(str)
--  print(str)
--end
--vim.keymap.set('n', '<Leader>4', function() testparam('hello') end)
--
--function testret()
--  print("hello")
--  return "good bye"
--end
--vim.keymap.set('n', '<Leader>5', testret())

