extends Node2D

@export var gauge_needed = 1
@export var timer_time = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	Score.GaugeChanged.connect(_on_gauge_changed)
	$Sprite.play("idle")
	#print(get_animation())
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_animation_finished():

	#print(current_frame)
	#print(get_animation())
	if $Sprite.get_animation() == "ability_use":
		choose_anim()

func change_animation(anim):
	var current_frame = $Sprite.get_frame()
	var current_progress = $Sprite.get_frame_progress()
	$Sprite.play(anim)
	$Sprite.set_frame_and_progress(current_frame,current_progress)

func choose_anim():
	if Score.gauge >= gauge_needed:
		if $Sprite.get_animation() != "ability_ready":
			change_animation("ability_ready")
	else:
		if $Sprite.get_animation() != "idle":
			change_animation("idle")
func _on_gauge_changed():
	if $Sprite.get_animation() != "ability_use":
		choose_anim()

func play_use():
	$Sprite.play("ability_use")
