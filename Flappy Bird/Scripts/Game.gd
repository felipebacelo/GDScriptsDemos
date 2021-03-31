extends Node

var score = 0

func _input(event):
	if event is InputEventScreenTouch and event.pressed:
		$BackAnim.play("Scroll")
		$Generator.start()
		$Bird.mode = RigidBody2D.MODE_RIGID
		$LabelStart.queue_free()
		
		set_process_input(false)

func _on_kill():
	$BackAnim.stop()
	$Generator.finish()
	$TimerReplay.start()

func _on_score():
	score += 1
	$LabelScore.text = str(score)
	$AudioScore.play()

func _on_TimerReplay_timeout():
	get_tree().reload_current_scene()
