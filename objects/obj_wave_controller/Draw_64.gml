draw_text(20, 20, "Score: " + string(run_score));
draw_text(20, 50, "Wave: " + string(wave));
draw_text(20, 80, "Scrap Needed: " + string(scrap_needed));

if (instance_exists(obj_player))
{
    var player = instance_find(obj_player, 0);

    draw_text(20, 110, "Health: " + string(player.player_health));
}
