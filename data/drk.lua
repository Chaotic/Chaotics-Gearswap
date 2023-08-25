function get_sets()

  mote_include_version = 2
  include('Chaotic-Mote-Include.lua')
  include('organizer-lib')

end

function job_setup()


  include('Chaotic-include.lua')

  state.Buff['Dark Seal'] = buffactive['Dark Seal'] or false

  absorbs = S{'Absorb-STR', 'Absorb-DEX', 'Absorb-VIT', 'Absorb-AGI', 'Absorb-INT', 'Absorb-MND', 'Absorb-CHR', 'Absorb-Attri', 'Absorb-ACC'}
  sleeps = S{'Sleep', 'Sleep II', 'Sleepga', 'Sleepga II', 'Bind'}
  
  scythe_singlehit = S{'Slice','Dark Harvest','Shadow of Death','Nightmare Scythe','Spinning Scythe','Vorpal Scythe','Spiral Hell','Catastrophe'}
  gs_singlehit = S{'Hard Slash','Power Slash','Frostbite','Freezebite','Shockwave','Crescent Moon','Spinning Slash','Ground Strike','Scourge'}

  casting_mode = ''

  initialize_job()

end

function user_setup()

  state.OffenseMode:options('Normal','HybridAcc','Tank')
  state.WeaponskillMode:options('Normal','MOD','ACC','ATSMOD','ATSACC','MODACC')
  state.CastingMode:options('Normal','Acc')
  state.PhysicalDefenseMode:options('PDT')
  state.MagicalDefenseMode:options('MDT')
  initialize_crafting_mode(player.name)

end

function job_post_precast(spell,action,spellMap,eventArgs)

  if spell.type == 'WeaponSkill' then
  
    if daytime then
      if (state.WeaponskillMode.value == 'Normal' and state.CombatWeapon.value == 'Apocalypse') or state.CombatWeapon.value == 'Ragnarok' then
        --equip({ear1="Fenrir's earring"})
      end
    end
    
    if player.sub_job == 'SAM' then
      if state.CombatWeapon.value == 'Apocalypse' and scythe_singlehit:contains(spell.english) then
        --equip({ammo="White tathlum"})
      --elseif state.CombatWeapon.value == 'Ragnarok' and gs_singlehit:contains(spell.english) then
       -- equip({body="Aurum cuirass"})
      end
    end
    
  end
  
  if spell.type == 'JobAbility' then
    if state.Tank.value then
      equip(set_combine(sets.enmityUp,sets.precast.JA[spell.english]) or sets.enmityUp)
    else
      equip(set_combine(sets.enmityDown,sets.precast.JA[spell.english]) or sets.enmityDown)
    end
  end

end

function job_buff_change(name,gain)
  
  sleep_swap(name,gain)
  
  if name == 'Aftermath' and player.equipment.main == 'Apocalypse' then
      handle_equipping_gear(player.status)
  end
  
  if name == 'Dark Seal' then
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

function job_post_midcast(spell,action,spellMap,eventArgs)

  if spell.skill == 'Elemental Magic' or (spell.name == 'Drain' or spell.name == 'Drain II' or spell.name == 'Aspir') then
    if spell.element == world.day_element or spell.element == world.weather_element then
      equip({waist="Hachirin-no-obi"})
    end
  end

  if spell.skill == 'Dark Magic' and state.Buff['Dark Seal'] and state.CastingMode.value == 'Acc' then
    equip(sets.midcast['Dark Magic'])
  end

end

function job_get_spell_map(spell, default_spell_map)

  if spell.skill == 'Dark Magic' and absorbs:contains(spell.english) then
    return 'Absorb'
  elseif spell.skill == 'Enfeebling Magic' and sleeps:contains(spell.english) then
    return 'Sleep'
  end

end

function customize_idle_set(idleSet)
  
  if player.hpp < 75 then
  
    --idleSet = set_combine(idleSet,{head="Crimson mask"})
  
    if daytime then
      --idleSet = set_combine(idleSet,{hands="Garden bangles",waist="Lycopodium sash"})
    end
  
  end

  if player.mpp < 50 and player.hpp >= 85 then
    idleSet = set_combine(idleSet,{neck="Parade gorget"})
  end
  
  idleSet = maybe_equip_crafting(idleSet,crafting_mode)
  return idleSet
  
end

function adjust_melee_groups()

  classes.CustomMeleeGroups:clear()
  
  if player.sub_job == 'SAM' then
    classes.CustomMeleeGroups:append('SAM')
  end

end

function customize_melee_set(meleeSet)

  if state.OffenseMode.value == 'Normal' and daytime then
    meleeSet = set_combine(meleeSet, {ear1="Fenrir's earring"})
  end
  
  if state.CombatWeapon.value == 'Zerg' and daytime then
    meleeSet = set_combine(meleeSet,{ammo="Fenrir's stone"})
  end
  
  if buffactive['Aftermath'] and state.CombatWeapon.value == 'Apocalypse' then
    if state.Tank.value then
    
      if state.OffenseMode.value == 'Tank' then
        meleeSet = set_combine(meleeSet, {body="Valhalla body"})
      else
        meleeSet = set_combine(meleeSet, {legs="Dusk trousers +1",feet="Aurum sabatons"})
      end
      
    else
    
      if state.OffenseMode.value == 'Tank' then
        meleeSet = set_combine(meleeSet, {body="Valhalla body"})
      elseif state.OffenseMode.value == 'Accuracy' then
        meleeSet = set_combine(meleeSet, {legs="Armada breeches",feet="Aurum sabatons"})
      else
        meleeSet = set_combine(meleeSet, {legs="Onyx cuisses",feet="Onyx sollerets"})
      end
      
    end
  end

  return meleeSet

end

function job_status_change(new,old)

  if new == "Engaged" then

    if player.equipment.main == 'Apocalypse' or player.equipment.main == 'Ragnarok' then
      state.CombatWeapon:set(player.equipment.main)
    elseif player.equipment.main == 'Kraken Club' or player.equipment.main == 'Mercurial Kris' then
      state.CombatWeapon:set('Zerg')
    else
      state.CombatWeapon:reset()
    end
    adjust_melee_groups()
  end

end
