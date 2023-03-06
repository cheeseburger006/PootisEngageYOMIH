extends "res://projectile/DirProjectileDefault.gd"

func fizzle1():
	hit_something = true
	terminate_hitboxes()
	hit_something_tick = current_tick
