-- insert the recipe to unlock
table.insert(data.raw['technology']['electric-energy-distribution-1'].effects, {type = "unlock-recipe", recipe = "fish-pole"})
if data.raw['technology']['electric-energy-distribution-1'].researched then
    data.raw['recipe']['fish-pole'].enabled = true
end
