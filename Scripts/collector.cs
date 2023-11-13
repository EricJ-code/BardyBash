using Godot;
using System;

public partial class collector : Node2D
{
	[Export]
	private string action ="";
	private int counter = 0;
	

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	public void spawnNote() {
		GetNode<Spawner>("Spawner").spawn();
	}

	public void collect() {
		// Use the input against the action variable.
	}
	public void _on_area_2d_area_entered(Area2D area) {
		//
		
		//test.printNumber();
		//score.add_gauge(1);
		//GD.Print(score.gauge);
		GD.Print("collide");
		// Replace with function body.
	}

	public void _on_area_2d_body_entered(Node body) {
	var score = GetNode<Score>("/root/Score");
		//GetNode<Score>("/root/Score").add_combo();

		//GD.Print(GetNode<Score>("/root/Score").gauge);
		score.addCombo();
		score.addGauge(1);
		
		GD.Print("This One");
	 }

}
