extends CharacterBody2D

@export var movementSpeed : float = 500

@onready var animatedSprite := $AnimatedSprite2D

var characterDirection : Vector2

func _physics_process(delta):
	print("Physics are running")
	characterDirection.x = Input.get_axis("move_left", "move_right")
	characterDirection.y = Input.get_axis("move_up", "move_down")
	characterDirection = characterDirection.normalized();
	
	if characterDirection.x > 0: animatedSprite.flip_h = false
	elif characterDirection.x < 0: animatedSprite.flip_h = true 
	
	if characterDirection:
		velocity = characterDirection * movementSpeed
		if animatedSprite.animation != "walk": animatedSprite.animation = "walk"
	else:
		velocity = velocity.move_toward(Vector2.ZERO, movementSpeed)
		if animatedSprite.animation != "idle": animatedSprite.animation = "idle"
		
	move_and_slide()
