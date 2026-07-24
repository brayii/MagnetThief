function spawn_bombs(_count)
{
    for (var i = 0; i < _count; i++)
    {
	    var pos = find_spawn_position(obj_bomb);

		if (pos == noone)
		{
			break;
		}
		
        instance_create_layer(
            pos.x,
            pos.y,
            "Instances",
            obj_bomb
        );
    }
}
