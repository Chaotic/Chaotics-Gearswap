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
  
    state.Buff['Copy Image (3)'] = buffactive['Copy Image (3)'] or false
    state.Buff['Copy Image (2)'] = buffactive['Copy Image (2)'] or false
    state.Buff['Copy Image (1)'] = buffactive['Copy Image'] or false
  
    initialize_job()
  end
  
  function user_setup()
  
    state.IdleMode:options('Normal','SuperMDT','SuperPDT')
    state.OffenseMode:options('Normal','Acc','Heavy','Wyrm')
    state.WeaponskillMode:options('Normal','Acc')
    state.PhysicalDefenseMode:options('PDT','SPDT','Breath')
    state.MagicalDefenseMode:options('MDT')
    
    state.RestingMode:options('Normal','TP')

    initialize_crafting_mode(player.name)

      -- ^ = Ctrl  ! = Alt   @ = Win
    send_command('bind !f9 gs c cycle IdleMode')
  
    gear.main = player.equipment.main
    gear.sub = player.equipment.sub
  
  end
  function user_unload()

    windower.send_command('sta !packets on')

end

function job_post_precast(spell,action,spellMap,eventArgs)
    if spell.type == 'Waltz' and spell.target.type == 'SELF' then
      equip(sets.precast.WaltzSelf)
    end

    if spell.type == 'JobAbility' then
        equip(set_combine(sets.enmity,sets.precast.JA[spell.english]) or sets.enmity)
    end
    
  end
  
  function job_buff_change(buff,gain)
  
    handle_standard_buffs(buff,gain)
  
    if buff:contains('Copy Image') then
      state.Buff[buff] = gain
      handle_equipping_gear(player.status)
    end
  
  end
  
  function customize_melee_set(meleeSet)
  
    if state.Buff['Copy Image (3)'] or state.Buff['Copy Image (2)'] or state.Buff['Copy Image'] then
      if state.OffenseMode.value == 'Heavy' then
        meleeSet = set_combine(sets.engaged.Acc,{})
      elseif state.OffenseMode.value == 'Wyrm' then
        meleeSet = set_combine(sets.engaged.Acc,{})
      end
    end
  
    return meleeSet
  
  end
  
  function job_post_midcast(spell,action,spellMap,eventArgs)
  
    if spellMap == 'Cure' and spell.target.type == 'SELF' then
      equip(sets.midcast['Healing Magic'].self)
    end
  
    if spell.skill == 'Healing Magic' or spell.skill == 'Divine Magic' then
      if spell.element == world.weather_element or spell.element == world.day_element and world.weather_element ~= 'Dark' then
        equip({})
      end
    end
  
  end
  
  function job_status_change(new,old)
  
    gear.main = player.equipment.main
    gear.sub = player.equipment.sub
  
  end
  
  function customize_idle_set(idleSet)
  
    crafting_mode = state.CraftingMode.value
    
      --[[  I don't have any of these
        if player.hpp < 75 then
         idleSet = set_combine(idleSet,{head="Crimson mask"})
        end
      if daytime then
          idleSet = set_combine(idleSet,{waist="Lycopodium sash"})
      end
      ]]
      if player.hpp < 50 then
          idleSet = set_combine(idleSet,{right_ring="Hercules' ring"})
      end
      
      if (player.hpp >= 85) then
        idleSet = set_combine(idleSet,{neck="Parade gorget"})
      end
    idleSet = maybe_equip_crafting(idleSet,crafting_mode)
    return idleSet
  
  end

