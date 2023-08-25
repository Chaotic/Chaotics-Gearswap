function get_sets()

  mote_include_version = 2

  include('Chaotic-Mote-Include.lua')
  
end

function job_setup()

  include('chaotic-Include.lua')

  state.Buff['Pianissimo'] = buffactive['Pianissimo'] or false
  state.Buff['Nightingale'] = buffactive['Nightingale'] or false
  state.Buff['Troubadour'] = buffactive['Troubadour'] or false

  initialize_job()

end

function user_setup()

  state.IdleMode:options('Normal','Combat')
  state.OffenseMode:options('Normal','DW')
  state.WeaponskillMode:options('Normal','HNM')
  state.PhysicalDefenseMode:options('PDT')
  state.MagicalDefenseMode:options('MDT')
  state.CastingMode:options('Normal','Acc','Combat')
  initialize_crafting_mode(player.name)
  sleeps            = S{'Sleep', 'Sleep II', 'Sleepga', 'Sleepga II', 'Bind'}
  elemental_debuffs = S{'Burn','Choke','Shock','Rasp','Drown','Frost'}

  spikes            = S{'Blaze Spikes','Shock Spikes','Ice Spikes'}
  
  bard_debuffs      = S{'Lullaby','Elegy','Requiem','Threnody'}

  casting_mode = ''

  send_command('bind !f9 gs c cycle IdleMode')

end

function user_unload()

  windower.send_command('sta !packets on')

end


-- Auto-Pianissimo
function job_precast(spell,action,spellMap,eventArgs)
  
  if spell.type == 'BardSong' then
    if ((spell.target.type == 'PLAYER' and not spell.target.charmed) or (spell.target.type == 'NPC' and spell.target.in_party)) and not state.Buff['Pianissimo'] then

      local spell_recasts = windower.ffxi.get_spell_recasts()
      if spell_recasts[spell.recast_id] < 2 then

        send_command('@input /ja "Pianissimo" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
        eventArgs.cancel = true
        return

      end

    end
    equip(sets.precast.FC[spell.type])
  end

end

-- Enfeebling magic handling
function job_midcast(spell,action,spellMap,eventArgs)

  if spell.skill == 'Enfeebling Magic' then
    equip(sets.midcast[spell.skill][spell.type])
  else
    equip(sets.midcast[spell.skill])
  end

end

--[[ Don't like doing things this way
-- Obi and grip handling
function job_post_midcast(spell,action,spellMap,eventsArgs)

  if spellMap == 'Cure' then
    equip({main="Chatoyant staff",sub="Raptor leather strap +1"})
  else
    if player.status == 'Idle' and state.IdleMode.value == 'Normal' and state.CastingMode.value ~= 'Combat' then
      
      if spell.skill == 'Enfeebling Magic' then
        
        if state.CastingMode.value == 'Normal' then
          equip({main="Alkalurops"})
        else
          equip({main="Chatoyant staff"})
        end
        
        if spell.type == 'WhiteMagic' then
          equip({sub="Raptor leather strap +1"})
        elseif spell.type == 'BlackMagic' then
          equip({sub="Bugard leather strap +1"})
        end 
        
      elseif spell.type == 'BardSong' then
        equip({main="Chatoyant staff",sub="Bugard leather strap +1"})
      elseif spell.english == 'Stoneskin' then
        equip({main="Alkalurops"})
      end
      
      if state.CastingMode.value == 'Acc' and player.status ~= 'Engaged' then
        equip(sets.grip[spell.element])
      end
      
    end
  end

  if spell.skill ~= 'Enhancing Magic' or spell.skill ~= 'Enfeebling Magic' then
    if spell.element == world.weather_element or spell.element == world.day_element then
      
      if world.weather_element ~= 'Dark' and spellMap == 'Cure' then
        equip({waist="Hachirin-no-obi"})
      end
      
      if spell.skill == 'Elemental Magic' then
        equip({waist="Hachirin-no-obi"})
      end
      
    end
  end
  
end
]]

function job_get_spell_map(spell,spellMap,default_spell_map)

  if spell.skill == 'Enfeebling Magic' and sleeps:contains(spell.english) then
    return 'Sleep'
  elseif spell.skill == 'Elemental Magic' and elemental_debuffs:contains(spell.english) then
    return 'EleEnfeebs'
  elseif spell.skill == 'Enhancing Magic' and spikes:contains(spell.english) then
    return 'Spikes'
  elseif bard_debuffs:contains(spellMap) or spell.english == 'Magic Finale' then
    return 'BardDebuff'
  end
 end

function job_status_change(new,old)

  if new == 'Engaged' then
    send_command('gs c set IdleMode Combat;gs c set CastingMode Combat')
  end
  
end

function job_buff_change(name,gain)

    handle_standard_buffs(name,gain)
  
  if name == 'Elemental Seal' then
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

function customize_idle_set(idleSet)

--[[ I don't have this
  if daytime then 
    idleSet = set_combine(idleSet,{waist="Lycopodium sash"})
  end
  ]]
  crafting_mode = state.CraftingMode.value
--[[ This isn't applicable right now
  if (state.IdleMode.value == 'Normal' and state.CastingMode.value ~= 'Combat' and state.CastingMode.value ~= 'Combat') then 
    idleSet = set_combine(idleSet,{main=gear.Staff.PDT,sub=gear.ElementalGrip})
  end
]]
  idleSet = maybe_equip_crafting(idleSet,crafting_mode)
  return idleSet
  
end
