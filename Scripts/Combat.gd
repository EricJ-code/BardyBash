extends Node

@export var boss_health = 100
@export var ability_1_cost = 10
@export var ability_2_cost = 20
@export var ability_3_cost = 30
@export var ability_4_cost = 30
var on_cooldown = false




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
        print("Ability used")
        on_cooldown = true
        $Cooldown.start()
func ability2():
    if Score.getGauge() >= ability_2_cost:
        Score.spendGauge(ability_2_cost)
        Score.increaseMultiplier()

        print("Ability used")
        on_cooldown = true
        $Cooldown.start()
        $MultiplierTimer.start(10)

func ability3():
    if Score.getGauge() >= ability_3_cost:
        Score.spendGauge(ability_3_cost)
        print("Ability 3 used")
        on_cooldown = true
        $SlowdownTimer.start(10)
        $Cooldown.start()
func ability4():
    if Score.getGauge() >= ability_4_cost:
        Score.spendGauge(ability_4_cost)
        print("Ability 4 used")
        on_cooldown = true
        $Cooldown.start()


func _on_slowdown_timer_timeout():
    print("Stopping slowdown")
    $SlowdownTimer.stop()
    pass # Replace with function body.


func _on_multiplier_timer_timeout():
    Score.resetMultiplier()
    $MultiplierTimer.stop()
    #
    pass # Replace with function body.
