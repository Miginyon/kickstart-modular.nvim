return {
  'wfxr/minimap.vim',
  config = function()
    -- Minimap settings
    vim.g.minimap_width = 10
    vim.g.minimap_auto_start = 0
    vim.g.minimap_auto_start_win_enter = 0

    -- -- Auto-start minimap on Neovim start
    -- vim.api.nvim_create_autocmd('VimEnter', {
    --   -- pattern = '*',
    --   nested = true,
    --   callback = function()
    --     vim.cmd 'MinimapToggle'
    --     vim.cmd 'wincmd p'
    --   end,
    -- })

    -- -- Auto-close minimap when exiting Neovim
    -- vim.api.nvim_create_autocmd('QuitPre', {
    --   pattern = '*',
    --   callback = function()
    --     vim.cmd 'MinimapToggle'
    --   end,
    -- })
  end,
}
