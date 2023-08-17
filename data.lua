local fish_pole=table.deepcopy(data.raw["electric-pole"]["big-electric-pole"])

fish_pole.name = "fish-pole"
fish_pole.icon =  "__fish-pole__/graphics/icons/fish-pole.png"
fish_pole.icon_mipmaps = 0
fish_pole.minable = {mining_time = 0.5, result = "fish-pole"}
fish_pole.drawing_box = {{-0.5, -0.5}, {0.5, 0.5}}
fish_pole.draw_copper_wires=false
fish_pole.draw_circuit_wires=false
fish_pole.collision_mask = {"ground-tile", "colliding-with-tiles-only"}
fish_pole.scale=0.5
fish_pole.pictures =
    {
      layers =
      {
        {
            filename = "__base__/graphics/entity/fish/fish-1.png",
            priority = "low",
            width = 22,
            height = 36,
            direction_count = 1,
            hr_version =
            {
                filename = "__base__/graphics/entity/fish/fish-2.png",
                priority = "low",
                width = 32,
                height = 32,
                direction_count = 1
            }
        }
	    }
    }

fish_pole.connection_points =
    {
      {
        shadow =
        {
          copper = util.by_pixel_hr(0, 0),
          red = util.by_pixel_hr(0, 0),
          green = util.by_pixel_hr(0, 0)
        },
        wire =
        {
          copper = util.by_pixel_hr(0, 0),
          red = util.by_pixel_hr(0, 0),
          green = util.by_pixel_hr(0, 0)
        }
      }
    }

data:extend({
	{
		type = "item",
		name = "fish-pole",
		icon = fish_pole.icon,
		icon_size = 64,
		subgroup = "energy-pipe-distribution",
		order = "b",
		place_result = "fish-pole",
		stack_size = 50
	},
	{
		type = "recipe",
		name = "fish-pole",
		enabled = "false",
		ingredients = 
		{
			{"big-electric-pole", 1},
			{"raw-fish", 1}
		},
		result = "fish-pole"
	},
	fish_pole,
})
