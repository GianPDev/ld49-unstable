extends Gift

func _ready() -> void:
	# I use a file in the working directory to store auth data
	# so that I don't accidentally push it to the repository.
	# Replace this or create a auth file with 3 lines in your
	# project directory:
	# <bot username>
	# <oauth token>
	# <initial channel>
	var authfile := File.new()
	authfile.open("./auth", File.READ)
	var botname := authfile.get_line()
	var token := authfile.get_line()
	var initial_channel = authfile.get_line()

	connect_to_twitch()
	yield(self, "twitch_connected")

	# Login using your username and an oauth token.
	# You will have to either get a oauth token yourself or use
	# https://twitchapps.com/tokengen/
	# to generate a token with custom scopes.
	authenticate_oauth(botname, token)
	if(yield(self, "login_attempt") == false):
	  print("Invalid username or token.")
	  return
	join_channel(initial_channel)

	# connect("cmd_no_permission", get_parent(), "no_permission")
	# connect("chat_message", get_parent(), "chat_message")
	connect("chat_message", $"../Viewers", "chat_message")
	
