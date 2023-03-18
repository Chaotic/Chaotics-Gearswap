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
	food="melon pie"
  }

function get_sets()

	mote_include_version = 2
	
	include('Mote-Include.lua')

end

function job_setup()
	
	-- import useful shit
	include('Chaotic-include.lua')
	
	-- buff states
	state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
	state.Buff['Dark Arts']              = buffactive['Dark Arts'] or buffactive['Addendum: Black'] or false
	state.Buff['Light Arts']             = buffactive['Light Arts'] or buffactive['Addendum: White'] or false
	state.Buff['Celerity']               = buffactive['Celerity'] or false
	state.Buff['Alacrity']               = buffactive['Alacrity'] or false
	state.Buff['Focalization']           = buffactive['Focalization'] or false
	
	-- custom spell groups
	helixes 					= S{'Geohelix','Hydrohelix','Anemohelix','Pyrohelix','Cryohelix','Ionohelix','Noctohelix','Luminohelix'}
	sleeps  					= S{'Sleep', 'Sleep II', 'Sleepga', 'Sleepga II', 'Bind'}
	elemental_debuffs = S{'Burn','Choke','Shock','Rasp','Drown','Frost'}
	
	spikes            = S{'Blaze Spikes','Shock Spikes','Ice Spikes'}
	
	-- different spell skills for different arts
	dark_arts_skill   = S{'Elemental Magic','Dark Magic','Enfeebling Magic'}
	light_arts_skill  = S{'Divine Magic','Enhancing Magic','Healing Magic','Enfeebling Magic'}
	
	initialize_job()
	
	casting_mode = ''
	
	gear.main = player.equipment.main
	gear.sub = player.equipment.sub

end

function user_setup()

	state.CastingMode:options('Normal','Acc','TH')
    
	state.IdleMode:options('Normal','DW','Combat','CombatDW')
    state.OffenseMode:options('Normal','DW')
	state.RestingMode:options('Normal','DW')
  initialize_crafting_mode(player.name)
	
end
function user_unload()

    windower.send_command('sta !packets off')

end
function job_post_precast(spell,action,spellMap,eventArgs) 

  if spell.type:contains('Magic') then
  
	  if state.Buff['Dark Arts'] or  state.Buff['Light Arts'] then
		   equip({head="Argute mortarboard",feet="Scholar's loafers +1"})
	  end
	   
    if spell.element == world.weather_element and (state.Buff['Celerity'] or state.Buff['Alacrity']) then
      equip({feet="Argute loafers"})
    end
    
	end
	
end

function job_midcast(spell,action,spellMap,eventArgs)

	if spell.skill == 'Enfeebling Magic' then
		equip(sets.midcast[spell.skill][spell.type])
	else 
		equip(sets.midcast[spell.skill])
  end
	
end

function job_buff_change(buff,gain)

	handle_standard_buffs(buff,gain)
	
	if buff == "Sublimation: Activated" then
		handle_equipping_gear()
	end
	
	if buff == 'Elemental Seal' or buff == 'Focalization' then
		if gain then
			casting_mode = state.CastingMode.value
			if (state.CastingMode.value ~= 'Normal' or state.CastingMode.value ~= 'Combat') then
				send_command('gs c set CastingMode Normal')
			end
		else
			send_command('gs c set CastingMode '..casting_mode)
		end
	end
	
end

function job_get_spell_map(spell, default_spell_map)

  if spell.skill == 'Enfeebling Magic' and sleeps:contains(spell.english) then
    return 'Sleep'
  elseif spell.skill == 'Elemental Magic' and elemental_debuffs:contains(spell.english) then
    return 'EleEnfeebs'
  elseif spell.skill == 'Enhancing Magic' and spikes:contains(spell.english) then
    return 'Spikes'
  end
	
end

