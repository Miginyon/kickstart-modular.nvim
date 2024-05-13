return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- 'theHamsta/nvim-dap-virtual-text',
    'nvim-neotest/nvim-nio',
    'rcarriga/nvim-dap-ui',
    -- 'Pocco81/DAPInstall.nvim',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('dapui').setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.open()
    end

    vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<Leader>dc', dap.continue, {})
    vim.keymap.set('n', '<Leader>dr', dap.restart, {})
    vim.keymap.set('n', '<Leader>dso', dap.step_over, {})
    vim.keymap.set('n', '<Leader>din', dap.step_into, {})
    vim.keymap.set('n', '<Leader>dot', dap.step_out, {})
    -- vim.keymap.set('n', '<Leader>dl', dap.run_last, {})
    -- vim.keymap.set('n', '<Leader>ds', dap.stop, {})
    -- vim.keymap.set('n', '<Leader>du', dap.up, {})
    -- vim.keymap.set('n', '<Leader>dd', dap.down, {})
    -- vim.keymap.set('n', '<Leader>dp', dap.pause, {})
    -- vim.keymap.set('n', '<Leader>de', dap.set_exception_breakpoints, {})
  end,
}
