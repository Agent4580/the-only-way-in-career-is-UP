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
	var direction_h = Input.get_axis('move_left', 'move_right')
	
	#Делаем движение, если direction не равен нулю
	#иначе останавливаемся
	if direction_h:
		velocity.x = speed * direction_h
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	if Input.is_action_just_pressed('jump') and is_on_floor():
		velocity.y = jump
	
	var direction_v = Input.get_axis('move_up', 'move_down')
	
	if  is_on_wall()  and not is_on_floor():
		$Gravity.set_gravity(0)
		velocity.y = 0
		if direction_v:
			velocity.y = speed * direction_v
	else:
		$Gravity.set_gravity(980)
	#Обязательная строка для данной игры
	move_and_slide()
