extends Node2D
@onready var inventory_ui = $CanvasLayer/InventoryUI


func _input(event):
	if event.is_action_pressed("inventory_ui"):
		inventory_ui.visible = !inventory_ui.visible
		get_tree().paused = !get_tree().paused
	
