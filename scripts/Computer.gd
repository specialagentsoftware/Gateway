extends StaticBody2D

func on_interact(_player):
	var new_dialog = Dialogic.start('computer',false)
	add_child(new_dialog)
