tool
extends Node2D

func _ready():
	pass


func _on_Again_pressed():
	Level.reset_match(0)
	get_tree().change_scene("res://scenes/Grid.tscn")


func _on_Menu_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")
