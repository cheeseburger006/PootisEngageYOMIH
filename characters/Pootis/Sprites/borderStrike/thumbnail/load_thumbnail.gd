extends Node2D

func _ready():
	var animated_texture = load("res://Pootis Mod/characters/Pootis/Sprites/borderStrike/thumbnail/thumbnail_texture.tres")
	
	# Get the list of image files in a directory
	var image_files = []
	var dir_path = "res://Pootis Mod/characters/Pootis/Sprites/borderStrike/thumbnail/sprites/"
	var dir = Directory.new()
	if dir.open(dir_path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.ends_with(".png"):  # or whatever file extension you're using
				image_files.append(file_name)
			file_name = dir.get_next()
		dir.list_dir_end()

	animated_texture.set_frames(image_files.size())

	for i in range(image_files.size()):
		animated_texture.set_frame_texture(i, load(dir_path + image_files[i]))
		animated_texture.set_frame_delay(i, 0.05)
