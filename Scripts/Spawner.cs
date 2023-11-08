using Godot;
using System;

public partial class Spawner : Node2D
{
	// Called when the node enters the scene tree for the first time.
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
		private Godot.Node note;

	public override void _Ready()
	{
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
	
	public void spawn(){
		AddChild(note);
		GD.Print("Parent", note.GetParent());
	}

}
