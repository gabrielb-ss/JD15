tool
extends Node2D

func _ready():
	var time = Level.level_info[Level.current_lvl][1] - Level.time_limit
	var moves = Level.level_info[Level.current_lvl][2] - Level.move_limit
	
	if PlayerInfo.scores_time[Level.current_lvl] == null:
		PlayerInfo.scores_time[Level.current_lvl] = time
		PlayerInfo.scores_move[Level.current_lvl] = moves
	elif time < PlayerInfo.scores_time[Level.current_lvl]:
		PlayerInfo.scores_time[Level.current_lvl] = time
		PlayerInfo.scores_move[Level.current_lvl] = moves
	elif time == PlayerInfo.scores_time[Level.current_lvl] and moves < PlayerInfo.scores_time[Level.current_lvl]:
		PlayerInfo.scores_move[Level.current_lvl] = moves
			
	
	if Level.current_lvl >= PlayerInfo.max_lvl:
		PlayerInfo.max_lvl = Level.current_lvl + 1
		
	PlayerInfo.save_player()
	$TimeR.text = "Recorde\n" + str(PlayerInfo.scores_time[Level.current_lvl])
	$MovesR.text = "Recorde\n" + str(PlayerInfo.scores_move[Level.current_lvl])
	
	var prompt = "Level " + str(Level.current_lvl + 1)
	$Level.text = prompt
	prompt = "Tempo\n" + str(time)
	$Time.text = prompt
	prompt = "Jogadas\n" + str(moves)
	$Moves.text = prompt
	
	$Wow.play()
	
	if Level.current_lvl < Level.level_info.size() - 1:
		Level.current_lvl += 1
		
		
	Level.reset_match(0)
	
func _on_menu_pressed():
	get_tree().change_scene("res://src/Scenes/MainMenu.tscn")

func _on_NextLevel_pressed():
	get_tree().change_scene("res://src/Scenes/GameScreen.tscn")
