function spawn_scrap(_count)
{
    for (var i = 0; i < _count; i++)
    {
		var pos =  find_spawn_position();
		
        instance_create_layer(
            pos.x,
            pos.y,
            "Instances",
            obj_scrap
        );
    }
}