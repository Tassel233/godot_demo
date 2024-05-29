extends Control

@onready var grid_container = $GridContainer
@onready var slots: Array = $GridContainer.get_children()
@onready var item_bar_items = $ItemBarContainer.get_children()

func _ready():
	Global.inventory_updated.connect(update_grid)
	Global.item_bar_updated.connect(update_item_bar)
	update_grid()
	
#############################################

func update_grid():
	clear_grid()
	for i in range(Global.inventory_size):
		if Global.inventory[i] != null:
			slots[i].set_slot(Global.inventory[i])
		else:
			slots[i].set_empty()
			
#clear all the items in each grid
func clear_grid():
	for i in range(Global.inventory_size):
		slots[i].set_empty()
		#slots[i].slot = null

############################################

func update_item_bar():
	for i in range(Global.item_bar_size):
		item_bar_items[i].item = Global.item_bar[i]
		item_bar_items[i].set_texture()
			
	
	
	
	
	
	
	
	
	
