extends Popup

func _ready():
	pass

func _on_Menu_pressed():
	popup_centered_minsize(Vector2(1,1))
	pass # Replace with function body.

func _on_Confirm_confirmed():
	Level.reset_match(0)
	get_tree().change_scene("res://scenes/MainMenu.tscn")
	pass # Replace with function body.
