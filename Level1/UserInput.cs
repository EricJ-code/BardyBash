// C# script to handle user input for the game using the Godot game engine.

using Godot;
using System;

public partial class UserInput : Godot.Node
{
	// Override the _Input method to handle input events
	public override void _Input(InputEvent @event)
	{
        // Check if the input event is a key event and if the key is pressed
		if (@event is InputEventKey keyEvent && keyEvent.Pressed)
		{
            // Check for specific keycodes and print corresponding messages
			if (keyEvent.Keycode == Key.Left)
			{
				GD.Print("Left was pressed");
			}

			if (keyEvent.Keycode == Key.Right)
			{
				GD.Print("Right was pressed");
			}

			 if (keyEvent.Keycode == Key.Up)
			{
				GD.Print("Up was pressed");
			}

			 if (keyEvent.Keycode == Key.Down)
			{
				GD.Print("Down was pressed");
			}

			if (keyEvent.Keycode == Key.Q)
			{
				GD.Print("Q was pressed");
			}

			if (keyEvent.Keycode == Key.W)
			{
				GD.Print("W was pressed");
			}

			if (keyEvent.Keycode == Key.E)
			{
				GD.Print("E was pressed");
			}
			if (keyEvent.Keycode == Key.R)
			{
				GD.Print("R was pressed");
			}
		}
	}
}
