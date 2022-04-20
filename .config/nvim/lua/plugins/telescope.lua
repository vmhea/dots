require('telescope').setup{
    pickers = {
        -- Enable searching hidden files
        find_files = { hidden = true },
        live_grep = {
            additional_args = function(opts)
                return {'--hidden'}
            end
        },
    },
    extensions = {}
}
