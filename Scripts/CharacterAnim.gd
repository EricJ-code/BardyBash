extends Node2D

# Exported variables
@export var gauge_needed = 1
@export var timer_time = 10
@export var ability = "None"
@export var color = Color(1,1,1)

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set modulate color of Sprite
	$Sprite.set_modulate(color)
	print(ability)

	# Check if ability is not "None"
	if ability !="None":
		print("This went")
		# Set gauge_needed from parent based on ability
		gauge_needed =  get_parent().get(ability)

	print(gauge_needed)

	# Connect to GaugeChanged signal from Score
	Score.GaugeChanged.connect(_on_gauge_changed)

	# Play "idle" animation
	$Sprite.play("idle")
	#print(get_animation())
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Function called when sprite animation is finished
func _on_sprite_animation_finished():
	print("Animation Finished!!!!!!!!!!!!!!!!!!!!!!!!!!")
	#print(get_animation())

	# Check current animation and choose next animation
	if $Sprite.get_animation() == "ability_use" or $Sprite.get_animation() == "ability_use2":
		choose_anim()

# Function to change animation while retaining current frame and progress
func change_animation(anim):
	var current_frame = $Sprite.get_frame()
	var current_progress = $Sprite.get_frame_progress()
	$Sprite.play(anim)
	$Sprite.set_frame_and_progress(current_frame,current_progress)

# Function to choose animation based on gauge value
func choose_anim():
	if Score.gauge >= gauge_needed:
		if $Sprite.get_animation() != "ability_ready":
			change_animation("ability_ready")
	else:
		if $Sprite.get_animation() != "idle":
			change_animation("idle")

# Function called when GaugeChanged signal is emitted
func _on_gauge_changed():
	print($Sprite.get_animation())

	# Check current animation before choosing a new one
	if $Sprite.get_animation() != "ability_use" and $Sprite.get_animation() != "ability_use2":
		choose_anim()

# Function to play "ability_use" animation
func play_use():
	$Sprite.play("ability_use")

# Function to play "ability_use2" animation
func play_single_use():
	$Sprite.play("ability_use2")
