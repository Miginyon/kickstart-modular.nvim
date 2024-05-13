-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
--vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Set the number of spaces in a tab to 4
vim.opt.tabstop = 4
-- Set the number of spaces used for soft tab stops to 4
vim.opt.softtabstop = 4
-- Set the number of spaces to use for each step of (auto)indent to 4
vim.opt.shiftwidth = 4
-- Convert tabs to spaces
vim.opt.expandtab = true

-- Enable smart indenting when starting a new line, useful for code formatting
vim.opt.smartindent = true

-- Disable text wrapping
vim.opt.wrap = false

-- Disable creation of swap files for recovery purposes
vim.opt.swapfile = false
-- Disable creation of backup files
vim.opt.backup = false
-- Set the directory for storing undo history files
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
-- Enable persistent undo (undo changes after file is closed and reopened)
-- Save undo history
vim.opt.undofile = true

-- Disable text wrapping
vim.opt.wrap = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 50

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Enable true color support in the terminal (for better colour schemes)
vim.opt.termguicolors = true
--require('bufferline').setup {}

-- Set a vertical line at the 80th character (helps maintain line length in code)
vim.opt.colorcolumn = '80'

-- Disable highlighting all search matches (highlights can be distracting)
vim.opt.hlsearch = false
-- Enable incremental search that shows partial matches as you type
vim.opt.incsearch = true

-- Set the cursor to blink in all modes. The blink rate is configured to 500 milliseconds.
-- Adjust the 'blinkon' value to change the blink rate (value is in milliseconds).
vim.opt.guicursor = 'a:blinkon500'

-- vim: ts=2 sts=2 sw=2 et
