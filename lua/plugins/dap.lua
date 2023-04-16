return {
  -- debugger
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap')
      dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
        name = 'lldb'
      }
      dap.configurations.c = {
        {
          name = "Launch",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
      }
      dap.configurations.cpp = dap.configurations.c
      dap.configurations.rust = dap.configurations.c
    end
  },
  -- improved ui
  {
    'rcarriga/nvim-dap-ui',
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      local api = require("nvim-tree.api")

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        api.tree.close()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
        api.tree.open()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
        api.tree.open()
      end
    end
  },
  -- show var values as virtual text
  {
    'theHamsta/nvim-dap-virtual-text',
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  },
}

