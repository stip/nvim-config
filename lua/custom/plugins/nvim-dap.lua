return {
  'mfussenegger/nvim-dap',
  dependencies = {
    { 'rcarriga/nvim-dap-ui', dependencies = { 'nvim-neotest/nvim-nio' } },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    dap.adapters.codelldb = {
      type = 'server',
      host = '127.0.0.1',
      port = 5463,
      executable = {
        command = 'C:\\Users\\stip\\tools\\extension\\adapter\\codelldb',
        args = { '--port', '5463' },
        detached = false,
      },
    }

    dap.configurations.cpp = {
      {
        name = 'Launch file',
        type = 'codelldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        --     args = { "3", "5", "4", "10" }
      },
    }

    dap.configurations.lua = {
      {
        type = 'nlua',
        request = 'attach',
        name = 'Attach to running Neovim instance',
        --     host = function()
        --       local value = vim.fn.input('Host [127.0.0.1]: ')
        --       if value ~= "" then
        --         return value
        --       end
        --       return '127.0.0.1'
        --     end,
        --     port = function()
        --       local val = tonumber(vim.fn.input('Port: '))
        --       assert(val, "Please provide a port number")
        --       return val
        --     end,
      },
    }
    --
    dap.adapters.nlua = function(callback, config)
      callback { type = 'server', host = '127.0.0.1', port = 8086 }
    end

    dap.configurations.c = dap.configurations.cpp
    dapui.setup()

    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap
    keymap('n', '<F8>', [[:lua require"dap".toggle_breakpoint()<CR>]], { noremap = true })
    keymap('n', '<F9>', [[:lua require"dap".continue()<CR>]], { noremap = true })
    keymap('n', '<F10>', [[:lua require"dap".step_over()<CR>]], { noremap = true })
    keymap('n', '<F11>', [[:lua require"dap".step_into()<CR>]], { noremap = true })
    keymap('n', '<F12>', [[:lua require"dap.ui.widgets".hover()<CR>]], { noremap = true })
    keymap('n', '<F5>', [[:lua require"osv".launch({port = 8086})<CR>]], { noremap = true })
  end,
}

-- local config = { host = '127.0.0.1', port = 5463 }
-- dap.adapters.codelldb = function(callback, config)
--   -- specify in your configuration host = your_host , port = your_port
--   callback { type = 'server', host = config.host, port = config.port }
-- end
--
-- dap.adapters.codelldb = {
--   type = 'server',
--   host = '127.0.0.1',
--   port = 5463,
--   executable = {
--     command = 'C:\\Users\\stip\\tools\\extension\\adapter\\codelldb',
--     args = { '--port', '5463' },
--     detached = false,
--   },
-- }
--
-- dap.configurations.cpp = {
--   {
--     name = 'Launch file',
--     type = 'codelldb',
--     request = 'launch',
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = true,
--     --     args = { "3", "5", "4", "10" }
--   },
-- }

--[[ dap.adapters.lldb = { ]]
--[[   type = 'executable', ]]
--[[   command = "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\Community\\VC\\Tools\\Llvm\\x64\\bin\\lldb-vscode.exe", ]]
--[[   name = "lldb" ]]
--[[ } ]]

--[[ dap.configurations.cpp = { ]]
--[[   { ]]
--[[     name = "Launch", ]]
--[[     type = "lldb", ]]
--[[     request = "launch", ]]
--[[     program = function() ]]
--[[       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file') ]]
--[[     end, ]]
--[[     cwd = '${workspaceFolder}', ]]
--[[     stopOnEntry = false, ]]
--[[     args = {3, 5, 4, 10}, ]]

--[[     -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting: ]]
--[[     -- ]]
--[[     --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope ]]
--[[     -- ]]
--[[     -- Otherwise you might get the following error: ]]
--[[     -- ]]
--[[     --    Error on launch: Failed to attach to the target process ]]
--[[     -- ]]
--[[     -- But you should be aware of the implications: ]]
--[[     -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html ]]
--[[     runInTerminal = false, ]]
--[[   }, ]]
--[[ } ]]
-- dap.configurations.c = dap.configurations.cpp

-- dap.adapters.neovim = function(callback)
--   local server = require('lua_debugger').launch()
--   callback({ type = 'server'; host = server.host; port = server.port; })
-- end
--
-- require("nvim-dap-virtual-text").setup()
--
-- local whichkey = require("which-key")
-- whichkey.register({
--   ["<leader>"] = {
--     y = {
--       name = "+file",
--       f = { "<cmd>Telescope find_files<cr>", "Find File" },
--       r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
--       n = { "<cmd>enew<cr>", "New File" },
--     },
--   },
-- })
--
