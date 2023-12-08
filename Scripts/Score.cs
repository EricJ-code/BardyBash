using Godot;
using System;

public partial class Score : Node
{
	// [KS]
// [Score]
// [This singleton class is used to handle the scoring system of the game.
//This class tracks the current combo points and current guage score of the current level, and contains the methods used to add and remove them
// as well as global emit signals to track when the combo and gauge has changed]
// Methods
// addGauge: this method increases the gauge used to spend on abilities
// spendGauge: this method decreases the gauge used to spend on abilities
// addCombo: this method increases the combo by 1
// resetCombo: this method sets the combo to 0
// increaseMultiplier: this method increases the bonus multiplier for the gauge addition
// resetMultiplier: this method sets the bonus multiplier to 1
// GaugeChangedEventHandler: signal emit handler for the gauge changing
// ComboChangeEventHandler: signal emit handler for the combo changing

	[Signal]
	public delegate void GaugeChangedEventHandler();
	[Signal]
	public delegate void ComboChangedEventHandler();

	[Signal]
	public delegate void PlayerHealthChangedEventHandler();
	[Signal]
	public delegate void BossHealthChangedEventHandler();
	private int gauge = 0;
	private int combo = 0;
	private int multiplier = 1;
	private int bossHealth = 10;
	private int playerHealth = 100;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{

	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
	//[KS]
	//[getGauge]
	//[Returns the current gauge value]
	// paramters: None
	// return: gauge
	
	public int getGauge()
	{
		return gauge;
	}
		//[KS]
	//[getCombo]
	//[Returns the current combo value]
	// paramters: None
	// return: combo
	public int getCombo()
	{
		return combo;
	}
	// [KS]
	// [addGauge]
	// [Adds the specified amount multiplied by the current bonus multiplier. Emits a GaugeChanged signal to be read by the GUI]
	// params
	// amt: this is the base amount of points to add to the gauge
	// emit: GaugeChanged
	public void addGauge(int amt){
	
		gauge += amt * multiplier;
		//GD.Print(gauge);
		EmitSignal(SignalName.GaugeChanged);
	}
	// [KS]
	// [resetCombo]
	// [Sets combo to 0 for broken combo. Emits a ComboChanged signal to be read by the GUI]
	// emit: ComboChange
	public void resetCombo()
	{
		combo = 0;
		EmitSignal(SignalName.ComboChanged);
	}

	// [KS]
	// [addCombo]
	// [Increments the combo by 1. Emits a ComboChanged signal to be read by the GUI]
	// emit: ComboChanged
	public void addCombo()
	{
		

		combo +=1;
		EmitSignal(SignalName.ComboChanged);
	}
	// [KS]
	// [spentGauge]
	// [Decreases the gauge by the selected amount. Emits a ComboChanged signal to be read by the GUI]
	// params:
	// amt: this is the amount to reduce by
	// emit: GaugeChanged
	public void spendGauge(int amt)
	{
	
		gauge -= amt;
		EmitSignal(SignalName.GaugeChanged);
	}
	// [KS]
	// [increaseMultiplier]
	// [Sets the multiplier to double.]

	public void increaseMultiplier(){
		multiplier = 2;

	}

	// [KS]
	// [resetMultiplier]
	// [Sets the multiplier to 1.]
	public void resetMultiplier(){
		multiplier = 1;
	}
	public void heal(){
		playerHealth =100;
		EmitSignal(SignalName.PlayerHealthChanged);

	}
	public void takeDamage(int amt)
	{
		playerHealth -= amt;
		EmitSignal(SignalName.PlayerHealthChanged);

	}
	public void damageBoss(int amt){
		bossHealth -= amt;
		EmitSignal(SignalName.BossHealthChanged);


	}
	public int getBossHealth(){
		return bossHealth;
	}
	public int getPlayerHealth(){
		return playerHealth;
	}
	public void startScore(){
		gauge = 0;
		combo = 0;
		multiplier = 1;
		bossHealth = 10;
		playerHealth = 100;
	}
}
