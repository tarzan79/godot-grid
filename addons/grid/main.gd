tool
extends EditorPlugin

func _enter_tree() -> void:
	add_custom_type("Grid", "Node2D", preload("grid.gd"), preload("icon_grid.svg"))
	
func _exit_tree() -> void:
	remove_custom_type("Grid")
