extends Node2D

func _on_TrashCan_pressed():
	Level.current_lvl = 0
	Level.reset_match(0)

func _on_Mute_toggled(button_pressed):
	if $CenterContainer/Mute.get_draw_mode() == 0:
		Level.get_node("Music").stop()
		$CenterContainer/Mute.icon = load("res://assets/icons/mute.png")
	else:
		Level.get_node("Music").play()
		$CenterContainer/Mute.icon = load("res://assets/icons/audio.png")
		
func _on_Config_toggled(button_pressed):
	if $Config.get_draw_mode() == 0:
		$CenterContainer/AnimationPlayer.play("UP")
	else:
		$CenterContainer/AnimationPlayer.play_backwards("UP")

func _on_Profile_toggled(button_pressed):
	var text = str(PlayerInfo.username)
	if $Profile.get_draw_mode() == 0:
		$ProfilePage/AnimationPlayer.play("profile slide left")
	else:
		$ProfilePage/AnimationPlayer.play_backwards("profile slide left")
	
	var level = 1
	
	for i in range (PlayerInfo.scores_time.size()):
		text += "\nLvl " + str(level) + ":		" + str(PlayerInfo.scores_time[i]) + "		" + str(PlayerInfo.scores_move[i])
		level += 1
	print(level)
	$ProfilePage/Scores.text = text

func _on_NovoJogo_toggled(button_pressed):
	get_tree().change_scene("res://src/scenes/Grid.tscn")
#	if $NovoJogo.get_draw_mode() == 0:
#		$PickLevel/AnimationPlayer.play("up")
#	else:
#		$PickLevel/AnimationPlayer.play_backwards("up")

func _on_Button_pressed():
	Level.current_lvl = 0
	Level.reset_match(0)
	get_tree().change_scene("res://src/scenes/Grid.tscn")
	pass # Replace with function body.


func _on_Button2_pressed():
	Level.current_lvl = 1
	Level.reset_match(0)
	get_tree().change_scene("res://src/scenes/Grid.tscn")
	pass # Replace with function body.


func _on_Button3_pressed():
	Level.current_lvl = 2
	Level.reset_match(0)
	get_tree().change_scene("res://src/scenes/Grid.tscn")
	pass # Replace with function body.


func _on_Button4_pressed():
	Level.current_lvl = 3
	Level.reset_match(0)
	get_tree().change_scene("res://src/scenes/Grid.tscn")
	pass # Replace with function body.


func _on_Button5_pressed():
	Level.current_lvl = 4
	Level.reset_match(0)
	get_tree().change_scene("res://src/scenes/Grid.tscn")
	pass # Replace with function body.
