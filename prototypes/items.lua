local fish_pole =
{
    type = "item",
    name = "fish-pole",
    icon = "__fish-pole__/graphics/icons/fish-pole.png",
    icon_size = 64,
    subgroup = "energy-pipe-distribution",
    order = data.raw["electric-pole"]["big-electric-pole"].order .. "z",
    place_result = "fish-pole",
    stack_size = 50
}

data:extend { fish_pole }
