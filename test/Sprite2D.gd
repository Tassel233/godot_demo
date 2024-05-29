extends Sprite2D
@onready var testarea = $".."

func _ready():
	var speed = testarea.speed
	print(speed)
	
