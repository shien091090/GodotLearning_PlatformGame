using Godot;
using System;

public partial class Player : Sprite2D
{
	[Export] private float speed;

	public override void _Ready()
	{
	}

	public override void _Process(double delta)
	{
		float movement = speed * (float)delta;
		if (Input.IsActionPressed("ui_up"))
			Position += new Vector2(0, -movement);

		if (Input.IsActionPressed("ui_down"))
			Position += new Vector2(0, movement);

		if (Input.IsActionPressed("ui_right"))
			Position += new Vector2(movement, 0);

		if (Input.IsActionPressed("ui_left"))
			Position += new Vector2(-movement, 0);
	}
}
