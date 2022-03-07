--[[
Dynamic Snippets are snippets that do not expand to a fixed template with 
entry points, but contain elements that depend on the value of variables 
in lua. Those are defined here. I call them "Fields".
--]]

dynsn = {}
----------------------
--      Fields      --
----------------------
dynsn.fields = {
    -- User Initials
    ["user_initials"]       = "ST",
    -- current Author, meaning a bibtexkey frequently in use, at the moment
    ["current_author"]      = "bereswill-ehlert2017"
}
