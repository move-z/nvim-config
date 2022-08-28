local dap, dapui = require("dap"), require("dapui")
local nt_api = require("nvim-tree.api")

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

