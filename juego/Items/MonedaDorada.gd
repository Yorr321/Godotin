extends Area


func _on_body_entered(_body):
	DatosJuego.sumar_monedas()
	$Colisionador.set_deferred("disabled", true)
	$AnimationPlayer.play("consumida")
	
