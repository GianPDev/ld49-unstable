extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var speed = 200

var jumpvelocity = 5000
var gravityscale = 200.0
var walkspeed = 350
var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x = walkspeed
	elif Input.is_action_pressed("left"):
		velocity.x = -walkspeed
	else:
		velocity.x = 0
#	if Input.is_action_pressed("down"):
#		velocity.y += 1
#	if Input.is_action_pressed("up"):
#		velocity.y -= 1
	if Input.is_action_pressed("jump"):
		velocity.y-=jumpvelocity
#	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity.y = gravityscale
#	var motion = velocity * delta
	move_and_slide(velocity)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
