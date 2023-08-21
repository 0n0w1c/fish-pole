-- swaps the placer for the pole
script.on_event(defines.events.on_built_entity, function(event)
    local _entity = event.created_entity or event.entity

    if _entity.name == "fish-pole-placer" then
        _entity.surface.create_entity{name="fish-pole", position=_entity.position, direction=_entity.direction, force=_entity.force, fast_replace=true, spill=false, raise_built=true, create_build_effect_smoke=false}
        _entity.destroy()
    end
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
    local _entity = event.created_entity or event.entity

    if _entity.name == "fish-pole-placer" then
        _entity.surface.create_entity{name="fish-pole", position=_entity.position, direction=_entity.direction, force=_entity.force, fast_replace=true, spill=false, raise_built=true, create_build_effect_smoke=false}
        _entity.destroy()
    end
end)

local function modify_blueprint(event)
	local player = game.players[event.player_index]
	local bp = player.blueprint_to_setup

	if bp.valid_for_read == false then
		local cursor = player.cursor_stack
		if cursor and cursor.valid_for_read then
			bp = cursor
		end
	end

	if bp ~= nil and bp.valid_for_read == true then
        local _entities = bp.get_blueprint_entities()

		for index, entity in pairs(_entities) do
            if entity.name == "fish-pole" then
                _entities[index].name = "fish-pole-placer"
            end
        end
        bp.set_blueprint_entities(_entities)
	end
end

local function on_setup(event)
  modify_blueprint(event)
end

local function on_configure(event)
  modify_blueprint(event)
end

script.on_event(defines.events.on_player_setup_blueprint, on_setup)
script.on_event(defines.events.on_player_configured_blueprint, on_configure)
