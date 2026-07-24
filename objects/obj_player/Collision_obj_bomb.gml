player_health -= 1;

instance_create_layer(
	other.x,
	other.y,
	"Instances",
	obj_explosion
);

with(other)
{
	instance_destroy();
}

