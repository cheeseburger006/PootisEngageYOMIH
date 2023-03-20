extends DefaultFireball

func fizzle():
	hit_something = true
	terminate_hitboxes()
	hit_something_tick = current_tick
