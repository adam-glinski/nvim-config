-- Examples
-- TODO: Yeah def gonna dew it later
-- FIXME: Gotta fix me
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
                    fg = "orange",
                    bg = "",
                    bold = true,
                    virtual_text = "",
                },
            }
        })
    end
}
