-- Examples
-- TODO: Yeah def gonna dew it later
-- FIXME: Gotta fix me
-- CONSIDER: Switching to blah blah blah...
-- WARNING: This function might throw exception
-- FUTURE: Extract this to new class
return {
    'Djancyp/better-comments.nvim',
    config = function ()
        require('better-comment').Setup({
            tags = {
                {
                    name = "TODO",
                    fg = "#076678",
                    bg = "",
                    bold = true,
                    virtual_text = "",
                },
                {
                    name = "FIXME",
                    fg = "#689d6a",
                    bg = "",
                    bold = true,
                    virtual_text = "",
                },
                {
                    name = "WARNING",
                    fg = "#d65d0e",
                    bg = "",
                    bold = true,
                    virtual_text = "",
                },
                {
                    name = "CONSIDER",
                    fg = "#427b58",
                    bg = "",
                    bold = true,
                    virtual_text = "",
                },
                {
                    name = "FUTURE",
                    fg = "#b16286",
                    bg = "",
                    bold = true,
                    virtual_text = "",
                },
            }
        })
    end
}
