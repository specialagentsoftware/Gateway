extends StaticBody2D

func on_interact(player):
	var new_dialog = Dialogic.start('computer',false)
	add_child(new_dialog)
