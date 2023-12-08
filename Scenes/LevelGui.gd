extends Control
#onload var gauge_bar = $GaugeBar



# Called when the node enters the scene tree for the first time.
func _ready():
	
	Score.GaugeChanged.connect(_on_gauge_changed)
	Score.ComboChanged.connect(_on_combo_changed)
	Score.BossHealthChanged.connect(_on_boss_health_changed)
	Score.PlayerHealthChanged.connect(_on_player_health_changed)

	#[KS]
	#[_on_gauge_changed]
	#[Changes the GaugeBar and the GaugeTotalLabel upon change of the gauge value on score]
	# signal connected to GaugeChanged from Score
func _on_gauge_changed():
	$GaugeBar.value = Score.getGauge()
	$GaugeBar.get_node("GaugeTotalLabel").text = "Gauge: " + str(Score.getGauge())

	#[KS]
	#[_on_combo_changed]
	#[Changes the ComboTotalLabel upon change of the combo value on score]
	# signal connected to ComboChanged from Score	
func _on_combo_changed():
	#$ComboTotalLabel.text = "Combo: " + str(Score.combo)
	$ComboTotalLabel.text = "Combo: " + str(Score.getCombo())
	
func _on_boss_health_changed():
	$BossHealthBar.value = Score.getBossHealth()

func _on_player_health_changed():
	$PlayerHealthBar.value = Score.getPlayerHealth()
	$PlayerHealthLabel.text = "Player Health: " + str(Score.getPlayerHealth())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
