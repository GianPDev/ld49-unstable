extends RigidBody2D

func set_msg(stamp : String, data : SenderData, msg : String, badges : String, nonbbstring : String) -> void:
	$RichTextLabel.bbcode_text = stamp + "[b][color="+ data.tags["color"] + "]" + data.tags["display-name"] +"[/color][/b]: " + msg
	# $RigidBody2D/Area2D/CollisionShape2D.shape.set_shape(new Shape2d());
	var collisionShape = $CollisionShape2D # CollisionShape2D.new();
	var shape = RectangleShape2D.new();
	# get size without bbcode stuff to get proper size
	# the length of the emote name is affecting the size
	var size = $RichTextLabel.get_font("normal_font").get_string_size(nonbbstring)
	size.x *= 0.5 
	shape.extents = size/2
	collisionShape.shape = shape
	collisionShape.position += Vector2(size.x/2, size.y)
	# self.add_child(collisionShape);
#func _ready():
#	var rigidBody = RigidBody2D.new()
#	# $"../RigidBody2D"
#	# self.add_child(rigidBody);
#	var collisionShape = CollisionShape2D.new();
#	# rigidBody.add_child(collisionShape)
#	var shape = RectangleShape2D.new();
#	shape.extents = self.get_font("normal_font").get_string_size(self.text)/2
#	collisionShape.shape = shape
#	print(shape)
#	call_deferred("add_child", collisionShape)
	# get_parent().add_child(collisionShape)
	# var text_size = Vector2($RichTextLabel.text.length()*2, 16);
	# text_shape.extents = txt_size # Vector2(txt_size.x, txt_size.y);
	# $RichTextLabel.rect_min_size = Vector2(0,0)
	# $RichTextLabel.position.x = txt_size.x /2;
	# print(txt_size)
	# print("created new shape")
	# print(text_shape);
	# shape = text_shape

func _physics_process(delta):
	# look at player
	# velocity move and slide
	velocity = move_and_slide
