using Godot;
using System;

public partial class Score : Node
{
	[Signal]
	public delegate void GaugeChangedEventHandler();
	[Signal]
	public delegate void ComboChangedEventHandler();

	private int gauge = 0;
	private int combo = 0;
	private int multiplier = 1;

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{

	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
	public int getGauge()
	{
		return gauge;
	}
	public int getCombo()
	{
		return combo;
	}
	public void add_gauge(int amt){
	
		gauge += amt * multiplier;
		GD.Print(gauge);
		EmitSignal(SignalName.GaugeChanged);
	}
	public void reset_combo()
	{
	

		combo = 0;
		EmitSignal(SignalName.ComboChanged);
	}
	public void add_combo()
	{
		

		combo +=1;
		EmitSignal(SignalName.ComboChanged);
	}

	public void spend_gauge(int amt)
	{
	
		gauge -= amt;
		EmitSignal(SignalName.GaugeChanged);
	}
}
