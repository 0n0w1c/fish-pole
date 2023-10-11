local fish_pole=table.deepcopy(data.raw["electric-pole"]["big-electric-pole"])

fish_pole.name = "fish-pole"
fish_pole.icon_mipmaps = 0
fish_pole.minable = {mining_time = 0.5, result = "fish-pole"}
fish_pole.collision_mask = {"ground-tile", "colliding-with-tiles-only"}

if settings.startup["show_wire_connections"].value then
    fish_pole.draw_copper_wires=true
    fish_pole.draw_circuit_wires=true
else
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
        wire =
        {
          copper = util.by_pixel_hr(0, 0),
          red = util.by_pixel_hr(4, 4),
          green = util.by_pixel_hr(-4, -4)
        },

        shadow =
        {
          copper = util.by_pixel_hr(0, 0),
          red = util.by_pixel_hr(4, 4),
          green = util.by_pixel_hr(-4, -4)
        }
      }
    }

    fish_pole.dying_explosion = nil
    fish_pole.corpse = nil
    fish_pole.damaged_trigger_effect = nil

data:extend { fish_pole }
