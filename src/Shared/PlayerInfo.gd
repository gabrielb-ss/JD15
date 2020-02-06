extends Node2D

var username = ""
var scores_time = []
var scores_move = []
var max_lvl = 0
var score
const path = "user://player.jason"

func _ready():
	scores_time.resize(Level.level_info.size())
	scores_move.resize(Level.level_info.size())

func get_score():
	var moves = 0
	score = 0
	
	for i in scores_time:
		if not i == null:
			score += i
			
	for i in scores_move:
		if not i == null:
			moves += i
			
	score = Level.max_time - score
	score += Level.max_time - moves

	return score * max_lvl

func save_player():
	var save_game = File.new()
	var save_dict = {
	"name": username,
	"times": scores_time,
	"moves": scores_move,
	"maxlvl": max_lvl
	}
	save_game.open(path, File.WRITE)
	save_game.store_line(to_json(save_dict))
	save_game.close()

func load_player():
	var save_game = File.new()
	if save_game.file_exists(path):
		save_game.open(path,File.READ)
		var tmp_data = save_game.get_as_text()
		save_game.close()
		
		var dict = {}
		dict = parse_json(tmp_data)
		username = dict["name"]
		scores_time = dict["times"]
		scores_move = dict["moves"]
		max_lvl = dict["maxlvl"]

		return 0
	else:
		return 1

func reset_info():
	max_lvl = 0
	for i in range (scores_time.size()):
		scores_time[i] = null
	for i in range (scores_move.size()):
		scores_move[i] = null
	save_player()
