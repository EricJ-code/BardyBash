//The following code is in C#:

using Godot;
using System;

public class UserInput : Node
{
    public override void _Process(float delta)
    {
        // Check for arrow keys
        Vector2 movement = new Vector2(0, 0);
        if (Input.IsActionPressed("ui_right"))
            movement.x += 1;
        if (Input.IsActionPressed("ui_left"))
            movement.x -= 1;
        if (Input.IsActionPressed("ui_down"))
            movement.y += 1;
        if (Input.IsActionPressed("ui_up"))
            movement.y -= 1;

        // Check for Q, W, E, R keys
        if (Input.IsActionPressed("q_key"))
        {
            // Do something when Q is pressed
            GD.Print("Q key is pressed. Performing an action up arrow");
        }
        if (Input.IsActionPressed("w_key"))
        {
            // Do something when W is pressed
            GD.Print("W key is pressed. Performing an action right left arrow");
        }
        if (Input.IsActionPressed("e_key"))
        {
            // Do something when E is pressed
            GD.Print("E key is pressed. Performing an action down arrow");
        }
        if (Input.IsActionPressed("r_key"))
        {
            // Do something when R is pressed
            GD.Print("R key is pressed. Performing an action right arrow");
        }

    }
}
