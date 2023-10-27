extends Control
#onload var gauge_bar = $GaugeBar



# Called when the node enters the scene tree for the first time.
func _ready():
	Test.printNumber()
	
	Score.GaugeChanged.connect(_on_gauge_changed)
	Score.ComboChanged.connect(_on_combo_changed)

func _on_gauge_changed():
	$GaugeBar.value = Score.getGauge()
	#$GaugeBar.get_node("GaugeTotalLabel").text = "Gauge: " + str(Score.getGauge())
	$GaugeBar.get_node("GaugeTotalLabel").text = "Gauge: " + str(Score.getGauge())
	pass
func _on_combo_changed():
	#$ComboTotalLabel.text = "Combo: " + str(Score.combo)
	$ComboTotalLabel.text = "Combo: " + str(Score.getCombo())
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
