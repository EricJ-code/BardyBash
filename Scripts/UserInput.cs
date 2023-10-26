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
                GD.Print("T was pressed");
            }

            if (keyEvent.Keycode == Key.Right)
            {
                GD.Print("T was pressed");
            }

             if (keyEvent.Keycode == Key.Up)
            {
                GD.Print("T was pressed");
            }

             if (keyEvent.Keycode == Key.Down)
            {
                GD.Print("T was pressed");
            }

            if (keyEvent.Keycode == Key.Q)
            {
                GD.Print("T was pressed");
            }

            if (keyEvent.Keycode == Key.W)
            {
                GD.Print("T was pressed");
            }

            if (keyEvent.Keycode == Key.E)
            {
                GD.Print("T was pressed");
            }
            if (keyEvent.Keycode == Key.R)
            {
                GD.Print("T was pressed");
            }
        }
    }
}