function job_post_midcast(spell,action,spellMap,eventArgs)

	-- midcast magic
	if spell.element == world.weather_element or spell.element == world.day_element then
		if spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic' then
			equip({waist="Hachirin-no-obi"})
		elseif spellMap == 'Cure' and world.weather_element ~= 'Dark' then
			equip({waist="Hachirin-no-obi"})
		end
	end
	
	-- argute loafers logic
	if state.Buff['Alacrity'] or state.Buff['Celerity'] then
		if (spell.skill == 'Healing Magic' or spell.skill == 'Enhancing Magic') and spell.element == world.weather_element then
			equip({feet="Argute loafers"})
		end
	end
	
	-- midcast logic
	if state.Buff['Dark Arts'] and dark_arts_skill:contains(spell.skill) and spell.skill ~= 'Elemental Magic' then
		equip({body="Scholar's gown +1"})
	elseif state.Buff['Light Arts'] and light_arts_skill:contains(spell.skill) then
		if spell.skill == 'Enhancing Magic' then
			equip({legs="Scholar's pants +1"})
			if spell.name == 'Phalanx' then
				equip({main="Crook"})
			end
		else
			equip({main="Crook",legs="Scholar's pants +1"})
		end
	end
	
	-- add grip if not engaged
	if state.CastingMode.value == 'Acc' then
		if player.status ~= 'Engaged' then
			equip(sets.grip[spell.element])
		end
	end
	
	if state.CastingMode.value == 'TH' then
		equip({main="Lotus katana"})
	end

end

function customize_idle_set(idleSet)

  crafting_mode = state.CraftingMode.value
	if state.Buff['Sublimation: Activated'] then
		idleSet = set_combine(idleSet,sets.sublimation)
		if daytime then
			idleSet = set_combine(idleSet,{ammo="Fenrir's stone"})
		end
	else
		if player.mpp > 95 then 
			idleSet = set_combine(idleSet,{main="Terra's staff"})
		end
		if daytime then 
			idleSet = set_combine(idleSet,{waist="Lycopodium sash"})
		end
	end
	idleSet = maybe_equip_crafting(idleSet,crafting_mode)

  return idleSet
	
end

function job_status_change(new,old,eventArgs)
	-- add_to_chat('job status change  new:'..new.. ': old:'..old.. ': eventArgs:'..eventArgs..':')
	if new == 'Engaged' then
	   if state.IdleMode.value ~= 'DW' then
		send_command('gs c set IdleMode Combat;gs c set CastingMode Combat')
	  else
		send_command('gs c set IdleMode CombatDW;gs c set CastingMode CombatDW')
	  end
	end
  end
  
  function custom_job_sub_job_change(new,old)
	--add_to_chat('custom job sub change  new:'..new.. ': old:'..old.. ':')
	if new == 'NIN' or new == 'DNC' then
	  if state.OffenseMode.value ~= 'DW' then
		send_command('gs c set OffenseMode DW')
	  end
	  if state.IdleMode.value ~= 'DW' then
		send_command('gs c set IdleMode DW')
	  end
	  if state.RestingMode.value ~= 'DW' then
		send_command('gs c set RestingMode DW')
	  end
	else
	  if state.OffenseMode.value ~= 'Normal' then
		send_command('gs c set OffenseMode Normal')
	  end
	  if state.IdleMode.value ~= 'Normal' then
		send_command('gs c set IdleMode Normal')
	  end
	  if state.RestingMode.value ~= 'Normal' then
		send_command('gs c set RestingMode Normal')
	  end
	end
  end

  -------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------
  -- Custom uber-handling of Helix
  function handle_helix()
    if areas.Cities:contains(world.area) then
      add_to_chat(122, 'Cannot use Healix in a city area.')
      return
    end
  
    local helixElement
  
        -- If we decided to use a storm, set that as the spirit element to cast.
    if world.weather_element ~= 'None' and (get_weather_intensity() > 0 or world.weather_element ~= elements.weak_to[world.day_element]) then
      if world.weather_element ~= 'Lightning' or world.day_element ~= 'Lightning' then
        helixElement = world.weather_element
      end
    else
      helixElement = world.day_element
    end
  
    local command = ''
  
      command = command..'input /ma "'..elements.helix_of[helixElement]..'" <t>;wait 4;'
  
    send_command(command)
    
  end