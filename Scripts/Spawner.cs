using Godot;
using System;

public partial class Spawner : Node2D
{
	// Called when the node enters the scene tree for the first time.
    // Path to the player scene
	[Export]
	private string playerPath = "res://Tscns/Note.tscn"; // Path to your scene

	//public override void _Ready()
	
	//{
		//string path = "res://Scenes/Notes/Note.tscn";
		
		//string path = "res://Scenes/Notes/Note.tscn";
		//PackedScene packedScene = GD.Load<PackedScene>(path);
		//Node2D note = packedScene.Instatiate<Node2D>();
		//spawn(note);
	//}
		//var scene = ResourceLoader.Load<PackedScene>(playerPath ).Instantiate();
    	
		// Reference to the instantiated player scene
		private Godot.Node note;

    // Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
        // Load the player scene and instantiate it
		note = ResourceLoader.Load<PackedScene>(playerPath ).Instantiate();
		//spawn();
	}
	// Called every frame. 'delta' is the elapsed time since the previous frame.

	public override void _Process(double delta)
	{


	}
	
	/*
	public void spawn(Godot.Node node){
		AddChild(note);
	}

*/

    // Spawn the player scene by adding it as a child to this node
	public void spawn(){
		AddChild(note);
		GD.Print("Parent", note.GetParent());
	}

}
