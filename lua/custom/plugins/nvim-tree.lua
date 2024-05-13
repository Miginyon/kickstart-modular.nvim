return {
  'kyazdani42/nvim-tree.lua',
  config = function()
    require('nvim-tree').setup {
      -- auto_close = true, -- Automatically close the tree when it's the last window
      open_on_tab = false, -- Disable opening the tree when switching tabs
      -- update_to_buf_dir = {
      --   enable = true,
      --   auto_open = true, -- Automatically open the tree when changing directory (cd)
      -- },
      hijack_cursor = false, -- Avoid the cursor jumping to the tree on buffer changes
      update_cwd = true, -- Keep the tree in sync with the current working directory
      view = {
        width = 30,
        side = 'right', -- Open the tree on the right side
      },
    }

    -- Key mappings
    vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

    -- Auto-open on start
    vim.cmd [[
      autocmd VimEnter * ++nested NvimTreeOpen
      autocmd VimEnter * ++nested wincmd p
    ]]

    -- Auto close
    vim.api.nvim_create_autocmd({ 'QuitPre' }, {
      callback = function()
        vim.cmd 'NvimTreeClose'
      end,
    })
  end,
}
