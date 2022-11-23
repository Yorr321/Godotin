tool
extends Button


export var accion: String

var traducciones: Dictionary = {
	"Space": "espacio",
	"Up": "flecha arriba",
	"Down": "flecha abajo",
	"Left": "flecha izquierda",
	"Right": "flecha derecha",
	"CapsLock": "Bloq Mayus"
}


func _ready() -> void:
	assert(InputMap.has_action(accion))
	set_process_unhandled_input(false)
	mostrar_input_actual()

func traducir_input(input_actual: String) -> String:
	if input_actual in traducciones:
		return traducciones[input_actual]
	
	return input_actual

func _get_configuration_warning() -> String:
	if accion == "":
		return "No hay accion asignada"
	
	return ""

func _unhandled_input(event: InputEvent) -> void:
	remapear_accion(event)
	pressed = false

func mostrar_input_actual() -> void:
	var input_actual: String = InputMap.get_action_list(accion)[0].as_text()
	text = traducir_input(input_actual)

func remapear_accion(event: InputEvent) -> void:
	InputMap.action_erase_events(accion)
	InputMap.action_add_event(accion, event)
	text = traducir_input(event.as_text())


func _on_toggled(button_pressed: bool) -> void:
	set_process_unhandled_input(button_pressed)
	if button_pressed:
		text = "Asignar Input..."
		release_focus()
	else:
		mostrar_input_actual()
