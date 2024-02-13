function get_sets()

  mote_include_version = 2
  include('Chaotic-Mote-Include.lua')

end

function job_setup()

  state.Buff['Mighty Strikes']    = buffactive['Mighty Strikes'] or false
  state.Buff['Warrior\'s Charge'] = buffactive['Warrior\'s Charge'] or false

  include('Chaotic-include.lua')

  gaxe_singlehit = S{'Shield Break','Iron Tempest','Armor Break','Keen Edge','Weapon Break','Full Break','Steel Cyclone','Metatron Torment'}

  aggressor_mode = ''

  initialize_job()

end

function user_setup()

    state.OffenseMode:options('Normal','DW', 'Acc','AccDW')
    state.WeaponskillMode:options('Normal','HNM')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')
    
    initialize_crafting_mode(player.name)

end

function user_unload()

    windower.send_command('sta !packets on')

end
function job_post_precast(spell,action,spellMap,eventsArgs)
  
  if spell.type == 'JobAbility' then
    if state.Tank.value then
      equip(set_combine(sets.enmityUp,sets.precast.JA[spell.english]) or sets.enmityUp)
    else
      equip(set_combine(sets.enmityDown,sets.precast.JA[spell.english]) or sets.enmityDown)
    end
  elseif spell.type == 'Waltz' and spell.target.type == 'SELF' then
    
    equip(sets.precast.WaltzSelf)
  end

end

function job_buff_change(buff,gain)

  handle_standard_buffs(buff,gain)
  
  if buff == 'Aggressor' then
    if gain then
      aggressor_mode = state.OffenseMode.value
      if state.OffenseMode.value ~= 'Normal' then
        send_command('gs c set OffenseMode Normal')
      end
    else
      send_command('gs c set OffenseMode '..aggressor_mode)
    end
  end

end

function job_status_change(new,old)
--[[
  if new == "Engaged" then
    if player.equipment.main == 'Bravura' or player.equipment.main == 'Ragnarok' then
      state.CombatWeapon:set(player.equipment.main)
    elseif player.equipment.main == 'Ridill' then
      state.CombatWeapon:set('DW')
    else
      state.CombatWeapon:reset()
    end
    adjust_melee_groups()
  end
]]
end

function get_custom_wsmode(spell,spellMap,default_wsmode)

  local wsmode = ''
  if state.Buff['Mighty Strike'] then
    wsmode = wsmode .. 'MS'
  end
  if wsmode ~= '' then
    return wsmode
  end

end

function customize_idle_set(idleSet)

  crafting_mode = state.CraftingMode.value
  idleSet = maybe_equip_crafting(idleSet,crafting_mode)
  return idleSet
  
end

function customize_melee_set(meleeSet)

  return meleeSet

end

function adjust_melee_groups()

  classes.CustomMeleeGroups:clear()
  
  if player.sub_job == 'SAM' then
    classes.CustomMeleeGroups:append('SAM')
  end

end
