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
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var deathIndex = rng.randi_range(0, 1)
		
		if(deathIndex == 0):
			return "PootisDeath1"
		else:
			return "PootisDeath2"
