extends Button

export(NodePath) var nodo_sfx
var boton_sfx: AudioStreamPlayer


func _ready() -> void:
	connect("pressed", self, "presionado")
	boton_sfx = get_node(nodo_sfx)

func presionado() -> void:
	boton_sfx.play()
