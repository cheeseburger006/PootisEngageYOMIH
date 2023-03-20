extends CharacterState

func _enter():
	if not host.is_grounded():
		return "Fall"

func _tick():
	host.apply_fric()
	host.apply_forces()
	if not host.is_grounded():
		return "Fall"
	if host.hp <= 0:
		return "PootisDeath"
