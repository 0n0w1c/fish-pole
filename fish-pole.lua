-- fish_pole.lua

local effects =
  {
      type = "unlock-recipe",
      recipe = "fish-pole"
  }

if mods['cargo-ships'] then
    table.insert(data.raw['technology']['oversea-energy-distribution'].effects, effects)
    data.raw['recipe']['floating-electric-pole'].subgroup = 'energy-pipe-distribution'
else
    table.insert(data.raw['technology']['electric-energy-distribution-1'].effects, effects)
end

local fish_pole=table.deepcopy(data.raw["electric-pole"]["big-electric-pole"])

fish_pole.name = "fish-pole"
fish_pole.icon = data.raw["capsule"]["raw-fish"].icon
fish_pole.icon_mipmaps = 0
fish_pole.minable = {mining_time = 0.5, result = "fish-pole"}
fish_pole.drawing_box = {{-0.5, -0.5}, {0.5, 0.5}}
-- LightedPolesPlus ignores electric-poles without wires
--fish_pole.draw_copper_wires=false
--fish_pole.draw_circuit_wires=false
fish_pole.collision_mask = {"ground-tile", "colliding-with-tiles-only"}

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

--		order = "a[energy]-bb[medium-electric-pole]",

data:extend({
	{
		type = "item",
		name = "fish-pole",
		icon = fish_pole.icon,
		icon_size = 64,
		subgroup = "energy-pipe-distribution",
		order = "a[energy]-bb[transformer]",
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
