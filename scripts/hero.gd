extends CharacterBody2D

var speed = 200
var jump = -400
var default_gravity = get_gravity()

@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	#Обязательная строка для данной игры
	move_and_slide()
	
	#Отвечает за гравитацию игрока
	#Начинает работать, когда игрок не на полу
	if not is_on_floor():
		velocity += get_gravity()
	
	var direction = Input.get_axis('move_left', 'move_right')
	
	if direction:
		velocity.x = speed * direction
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
