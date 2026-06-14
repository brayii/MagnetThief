if (scrap_needed <= 0)
{
    //show_message("Wave Complete!");

    wave += 1;
    scrap_needed = 10 + wave * 2;
	
	spawn_wave(wave);
}

