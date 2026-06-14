function spawn_wave(_wave)
{
    var scrap_count = 10 + (_wave * 2);
    var bomb_count = 2 + _wave;

    spawn_scrap(scrap_count);
    spawn_bombs(bomb_count);
}