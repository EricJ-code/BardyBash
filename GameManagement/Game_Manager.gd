extends Node2D

@onready var Music = $AudioStreamPlayer
@onready var DefaultStage = load("res://Level1/spawnertest.tscn")
@onready var DefaultSong = load("res://Music/DummySong.wav")
# Called when the node enters the scene tree for the first time.
func _ready():
	Music.stream = DefaultSong
	Music.play()

func play_song(song_file):
	Music.stream = song_file
	Music.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ui_layer_load_level():
	var startInstance = DefaultStage.instantiate()
	add_child(startInstance)
	#get_tree().change_scene_to_file("res://Level1/spawnertest.tscn")
	
	
