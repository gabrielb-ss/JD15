extends Node2D

const level_info = [[3,200,200], [3, 150, 150], [4, 200, 200], [4, 150, 150]]
const save_path = "res://saves/save.jason"
var current_lvl = load_game()
var side_size = level_info[current_lvl][0]
var time_limit = level_info[current_lvl][1]
var move_limit = level_info[current_lvl][2]
var tile_position = ""


func _ready():
	$Music.play()

func save_game():
	var save_game = File.new()
	var save_dict = {
	"current": current_lvl,
	"move" : move_limit,
	"time": time_limit,
	"tile": tile_position
	}
	save_game.open(save_path, File.WRITE)
	save_game.store_line(to_json(save_dict))
	save_game.close()
	#print(save_dict)
	
func load_game():
	var save_game = File.new()
	if save_game.file_exists(save_path):
		save_game.open(save_path,File.READ)
		var tmp_data = save_game.get_as_text()
		save_game.close()
		
		var dict = {}
		dict = parse_json(tmp_data)
		current_lvl = dict["current"]
		move_limit = dict["move"]
		time_limit = dict["time"]
		tile_position = dict["tile"]
		return current_lvl
	else:
		return 0

		#print(tile_position)

func reset_match(var flag):
	if flag == 1: 
		tile_position = ""
	else:
		side_size = level_info[current_lvl][0]
		time_limit = level_info[current_lvl][1]
		move_limit = level_info[current_lvl][2]
		tile_position = ""
	save_game()
