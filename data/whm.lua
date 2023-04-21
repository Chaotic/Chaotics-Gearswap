include('organizer-lib')
organizer_items = {
    warp="Instant Warp",
    echos="Echo Drops",
    invis="Prism Powder",
    sneak="Silent Oil",
    shihei="Shihei",
    choco="Chocobo Whistle",
    nexus="Nexus Cape",
    warpring="Warp Ring",
    xpring="Empress Band",
  }

function get_sets()
	
	mote_include_version = 2
	include('Mote-Include.lua')
	
end

function job_setup()
	include('Chaotic-include.lua')

end

function user_setup()

	state.OffenseMode:options('Normal', 'Acc')
	state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Normal', 'PDT', 'MDT')
    
  initialize_crafting_mode(player.name)


end

function user_unload()

    windower.send_command('sta !packets on')

end
function job_post_midcast(spell, action, spellMap, eventArgs)

	if spellMap == 'Cure' and spell.target.type == 'SELF' then
		equip(sets.midcast.CureSelf)
	end
	
end

function job_post_aftercast(spell, action, spellMap, eventArgs)
send_command('gs c update')
end

function job_midcast(spell, action, spellMap, eventArgs)
	
	if spell.skill == 'Enfeebling Magic' then
		equip(sets.midcast[spell.skill][spell.type])
	else 
		equip(sets.midcast[spell.skill])
    end
	
end

function job_state_change(stateField, newValue, oldValue)

	if stateField == 'Offense Mode' then
		if newValue == 'None' then
			enable('main', 'sub', 'range')
		else
			disable('main', 'sub', 'range')
		end
	end
	
end

function display_current_job_state(eventArgs)

	display_current_caster_state()
	eventArgs.handled = true
	
end
function customize_idle_set(idleSet)

  crafting_mode = state.CraftingMode.value
  if (state.CastingMode.value ~= 'Combat' and state.CastingMode.value ~= 'Combat') then 
 --   idleSet = set_combine(idleSet,{main="Terra's staff",sub="Raptor leather strap +1"})
  end
  idleSet = maybe_equip_crafting(idleSet,crafting_mode)
  return idleSet

end

function job_buff_change(buff,gain)
  
	handle_standard_buffs(buff,gain)
  
  end