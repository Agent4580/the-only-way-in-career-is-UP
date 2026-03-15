extends CharacterBody2D

var speed = 200
var jump = -400
var default_gravity = get_gravity()

@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	
	#Отвечает за гравитацию игрока
	#Начинает работать, когда игрок не на полу
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	#Определяем направление движения
	var direction = Input.get_axis('move_left', 'move_right')
	
	#Делаем движение, если direction не равен нулю
	#иначе останавливаемся
	if direction:
		velocity.x = speed * direction
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	if Input.is_action_just_pressed('jump') and is_on_floor():
		velocity.y = jump
	
	#Обязательная строка для данной игры
	move_and_slide()
