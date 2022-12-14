extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var A:float = 100
export var B:float = 100
export var wx:float = 4;
export var wy:float = 3;
export var phase:float = 0;
export var lambda:float = .3
export var simulateuptoseconds:float = 30;
export var traceMaxSample:int = 100

var time = 0
var tracePoints = []
var e = 2.71
var alive = true
var m = .02;


func xpos(t):
	return A*sin(wx*t+phase) /(pow(e,lambda*t))
	
	
func ypos(t):
	return B*sin(wy*t) / (pow(e,lambda*t))

func position(t):
	return Vector2(xpos(t),ypos(t))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func add_point(p):
	#tracePoints.append(p)
	$trace.add_point(p)
	if($trace.get_point_count()>traceMaxSample):
		#tracePoints.pop_front()
		$trace.remove_point(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not alive:
		return
	$particle.position = position(time)
	add_point($particle.position)
	$pathrender.add_point($particle.position)
	#$trace.points = tracePoints
	time+=m
	if time > simulateuptoseconds:
		alive = false
