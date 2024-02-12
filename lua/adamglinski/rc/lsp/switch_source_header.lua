-- Script to quickly switch between source and header files
-- :e %<.h
--

local sourceHeaderPairs = {
    cpp = {"h", "hpp"},
}

function SwitchSourceHeader()
    local ext = vim.bo.filetype
    for sourceType, headerType in pairs(sourceHeaderPairs) do
    end
end
