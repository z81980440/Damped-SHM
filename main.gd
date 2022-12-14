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


var renders = []
# Called when the node enters the scene tree for the first time.



func reset():
	
	var m = 0
	for render in renders:
		render.get_child(0).clear_points()
		render.get_child(2).clear_points()
		render.get_child(1).position = Vector2.ZERO
		render.time = 0
		render.alive = true
		if wx > wy:
			m = .1/wx
		else:
			m = .1/wy
		render.m = m;
	$render2.k = .25/m;
	$render3.k= .25/m;

func _ready():
	renders.append($render)
	renders.append($render2)
	renders.append($render3)
		
	
	$ui/container/A.text = str(A)
	$ui/container/B.text = str(B)
	$ui/container/wx.text = str(wx)
	$ui/container/wy.text = str(wy)
	$ui/container/phase.text = str(phase)
	$ui/container/dump.text = str(lambda)
	$ui/container/sim.text = str(simulateuptoseconds)

	for render in renders:
		render.A =A
		render.B = B
		render.wx = wx
		render.wy = wy
		render.phase = phase
		render.lambda = lambda
		render.simulateuptoseconds=simulateuptoseconds
		render.traceMaxSample=traceMaxSample
	reset()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LineEdit_text_changed(new_text):
		if float(new_text) > 100:
			$ui/container/A.text = "100"
			new_text = 100
		for render in renders:
			render.A = float(new_text)
			reset()


func _on_B_text_changed(new_text):
	if float(new_text) > 100:
			$ui/container/B.text = "100"
			new_text=100
	for render in renders:
			render.B=float(new_text)
			reset()


func _on_wx_text_changed(new_text):
	if float(new_text) > 15:
			$ui/container/wx.text = "15"
			new_text=15
	for render in renders:
			render.wx=float(new_text)
			reset()


func _on_wy_text_changed(new_text):
	if float(new_text) > 15:
			$ui/container/wy.text = "15"
			new_text= 15
	for render in renders:
			render.wy=float(new_text)
			reset()


func _on_phase_text_changed(new_text):
	for render in renders:
			render.phase=float(new_text)
			reset()


func _on_dump_text_changed(new_text):
	for render in renders:
			render.lambda=float(new_text)
			reset()


func _on_sim_text_changed(new_text):
	for render in renders:
			render.simulateuptoseconds=int(new_text)
			reset()
