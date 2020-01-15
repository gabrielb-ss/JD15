extends Node2D

var teste = []

func _ready():
	teste.append(Vector2(1,1))
	if teste[2] == null:
		print("ha")
	
	print(teste)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
