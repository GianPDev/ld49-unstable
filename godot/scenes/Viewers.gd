extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# create struct that gets viewer and message
var viewers = [];

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#gets user when they chat if they are not already on the list
# aka gets unique user
func chat_message(data : SenderData, msg : String) -> void:
	var display_name = data.tags["display-name"];
	if !viewers.has(display_name) && viewers.size() < 100:
		viewers.append(display_name);
		print("added: " + display_name);
		print(viewers);
	print(display_name + ": " + msg);
