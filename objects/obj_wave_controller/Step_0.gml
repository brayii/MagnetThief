if (wave_active && scrap_needed <= 0)
{
	wave_active = false;

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
	wave_active = (scrap_needed > 0);
}

