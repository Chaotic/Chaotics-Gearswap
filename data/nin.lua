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

    state.Buff['Yonin'] = buffactive['Yonin'] or false
    state.Buff['Innin'] = buffactive['Innin'] or false
    state.Buff['Sange'] = buffactive['Sange'] or false
    
    offhand_katana = S{'Narigitsune','Mamushito +1','Shusui'}
  
    initialize_job()
  
  end
  
  function user_setup()
  
    state.OffenseMode:options('Normal','HybridAcc','Acc')
    state.WeaponskillMode:options('Normal','HNM')
    state.CastingMode:options('Normal','Enmity')
    state.RangedMode:options('Normal','HNM')
    state.PhysicalDefenseMode:options('Evasion', 'PDT')
    state.MagicalDefenseMode:options('MDT')
    initialize_crafting_mode(player.name)

  end
  
  function user_unload()

    windower.send_command('sta !packets off')

end
  function job_buff_change(buff,gain)
  
    handle_standard_buffs(buff,gain)
  
  end
  
  function job_post_precast(spell)
  
    if spell.type == 'JobAbility' then
      if state.Tank.value then
        equip(set_combine(sets.enmityUp,sets.precast.JA[spell.english]) or sets.enmityUp)
      else
        equip(set_combine(sets.enmityDown,sets.precast.JA[spell.english]) or sets.enmityDown)
      end
    end
    
    if spell.type == 'WeaponSkill' and not daytime then
      if state.WeaponskillMode.value == 'Normal' then
        equip({feet="Koga kyahan +1"})
      end
    end
  
  end
  
  function job_post_midcast(spell,default_spell_map)
  
    if spell.skill == 'Ninjutsu' then
      if spell.element == world.weather_element or spell.element == world.day_element then
        equip({waist="Hachirin-no-obi"})
      end
    end
  
  end
  
  function job_get_spell_map(spell,default_spell_map)
  
    if spell.skill == "Ninjutsu" then
      if not default_spell_map then
        if spell.target.type == 'SELF' then
          return 'NinjutsuBuff'
        else
          return 'NinjutsuDebuff'
        end
      end
    end
  
  end
  
  function customize_idle_set(idleSet)

      crafting_mode = state.CraftingMode.value
      if daytime then
        idleSet = set_combine(idleSet,{waist="Lycopodium sash"})
      end
      idleSet = maybe_equip_crafting(idleSet,crafting_mode)
      return idleSet
    
  
  end
  
  function customize_melee_set(meleeSet)
  
    if player.hpp < 75 and state.OffenseMode.value == 'Normal' then
      meleeSet = set_combine(meleeSet,{ring1="Shinobi ring",legs="Koga hakama"})
    end
    
    if not daytime then
      meleeSet = set_combine(meleeSet,{hands="Koga tekko"})
    end
    
    if not offhand_katana:contains(player.equipment.sub) then
      meleeSet = set_combine(meleeSet,{neck="Ancient torque"})
    end
    
    return meleeSet
  
  end
  