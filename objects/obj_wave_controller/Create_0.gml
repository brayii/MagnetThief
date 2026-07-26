run_score = 0;
wave = 1;
scrap_needed = 0;

if (!variable_global_exists("high_score"))
{
	global.high_score = 0;
}

global.last_score = 0;

//scrap_needed = spawn_wave(wave);
// Generated walls must exist before spawn positions are checked.
alarm[0] = 1;
//wave_active = (scrap_needed > 0);
