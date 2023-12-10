extends Node2D

@onready var Music = $AudioStreamPlayer
@onready var DefaultStage = load("res://Level1/spawnertest.tscn")
@onready var DefaultSong = load("res://Music/DummySong.wav")
@onready var Options = $UI_Layer/Options
@onready var childLevel = null

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set the default music file when the script is ready
	Music.stream = DefaultSong
	#Music.play()

# Function to handle user input, specifically the Pause action
func _input(delta):
	if Input.is_action_pressed("Pause"):
        	# Show the Options menu when the Pause action is triggered
		Options.show()

# Function to play a specified song file
func play_song(song_file):
 	# Set the music stream to the specified song file
	Music.stream = song_file
    	# Play the music
	Music.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Event handler for loading a level from the UI layer
func _on_ui_layer_load_level():
  	# Instantiate the default stage scene
	var childLevel = DefaultStage.instantiate()
    	# Add the instantiated level as a child to the current node
	add_child(childLevel)
	#get_tree().change_scene_to_file("res://Level1/spawnertest.tscn")

# Event handler for unloading a level from the UI layer
func _on_ui_layer_unload_level():
    	# Check if a child level exists
	if childLevel != null:
       		# Free the memory occupied by the child level
		childLevel.queue_free() 
	
