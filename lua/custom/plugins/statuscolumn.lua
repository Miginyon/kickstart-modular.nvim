return {
  'luukvbaal/statuscol.nvim',
  event = 'BufReadPre',
  enabled = false,
  config = function()
    local builtin = require 'statuscol.builtin'
    require('statuscol').setup {
      setopt = true,
      separator = '',
      relculright = true,
      segments = {
        { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
        {
          sign = { name = { '.*' }, maxwidth = 1, colwidth = 1, auto = true, wrap = true },
          text = { '%s', ' ' },
          click = 'v:lua.ScSa',
        },
        {
          text = { builtin.lnumfunc, ' ' },
          click = 'v:lua.ScLa',
        },
        {
          sign = { name = { 'GitSigns' }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
          click = 'v:lua.ScSa',
        },
      },
    }
  end,
}
-- return {
--   'luukvbaal/statuscol.nvim',
--   -- event = "VeryLazy", -- will cause alpha screen flicker
--   config = function()
--     local builtin = require 'statuscol.builtin'
--     require('statuscol').setup {
--       setopt = true,
--       ft_ignore = { '', 'qf', 'neo-tree', 'alpha' },
--       segments = {
--         { text = { '%s' }, click = 'v:lua.ScSa' },
--         {
--           text = { builtin.lnumfunc, ' ' },
--           condition = { true, builtin.not_empty },
--           click = 'v:lua.ScLa',
--         },
--         { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
--         { text = { ' ' } },
--       },
--     }
--   end,
-- }
-- return {
--   'luukvbaal/statuscol.nvim',
--   event = { 'VimEnter' }, -- Enter when on Vim startup to setup folding correctly (Avoid number in fold column)
--   config = function()
--     local builtin = require 'statuscol.builtin'
--     require('statuscol').setup {
--       relculright = false,
--       ft_ignore = { 'neo-tree' },
--       segments = {
--         {
--           -- line number
--           text = { ' ', builtin.lnumfunc },
--           condition = { true, builtin.not_empty },
--           click = 'v:lua.ScLa',
--         },
--         { text = { '%s' }, click = 'v:lua.ScSa' }, -- Sign
--         { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' }, -- Fold
--       },
--     }
--     vim.api.nvim_create_autocmd({ 'BufEnter' }, {
--       callback = function()
--         if vim.bo.filetype == 'neo-tree' then
--           vim.opt_local.statuscolumn = ''
--         end
--       end,
--     })
--   end,
-- }
-- return {
--   'luukvbaal/statuscol.nvim',
--   lazy = false,
--   config = function()
--     -- local builtin = require 'statuscol.builtin'
--     require('statuscol').setup {
--       seperator = '|',
--     }
--   end,
-- }

-- return {
--   'luukvbaal/statuscol.nvim',
--   lazy = false,
--   config = function(opts)
--     local builtin = require 'statuscol.builtin'
--     require('statuscol').setup {
--       relculright = false,
--       segments = {
--         {
--           text = { builtin.foldfunc },
--           click = 'v:lua.ScFa',
--         },
--         {
--           sign = { name = { 'Diagnostic' }, maxwidth = 2, auto = true },
--           click = 'v:lua.ScSa',
--         },
--         {
--           text = { builtin.lnumfunc },
--           click = 'v:lua.ScLa',
--         },
--         {
--           sign = { name = { '.*' }, maxwidth = 2, colwidth = 1, auto = true },
--           click = 'v:lua.ScSa',
--         },
--       },
--     }
--   end,
-- }
