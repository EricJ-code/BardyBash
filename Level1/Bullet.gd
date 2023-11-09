extends CharacterBody2D

#var vel= Vector2(0, 1)

var speed = 300
var timeInstantiated;
var assignedTime;
var songManager = load("res://Scripts/SongManager.cs")

func _ready():
	#timeInstantiated = SongManager.GetAudioSourceTime();
	pass

func _process(delta):
	position += transform.x * speed * delta
	#var timeSinceInstantiated = SongManager.GetAudioSourceTime() - timeInstantiated;
	#float t = (float)(timeSinceInstantiated / (SongManager.Instance.noteTime * 2));

	
	#if (t > 1)
	#	Instance.queue_free();
	#else
		#position += transform.x * speed * delta
	#var collision_info = move_and_collide(vel.normalized() * delta * speed)
	#move_and_collide(speed * delta)



