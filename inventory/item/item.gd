extends Node

@export var item: Item
@onready var sprite_2d = $Sprite2D
@onready var label = $Label

var scene_path = "res://inventory/item/inventory_item.tscn"
var player_in_range = false


func _ready():
	if item != null:
		sprite_2d.texture = item.texture
		label.text = item.effect
	
func pickup_item():
	if Global.player_node:
		Global.add_item(item)
		self.queue_free()

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		pickup_item()
		body.strategies.append(item.strategy)
		item.strategy.change_spell(body.spell)

