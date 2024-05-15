-- Examples
-- TODO: Yeah def gonna dew it later
-- FIXME: Gotta fix me
-- CONSIDER: Switching to blah blah blah...
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
                    fg = "#427b58",
                    bg = "",
                    bold = true,
                    virtual_text = "",
                },
                {
                    name = "CONSIDER",
                    fg = "#d65d0e",
                    bg = "",
                    bold = true,
                    virtual_text = "",
                },
            }
        })
    end
}
