local completion = {}
local conf = require("modules.completion.config")

completion["neoclide/coc.nvim"] = {
    opt = true,
    event = "BufRead",
    branch = "release",
    config = conf.coc
}

return completion
