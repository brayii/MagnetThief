/// @function build_level_from_map(_map, _cell_size, _start_x, _start_y)
/// @description Creates obj_wall instances from a text-grid map.
///
/// @param {Array<String>} _map
/// @param {Real} _cell_size
/// @param {Real} _start_x
/// @param {Real} _start_y

function build_level_from_map(_map, _cell_size, _start_x, _start_y)
{
    var _row_count = array_length(_map);

    for (var _row = 0; _row < _row_count; _row++)
    {
        var _line = _map[_row];
        var _column_count = string_length(_line);

        for (var _column = 0; _column < _column_count; _column++)
        {
            // GameMaker string positions begin at 1.
            var _symbol = string_char_at(_line, _column + 1);

            var _x = _start_x + (_column * _cell_size);
            var _y = _start_y + (_row * _cell_size);

            switch (_symbol)
            {
                case "#":
                case "A":
                case "B":
                case "C":
                case "E":
                    instance_create_layer(
                        _x,
                        _y,
                        "Instances_Obstacles",
                        obj_wall
                    );
                    break;
            }
        }
    }
}