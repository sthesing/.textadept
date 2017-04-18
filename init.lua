-- Theme
if not CURSES then 
    ui.set_theme('base16-solarized-dark', 
    {font = 'Inconsolata', fontsize = 12}) 
end

-- Snippets
require("snippets/snippets")

-- Fuzzy Finder
local fuzzy_finder = require 'fuzzy_finder'
local filter = {
	extensions = {'phar'}, --hidden files
	folders = {"%.", 'node_modules', 'vendor'} --hidden folders
}
keys[OSX and 'mp' or 'cp'] = {fuzzy_finder.show, filter}