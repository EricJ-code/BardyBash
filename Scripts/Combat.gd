extends Node

@export var boss_health = 100
@export var ability_1_cost = 10
@export var ability_2_cost = 20
@export var ability_3_cost = 30
@export var ability_4_cost = 30
var on_cooldown = false
var dmg_multiplier = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("action1") and on_cooldown == false:
		print("Button pressed")
		ability1()
		print($Cooldown.get_time_left())
	if Input.is_action_pressed("action2") and on_cooldown == false:
		print("Button pressed")
		ability2()
		print($Cooldown.get_time_left())
	if Input.is_action_pressed("action3") and on_cooldown == false:
		print("Button pressed")
		ability3()
		print($Cooldown.get_time_left())
	if Input.is_action_pressed("action4") and on_cooldown == false:
		print("Button pressed")
		ability4()
		print($Cooldown.get_time_left())

func _on_cooldown_timeout():
	$Cooldown.stop()
	on_cooldown = false
	print("------------Ended")

func ability1():
	if Score.getGauge() >= ability_1_cost:
		Score.spendGauge(ability_1_cost)
		$Esmerelda.play_single_use()
		Score.heal()
		print("Ability used")
		on_cooldown = true
		$Cooldown.start()
		
func ability2():
	if Score.getGauge() >= ability_2_cost:
		Score.spendGauge(ability_2_cost)
		Score.increaseMultiplier()
		$Esmerelda2.play_use()

		print("Ability used")
		on_cooldown = true
		$Cooldown.start()
		$MultiplierTimer.start(10)

func ability3():
	if Score.getGauge() >= ability_3_cost:
		Score.spendGauge(ability_3_cost)
		$Esmerelda3.play_use()
		double_dmg_mult()
		print("Ability 3 used")
		on_cooldown = true
		$SlowdownTimer.set_wait_time($SlowdownTimer.get_time_left()+10)
		if $SlowdownTimer.is_stopped():
			$SlowdownTimer.start($SlowdownTimer.get_wait_time())
		$Cooldown.start()
func ability4():
	if Score.getGauge() >= ability_4_cost:
		Score.spendGauge(ability_4_cost)
		$Esmerelda4.play_single_use()
		print("Ability 4 used")
		on_cooldown = true
		$Cooldown.start()
		Score.damageBoss(dmg_multiplier * 1)

func _on_slowdown_timer_timeout():
	reset_dmg_mult()
	$Esmerelda3.choose_anim()
	print("Stopping slowdown")
	$SlowdownTimer.stop()
	pass # Replace with function body.

func _on_multiplier_timer_timeout():
	$Esmerelda2.choose_anim()
	Score.resetMultiplier()
	$MultiplierTimer.stop()
	#
	pass # Replace with function body.

func double_dmg_mult():
	dmg_multiplier = 2

func reset_dmg_mult():
	dmg_multiplier = 1