include('organizer-lib')
organizer_items = {
    warp="Instant Warp",
    echos="Echo Drops",
    invis="Prism Powder",
    sneak="Silent Oil",
    shihei="Shihei",
    choco="Chocobo Whistle",
    nexus="Nexus Cape",
    warpring="Warp Ring"
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
  
    state.Buff['Building Flourish'] = buffactive['Building Flourish'] or false
  
    JA_Types = S{'Flourish1','Flourish2','JobAbility'}
  
    initialize_job()
  
  end
  
  function user_setup()
  
    state.OffenseMode:options('Normal','HybridAcc','OffTank','Tank')
    state.WeaponskillMode:options('Normal','HybridAcc','Acc','Mod')
    state.PhysicalDefenseMode:options('Evasion','PDT')
    state.MagicalDefenseMode:options('MDT')
    initialize_crafting_mode(player.name)
  end
  
  function user_unload()

    windower.send_command('sta !packets on')

end
function job_post_precast(spell,action,spellMap,eventArgs)
  
    if JA_Types:contains(spell.type) then
      if state.Tank.value then
        equip(set_combine(sets.enmityUp,sets.precast.JA[spell.english]) or sets.enmityUp)
      else
        equip(set_combine(sets.enmityDown,sets.precast.JA[spell.english]) or sets.enmityDown)
      end
    end
  
    if spell.type == 'Waltz' and spell.target.type == 'SELF' then
      equip(sets.precast.WaltzSelf)
      if world.day_element == 'Dark' then
        equip({back="Shadow mantle"})
      end
    end
  
    if spell.type == 'WeaponSkill'and state.WeaponskillMode.value ~= 'Mod' then
      if daytime then
        equip({ear1="Fenrir's earring"})
      end
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
  
    if state.OffenseMode.value:contains('Tank') then
      if state.Buff['Copy Image (3)'] or state.Buff['Copy Image (2)'] or state.Buff['Copy Image'] then
        meleeSet = set_combine(sets.engaged.HybridAcc)
      end
    end
  
    return meleeSet
  
  end
  
  function customize_idle_set(idleSet)
  
    if player.hpp < 75 and daytime then
      idleSet = set_combine(idleSet,{hands="Garden bangles",waist="Lycopodium sash"})
    end
    idleSet = maybe_equip_crafting(idleSet,crafting_mode)
    return idleSet
  
  end
  