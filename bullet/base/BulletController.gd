extends Node2D
class_name BulletController

@export var bullet_speed: float = 200.0	#子弹速度
@export var bullet_range:float = 500	#射程
@export var bullet_scene: PackedScene
@export var bullet_count: int = 1	#同时射出的子弹数量
@export_range(0, 360) var arc: float = 50
@export var fire_rate: float = 4.0	#射速

var travelled_distance:float = 0	#子弹已移动的距离
var shoot_flag = true

func shoot():
	if shoot_flag:
		shoot_flag = false
		for i in range(bullet_count):
			var new_bullet = bullet_scene.instantiate()
			new_bullet.position = global_position
			new_bullet.bullet_speed = bullet_speed
			if bullet_count != 1:
				var rad = deg_to_rad(arc)
				var increment = rad / (bullet_count - 1)	#每颗子弹之间的弧度差值
				new_bullet.global_rotation = (
					global_rotation + i * increment - rad / 2
				)
			get_tree().root.add_child(new_bullet)
		await get_tree().create_timer(1 / fire_rate).timeout
		shoot_flag = true
			
			
			
