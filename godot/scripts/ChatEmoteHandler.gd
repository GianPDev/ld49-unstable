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
func chat_message(senderdata : SenderData, msg : String) -> void:
	# var msgnode : RigidBody2D = preload("res://scripts/EmoteShot.tscn").instance()
	# var nonbbstring = "" # senderdata.tags["color"] + senderdata.tags["display-name"] + ": " + msg;

	var emotes = ""
	# var boxsize = Vector2(0,28)
	var boxsize = Vector2(28,28)
	if($"../TwitchChat".image_cache):
		var locations : Array = []
		for emote in senderdata.tags["emotes"].split("/", false):
			var data : Array = emote.split(":")
			for d in data[1].split(","):
				var start_end = d.split("-")
				locations.append(EmoteLocation.new(data[0], int(start_end[0]), int(start_end[1])))
		locations.sort_custom(EmoteLocation, "smaller")
		var offset = 0
		for loc in locations:
			var emote_string = "[img=center]" + $"../TwitchChat".image_cache.get_emote(loc.id).resource_path +"[/img]"
			# print("emote_string: " + emote_string)
			# msg = msg.substr(0, loc.start + offset) + emote_string + msg.substr(loc.end + offset + 1)
			# msg = msg.substr(0, loc.start + offset) + emote_string + msg.substr(loc.end + offset + 1)
			var msgnode : RigidBody2D = preload("res://scripts/EmoteShot.tscn").instance()
			msgnode.set_msg(emote_string, boxsize)
			msgnode.position = Vector2(150, 50);
			call_deferred("add_child", msgnode)
			# emotes += emote_string
			# nonbbstring += "TEXT"
			# boxsize.x += 28;
			
			# offset += emote_string.length() + loc.start - loc.end - 1
	# msgnode.position = Vector2(150, 50);
	# var usrmsg : String = "[" + str(time["hour"]) + ":" + ("0" + str(time["minute"]) if time["minute"] < 10 else str(time["minute"])) + "]" + senderdata.tags["color"] + senderdata.tags["display-name"] + badges + ": " + msg;
	# msgnode.set_msg(str(time["hour"]) + ":" + ("0" + str(time["minute"]) if time["minute"] < 10 else str(time["minute"])), senderdata, msg, badges, nonbbstring)
	# if (emotes != ""):
		# call_deferred("add_child", msgnode)
		# msgnode.set_msg(emotes, nonbbstring, boxsize)
	# print(usrmsg)
	var viewer_enemy:RigidBody2D = preload("res://scripts/ViewerEnemy.tscn").instance()
	var time = OS.get_time()
	var stamp = str(time["hour"]) + ":" + ("0" + str(time["minute"]) if time["minute"] < 10 else str(time["minute"]))
	var display_name = stamp + "[b][color="+ senderdata.tags["color"] + "]" + senderdata.tags["display-name"] +"[/color][/b]"
	# var display_name = senderdata.tags["display-name"];
	if !viewers.has(display_name) && viewers.size() < 100:
		viewers.append(display_name);
		print("added: " + display_name);
		print(viewers);
	print(display_name + ": " + msg);
	var nonbbstring = stamp + senderdata.tags["color"] + senderdata.tags["display-name"] + ":[]";
	viewer_enemy.set_msg(stamp, senderdata, "", "", nonbbstring)
	
	viewer_enemy.position = Vector2(150, 200);
	call_deferred("add_child", viewer_enemy)
	
class EmoteLocation extends Reference:
	var id : String
	var start : int
	var end : int

	func _init(emote_id, start_idx, end_idx):
		self.id = emote_id
		self.start = start_idx
		self.end = end_idx

	static func smaller(a : EmoteLocation, b : EmoteLocation):
		return a.start < b.start
