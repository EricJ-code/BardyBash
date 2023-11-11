extends CharacterBody2D

const bulletPath = preload("res://Level1/Bullet.tscn")

func _ready():
	pass
func _input(delta):
	if Input.is_action_pressed("ui_accept"):
		print("shoot")
		shoot1()
		shoot2()
		
		shoot3()
		shoot4()
		
	#have a function that returns collision true...if collision true queue free 
	#$Node2D.look_at(get_global_mouse_position())
		


func shoot1(): 
	var bullet = bulletPath.instantiate()
	get_parent().add_child(bullet)
	bullet.position = $Node2D/Marker2D.global_position
	bullet.rotation = $Node2D/Marker2D.global_rotation
	
func shoot2():
	var bullet2 = bulletPath.instantiate() 
	get_parent().add_child(bullet2)
	bullet2.position = $Marker2D2.global_position
	bullet2.rotation = $Marker2D2.global_rotation
	
func shoot3():
	var bullet3 = bulletPath.instantiate() 
	get_parent().add_child(bullet3)
	bullet3.position = $Marker2D2.global_position
	bullet3.rotation = $Marker2D3.global_rotation
	
func shoot4(): 
	var bullet4 = bulletPath.instantiate() 
	get_parent().add_child(bullet4)
	bullet4.position = $Marker2D4.global_position
	bullet4.rotation = $Marker2D4.global_rotation





	#this function should probably return something to input delta
