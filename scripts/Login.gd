extends Node2D

func _ready():
	if PlayerInfo.load_player() == 0:
		print(PlayerInfo.username)
		get_tree().change_scene("res://scenes/MainMenu.tscn")

func _on_LineEdit_text_entered(new_text):
	PlayerInfo.username = $LineEdit.text
	PlayerInfo.save_player()
	get_tree().change_scene("res://scenes/MainMenu.tscn")
