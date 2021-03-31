extends Node2D

signal kill()
signal score()

func _process(delta):
	position += Vector2(-360, 0) * delta
	
	if position.x < -100:
		print("Free!")
		queue_free()

func _on_AreaKill_body_entered( body ):
	if body.get_name() == "Bird":
		emit_signal("kill")
		body.kill()

func _on_AreaScore_body_entered( body ):
	$AreaScore.queue_free()
	emit_signal("score")
