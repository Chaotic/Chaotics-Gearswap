include('organizer-lib')
organizer_items = {
  warp="Instant Warp",
  echos="Echo Drops",
  invis="Prism Powder",
  sneak="Silent Oil",
  shihei="Shihei",
  Shinobi="Shinoi-Tabi",
  Sanjaku="Sanjaku-Tenugui",
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

state.Buff['Sneak Attack']       = buffactive['Sneak Attack'] or false
state.Buff['Trick Attack']       = buffactive['Trick Attack'] or false
state.Buff['Assassin\'s Charge'] = buffactive['Assassin\'s Charge'] or false

single_hit_ws = S{'Wasp Sting','Shadowstitch','Viper Bite','Mercy Stroke','Mandalic Stab'}

offhand_misc = S{'Ridill','Kraken Club'}
offhand_daggers = S{'Thief\'s Knife','Mercurial Kris'}

initialize_job()

end

function user_setup()

include('Mote-TreasureHunter.lua')

state.OffenseMode:options('Normal','HybridAcc','Acc','MDT')
state.WeaponskillMode:options('Normal','Atk','Acc','AtkAcc')
state.RangedMode:options('Normal','Acid','Bloody','Sleep')
state.PhysicalDefenseMode:options('Evasion','SubtleBlow','PDT')
state.MagicalDefenseMode:options('MDT')
state.RestingMode:options('Normal','TP')

initialize_crafting_mode(player.name)

-- ^ = Ctrl  ! = Alt   @ = Win
send_command('bind !f10 gs c cycle Ranged')
send_command('bind !f9 gs c cycle TreasureMode')

end

function user_unload()

  windower.send_command('sta !packets off')

end

function job_buff_change(buff,gain)

  handle_standard_buffs(buff,gain)

if state.Buff[buff] ~= nil then
  if not midaction() then
    handle_equipping_gear(player.status)
  end
end

end

function job_post_precast(spell,action,spellMap,eventArgs)

if spell.type == 'WeaponSkill' then  -- extra weaponskill handling

  if not state.Ranged.value then  -- if no boomerang or crossbow equipped
    if spell.english == 'Cyclone' or state.Buff['Sneak Attack'] then
      sets.postPrecast = set_combine(sets.postPrecast,{ammo="Black tathlum"})  -- always black tath when sneak attacking
    else
      if state.WeaponskillMode.value == 'Normal' then
        sets.postPrecast = set_combine(sets.postPrecast,{ammo="Bomb core"})
      elseif state.WeaponskillMode.value == 'Atk' then
        sets.postPrecast = set_combine(sets.postPrecast,{ammo="Bomb core"})
      elseif state.WeaponskillMode.value == 'Acc' then
        sets.postPrecast = set_combine(sets.postPrecast,{ammo="Fire bomblet"})
      elseif state.WeaponskillMode.value == 'AtkAcc' then
        sets.postPrecast = set_combine(sets.postPrecast,{ammo="Fire bomblet"})
      end
    end
  end

  if state.Buff['Assassin\'s Charge'] then
    if single_hit_ws:contains(spell.name) then  -- only for single hit ws's
      if daytime then
        sets.postPrecast = set_combine(sets.postPrecast,{right_ear="Fenrir's earring"})
      else
        sets.postPrecast = set_combine(sets.postPrecast,{right_ear="Merman's earring"})
      end
      if state.WeaponskillMode.value == 'Atk' then
        sets.postPrecast = set_combine(sets.postPrecast,{right_ring="Strigoi ring"})
      elseif state.WeaponskillMode.value == 'Acc' then
        sets.postPrecast = set_combine(sets.postPrecast,{right_ring="Zilant ring"})
      elseif state.WeaponskillMode.value == 'AtkAcc' then
        sets.postPrecast = set_combine(sets.postPrecast,{right_ring="Mars's ring"})
      end
    else
      if daytime and (state.WeaponskillMode.value == 'Atk' or state.WeaponskillMode.value == 'AtkAcc')then
        sets.postPrecast = set_combine(sets.postPrecast,{left_ear="Merman's earring"})
      end
    end
  else
    if daytime and (state.WeaponskillMode.value == 'Atk' or state.WeaponskillMode.value == 'AtkAcc')then
      sets.postPrecast = set_combine(sets.postPrecast,{left_ear="Merman's earring"})
    end
  end
  
  if (state.Buff['Sneak Attack'] or state.Buff['Trick Attack']) and (state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime') then
    sets.postPrecast = set_combine(sets.postPrecast,sets.TreasureHunter)
  end

elseif spell.type == 'JobAbility' then  -- job ability handling
  if state.Tank.value then
    sets.postPrecast = set_combine(sets.enmityUp,sets.precast.JA[spell.english]) or sets.enmityUp
  else
    sets.postPrecast = set_combine(sets.enmityDown,sets.precast.JA[spell.english]) or sets.enmityDown
  end
elseif spell.type == 'Waltz' and spell.target.type == 'SELF' then
  sets.postPrecast = set_combine(sets.postPrecast,sets.precast.WaltzSelf)
  if world.day_element == 'Dark' then
    sets.postPrecast = set_combine(sets.postPrecast,{back="Shadow mantle"})
  end
end

equip(sets.postPrecast)
sets.postPrecast = {}

end

function customize_melee_set(meleeSet)

if state.TreasureMode.value == 'Fulltime' then
  meleeSet = set_combine(meleeSet, sets.TreasureHunter)
end

if state.Ranged then
  meleeSet = set_combine(meleeSet, sets[state.RangedMode.value])
end

if state.OffenseMode.value == 'Normal' or state.OffenseMode.value == 'HybridAcc' then
    if offhand_misc:contains(player.equipment.sub) then
      meleeSet = set_combine(meleeSet,{neck="Ancient torque"})
    else
      meleeSet = set_combine(meleeSet,{neck="Love torque"})
    end
end

return meleeSet

end

function customize_idle_set(idleSet)
crafting_mode = state.CraftingMode.value
if player.hpp <= 75 then
  if daytime then
    idleSet = set_combine(idleSet,sets.Regen.daytime)
  else
    idleSet = set_combine(idleSet,sets.Regen)
  end
end

if state.Ranged.value then
  idleSet = set_combine(idleSet, sets[state.RangedMode.value])
end

idleSet = maybe_equip_crafting(idleSet,crafting_mode)
return idleSet

end

function get_custom_wsmode(spell,spellMap,default_wsmode)

local wsmode

if state.Buff['Sneak Attack'] then
  wsmode = 'SA'
end

if state.Buff['Trick Attack'] then
  wsmode = (wsmode or '') .. 'TA'
end

return wsmode

end

function job_handle_equipping_gear(status,eventArgs)

check_buff('Sneak Attack', eventArgs)
check_buff('Trick Attack', eventArgs)
check_buff('Assassin\'s Charge', eventArgs)

end

function check_buff(name,eventArgs)

if state.Buff[name] then
  equip(sets.buff[name] or {})
  if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
    equip(sets.TreasureHunter)
  end
  eventArgs.handled = true
end

end
