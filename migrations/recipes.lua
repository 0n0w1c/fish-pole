for index, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    recipes["fish-pole"].enabled = technologies["electric-energy-distribution-1"].researched
end
