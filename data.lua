local fish_pole=table.deepcopy(data.raw["electric-pole"]["big-electric-pole"])

fish_pole.name = "fish-pole"
fish_pole.icon =  "__fish-pole__/graphics/icons/fish-pole.png"
fish_pole.icon_mipmaps = 0
fish_pole.minable = {mining_time = 0.5, result = "fish-pole"}
fish_pole.selection_box = {{-0.4, -0.4}, {0.4, 0.4}}
fish_pole.drawing_box = {{0.0, 0.0}, {0.0, 0.0}}
fish_pole.collision_box = {{0.0, 0.0}, {0.0, 0.0}}
fish_pole.collision_mask = {"ground-tile", "colliding-with-tiles-only"}

if not settings.startup["show_wire_conenctions"].value then
  fish_pole.draw_copper_wires=false
  fish_pole.draw_circuit_wires=false
end

fish_pole.maximum_wire_distance = settings.startup["wire_reach"].value
fish_pole.supply_area_distance = settings.startup["supply_width"].value / 2

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
          copper = util.by_pixel_hr(6, 6),
          red = util.by_pixel_hr(0, 0),
          green = util.by_pixel_hr(-6, -6)
        },
        wire =
        {
          copper = util.by_pixel_hr(6, 6),
          red = util.by_pixel_hr(0, 0),
          green = util.by_pixel_hr(-6, -6)
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
