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
		/*
		Eric Estadt
		10.2.2023
		In reference to below also commented
		Goal:
			Trying to play music along side with the print "Note On"
			Inorder to see if we can use to spawn note.
			Will do more research soon.
			May need to use async inorder to play but not interrupt gameplay.
		*/
		/*
		using (var outputDevice = OutputDevice.GetByName("Microsoft GS Wavetable Synth"))
		{
			midiFile.Play(outputDevice);
			var playback = midiFile.GetPlayback(outputDevice);
			playback.Start();
		}
		*/
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
		/*
		Eric Estadt
		10.2.2023
		Comment in reference to below also commented
		Quick proof of of concept code.
		Will print out the note events and wait times accordingly.
		May need more work. Must calc proper wait times to compare.
		Still needs some work may need to implement async waits.
		*/
		var timing = 0;
		var timing2 = 0;
		for (int i = 2; i < noteEvents.Count -1 ; i++)
			{
				if(noteEvents[i].Contains("On")){
					GD.Print("Note On");
					timing = noteEvents[i-2].Split(' ',':')[2].ToInt();
					timing2 = noteEvents[i].Split(' ',':')[2].ToInt();
					int sleepTime = timing2 - timing;
					GD.Print("WAIT: "+ sleepTime);
					//Thread.Sleep(sleepTime);
				}
				else if( noteEvents[i].Contains("Off"))
					GD.Print("Note Off");
			}
		/*
		Eric Estadt
		10.2.2023
		Comment in reference to below also commented
		We may eventually need to just read the beatmaps as opposed to
		writing them thus the reader.
		the for loop that follows is a debug tool to track Notes On and Notes Off
		*/
		/*
		using (StreamReader beatMapReader = new StreamReader(Path.Combine("Music/BeatMaps","WriteLines.txt"))){


			beatMapReader.Close();
		}
					
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
