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

func _frame_64():
	var projectile0_x = 31
	var projectile0_y = -22
	var projectile1_x = 3
	var projectile1_y = -43
	var projectile2_x = -9
	var projectile2_y = -46
	var projectile3_x = -2
	var projectile3_y = -74
	var projectile4_x = -8
	var projectile4_y = -9
	var projectile5_x = 9
	var projectile5_y = -82

	host.spawn_object(preload("res://Pootis Mod/characters/Pootis/Projectiles/DeathProjectiles/DeathLaunch00.tscn"), projectile0_x, projectile0_y, true, {"dir": fixed.normalized_vec("0", "0")})
	host.spawn_object(preload("res://Pootis Mod/characters/Pootis/Projectiles/DeathProjectiles/DeathLaunch01.tscn"), projectile1_x, projectile1_y, true, {"dir": fixed.normalized_vec("0", "0")})
	host.spawn_object(preload("res://Pootis Mod/characters/Pootis/Projectiles/DeathProjectiles/DeathLaunch02.tscn"), projectile2_x, projectile2_y, true, {"dir": fixed.normalized_vec("0", "0")})
	host.spawn_object(preload("res://Pootis Mod/characters/Pootis/Projectiles/DeathProjectiles/DeathLaunch03.tscn"), projectile3_x, projectile3_y, true, {"dir": fixed.normalized_vec("0", "0")})
	host.spawn_object(preload("res://Pootis Mod/characters/Pootis/Projectiles/DeathProjectiles/DeathLaunch04.tscn"), projectile4_x, projectile4_y, true, {"dir": fixed.normalized_vec("0", "0")})
	host.spawn_object(preload("res://Pootis Mod/characters/Pootis/Projectiles/DeathProjectiles/DeathLaunch05.tscn"), projectile5_x, projectile5_y, true, {"dir": fixed.normalized_vec("0", "0")})
