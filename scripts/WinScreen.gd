tool
extends Node2D

func _ready():
	var prompt = "Level " + str(Level.current_lvl + 1)
	$Level.text = prompt
	prompt = "Tempo\n" + str(Level.level_info[Level.current_lvl][1] - Level.time_limit)
	$Time.text = prompt
	prompt = "Movimentos\n" + str(Level.level_info[Level.current_lvl][2] - Level.move_limit)
	$Moves.text = prompt
	
	$Wow.play()
	
	if Level.current_lvl < Level.level_info.size() - 1:
		Level.current_lvl += 1
		
	Level.reset_match(0)
	
func _on_menu_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")

func _on_NextLevel_pressed():
	get_tree().change_scene("res://scenes/Grid.tscn")
