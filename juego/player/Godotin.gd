class_name Godotin
extends KinematicBody


const direccion_arriba: Vector3 = Vector3.UP

export var velocidad_max: Vector2 = Vector2(10.0, 60.0)
export var gravedad: float = 9.8
export var impulso: float = 50.0
export var fuerza_salto: float = 18.0

var movimiento: Vector3 = Vector3.ZERO
var salto_interrumpido = false
var saltando = false

onready var brazo_camara: SpringArm = $BrazoCamara


func _physics_process(delta: float) -> void:
	movimiento_vertical()
	movimiento = move_and_slide(movimiento, direccion_arriba)

func movimiento_vertical() -> void:
	if not is_on_floor():
		movimiento.y -= gravedad
		movimiento.y = clamp(movimiento.y, -velocidad_max.y, impulso)
		if Input.is_action_just_released("saltar"):
			salto_interrumpido = true
		else:
			saltando = false
		
		var inicio_salto: bool = is_on_floor() and Input.is_action_just_pressed("saltar")
		 
		if inicio_salto:
			saltando = true
			salto_interrumpido = false
		
		if movimiento.y >= velocidad_max.y:
			salto_interrumpido = true
		
		if Input.is_action_pressed("saltar") and saltando and not salto_interrumpido:
			movimiento.y += fuerza_salto

func _process(delta: float) -> void:
	brazo_camara.translation = translation
