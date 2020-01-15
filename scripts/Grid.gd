extends TileMap

var side = Level.side_size 
var dimention = side * side
var sprites4x4 = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O"]
var sprites3x3 = ["A","B","C","D","E","F","G","H"]
var tile_position = ""

func _ready():
	Level.load_game()
	if side == 3: self.position = Vector2(64,0)
#	print(Level.current_lvl, side)

	generate_frame()
	$"../MovesLeft".set_text(str(Level.move_limit))
	if Level.tile_position.empty():
		tile_position = random_str(side)
	else:
		tile_position = Level.tile_position
	#tile_position = "A"
	call_deferred("load_tiles")

func generate_frame():
	for i in range (-1, side + 2):
		set_cell(i, -1, 5)
		set_cell(i, side, 5)
		set_cell(0, i - 1, 5)
		set_cell(side + 1, i - 1, 5)
		
func load_tiles():
	var tile = preload("res://scenes/Tile.tscn")
	var vec2 = Vector2(1,1)
	for i in tile_position:
		if  i != "-":
			var newt = tile.instance()
			newt.tile_sprite = i
			newt.position = (map_to_world(vec2))
			self.add_child(newt)
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
			r_str = "ABCDEFG-H"
#			idx = rng.randi_range(0, sprites3x3.size() - 1)
#			r_str += sprites3x3[idx]
#			sprites3x3.erase(sprites3x3[idx])
		elif side == 4:
			r_str = "ABCDEFGHIJKLMN-O"
#			idx = rng.randi_range(0, sprites4x4.size() - 1)
#			r_str += sprites4x4[idx]
#			sprites4x4.erase(sprites4x4[idx])
##
#	r_str += "-"
	#print(r_str)
	return r_str

func set_tile_position(var t_sprite, var new_pos, var old_pos):
	var translated
	Level.move_limit -= 1
	$"../MovesLeft".set_text(str(Level.move_limit))
	
	translated = translate(old_pos)
	tile_position[translated] = "-"

	translated = translate(new_pos)
	tile_position[translated] = t_sprite
#	print(t_sprite, " ", old_pos, " ", new_pos, " ", translated)
	Level.tile_position = tile_position
	print(tile_position)
	is_win()	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             

func translate(v2):
	var trans = v2.x - 1 + side * (v2.y - 1)
	return trans
	
func is_win():
	if Level.tile_position == "ABCDEFGH-" or Level.tile_position == "ABCDEFGHIJKLMNO-":
		get_tree().change_scene("res://scenes/WinScreen.tscn")

func _on_Reset_pressed():
	print(Level.current_lvl)
	Level.reset_match(1)
	get_tree().change_scene("res://scenes/Grid.tscn")
	


func _on_Menu_pressed():
	Level.reset_match(0)
	get_tree().change_scene("res://scenes/MainMenu.tscn")
	
	