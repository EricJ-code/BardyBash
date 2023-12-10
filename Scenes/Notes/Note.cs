using Godot;
using System;

// Note class extends Node2D for 2D game functionality
public partial class Note : Node2D
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
        // Adjust the position of the note, creating a downward movement
		Position += new Vector2(0,300*(float)delta);
	}
}
