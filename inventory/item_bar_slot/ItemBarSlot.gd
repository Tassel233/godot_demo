extends Panel

@export var item: Item
@onready var sprite_2d = $Sprite2D

func _ready():
	if item != null:
		sprite_2d.texture = item.texture

func set_texture():
	if item != null:
		sprite_2d.texture = item.texture
	else:
		sprite_2d.texture = null

func _get_drag_data(at_position):
	if item != null:
		var tmp_texture = TextureRect.new()
		tmp_texture.texture = sprite_2d.texture
		tmp_texture.scale = sprite_2d.scale
		set_drag_preview(tmp_texture)
		return get_index()
	
func _can_drop_data(at_position, data):
	return true
	
func _drop_data(at_position, data):
	Global.change_items(data, get_index())
	

	


func _on_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			Global.upload_item(get_index())
			
			
			
