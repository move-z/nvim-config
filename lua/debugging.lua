local dap, dapui = require("dap"), require("dapui")
local nt_api = require("nvim-tree.api")

vim.fn.sign_define('DapBreakpoint', {text='🚫', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='❓', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='⛔', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='📝', texthl='', linehl='', numhl=''})

dapui.setup()
require('nvim-dap-virtual-text').setup()

dap.listeners.after.event_initialized["dapui"] = function()
  nt_api.tree.close()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui"] = function()
  dapui.close()
  nt_api.tree.open()
end
dap.listeners.before.event_exited["dapui"] = function()
  dapui.close()
  nt_api.tree.open()
end

