extends ColorRect
@onready var usage_panel = $"."

func _ready():
	var slot 
	

func _on_use_button_pressed():
	Global.onload_item()
	visible = !visible
	
	
func _on_drop_button_pressed():
	Global.remove_item()
	visible = !visible
