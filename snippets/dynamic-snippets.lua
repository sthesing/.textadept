--[[
Dynamic Snippets are snippets that do not expand to a fixed template with 
entry points, but contain elements that depend on the value of variables 
in lua.
Those are defined here in the section "Fields".
The snippets themselves are in the section "Dynamic snippets"
--]]

dynsn = {}

dynsn.snippets = {}

----------------------
--      Fields      --
----------------------
dynsn.fields = {
    -- User Initials
    ["user_initials"]       = "ST",
    -- current Author, meaning a bibtexkey frequently in use, at the moment
    ["current_author"]      = "grampp2014",
}

----------------------
-- Dynamic Snippets --
----------------------
