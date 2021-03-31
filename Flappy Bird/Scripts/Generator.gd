extends Timer


func _on_Generator_timeout():
	randomize()
	
	var new_pipe = preload("res://Scenes/Pipe.tscn").instance()
	
	new_pipe.position = Vector2(810, rand_range(250, 1020))
	
	new_pipe.connect("kill", get_parent(), "_on_kill")
	new_pipe.connect("score", get_parent(), "_on_score")
	
	add_child(new_pipe)

func finish():
	stop()
	
	for pipe in get_children():
		pipe.set_process(false)