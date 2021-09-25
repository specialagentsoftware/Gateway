extends Node2D



func _ready():
	var new_dialog = Dialogic.start('intro',true)
	Dialogic.set_variable('password','no')
	Dialogic.set_variable('lasers','no')
	Dialogic.set_variable('doors','no')
	Dialogic.set_variable('pizza','no')
	add_child(new_dialog)
