extends KinematicBody2D

onready var tween = $Tween
var tile_sprite

func _ready():
	match int(Level.current_lvl):
		0:
			$Lv1.show()
			$Lv1.play(tile_sprite)
		1: 
			$Lv2.show()
			$Lv2.play(tile_sprite)
		2:
			$Lv3.show()
			$Lv3.play(tile_sprite)
		3:
			$Lv4.show()
			$Lv4.play(tile_sprite)
		4:
			$Lv5.show()
			$Lv5.play(tile_sprite)
			
			
func get_tile_pos(var v2):
	v2 = v2 + get_parent().world_to_map(position)
	return v2
	
func _on_Tile_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index==BUTTON_LEFT:
		$Click.play()
		if try_move(Vector2.RIGHT*128):
			$"/root/GameScreen/Game".set_tile_position(tile_sprite, get_tile_pos(Vector2.RIGHT),get_parent().world_to_map(position))
			return
		if try_move(Vector2.DOWN*128): 
			$"/root/GameScreen/Game".set_tile_position(tile_sprite, get_tile_pos(Vector2.DOWN), get_parent().world_to_map(position))
			return
		if try_move(Vector2.LEFT*128): 
			$"/root/GameScreen/Game".set_tile_position(tile_sprite, get_tile_pos(Vector2.LEFT),get_parent().world_to_map(position))
			return
		if try_move(Vector2.UP*128): 
			$"/root/GameScreen/Game".set_tile_position(tile_sprite, get_tile_pos(Vector2.UP),get_parent().world_to_map(position))
			return

func try_move(rel_vec):
	var t
	if Level.side_size == 3:
		t = self.transform
		t[2] += Vector2(64,0)
	else:
		t = transform
	if test_move(t,rel_vec): return false
	tween.interpolate_property(self,"position",position,position+rel_vec,0.25,Tween.TRANS_QUINT,Tween.EASE_IN_OUT)
	tween.start()
	return true
