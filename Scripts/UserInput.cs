// //The following code is in C#:

// using Godot;
// using System;

// public class UserInput : Node
// {
//     public override void _Process(float delta)
//     {
//         // Check for arrow keys
//         Vector2 movement = new Vector2(0, 0);
//         if (Input.IsActionPressed("ui_right"))
//             movement.x += 1;
//         if (Input.IsActionPressed("ui_left"))
//             movement.x -= 1;
//         if (Input.IsActionPressed("ui_down"))
//             movement.y += 1;
//         if (Input.IsActionPressed("ui_up"))
//             movement.y -= 1;

//         // Check for Q, W, E, R keys
//         if (Input.IsActionPressed("q_key"))
//         {
//             // Do something when Q is pressed
//             GD.Print("Q key is pressed. Performing an action up arrow");
//         }
//         if (Input.IsActionPressed("w_key"))
//         {
//             // Do something when W is pressed
//             GD.Print("W key is pressed. Performing an action right left arrow");
//         }
//         if (Input.IsActionPressed("e_key"))
//         {
//             // Do something when E is pressed
//             GD.Print("E key is pressed. Performing an action down arrow");
//         }
//         if (Input.IsActionPressed("r_key"))
//         {
//             // Do something when R is pressed
//             GD.Print("R key is pressed. Performing an action right arrow");
//         }

//     }
// }


// connect to 2d node when possible

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