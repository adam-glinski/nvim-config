local blink_cmp_highlights = function ()
    return {
        BlinkCmpLabel = { link = 'CmpItemAbbr' },
        BlinkCmpLabelMatch = { link = 'CmpItemAbbrMatch' },
        BlinkCmpLabelDeprecated = { link = 'CmpItemAbbrDeprecated'},
        BlinkCmpLabelDetail = { link = 'CmpItemMenu' },
        BlinkCmpLabelDescription = { link = 'CmpItemMenu' },

        BlinkCmpSource = { link = 'CmpItemMenu' },
        BlinkCmpKind = { link = 'CmpItemKind' },
        BlinkCmpKindText = { link = "CmpItemKindText" },
        BlinkCmpKindMethod = { link = "CmpItemKindMethod" },
        BlinkCmpKindFunction = { link = "CmpItemKindFunction" },
        BlinkCmpKindConstructor = { link = "CmpItemKindConstructor" },
        BlinkCmpKindField = { link = "CmpItemKindField" },
        BlinkCmpKindVariable = { link = "CmpItemKindVariable" },
        BlinkCmpKindClass = { link = "CmpItemKindClass" },
        BlinkCmpKindInterface = { link = "CmpItemKindInterface" },
        BlinkCmpKindModule = { link = "CmpItemKindModule" },
        BlinkCmpKindProperty = { link = "CmpItemKindProperty" },
        BlinkCmpKindUnit = { link = "CmpItemKindUnit" },
        BlinkCmpKindValue = { link = "CmpItemKindValue" },
        BlinkCmpKindEnum = { link = "CmpItemKindEnum" },
        BlinkCmpKindKeyword = { link = "CmpItemKindKeyword" },
        BlinkCmpKindSnippet = { link = "CmpItemKindSnippet" },
        BlinkCmpKindColor = { link = "CmpItemKindColor" },
        BlinkCmpKindFile = { link = "CmpItemKindFile" },
        BlinkCmpKindReference = { link = "CmpItemKindReference" },
        BlinkCmpKindFolder = { link = "CmpItemKindFolder" },
        BlinkCmpKindEnumMember = { link = "CmpItemKindEnumMember" },
        BlinkCmpKindConstant = { link = "CmpItemKindConstant" },
        BlinkCmpKindStruct = { link = "CmpItemKindStruct" },
        BlinkCmpKindEvent = { link = "CmpItemKindEvent" },
        BlinkCmpKindOperator = { link = "CmpItemKindOperator" },
        BlinkCmpKindTypeParameter = { link = "CmpItemKindTypeParameter" },
    }
end


return {
    'luisiacc/gruvbox-baby',
    priority = 1000,
    branch = "main",
    config = function ()
        vim.g.gruvbox_baby_telescope_theme = 1
        vim.g.gruvbox_baby_highlights = blink_cmp_highlights()
        -- vim.g.gruvbox_baby_transparent_mode = 1
        function SetColor(color)
            color = color or "gruvbox-baby" -- gruvbox is now deafult colorscheme
            vim.cmd.colorscheme(color)

            -- NOTE: For transparent mode
            -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end

        SetColor()
    end
}
