using Godot;
using System;
using Melanchall.DryWetMidi.Multimedia;
using Melanchall.DryWetMidi.Core;
using Melanchall.DryWetMidi.Interaction;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading;



public partial class textNoteTranslation : Godot.Node2D
{

	MidiFile midiFile;

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		midiFile = MidiFile.Read("Music/DummySong.mid");

		List<string> noteEvents = new List<string>();
		
		foreach (var x in midiFile.GetTrackChunks()) {
			GD.Print(x);
			foreach (var y in x.GetTimedEvents()){
				if(y.ToString().Contains("Note")){
					noteEvents.Add(y.ToString());
				}
			}
		}
		using (StreamWriter outputFile = new StreamWriter(Path.Combine("Music/BeatMaps", "WriteLines.txt"))){
			foreach (string line in noteEvents)
				outputFile.WriteLine(line);
			outputFile.Close();
		}

		var timing = 0;
		var timing2 = 0;

		using (StreamReader beatMapReader = new StreamReader(Path.Combine("Music/BeatMaps","WriteLines.txt"))){
			for (int i = 0; i < noteEvents.Count; i++)
			{
				if(noteEvents[i].Contains("On")){
					GD.Print("Note On");
					timing = noteEvents[i].Split(' ',':')[2].ToInt();
					timing2 = noteEvents[i-1].Split(' ',':')[2].ToInt();
					int sleepTime = timing2 - timing;
					//Thread.Sleep(sleepTime);
				}
			}
			/*
			foreach(string line in noteEvents)
				if( line.Contains("On")){
					GD.Print("Note On");
					var split = line.Split(' ',':');
					timing = split[2].ToInt();
					Thread.Sleep(timing);
				}
				else if( line.Contains("Off"))
					GD.Print("Note Off");
		*/
		}
		
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
/*
This is a comment

var delta_sum_ := 0.0

var left := []

onready var stuff := {
	60: {
		"color": Color.purple,
		"key": "left",
		"node": get_node("buttons/left"),
		"queue": []
	},
	61: {
		"color": Color.aqua,
		"key": "up",
		"node": get_node("buttons/up"),
		"queue": []
	},
	62: {
		"color": Color.blue,
		"key": "down",
		"node": get_node("buttons/down"),
		"queue": []
	},
	63: {
		"color": Color.red,
		"key": "right",
		"node": get_node("buttons/right"),
		"queue": []
	}
}

var animation := {
	36: {
		"call": "kick",
	},
	37: {
		"call": "snare",
	},
	38: {
		"call": "hat_closed",
	},
	39: {
		"call": "hat_open",
	}
}

var animation_queue := []

func _ready() -> void:
	for s in stuff.values():
		s.node.color = s.color

func _process(delta):
	delta_sum_ += delta
	
	for s in stuff.values():
		if Input.is_action_just_pressed(s.key):
			if not s.queue.empty():
				if s.queue.front().test_hit(delta_sum_):
					s.queue.pop_front().hit(s.node.global_position)
					print("hit")
				else:
					print("TOO EARLY")
			else:
				print("WUT??")
				
		if not s.queue.empty():
			if s.queue.front().test_miss(delta_sum_):
				s.queue.pop_front().miss()
				print("miss")

	for s in stuff.values():
		s.node.pressed = Input.is_action_pressed(s.key)
	
	if delta_sum_ >= 1.0 and not $music.playing:
		$music.play()
		$midi2.play()

func _on_midi_event(channel, event):
	if channel.track_name == "animation":
		
		var s = stuff.get(event.note)
		
		if s and event.type == 1:
			var i = preload("res://note.tscn").instance()
			add_child(i)
			i.expected_time     = delta_sum_ + 1.0
			i.global_rotation   = s.node.global_rotation
			i.global_position.y = -400
			i.global_position.x = s.node.global_position.x
			i.color             = s.color
			s.queue.push_back(i)

func _on_midi2_event(channel, event):
	if channel.track_name == "animation":
		var a = animation.get(event.note)
		if a and event.type == 1:
			$drum.call(a.call)

*/
