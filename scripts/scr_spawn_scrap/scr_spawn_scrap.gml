function spawn_scrap(_count)
{
	var spawned_count = 0;

    for (var i = 0; i < _count; i++)
    {
		var pos = find_spawn_position(obj_scrap);

		if (pos == noone)
		{
			break;
		}
		
        instance_create_layer(
            pos.x,
            pos.y,
            "Instances",
            obj_scrap
        );

		spawned_count += 1;
    }

	return spawned_count;
}
