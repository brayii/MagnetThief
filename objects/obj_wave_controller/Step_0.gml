if (scrap_needed <= 0)
{
	with (obj_scrap)
	{
		instance_destroy();
	}

	with (obj_bomb)
	{
		instance_destroy();
	}

	wave += 1;
	scrap_needed = spawn_wave(wave);
}

