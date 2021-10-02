extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# func _on_Gift_chat_message(sender_data, message):
	# print(sender_data.tags["display-name"] + ": " + message) # Replace with function body.
func chat_message(data : SenderData, msg : String) -> void:
	print(data.tags["display-name"] + ": " + msg)

