extends CharacterBody2D

@export var speed: float = 300
@onready var interact_ui = $InteractUI
@onready var spell = $Bullet
var strategies: Array[BaseSpellStrategy] = []


func _ready():
	Global.set_player_node(self)


func _physics_process(delta):
	#角色移动
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	move_and_slide()
	
	#射击
	if Input.is_action_pressed("attack"):
		spell.shoot()

		
		
		
		
