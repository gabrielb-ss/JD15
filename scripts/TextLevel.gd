extends RichTextLabel

func _ready():
	set_text("Level " + str(Level.current_lvl + 1))
	