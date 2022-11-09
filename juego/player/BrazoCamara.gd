extends SpringArm


export var velocidad_mov_camara: float = 0.10
export var rango_rotacion_camara_x: Vector2 = Vector2(-90.0, 30.0)
export var rango_rotacion_camara_y: Vector2 = Vector2(0.0, 360.0)


func _ready() -> void:
	set_as_toplevel(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


var c := 0
func _unhandled_input(event: InputEvent) -> void:
	c += 1
	if event is InputEventMouseMotion:
		#Movimiento alrededor eje X (arriba/abajo)
		rotation_degrees.x += event.relative.y * velocidad_mov_camara
		rotation_degrees.x = clamp(
			rotation_degrees.x,
			rango_rotacion_camara_x.x,
			rango_rotacion_camara_x.y
		)
		
		 #Movimiento alrededor eje Y (derecha/izquierda)
		rotation_degrees.y += event.relative.x * velocidad_mov_camara
		rotation_degrees.y = wrapf(
			rotation_degrees.y,
			rango_rotacion_camara_y.x,
			rango_rotacion_camara_y.y
		)
		
		
		
		
		
		#TODO: Solo para debug
		if Input.is_action_pressed("ui_cancel"):
			get_tree().quit()
