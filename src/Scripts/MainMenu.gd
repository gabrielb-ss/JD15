extends Node2D

func _on_Config_toggled(button_pressed):
	$ConfigButtons.show()
	if $Config.get_draw_mode() == 0:
		$ConfigButtons/AnimationPlayer.play("UP")
	else:
		$ConfigButtons/AnimationPlayer.play_backwards("UP")
	
func _on_TrashCan_pressed():
	Level.current_lvl = 0
	Level.reset_match(0)

func _on_Mute_toggled(button_pressed):
	if $ConfigButtons/Mute.get_draw_mode() == 0:
#		Level.get_node("Music").stop()
		$ConfigButtons/Mute.icon = load("res://assets/icons/black_icons/muted.png")
	else:
#		Level.get_node("Music").play()
		$ConfigButtons/Mute.icon = load("res://assets/icons/black_icons/audio.png")
		

func _on_NovoJogo_pressed():
	get_tree().change_scene("res://src/Scenes/GameScreen.tscn")
		
func _on_Profile_toggled(button_pressed):
	$ProfilePage.show()
	var text = str(PlayerInfo.username + "	RECORDES" + "\n\n			Tempo	Jogadas")
	if $Profile.get_draw_mode() == 0:
		$ProfilePage/AnimationPlayer.play("profile slide left")
	else:
		$ProfilePage/AnimationPlayer.play_backwards("profile slide left")
		
	
	var level = 1
	var time_score = ""
	var move_score = ""
	for i in range (PlayerInfo.scores_time.size()):
		if PlayerInfo.scores_time[i] == null:
			time_score = "NA"
		else: 
			time_score = str(PlayerInfo.scores_time[i])
		
		if PlayerInfo.scores_move[i] == null:
			move_score = "NA"
		else: 
			move_score = str(PlayerInfo.scores_move[i])
			
		text += "\nLvl " + str(level) + ":		" + time_score + "		" + move_score
		level += 1
	$ProfilePage/Scores.text = text
