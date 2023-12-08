using Godot;
using System;
using System.Net;
using Melanchall.DryWetMidi.Core;
using Melanchall.DryWetMidi.Interaction;
using Melanchall.DryWetMidi.Multimedia;
using System.Windows.Markup;
using System.Collections.Generic;
using System.Data;
using System.Runtime.Serialization;
using System.Linq;

public partial class SongManager : Node
{
	public static SongManager Instance;
	AudioStreamPlayer audioStreamPlayer;
	public float songDelayInSeconds;
	public int inputDelayInMilliseconds;
	public string fileLocation;
	public float noteTime;
	public float noteSpawnY;
	public float noteTapY;
	public List<double> timestamps;

	public Dictionary<double, int> timestampToNote = new Dictionary<double, int>();
	GDScript blScript;

	[Signal]
	public delegate void NoteSpawnerEventHandler();

	int spawnIndex = 0;

	public Melanchall.DryWetMidi.MusicTheory.NoteName noteRestriction;
	public float noteDepsawnY
	{
		get
		{
			return noteTapY - (noteSpawnY - noteTapY);
		}
	}

	public static MidiFile midifile;

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		Instance = this;
		audioStreamPlayer = GetNode<AudioStreamPlayer>("AudioStreamPlayer");
		timestamps = new List<double>();
		blScript = (GDScript)GD.Load("res://Level1/Bullet.gd");

		ReadFromFile();
	}	


	List<GodotObject> Bullets = new List<GodotObject>(); // list of all bullets to spawn in song
	int counter = 1;
	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		//GD.Print(GetAudioSourceTime() + " " +  (timestamps[spawnIndex] - Instance.noteTime)); // problem child
		
		if (spawnIndex < timestamps.Count)
		{
			
			if (GetAudioSourceTime() >= timestamps[spawnIndex] - Instance.noteTime)
			{	
				//if (timestampToNote.ContainsKey(GetAudioSourceTime()))
				// if (counter == 4) 
				// 	counter = 1;
				// else if (counter == 1 || counter == 3) 
				int difficulty = 4; // higher = easier
				if (timestampToNote[timestamps[spawnIndex] - Instance.noteTime] > 0) {
					if(spawnIndex % difficulty == 0 ){
						EmitSignal(SignalName.NoteSpawner, timestampToNote[timestamps[spawnIndex] - Instance.noteTime]);
					}
				}
				//GodotObject bullet = (GodotObject)blScript.New(); // This is a GodotObject
				//Bullets.Add(bullet); // assigns a note to the list of notes
				//bullet.Set("assignedTime", (float)timestamps[spawnIndex]);  // when to spawn the note
				
				
				GD.Print(spawnIndex);
				spawnIndex++;
				//GD.Print(Bullets.Count);
			}
		}
	}

	public void ReadFromFile()
	{
		midifile = MidiFile.Read("Music/Oscar-Sketch-2.mid");
		GetDataFromMidi();
	}

	public void GetDataFromMidi() {
		var notes = midifile.GetNotes();
		var array = new Melanchall.DryWetMidi.Interaction.Note[notes.Count];
		notes.CopyTo(array, 0);

		SetTimeStamps(array);

		//GD.Print(timestampToNote.Values);
		foreach (var note in timestampToNote) {
			//GD.Print("Key: " + note.Key);
			//GD.Print("Value: " + note.Value);
			// foreach (var noteName in note.Value) {
			// 	GD.Print(noteName);
			// }
		}
		StartSong();
	}

	public void StartSong() {
		Instance.audioStreamPlayer.Play();
	}


	
	public static double GetAudioSourceTime() {
		
		return Instance.audioStreamPlayer.GetPlaybackPosition() + AudioServer.GetTimeSinceLastMix() - AudioServer.GetOutputLatency();
		// (1536*8) = problem needs to be akin to Instance.audioSource.clip.frequency; but in godot
		//return Instance.audioStreamPlayer.GetPlaybackPosition() / (1536*8);
		
	}


	
	public void SetTimeStamps(Melanchall.DryWetMidi.Interaction.Note[] array) {
		foreach (var note in array)
		{
			//GD.Print(note.NoteName); // name of note
			
			//if (note.NoteName == Melanchall.DryWetMidi.MusicTheory.NoteName.C) {
				//Melanchall.DryWetMidi.
				var metricTimeSpan = TimeConverter.ConvertTo<MetricTimeSpan>(note.Time, midifile.GetTempoMap());
				var time = metricTimeSpan.Minutes * 60f + metricTimeSpan.Seconds + metricTimeSpan.Milliseconds / 1000f;

				if (timestampToNote.ContainsKey(time)) {
					timestampToNote[time] += 1;
				//	timestampToNote[time] = timestampToNote[time].Concat(new Melanchall.DryWetMidi.MusicTheory.NoteName[] {note.NoteName}).ToArray();
				} else {
					timestampToNote.Add(time, 1);
					//timestampToNote.Add(time, new Melanchall.DryWetMidi.MusicTheory.NoteName[] {note.NoteName});
				}

				timestamps.Add(time);
			//}
		}
	}	

}
