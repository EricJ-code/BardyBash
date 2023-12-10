extends CharacterBody2D

# Constant to store the path to the Bullet scene
const bulletPath = preload("res://Level1/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Input handling function
func _input(delta):
    # Check if the "ui_accept" action is pressed
	if Input.is_action_pressed("ui_accept"):
		print("shoot")
		var i = 0

    # Check for different spawn actions and call corresponding shoot functions
	if Input.is_action_just_pressed("SpawnLeft"):
		shoot1()

	if Input.is_action_just_pressed("Spawn up"):
		shoot2()

	if Input.is_action_just_pressed("Spawn down"):
		shoot3()

	if Input.is_action_just_pressed("spawn right"):
		shoot4()


	#have a function that returns collision true...if collision true queue free 
	#$Node2D.look_at(get_global_mouse_position())

# Function to shoot bullets to the left
func shoot1(): 
	var bullet = bulletPath.instantiate()
	get_parent().add_child(bullet)
	bullet.position = $Node2D/Marker2D.global_position
	bullet.rotation = $Node2D/Marker2D.global_rotation
	
# Function to shoot bullets upward
func shoot2():
	var bullet2 = bulletPath.instantiate() 
	get_parent().add_child(bullet2)
	bullet2.position = $Marker2D2.global_position
	bullet2.rotation = $Marker2D2.global_rotation

# Function to shoot bullets downward
func shoot3():
	var bullet3 = bulletPath.instantiate() 
	get_parent().add_child(bullet3)
	bullet3.position = $Marker2D2.global_position
	bullet3.rotation = $Marker2D3.global_rotation
	
# Function to shoot bullets to the right
func shoot4(): 
	var bullet4 = bulletPath.instantiate() 
	get_parent().add_child(bullet4)
	bullet4.position = $Marker2D4.global_position
	bullet4.rotation = $Marker2D4.global_rotation





	#this function should probably return something to input delta


# Function triggered by an external node to shoot a specified number of bullets in random directions
func _on_node_2_note_spawner(numberBullets):
	print("shoot")
	#print(numberBullets)
	var random_numbers = []

    # Generate random numbers to determine bullet lanes
	for i in range(numberBullets):
		var lanes = randi() % 4 + 1  # Adjust the range as needed
		var random_number = randi() % numberBullets + 1  # Adjust the range as needed
		random_numbers.append(lanes)
#
	print(random_numbers)

    # Shoot bullets based on generated random numbers
	for numbers in random_numbers:
		if numbers == 1:
			shoot1()
			break
		if numbers == 2:
			shoot2()
			break
		if numbers == 3:
			shoot3()
			break
		if numbers == 4:
			shoot4()
			break
	#for number in random_numbers:
	#	if number == 1:
	#		shoot1()
	#	elif number == 2:
	#		shoot2()
	#	elif number == 3:
	#		shoot3()
	#	elif number == 4:
	#		shoot4()
	#	else:
	#		print("error")

	# shoot1()
	# shoot2()
	
	# shoot3()
	# shoot4()
	pass # Replace with function body.
