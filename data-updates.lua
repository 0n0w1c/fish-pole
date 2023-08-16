local effects = {
    type = "unlock-recipe",
    recipe = "fish-pole"
}

-- insert the recipe effect to unlock
if mods['cargo-ships'] then
    table.insert(data.raw['technology']['oversea-energy-distribution'].effects, effects)
    data.raw['recipe']['floating-electric-pole'].subgroup = 'energy-pipe-distribution'
    if data.raw['technology']['oversea-energy-distribution'].researched then
        data.raw['recipe']['fish-pole'].enabled = true
    end
else
    table.insert(data.raw['technology']['electric-energy-distribution-1'].effects, effects)
    if data.raw['technology']['electric-energy-distribution-1'].researched then
        data.raw['recipe']['fish-pole'].enabled = true
    end
end
