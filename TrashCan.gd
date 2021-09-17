extends StaticBody2D

func on_interact(player):
	var new_dialog = Dialogic.start('trashcan',false)
	#Dialogic.set_variable('password','yes')
	add_child(new_dialog)
