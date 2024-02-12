
return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function ()
        local dap = require("dap")
        require("dapui").setup()

        -- Adapters
        dap.adapters.cppdbg = {
            id = "cppdbg",
            type = "executable",
            command = "C:\\Users\\adams\\.vscode\\extensions\\ms-vscode.cpptools-1.16.3-win32-x64\\debugAdapters\\bin\\OpenDebugAD7.exe",
            options = {
                detached = false
            }
        }

        -- Configurations
        dap.adapters.cpp = {
            type = "executable",
            attach = {
                pidProperty = "pid",
                pidSelect = "ask"
            },
            command = "lldb",
            env = {
                LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
            },
            name = "lldb"
        }
        -- Configurations
        --[[
        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "cppdbg",
                request = "launch",
                program = function ()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', "file")
                end,
                cwd = "${workspaceFolder}",
                stopAtEntry = true,
            }
        }
        ]]
        dap.configurations.cpp = {                                                                                                                
            {                                                                                                                                         
                name = "lldb",                                                                                                                         
                type = "cpp",                                                                                                                          
                request = "launch",                                                                                                                    
                program = function()                                                                                                                   
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')                                                         
                end,                                                                                                                                   
                cwd = '${workspaceFolder}',                                                                                                            
                externalTerminal = false,                                                                                                              
                stopOnEntry = false,                                                                                                                   
                args = {}                                                                                                                              
            },                                                                                                                                        
        }
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp
    end

}
