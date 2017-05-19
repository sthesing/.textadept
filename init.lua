-- Theme
if not CURSES then 
    ui.set_theme('base16-solarized-dark', 
    {font = 'Inconsolata', fontsize = 12}) 
end

-- Snippets
require("snippets/snippets")

-- Elastic Tabstops
require('elastic_tabstops').enable()

-- Textadept's yaml module
yaml = require "yaml"

-- Or just the lyaml contained in there
--lyaml = require "yaml.lyaml"

-- Zettels
local zettels = require('zettels')
zettels.enable(os.getenv("HOME") .. '/Dokumente/Zettelkasten/', os.getenv("HOME") .. "/.config/Zettels/index.yaml")

-- Keyboard Chains
keys['c2'] = {
    -- German Quotation marks
    up = function() buffer.add_text("“") end,
    down = function() buffer.add_text("„") end
}
