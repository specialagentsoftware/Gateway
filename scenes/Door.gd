extends StaticBody2D

func on_interact(_player):
	var new_dialog = Dialogic.start('doors',false)
	add_child(new_dialog)
	new_dialog.connect("dialogic_signal",self,"HideDoor")
	
func HideDoor(_parameter):
	queue_free()
