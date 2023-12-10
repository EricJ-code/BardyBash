extends Control
#onload var gauge_bar = $GaugeBar



# Called when the node enters the scene tree for the first time.
func _ready():
	# Connecting signals to their respective methods in response to changes in the Score
	Score.GaugeChanged.connect(_on_gauge_changed)
	Score.ComboChanged.connect(_on_combo_changed)
	Score.BossHealthChanged.connect(_on_boss_health_changed)
	Score.PlayerHealthChanged.connect(_on_player_health_changed)

	#[KS]
	#[_on_gauge_changed]
	#[Changes the GaugeBar and the GaugeTotalLabel upon change of the gauge value on score]
	# signal connected to GaugeChanged from Score

# Signal handler for when the gauge value in Score changes
func _on_gauge_changed():
	# Updating the GaugeBar and GaugeTotalLabel based on Score's gauge value
	$GaugeBar.value = Score.getGauge()
	$GaugeBar.get_node("GaugeTotalLabel").text = "Gauge: " + str(Score.getGauge())

	#[KS]
	#[_on_combo_changed]
	#[Changes the ComboTotalLabel upon change of the combo value on score]
	# signal connected to ComboChanged from Score	

# Signal handler for when the combo value in Score changes
func _on_combo_changed():
	# Updating the ComboTotalLabel based on Score's combo value
	#$ComboTotalLabel.text = "Combo: " + str(Score.combo)
	$ComboTotalLabel.text = "Combo: " + str(Score.getCombo())
	
# Signal handler for when the boss health value in Score changes
func _on_boss_health_changed():
	# Updating the BossHealthBar based on Score's boss health value
	$BossHealthBar.value = Score.getBossHealth()

# Signal handler for when the player health value in Score changes
func _on_player_health_changed():
	# Updating the PlayerHealthBar and PlayerHealthLabel based on Score's player health value
	$PlayerHealthBar.value = Score.getPlayerHealth()
	$PlayerHealthLabel.text = "Player Health: " + str(Score.getPlayerHealth())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
