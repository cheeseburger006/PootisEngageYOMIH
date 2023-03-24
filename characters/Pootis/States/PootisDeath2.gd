extends CharacterState

func _frame_0():

	var vel = host.get_vel()
	host.set_vel(vel.x, "0")
	host.set_grounded(true)
	host.set_pos(host.get_pos().x, 0)
	host.on_the_ground = true
	host.colliding_with_opponent = false

func _exit():
	host.on_the_ground = false
	host.colliding_with_opponent = true

func _tick():
	host.apply_fric()
	host.apply_forces()
	if host.hp <= 0:
		endless = true
