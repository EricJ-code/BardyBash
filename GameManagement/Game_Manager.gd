extends Node2D

@onready var Music = $AudioStreamPlayer
@onready var DefaultStage = load("res://Level1/spawnertest.tscn")
@onready var DefaultSong = load("res://Music/DummySong.wav")
@onready var Options = $UI_Layer/Options
@onready var childLevel = null 
# Called when the node enters the scene tree for the first time.
func _ready():
	Music.stream = DefaultSong
	#Music.play()

func _input(delta):
	if Input.is_action_pressed("Pause"):
		Options.show()

func play_song(song_file):
	Music.stream = song_file
	Music.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ui_layer_load_level():
	var childLevel = DefaultStage.instantiate()
	add_child(childLevel)
	#get_tree().change_scene_to_file("res://Level1/spawnertest.tscn")

func _on_ui_layer_unload_level():
	if childLevel != null: 
		childLevel.queue_free() 
	
