local osname = vim.loop.os_uname().sysname
HOME = os.getenv("HOME")

if(osname == "Darwin") then
    NVIM_DIR = HOME .. ".config/nvim"
    NVIM_DATA_DIR =  "~/.local/share/nvim/"
elseif osname == "Windows_NT" then
    NVIM_DIR = os.getenv("LOCALAPPDATA") .. "\\nvim"
    NVIM_DATA_DIR = os.getenv("LOCALAPPDATA") .. "\\nvim-data"
end

