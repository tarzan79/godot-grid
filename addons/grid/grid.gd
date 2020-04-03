tool
extends Node2D

export (Vector2) var end = Vector2(0, 0) setget set_end # position of end corner
export (Vector2) var size = Vector2(128, 128) setget set_size #Size from position to end
export (Vector2) var cell_size = Vector2(32, 32) setget set_cell_size
export (Vector2) var separation = Vector2(0, 0) setget set_separation
export (Color) var color  = Color.red setget set_color
export (Color) var color2  = Color.blue
export (Color) var color3  = Color.yellow
export (Color) var color4  = Color.green
export (float) var width = 1.0 setget set_width

func _enter_tree():
    end = position + size
    update()

func set_end(e):
    end = e
    size = end - position
    update()

func set_size(s):
    size = s
    end = position + size
    update()
    
func set_cell_size(size):
    cell_size = size
    update()
    
func set_width(w):
    width = w
    update()

func set_color(col):
    color = col
    update()
    
func set_separation(sep):
    separation = sep
    update()
    
func _draw():
    var col = size.x / (cell_size.x + separation.x)
    var row = size.y / (cell_size.y + separation.y)
    
    if position == null:
        position = get_parent().rect_position + 5
    
    for i in col:
        
        var from = Vector2(position.x + cell_size.x * i + separation.x * i, position.y)
        var to = Vector2(position.x + cell_size.x * i + separation.x * i, position.y + size.y + separation.y * (col - 1) - int(width))
        draw_line(from, to, color, width)
        
        var from2 = Vector2(position.x + cell_size.x * i + separation.x * i + cell_size.x, position.y)
        var to2 = Vector2(position.x + cell_size.x * i + separation.x * i + cell_size.x, position.y + size.y + separation.y * (col - 1) - int(width))
        draw_line(from2, to2, color2, width)

    for i in row:
        var from = Vector2(position.x, position.y + cell_size.y * i + separation.y * i)
        var to = Vector2(position.x + size.x + separation.x * (row - 1) - int(width), position.y + cell_size.y * i + separation.y * i)
        draw_line(from, to, color3, width)

        var from2 = Vector2(position.x, position.y + cell_size.y * i + separation.y * i + cell_size.y)
        var to2 = Vector2(position.x + size.x + separation.x * (row - 1) - int(width), position.y + cell_size.y * i + separation.y * i + cell_size.y)
        draw_line(from2, to2, color4, width)
