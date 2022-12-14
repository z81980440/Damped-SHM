extends "res://render.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var k = 10

func xpos(t):
	return k*t;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
