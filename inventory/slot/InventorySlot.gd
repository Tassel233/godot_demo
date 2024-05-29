extends Control


@onready var button = $Button
@onready var sprite_2d = $OuterBorder/Sprite2D
@onready var amount = $OuterBorder/amount
@onready var detail_panel = $"../../DetailPanel"
@onready var usage_panel = $"../../UsagePanel"

@export var slot: SlotData = null



func set_empty():
	sprite_2d.texture = null
	amount.text = ""
	slot = null
	button.disabled = true
	
func set_slot(new_slot: SlotData):
	button.disabled = false
	slot = new_slot
	sprite_2d.texture = new_slot.item.texture
	amount.text = str(new_slot.amount)
	


func _on_button_pressed():
	if slot != null:
		#usage_panel的位置根据当前slot位置偏移
		usage_panel.global_position = global_position + Vector2(50, 50)

		if Global.item_to_be_handled == null:
			Global.item_to_be_handled = slot.item
			usage_panel.visible = true
		else:
			#若重复点击同一个物品，则usage_panel toggle
			if Global.item_to_be_handled.name == slot.item.name:
				usage_panel.visible = !usage_panel.visible
			else:
				Global.item_to_be_handled = slot.item
				usage_panel.visible = true
				
		#print(Global.item_to_be_handled.name)

func _on_button_mouse_entered():
	if slot != null:
		detail_panel.get_node("ItemName").text = slot.item.name
		detail_panel.get_node("ItemDescription").text = slot.item.description
		detail_panel.get_node("ItemEffect").text = slot.item.effect
		detail_panel.visible = true
func _on_button_mouse_exited():
	detail_panel.visible = false
