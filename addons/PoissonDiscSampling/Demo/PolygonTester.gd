extends Node2D


onready var polygon: Array = $Polygon2D.polygon
onready var n = polygon.size()

var radius: int = 20
var k: int = 0
var points := []


func _draw() -> void:
	for i in n:
		draw_line(polygon[i], polygon[(i+1)%n], Color(1,1,0), 2, 1)
	
	draw_circle(points[k], radius / 2, Color( 1, 0, 0, 1 ))
	draw_circle(points[k], 2, Color( 1, 1, 0, 1 ))

func _ready() -> void:
	var pds = PoissonDiscSampling.new()
	
	var start_time = OS.get_ticks_msec()
	points = pds.generate_points(radius, $Polygon2D.polygon, 30)
	print(points.size(), " points generated in ", OS.get_ticks_msec() - start_time, " miliseconds" )
	
	get_viewport().render_target_clear_mode = Viewport.UPDATE_ONCE


func _process(delta: float) -> void:
	if k < points.size() - 1:
		update()
		k += 1
