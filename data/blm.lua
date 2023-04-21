function get_sets()

    --mote library settings
    mote_include_version = 2
    include('Mote-Include.lua')
      
  end
  
  function job_setup()
   
    --kay library settings
    include('Chaotic-include.lua')
      
    initialize_job()
      
  end
  
  function user_setup()
  
    --combat modes
    state.IdleMode:options('Normal','DW','Combat','CombatDW')
    state.OffenseMode:options('Normal','DW')
    state.CastingMode:options('Normal','HybridAcc','Accuracy','TH','Combat','CombatDW')
    state.RestingMode:options('Normal','DW','TP')
    state.LevelCap:options('Normal','30','40','50')
    CombatForm='Normal' 

    state.MagicBurst = M(false, 'Magic Burst')
    
    initialize_crafting_mode(player.name)
      
    helixes           = S{'Geohelix','Hydrohelix','Anemohelix','Pyrohelix','Cryohelix','Ionohelix','Noctohelix','Luminohelix'}
    sleeps            = S{'Sleep', 'Sleep II', 'Sleepga', 'Sleepga II', 'Bind'}
    elemental_debuffs = S{'Burn','Choke','Shock','Rasp','Drown','Frost'}
    
    spikes            = S{'Blaze Spikes','Shock Spikes','Ice Spikes'}
    
    casting_mode = ''
      
    --bind combat mode cycles
    send_command('bind !f9 gs c toggle MagicBurst')
      
  end
  function user_unload()

    windower.send_command('sta !packets on')

end
--[[
function job_precast(spell,action,spellMap,eventArgs)
  
  custom_debug("job precast","")  
end
]]
function job_midcast(spell,action,spellMap,eventArgs)
    -- handle different equipsets for White and Black magic
    if spell.skill == 'Enfeebling Magic' then
      equip(sets.midcast[spell.skill][spell.type])
    else 
      equip(sets.midcast[spell.skill])
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
  
  function job_aftercast(spell,action,spellMap,eventArgs)
  
      if spell.skill == 'Elemental Magic' then
          state.MagicBurst:reset()
      end
      
  end
  
  function customize_idle_set(idleSet)
  
  crafting_mode = state.CraftingMode.value
   
--[[
    if daytime then 
      idleSet = set_combine(idleSet,{hands="Garden bangles",waist="Lycopodium sash"})
    end
    ]]
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

function job_buff_change(buff,gain)
  
  handle_standard_buffs(buff,gain)

end

function handle_level_sync(gain)
  if gain then
    if player.main_job_level>59 then
      send_command('gs c set LevelCap Normal')
    elseif player.main_job_level>49 then
      send_command('gs c set LevelCap 50')
    elseif player.main_job_level>39 then
      send_command('gs c set LevelCap 40')
    else
      send_command('gs c set LevelCap 30')
      end
  else
    send_command('gs c set LevelCap Normal')
  end
end

--[[  I'm not a fan of most of this.  Doubly so euiping gear in these functions.  Since I don't use most of it comment it out for now
  
function job_post_midcast(spell,action,spellMap,eventArgs)
  
      if (spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic') and not elemental_debuffs:contains(spell.english) then
        if spell.element == world.weather_element and spell.element == world.day_element then
          if spell.skill == 'Elemental Magic' then
            equip({legs="Sorcerer's tonban"})
          end
          equip({waist="Hachirin-no-obi",main="Chatoyant staff"})
        elseif spell.element == world.day_element then
          if spell.skill == 'Elemental Magic' then
            equip({legs="Sorcerer's tonban"})
          end
          equip({waist="Hachirin-no-obi",main="Claustrum"})
        elseif spell.element == world.weather_element then
          equip({waist="Hachirin-no-obi",main="Chatoyant staff"})
        end
            
        if state.CastingMode.value == 'TH' then
          equip({main="Lotus Katana"})
        end	
        
      end  
        
      if spellMap == 'Cure' then
        if not (world.weather_element == 'Dark' or world.day_element == 'Dark') then
          equip({waist="Hachirin-no-obi"})
        end
      end
            
      if state.MagicBurst.value then
        equip(sets.magic_burst)
      end
    
      end
    end
    ]]