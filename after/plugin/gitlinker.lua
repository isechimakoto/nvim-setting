require "gitlinker".setup({
    opts = {
        -- adds current line nr in the url for normal mode
        add_current_line_on_normal_mode = true,
        -- print the url after performing the action
        print_url = true,
    },
    callbacks = {
        ["github.com"] = function(url_data)
            local url = "https://github.com/" .. url_data.repo .. "/blob/" .. url_data.rev .. "/" .. url_data.file
            if url_data.lstart then
                url = url .. "#L" .. url_data.lstart
                if url_data.lend then url = url .. "-L" .. url_data.lend end
            end
            return url
        end
    }
})
