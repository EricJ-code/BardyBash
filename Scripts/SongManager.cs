using Godot;
using System;
using System.Net;
using Melanchall.DryWetMidi.Core;
using Melanchall.DryWetMidi.Interaction;
using Melanchall.DryWetMidi.Multimedia;
using System.Windows.Markup;
using System.Collections.Generic;


public partial class SongManager : Node
{
	public Spawner spawner;
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
		spawner = GetNode<Node2D>("Spawner") as Spawner;
		ReadFromFile();
		
	}


		

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		double time = (Time.GetTicksUsec() - _timeBegin) / 1000000.0d;
		time = Math.Max(0.0d, time - _timeDelay);
		//GD.Print(string.Format("Time is: {0}", time));

		if (spawnIndex < timestamps.Count)
		{
			if (GetAudioSourceTime() >= timestamps[spawnIndex] - Instance.noteTime)
            {
                spawner.spawn();
                //notes.Add(note.GetComponent<Note>());
                //note.GetComponent<Note>().assignedTime = (float)timeStamps[spawnIndex];
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

		GD.Print(array);
		SetTimeStamps(array);
		StartSong();
	}

	public void StartSong() {
		audioStreamPlayer.Play();
	}

	public static double GetAudioSourceTime() {
		// first part should be correct but second part takes in frequency where to get this value??
		//return Instance.audioStreamPlayer.GetPlaybackPosition() / Instance.audioStreamPlayer.frequency;
		return 0;
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
