extends KinematicBody2D

#Variable definition
var curHp : int = 10
var maxHp : int = 10
var moveSpeed : int = 75
var damage : int = 1
var gold : int = 0
var curLevel : int = 0
var curXp : int = 0
var xpToNextLevel : int = 50
var xpToLevelIncreaserate : float = 1.2
var interactDist : int = 20
var vel : Vector2 = Vector2()
var facingDir : Vector2 = Vector2()
var inventory : Array = []
onready var rayCast = get_node("RayCast2D")
onready var anim = get_node("AnimatedSprite")

func _physics_process(_delta):
	vel = Vector2()
	if Input.is_action_pressed("move_up"):
		vel.y -= 1
		facingDir = Vector2(0,-1)
	if Input.is_action_pressed("move_down"):
		vel.y += 1
		facingDir = Vector2(0,1)
	if Input.is_action_pressed("move_left"):
		vel.x -= 1
		facingDir = Vector2(-1,0)
	if Input.is_action_pressed("move_right"):
		vel.x += 1
		facingDir = Vector2(1,0)
	vel = vel.normalized()
	var _ms_return = move_and_slide(vel * moveSpeed)
	manage_animations()

func manage_animations():
	if vel.x > 0:
		play_animation("MoveRight")
	elif vel.x < 0:
		play_animation("MoveLeft")
	elif vel.y < 0:
		play_animation("MoveUp")
	elif vel.y > 0:
		play_animation("MoveDown")
	elif facingDir.x == 1:
		play_animation("IdleRight")
	elif facingDir.x == -1:
		play_animation("IdleLeft")
	elif facingDir.y == -1:
		play_animation("IdleUp")
	elif facingDir.y == 1:
		play_animation("IdleDown")
		
func _process(delta):
	if check_interact():
		if Input.is_action_just_pressed("interact"):
			try_interact()

func check_interact():
	var e = get_node("e")
	rayCast.cast_to = facingDir * interactDist
	if rayCast.is_colliding():
		var rc = rayCast.get_collider()
		if rc != null:
			if rc.has_method("on_interact"):
				e.visible = true
			return true
		else:
			e.visible = false
			return false
	else:
		e.visible = false
		return false

func try_interact():
	rayCast.get_collider().on_interact(self)

func play_animation(anim_name):
	if anim.animation != anim_name:
		anim.play(anim_name)
		
func recieve_item(item):
	inventory.append(item)
