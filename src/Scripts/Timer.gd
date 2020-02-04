extends RichTextLabel

func _process(delta):
	set_text(str(Level.time_limit))

func _on_Timer_timeout():
	Level.save_game()
	Level.time_limit -= 1
	if Level.time_limit < 1 or Level.move_limit < 1:
		get_tree().change_scene("res://scenes/DefeatScreen.tscn")
		pass
