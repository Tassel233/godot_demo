extends CharacterBody2D
@export var bullet_damage: int
@export var bullet_speed: float
@export var bullet_direction: Vector2 = Vector2.RIGHT
@export var bullet_range:float = 500	#射程
var travelled_distance: float = 0

func _ready():
	bullet_direction = Vector2.RIGHT.rotated(global_rotation)


#设置子弹的一些参数
func set_properties(bullet_damage, bullet_speed, bullet_direction, bullet_range):
	self.bullet_damage = bullet_damage
	self.bullet_speed = bullet_speed
	self.bullet_direction = bullet_direction
	self.bullet_range = bullet_range

func _process(delta):
	position += bullet_direction * bullet_speed * delta
	travelled_distance += delta * bullet_speed
	#射程检测
	if travelled_distance > bullet_range:
		queue_free()
