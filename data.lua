local fish_pole=table.deepcopy(data.raw["electric-pole"]["big-electric-pole"])

fish_pole.name = "fish-pole"
fish_pole.icon =  "__fish-pole__/graphics/icons/fish-pole.png"
fish_pole.icon_mipmaps = 0
fish_pole.minable = {mining_time = 0.5, result = "fish-pole-placer"}
fish_pole.collision_mask = {"ground-tile", "colliding-with-tiles-only"}

fish_pole.placeable_by = {item = "fish-pole-placer", count = 1}

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
          copper = util.by_pixel_hr(0, 0),
          red = util.by_pixel_hr(4, 4),
          green = util.by_pixel_hr(-4, -4)
        },
        wire =
        {
          copper = util.by_pixel_hr(0, 0),
          red = util.by_pixel_hr(4, 4),
          green = util.by_pixel_hr(-4, -4)
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
	stack_size = 50
},
{
	type = "recipe",
	name = "fish-pole",
	enabled = "true",
	hidden = "true",
	ingredients =
	{
		{"big-electric-pole", 1},
		{"raw-fish", 1}
	},
	result = "fish-pole"
},
fish_pole,
})

local fish_pole_placer = table.deepcopy(data.raw["electric-pole"]["fish-pole"])

fish_pole_placer.name = "fish-pole-placer"
fish_pole_placer.draw_copper_wires=true
fish_pole_placer.draw_circuit_wires=true

data:extend({
{
	type = "item",
	name = "fish-pole-placer",
	icon = fish_pole_placer.icon,
	icon_size = 64,
	subgroup = "energy-pipe-distribution",
	order = "b",
	place_result = "fish-pole-placer",
	stack_size = 50
},
{
	type = "recipe",
	name = "fish-pole-placer",
	enabled = "false",
	ingredients =
	{
		{"big-electric-pole", 1},
		{"raw-fish", 1}
	},
	result = "fish-pole-placer"
},
fish_pole_placer,
})
