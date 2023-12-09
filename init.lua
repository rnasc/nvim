require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

local telescope = require("telescope")
telescope.load_extension("ag")

require('nvim-highlight-colors').setup {
  render = 'background', -- or 'foreground' or 'first_column'
  enable_named_colors = true,
  enable_tailwind = true,
  custom_colors = {
    -- label property will be used as a pattern initially(string.gmatch), therefore you need to escape the special characters by yourself with % 
    {label = '%-%-theme%-font%-color', color = '#fff'},
    {label = '%-%-theme%-background%-color', color = '#23222f'},
    {label = '%-%-theme%-primary%-color', color = '#0f1219'},
    {label = '%-%-theme%-secondary%-color', color = '#5a5d64'},
    {label = '%-%-theme%-contrast%-color', color = '#fff'},
    {label = '%-%-theme%-accent%-color', color = '#55678e'},
  }
}
require("nvim-highlight-colors").turnOn()
require("nvim-highlight-colors").toggle()
