extends Node2D


@onready var polygon: Array = $Polygon2D.polygon
@onready var n = polygon.size()

var p_radius: int = 20
var k: int = 0
var points := []


func _draw() -> void:
	for i in n:
		draw_line(polygon[i], polygon[(i+1)%n], Color(1,1,0), 2, 1)
	
	draw_circle(points[k], p_radius / 2, Color( 1, 0, 0, 1 ))
	draw_circle(points[k], 2, Color( 1, 1, 0, 1 ))


func _ready() -> void:
	var start_time = Time.get_ticks_msec()
	points = PoissonDiscSampling.generate_points_for_polygon($Polygon2D.polygon, p_radius, 30)
#	points = PoissonDiscSampling.generate_points_for_circle(Vector2(300,300),200, p_radius, 30)
	print(points.size(), " points generated in ", Time.get_ticks_msec() - start_time, " miliseconds" )


func _process(delta: float) -> void:
	if k < points.size() - 1:
		queue_redraw()
		k += 1
