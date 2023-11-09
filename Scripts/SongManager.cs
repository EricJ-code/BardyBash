using Godot;
using System;
using System.Net;
using Melanchall.DryWetMidi.Core;
using Melanchall.DryWetMidi.Interaction;
using Melanchall.DryWetMidi.Multimedia;
using System.Windows.Markup;
using System.Collections.Generic;
using System.Data;

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

	private double _timeBegin;
	private double _timeDelay;

	public List<double> timestamps;

	GDScript MyGDScript;

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
		_timeBegin = Time.GetTicksUsec();
		_timeDelay = AudioServer.GetTimeToNextMix() + AudioServer.GetOutputLatency();
		timestamps = new List<double>();
		
		ReadFromFile();
		//spawner = GetNode<CharacterBody2D>("CharacterBody2D");
		// get a script attached to the node spawner
		MyGDScript = (GDScript)GD.Load("res://Level1/Shooter.gd");
		
	}	


	// List<Bullets> bullets = new list<Bullets>(); // list of all bullets to spawn in song
	
	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		double time = (Time.GetTicksUsec() - _timeBegin) / 1000000.0d;
		time = Math.Max(0.0d, time - _timeDelay);

		if (spawnIndex < timestamps.Count)
		{
			GD.Print(GetAudioSourceTime()); // problem child

			if (GetAudioSourceTime() >= timestamps[spawnIndex] - Instance.noteTime)
            {	
				EmitSignal(SignalName.NoteSpawner);
				
                //bullets.Add(bullet object); // assigns a note to the list of notes
                //bullet.assignedTime = (float)timeStamps[spawnIndex]; // when to spawn the note
                spawnIndex++;
            }
		}
	}

	public void ReadFromFile()
	{
		midifile = MidiFile.Read("Music/DummySong.mid");
		GetDataFromMidi();
	}

	public void GetDataFromMidi() {
		var notes = midifile.GetNotes();
		var array = new Melanchall.DryWetMidi.Interaction.Note[notes.Count];
		notes.CopyTo(array, 0);

		SetTimeStamps(array);
		GD.Print(timestamps.Count);
		StartSong();
	}

	public void StartSong() {
		audioStreamPlayer.Play();
	}


	
	public static double GetAudioSourceTime() {
		
		// (1536*8) = problem needs to be akin to Instance.audioSource.clip.frequency; but in godot
		return Instance.audioStreamPlayer.GetPlaybackPosition() / (1536*8);
		
	}


	
	public void SetTimeStamps(Melanchall.DryWetMidi.Interaction.Note[] array) {
		foreach (var note in array)
		 {
			if (note.NoteName == noteRestriction)
			{
				var metricTimeSpan = TimeConverter.ConvertTo<MetricTimeSpan>(note.Time, midifile.GetTempoMap());
				timestamps.Add((double)metricTimeSpan.Minutes * 60f + metricTimeSpan.Seconds + (double)metricTimeSpan.Milliseconds / 1000f);
			}
		 }
	}	

}