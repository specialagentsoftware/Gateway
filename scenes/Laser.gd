extends StaticBody2D


func on_interact(_player):
	var new_dialog = Dialogic.start('lasers',false)
	add_child(new_dialog)
	new_dialog.connect("dialogic_signal",self,"HideLaser")
	
func HideLaser(_parameter):
	queue_free()
