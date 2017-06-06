buffer.use_tabs = false
buffer.tab_width = 4
buffer.wrap_mode = buffer.WRAP_WORD
buffer.edge_column = 79
buffer.edge_mode = buffer.EDGE_LINE
buffer.edge_colour = buffer.property_int["color.base0A"]

if CURSES then
    buffer.caret_line_back = 0xff0000
    buffer.caret_line_visible = true
end