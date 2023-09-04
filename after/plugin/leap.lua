local function set_custom_mapping(force_3f)
    for _, _14_ in ipairs({
        { "n", "s", "<Plug>(leap-forward)" },
        { "n", "S", "<Plug>(leap-backward)" },
        { "x", "s", "<Plug>(leap-forward)" },
        { "x", "S", "<Plug>(leap-backward)" },
        { "o", "z", "<Plug>(leap-forward)" },
        { "o", "Z", "<Plug>(leap-backward)" },
        { "o", "x", "<Plug>(leap-forward-x)" },
        { "o", "X", "<Plug>(leap-backward-x)" },
        { "n", "gs", "<Plug>(leap-cross-window)" },
        { "x", "gs", "<Plug>(leap-cross-window)" },
        { "o", "gs", "<Plug>(leap-cross-window)" } }) do
        local _each_15_ = _14_
        local mode = _each_15_[1]
        local lhs = _each_15_[2]
        local rhs = _each_15_[3]
        if (force_3f or ((vim.fn.mapcheck(lhs, mode) == "") and (vim.fn.hasmapto(rhs, mode) == 0))) then
            vim.keymap.set(mode, lhs, rhs, { silent = true })
        else
        end
    end
    return nil
end

set_custom_mapping()

-- require('leap').add_default_mappings()
