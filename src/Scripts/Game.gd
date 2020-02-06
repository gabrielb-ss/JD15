extends Control

var side = Level.side_size 
var dimention = side * side
var sprites4x4 = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O"]
var sprites3x3 = ["A","B","C","D","E","F","G","H"]
var tile_position = ""

func _ready():
	Level.load_game()
	$Level.set_text("Level " + str(Level.current_lvl + 1))
	$MovesLeft.set_text(str(Level.move_limit))
	if side == 3: $Grid.position = Vector2(64,0)
	generate_frame()
	
	if Level.tile_position.empty():
		tile_position = random_str(side)
	else:
		tile_position = Level.tile_position

	call_deferred("load_tiles")

func generate_frame():
	var cell_sprite
	cell_sprite = 6
	for i in range (0, side):
		$Grid.set_cell(i+1, 0, 11)
		$Grid.set_cell(i+1, side + 1, 12)
		$Grid.set_cell(0, i+1, 9)
		$Grid.set_cell(side + 1, i+1, 10)
		
func load_tiles():
	var tile = preload("res://src/Scenes/Tile.tscn")
	var vec2 = Vector2(1,1)
	for i in tile_position:
		if  i != "-":
			var newt = tile.instance()
			newt.tile_sprite = i
			newt.position = ($Grid.map_to_world(vec2))
			$Grid.add_child(newt)
#
		if vec2.x == side:
			vec2.y += 1
			vec2.x = 1
		else:
			vec2.x += 1
	
func random_str(var side):
	var r_str = ""
	var idx
	var rng = RandomNumberGenerator.new()
	for i in range(0, dimention - 1):
		rng.randomize()
		if side == 3:
#			r_str = "ABCDEFG-H"
			idx = rng.randi_range(0, sprites3x3.size() - 1)
			r_str += sprites3x3[idx]
			sprites3x3.erase(sprites3x3[idx])
		elif side == 4:
#			r_str = "ABCDEFGHIJKLMN-O"
			idx = rng.randi_range(0, sprites4x4.size() - 1)
			r_str += sprites4x4[idx]
			sprites4x4.erase(sprites4x4[idx])
#
	r_str += "-"
	return r_str

func set_tile_position(var t_sprite, var new_pos, var old_pos):
	var translated
	Level.move_limit -= 1
	$MovesLeft.set_text(str(Level.move_limit))
	
	translated = translate(old_pos)
	tile_position[translated] = "-"

	translated = translate(new_pos)
	tile_position[translated] = t_sprite
	Level.tile_position = tile_position
	is_win()                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           

func translate(v2):
	var trans = v2.x - 1 + side * (v2.y - 1)
	return trans
	
func is_win():
	if Level.tile_position == "ABCDEFGH-" or Level.tile_position == "ABCDEFGHIJKLMNO-":
		get_tree().change_scene("res://src/Scenes/WinScreen.tscn")

func _on_Reset_pressed():
	Level.reset_match(1)
	get_tree().change_scene("res://src/Scenes/GameScreen.tscn")
	

func _on_Menu_pressed():
	Level.reset_match(0)
	get_tree().change_scene("res://src/Scenes/MainMenu.tscn")
	
func _process(delta):
	$Timer.set_text(str(Level.time_limit))

func _on_Timer_timeout():
	Level.save_game()
	Level.time_limit -= 1
	if Level.time_limit < 1 or Level.move_limit < 1:
		get_tree().change_scene("res://src/Scenes/DefeatScreen.tscn")
