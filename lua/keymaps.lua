-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
-- add yours here

--Dismiss Noice Messages
vim.keymap.set('n', '<leader>nm', '<cmd>NoiceDismiss<CR>', { desc = 'Dismiss Noice Messages' })

-- Command to load the API key and open ChatGPT
vim.api.nvim_create_user_command('OpenChatGPT', function()
  local key = vim.fn.system 'op read op://Miginyon/OpenAI-ChatGPT-Nvim-Api-Key/credential --no-newline'
  vim.fn.setenv('CHATGPT_API_KEY', key)
  vim.cmd ':ChatGPT'
end, {})

-- Mapping this command to <leader>gpt
vim.api.nvim_set_keymap('n', '<leader>gpt', ':OpenChatGPT<CR>', { noremap = true, silent = true })

-- Minimap key mapping
vim.api.nvim_set_keymap('n', '<leader>mm', ':MinimapToggle<CR>', { noremap = true, silent = true })

-- Map <leader><F8> to toggle the Tagbar, which provides an overview of the tags in the current file
vim.keymap.set('n', '<leader><F8>', ':TagbarToggle<CR>', { desc = 'Toggle Tagbar' })

-- Function to toggle undotree and focus
-- This function toggles the visibility of the undotree. If the undotree becomes visible,
-- the function searches for its window and sets the focus to it, allowing immediate interaction.
function ToggleUndotreeAndFocus()
  -- Toggle the undotree
  vim.cmd 'UndotreeToggle'

  -- Iterate through all open windows to find the undotree window
  for _, win in pairs(vim.api.nvim_list_wins()) do
    -- Check if the current window is the undotree window
    if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(win), 'filetype') == 'undotree' then
      -- Focus the undotree window
      vim.api.nvim_set_current_win(win)
      break
    end
  end
end

-- Map <leader><F5> to toggle the undotree and focus on it if opened
-- This key mapping allows quick toggling of the undotree and shifting focus to it with the <leader><F5> key combination.
vim.keymap.set('n', '<leader><F5>', ToggleUndotreeAndFocus, { desc = 'Toggle undotree and focus it' })

-- Remap the 'Tab' key to cycle to the next buffer in normal mode
vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', {
  noremap = true, -- Avoids recursion, making this a non-recursive mapping
  silent = true, -- Avoids showing the command in the command line when executed
})

-- Remap the 'Shift+Tab' key to cycle to the previous buffer in normal mode
vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', {
  noremap = true, -- Avoids recursion, ensuring this mapping does not call itself
  silent = true, -- Makes the execution silent, not showing the command in the command line
})

-- Tagbar mapping
vim.keymap.set('n', '<F8>', ':TagbarToggle<CR>', { noremap = true, silent = true })

-- Primeagen mappings
-- In visual mode, pressing K moves the selected block of text up one line.
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- In visual mode, pressing J moves the selected block of text down one line.
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

-- In normal mode, Ctrl+u scrolls up half a page and centers the screen on the new cursor location.
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- In normal mode, Ctrl+d scrolls down half a page and centers the screen on the new cursor location.
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- These mappings remap the search next (n) and search previous (N) to center the screen on the match and keep the search highlighted.
-- Pressing 'n' in normal mode will jump to the next search result and center the screen.
vim.keymap.set('n', 'n', 'nzzzv')

-- Pressing 'N' in normal mode will jump to the previous search result and center the screen.
vim.keymap.set('n', 'N', 'Nzzzv')

-- Makes the current file executable.
vim.keymap.set('n', '<leader>xe', '<cmd>!chmod +x %<CR>', { silent = true })

-- In visual mode, this mapping allows you to paste over a selection without affecting the unnamed register.
vim.keymap.set('x', '<leader>p', [["_dP]])

-- This mapping lets you delete text without affecting the unnamed register, in both normal and visual modes.
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- In insert mode, pressing Ctrl+c will act as an escape key.
vim.keymap.set('i', '<C-c>', '<Esc>')

-- A substitution command that starts a search and replace based on the word under the cursor.
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- This mapping is for formatting the current buffer.
-- It utilizes Neovim's built-in LSP (Language Server Protocol) support.
-- When you press <leader>f in normal mode, it will format your current file
-- according to the rules and configurations provided by the active LSP server for that file type.
-- This is useful for automatically fixing indentation, line wrapping, organizing imports,
-- and other language-specific styling corrections.
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

local map = vim.keymap.set

map('n', ';', ':', { desc = 'CMD enter command mode' })

map('n', '<leader>fm', function()
  require('conform').format()
end, { desc = 'File Format with conform' })

map('i', 'jk', '<ESC>', { desc = 'Escape insert mode' })

-- vim: ts=2 sts=2 sw=2 et
