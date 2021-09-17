extends Node2D

onready var new_dialog = Dialogic.start('computerscreen',false)

func _ready():
	add_child(new_dialog)
	new_dialog.connect('dialogic_signal',self,'dialogic_signal_event')

func dialogic_signal_event(param):
	if param == 'doors':
		doors()
	if param == 'pizza':
		pizza()
	if param == 'lasers':
		lasers()

func lasers():
	Dialogic.set_variable('lasers','yes').save_definitions()
	
func doors():
	Dialogic.set_variable('doors','yes').save_definitions()
	
func pizza():
	Dialogic.set_variable('pizza','yes').save_definitions()
	
