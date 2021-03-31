extends RigidBody2D

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			linear_velocity = Vector2(0, -1000)
			$Audio.play()

func kill():
	set_process_input(false)
	apply_impulse(Vector2(0, 0), Vector2(-1000, 0))