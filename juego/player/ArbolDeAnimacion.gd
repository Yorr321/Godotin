class_name ArbolAnimacionPlayer
extends AnimationTree


func get_valor_mezcla_idle_caminar() -> float:
	return get("parameters/MezclaIdleCaminar/blend_amount")

func set_valor_mezcla_idle_caminar(valor: float) -> void:
	set("parameters/MezclaIdleCaminar/blend_amount", valor)

func get_transicion_suelo_aire() -> int:
	return get("parameters/TransicionSueloAire/current")

func set_transicion_suelo_aire(valor: int) -> void:
	set("parameters/TransicionSueloAire/current", valor)

func get_mezcla_saltar_caer() -> float:
	return get("parameters/MezclaSaltarCaer/blend_amount")

func set_mezcla_saltar_caer(valor: float) -> void:
	set("parameters/MezclaSaltarCaer/blend_amount", valor)

func get_mezcla_disparar() -> float:
	return get("parameters/MezclaDisparar/blend_amount")

func set_mezcla_disparar(valor: float) -> void:
	set("parameters/MezclaDisparar/blend_amount", valor)
