extends "res://characters/states/HurtAerial.gd"

func _tick():
	if host.is_grounded() and bounce_frames > 0:
		anim_name = "Knockdown"
	else :
		anim_name = "HurtAerial"

	host.apply_x_fric(AIR_FRIC)
	host.apply_grav_custom(HIT_GRAV, HIT_FALL_SPEED)
	host.apply_forces_no_limit()

	var vel = host.get_vel()
	var bounce = BOUNCE.NO_BOUNCE
	var col_box = host.get_collision_box()
	
	if (host.hitlag_ticks > 0 or (host.is_grounded() and bounce_frames > 0)):
		pass
	elif (col_box.x1 <= - host.stage_width and fixed.lt(vel.x, "0")):
		bounce = BOUNCE.LEFT_WALL
	elif (col_box.x2 >= host.stage_width and fixed.gt(vel.x, "0")):
		bounce = BOUNCE.RIGHT_WALL

	if (bounce != BOUNCE.NO_BOUNCE):
		if wall_slam:
			queue_state_change("WallSlam", bounce)
			return 
		host.hitlag_ticks = 3
		host.play_sound("Block")
		host.set_vel(fixed.mul(vel.x, BOUNCE_FACTOR), vel.y)
		
		
		if (Vector2(vel.x, vel.y).length() > 5):
			var particle_pos = Vector2(
				(col_box.x1 if bounce == BOUNCE.LEFT_WALL else col_box.x2), 
				host.get_center_position_float().y
			)
			
			var particle_dir = Vector2.DOWN if bounce == BOUNCE.LEFT_WALL else Vector2.UP
			
			host.spawn_particle_effect(BOUNCE_PARTICLE, particle_pos, particle_dir)

	if bounce_frames > 0:
		host.set_pos(host.get_pos().x, 0)
		bounce_frames -= 1
		if bounce_frames == 0:
			host.set_pos(host.get_pos().x, - 1)
	else :
		if host.is_grounded() and fixed.ge(host.get_vel().y, "0"):
			if knockdown:
				if hard_knockdown:
					return "HardKnockdown"
				else :
					return "Knockdown"
					
			elif host.hp == 0:
				var rng = RandomNumberGenerator.new()
				rng.randomize()
				var deathIndex = rng.randi_range(0, 1)
				
				if(deathIndex == 0):
					return "PootisDeath1"
				else:
					return "PootisDeath2"
				
			else :
				if host.hp > 0:
					return "Landing"
				return "Knockdown"
				
	var extended_hitstun = hitbox.knockdown_extends_hitstun and hitbox.knockdown and not ground_bounced
	
	if not extended_hitstun and current_tick > hitstun:
		if can_act and host.hp > 0:
			return fallback_state
		else :
			enable_interrupt()
			can_act = true
