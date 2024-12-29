return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("dapui").setup()


  dap.adapters.bash = {
      type = 'executable',
      command = 'bash-debug-adapter',
      name = 'bash'
    }

  dap.configurations.sh = {
    {
      type = 'bash',
      request = 'launch',
      name = "Launch Bash Script",
      program = "${file}",
      cwd = "${workspaceFolder}",
      args = {},
      env = function()
        local variables = {}
        for k, v in pairs(vim.fn.environ()) do
          table.insert(variables, string.format("%s=%s", k, v))
        end
        return variables
      end,
    },
  }

    -- Function to derive executable name from current source file
    local function get_executable_name()
      local file = vim.fn.expand("%:t")     -- Get current file name
      local path = vim.fn.expand("%:p:h")   -- Get current file directory
      local executable = file:gsub("%.c$", "") -- Remove .c extension
      return path .. "/" .. executable      -- Combine path and executable name
    end

    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = "/home/norbert/softWare/cpptools/extension/debugAdapters/bin/OpenDebugAD7", -- Adjust this path
      options = {
        detached = false,
      },
    }

    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "cppdbg",
        request = "launch",
        program = function()
          return get_executable_name()
          -- return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        setupCommands = {
          {
            text = "-enable-pretty-printing",
            description = "enable pretty printing",
            ignoreFailures = false,
          },
        },
        miDebuggerPath = "/usr/bin/gdb", -- Ensure this points to your gdb executable
        miDebuggerArgs = "",
        args = {},
      },
    }

    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp

    -- Keybindings for DAP
    vim.api.nvim_set_keymap('n', '<F10>', '<Cmd>lua require"dap".step_over()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<F11>', '<Cmd>lua require"dap".step_into()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<F12>', '<Cmd>lua require"dap".step_out()<CR>', { noremap = true, silent = true })
    vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint,  { desc = "Toggle breakpoint (debug)"})
    vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Continue (debug)"})
    vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "Step Over (debug)"})
    vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "Step Into (debug)"})
    vim.keymap.set("n", "<Leader>du", dap.step_out, { desc = "Step Out (debug)"})
    vim.keymap.set('n', '<Leader>dn', dap.run_to_cursor, { desc = "Run to Cursor (debug)"})  -- Jump to next breakpoint
    vim.keymap.set('n', '<Leader>db', dap.step_back, { desc = "Step back (debug)"})      -- Step back
    vim.keymap.set('n', '<Leader>dui', dapui.toggle, { desc = "Toggle (debug)"})

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

  end,
}
