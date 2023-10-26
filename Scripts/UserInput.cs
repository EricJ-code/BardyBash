//The following code is in C#:

using Godot;
using System;

public partial class UserInput : Godot.Node
{
    public override void _Input(InputEvent @event)
    {
        if (@event is InputEventKey keyEvent && keyEvent.Pressed)
        {
            if (keyEvent.Keycode == Key.Left)
            {
                GD.Print("R was pressed");
            }

            if (keyEvent.Keycode == Key.Right)
            {
                GD.Print("W was pressed");
            }

             if (keyEvent.Keycode == Key.Up)
            {
                GD.Print("E was pressed");
            }

             if (keyEvent.Keycode == Key.Down)
            {
                GD.Print("Q was pressed");
            }

            if (keyEvent.Keycode == Key.Q)
            {
                GD.Print("Down was pressed");
            }

            if (keyEvent.Keycode == Key.W)
            {
                GD.Print("Left was pressed");
            }

            if (keyEvent.Keycode == Key.E)
            {
                GD.Print("Up was pressed");
            }
            if (keyEvent.Keycode == Key.R)
            {
                GD.Print("Right was pressed");
            }
        }
    }
}
