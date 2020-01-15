extends Node2D

func _on_Button_pressed():
	
	get_tree().change_scene("res://scenes/Grid.tscn")

func _on_TrashCan_pressed():
	Level.current_lvl = 0
	Level.reset_match(0)

func _on_Mute_toggled(button_pressed):
	if $CenterContainer/Mute.get_draw_mode() == 0:
		Level.get_node("Music").stop()
		$CenterContainer/Mute.icon = load("res://icons/mute.png")
	else:
		Level.get_node("Music").play()
		$CenterContainer/Mute.icon = load("res://icons/audio.png")
		
func _on_Config_toggled(button_pressed):
	if $Config.get_draw_mode() == 0:
		$CenterContainer/AnimationPlayer.play("UP")
	else:
		$CenterContainer/AnimationPlayer.play_backwards("UP")
