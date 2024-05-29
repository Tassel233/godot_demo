extends Node


@export var inventory_size = 18

var inventory: Array[SlotData]	#存储背包中的所有物品
var item_bar: Array[Item]
var player_node: Node
var item_to_be_handled: Item
static var item_bar_size: int = 5
static var item_bar_cursor: int

signal inventory_updated #emit when inventory changed
signal item_bar_updated	#emits when item_bar changed

func _ready():
	inventory.resize(inventory_size)
	item_bar.resize(item_bar_size)
	
	
#####################背包相关函数######################

func add_item(item: Item):
	for i in range(inventory.size()):
		if inventory[i] != null and inventory[i].item.name == item.name:
			inventory[i].amount += 1
			inventory_updated.emit()
			return true
		elif inventory[i] == null:
			var new_slot = SlotData.new()
			new_slot.item = item
			new_slot.amount = 1
			inventory[i] = new_slot
			inventory_updated.emit()
			return true
	return false

func remove_item():
	for i in range(inventory.size()):
		if inventory[i] != null and item_to_be_handled.name == inventory[i].item.name:
			if inventory[i].amount > 1:
				inventory[i].amount -= 1
			elif inventory[i].amount == 1:
				inventory[i] = null
			inventory_updated.emit()
			return

func change_inventory_size():
	inventory_updated.emit()
	
	
####################物品栏相关函数###################

#装备item
func onload_item():
	#item_bar中有多余的槽位时装入
	for i in range(item_bar_size):
		if item_bar[i] == null:
			item_bar[i] = item_to_be_handled
			remove_item()
			print(item_bar)
			item_bar_updated.emit()
			return

#使用item
func use_item(item: Item):
	item_bar_updated.emit()
	pass

#卸下item
func upload_item(index: int):
	add_item(item_bar[index])
	item_bar[index] = null
	item_bar_updated.emit()
	pass

#交换item_bar中的两个item
func change_items(index1, index2):
	var tmp_item: Item
	tmp_item = item_bar[index1]
	item_bar[index1] = item_bar[index2]
	item_bar[index2] = tmp_item
	item_bar_updated.emit()


#####################################################

	
func set_player_node(player):
	player_node = player
