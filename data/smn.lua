-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Also, you'll need the Shortcuts addon to handle the auto-targetting of the custom pact commands.

--[[

    Custom commands:

    

    gs c siphon

        Automatically run the process to: dismiss the current avatar; cast appropriate

        weather; summon the appropriate spirit; Elemental Siphon; release the spirit;

        and re-summon the avatar.

        

        Will not cast weather you do not have access to.

        Will not re-summon the avatar if one was not out in the first place.

        Will not release the spirit if it was out before the command was issued.

        

    gs c pact [PactType]

        Attempts to use the indicated pact type for the current avatar.

        PactType can be one of:

            cure

            curaga

            buffOffense

            buffDefense

            buffSpecial

            debuff1

            debuff2

            sleep

            nuke2

            nuke4

            bp70

            bp75 (merits and lvl 75-80 pacts)

            astralflow

--]]


-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    include('organizer-lib')
  end
  
  function job_setup()
    include('Chaotic-include.lua')
    initialize_job()
    --spirits = S{"LightSpirit", "DarkSpirit", "FireSpirit", "EarthSpirit", "WaterSpirit", "AirSpirit", "IceSpirit", "ThunderSpirit"}
    spirits = S{"LightSpirit", "DarkSpirit", "EarthSpirit", "WaterSpirit", "AirSpirit", "IceSpirit"}
    avatars = S{"Carbuncle", "Fenrir", "Diabolos", "Ifrit", "Titan", "Leviathan", "Garuda", "Shiva", "Ramuh"}
    magicalRagePacts = S{
      'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgment Bolt','Searing Light','Howling Moon','Ruinous Omen',
      'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II',
      'Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV',
      'Thunderspark','Burning Strike','Meteorite','Nether Blast','Flaming Crush',
      'Meteor Strike','Heavenly Strike','Wind Blade','Geocrush','Grand Fall','Thunderstorm',
      'Holy Mist','Lunar Bay','Night Terror','Level ? Holy'}
    pacts = {}
    pacts.cure 
     = {['Carbuncle'] = 'Healing Ruby' }
    pacts.curaga
     = {['Carbuncle'] = 'Healing Ruby II'
       ,['Garuda']    = 'Whispering Wind'
       ,['Leviathan'] = 'Spring Water'}
    pacts.buffoffense
     = {['Carbuncle'] = 'Glittering Ruby'
       ,['Ifrit']     = 'Crimson Howl'
       ,['Garuda']    = 'Hastega'
       ,['Ramuh']     = 'Rolling Thunder'
       ,['Fenrir']    = 'Ecliptic Growl'}
    pacts.buffdefense
     = {['Carbuncle'] = 'Shining Ruby'
       ,['Shiva']     = 'Frost Armor'
       ,['Garuda']    = 'Aerial Armor'
       ,['Titan']     = 'Earthen Ward'
       ,['Ramuh']     = 'Lightning Armor'
       ,['Fenrir']    = 'Ecliptic Howl'
       ,['Diabolos']  = 'Noctoshield'}
    pacts.buffspecial
     = {['Ifrit']     = 'Inferno Howl'
       ,['Garuda']    = 'Fleet Wind'
       ,['Titan']     = 'Earthen Armor'
       ,['Diabolos']  = 'Dream Shroud'
       ,['Carbuncle'] = 'Soothing Ruby'
       ,['Fenrir']    = 'Heavenward Howl'}
    pacts.debuff1
     = {['Shiva']     = 'Diamond Storm'
       ,['Ramuh']     = 'Shock Squall'
       ,['Leviathan'] = 'Tidal Roar'
       ,['Fenrir']    = 'Lunar Cry'
       ,['Diabolos']  = 'Pavor Nocturnus'}
    pacts.debuff2
     = {['Shiva']      = 'Sleepga'
       , ['Leviathan'] = 'Slowga'
       , ['Fenrir']    = 'Lunar Roar'
       , ['Diabolos']  = 'Somnolence'}
    pacts.sleep
     = {['Shiva']    = 'Sleepga'
       ,['Diabolos'] = 'Nightmare'}
    pacts.nuke2
     = {['Ifrit']     = 'Fire II'
       ,['Shiva']     = 'Blizzard II'
       ,['Garuda']    = 'Aero II'
       ,['Titan']     = 'Stone II'
       ,['Ramuh']     = 'Thunder II'
       ,['Leviathan'] = 'Water II'}
    pacts.nuke4
     = {['Ifrit']     = 'Fire IV'
       ,['Shiva']     = 'Blizzard IV'
       ,['Garuda']    = 'Aero IV'
       ,['Titan']     = 'Stone IV'
       ,['Ramuh']     = 'Thunder IV'
       ,['Leviathan'] = 'Water IV'}
    pacts.bp70
     = {['Ifrit']     = 'Flaming Crush'
       ,['Shiva']     = 'Rush'
       ,['Garuda']    = 'Predator Claws'
       ,['Titan']     = 'Mountain Buster'
       ,['Ramuh']     = 'Chaotic Strike'
       ,['Leviathan'] = 'Spinning Dive'
       ,['Carbuncle'] = 'Meteorite'
       ,['Fenrir']    = 'Eclipse Bite'
       ,['Diabolos']  = 'Nether Blast'}
    pacts.bp75
     = {['Ifrit']     = 'Meteor Strike'
       ,['Shiva']     = 'Heavenly Strike'
       ,['Garuda']    = 'Wind Blade'
       ,['Titan']     = 'Geocrush'
       ,['Ramuh']     = 'Thunderstorm'
       ,['Leviathan'] = 'Grand Fall'
       ,['Carbuncle'] = 'Holy Mist'
       ,['Fenrir']    = 'Lunar Bay'
       ,['Diabolos']  = 'Night Terror'}
    pacts.astralflow
     = {['Ifrit']     = 'Inferno'
       ,['Shiva']     = 'Diamond Dust'
       ,['Garuda']    = 'Aerial Blast'
       ,['Titan']     = 'Earthen Fury'
       ,['Ramuh']     = 'Judgment Bolt'
       ,['Leviathan'] = 'Tidal Wave'
       ,['Carbuncle'] = 'Searing Light'
       ,['Fenrir']    = 'Howling Moon'
       ,['Diabolos']  = 'Ruinous Omen'}
  
    -- Wards table for creating custom timers
    wards = {}
    -- Base duration for ward pacts.
    wards.durations
     = {['Crimson Howl']    = 60
       ,['Earthen Armor']   = 60
       ,['Inferno Howl']    = 60
       ,['Heavenward Howl'] = 60
       ,['Rolling Thunder'] = 120
       ,['Fleet Wind']      = 120
       ,['Shining Ruby']    = 180
       ,['Frost Armor']     = 180
       ,['Lightning Armor'] = 180
       ,['Ecliptic Growl']  = 180
       ,['Glittering Ruby'] = 180
       ,['Hastega']         = 180
       ,['Noctoshield']     = 180
       ,['Ecliptic Howl']   = 180
       ,['Dream Shroud']    = 180
    }
    -- Icons to use when creating the custom timer.
    wards.icons = {
      ['Earthen Armor']   = 'spells/00299.png', -- 00299 for Titan
      ['Shining Ruby']    = 'spells/00043.png', -- 00043 for Protect
      ['Dream Shroud']    = 'spells/00304.png', -- 00304 for Diabolos
      ['Noctoshield']     = 'spells/00106.png', -- 00106 for Phalanx
      ['Inferno Howl']    = 'spells/00298.png', -- 00298 for Ifrit
      ['Hastega']         = 'spells/00358.png', -- 00358 for Hastega
      ['Rolling Thunder'] = 'spells/00104.png', -- 00358 for Enthunder
      ['Frost Armor']     = 'spells/00250.png', -- 00250 for Ice Spikes
      ['Lightning Armor'] = 'spells/00251.png', -- 00251 for Shock Spikes
      ['Fleet Wind']      = 'abilities/00074.png', --
    }
    -- Flags for code to get around the issue of slow skill updates.
    wards.flag = false
    wards.spell = ''
  
    windower.send_command('lua l pettp')
  end
  
  -------------------------------------------------------------------------------------------------------------------
  -- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
  -------------------------------------------------------------------------------------------------------------------
  
  -- Setup vars that are user-dependent.  Can override this function in a sidecar file.
  function user_setup()
  
    state.IdleMode:options('Normal','Combat')
    state.OffenseMode:options('Normal','DW')
    state.WeaponskillMode:options('Normal','HNM')
    state.PhysicalDefenseMode:options('PDT')
    state.MagicalDefenseMode:options('MDT')
    state.CastingMode:options('Normal','Acc','TH','Combat')
    state.RestingMode:options('Normal','TP')
    state.LevelCap:options('Normal','30','40','50')

    initialize_crafting_mode(player.name)
  
    sleeps            = S{'Sleep', 'Sleep II', 'Sleepga', 'Sleepga II', 'Bind'}
    elemental_debuffs = S{'Burn','Choke','Shock','Rasp','Drown','Frost'}
    
    spikes            = S{'Blaze Spikes','Shock Spikes','Ice Spikes'}
    
    casting_mode = ''
  
    gear.perp_staff = {main="Iridal Staff"}
    
    send_command('bind !f9 gs c cycle IdleMode')
  
  end
  
  
  function user_unload()
  
    windower.send_command('sta !packets off')
    windower.send_command('lua u pettp')
  
  end
  
  function job_midcast(spell, action, spellMap, eventArgs)
  
    -- handle different equipsets for White and Black magic
    if not spell.interrupted and spell.type == 'BloodPactWard' and spellMap ~= 'DebuffBloodPactWard' then
      wards.flag = true
      wards.spell = spell.english
      send_command('wait 10; gs c reset_ward_flag')
      create_pact_timer(wards.spell)
    end

    if spell.skill == 'Enfeebling Magic' then
      equip(sets.midcast[spell.skill][spell.type])
    else
      equip(sets.midcast[spell.skill])
    end
  
  end
  
  function job_post_midcast(spell,action,spellMap,eventArgs)
  --[[
    if spell.skill == 'Enhancing Magic' or spell.skill == 'Summoning Magic' or (spell.skill == 'Healing Magic' and not (spellMap == 'Cure' or spellMap == 'Curaga')) then
      if player.status == 'Idle' and state.IdleMode.value == 'Normal' and state.CastingMode.value ~= 'Combat' then
        equip({main="Seveneyes",sub="Genbu's shield"})
      end
    elseif spellMap == 'Cure' or spellMap == 'Curaga' then
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
  ]]    
    if spell.skill == 'Elemental Magic' and state.CastingMode.value == 'TH' then
      equip({main="Lotus katana"})
    end

  end
  
  function job_pet_midcast(spell, action, spellMap, eventArgs)
    --[[
      if pet.name == 'Garuda' and not magicalRagePacts:contains(spell.english) then
      equip({head="Karura hachigane"})
    end
    ]]
    
  end
  
  function job_pet_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted and spell.type == 'BloodPactWard' and spellMap ~= 'DebuffBloodPactWard' then
      wards.flag = true
      wards.spell = spell.english
      create_pact_timer(wards.spell)
    end
  
  end
  
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
  function job_buff_change(buff, gain)
  
    handle_standard_buffs(buff,gain)
  
    if state.Buff[buff] ~= nil or storms:contains(buff) then
      handle_equipping_gear(player.status)
    end
  
  end
  
  
  -- Called when the player's pet's status changes.
  -- This is also called after pet_change after a pet is released.  Check for pet validity.
  function job_pet_status_change(newStatus, oldStatus, eventArgs)
    if pet.isvalid and not midaction() and not pet_midaction() and ((newStatus == 'Engaged' or oldStatus == 'Engaged') or newStatus == 'Idle') then
      handle_equipping_gear(player.status, newStatus)
    end
    eventArgs.handled = true
  end
  
  function job_handle_equipping_gear(playerStatus, eventArgs)

      local HandleSet
    if playerStatus == 'Idle' then
      HandleSet = customize_idle_set(sets.idle)
    elseif playerStatus == 'Engaged' then
      HandleSet = sets.engaged
    end


    if pet.isvalid and (playerStatus == 'Engaged' or playerStatus == 'Idle') then
      HandleSet = equipPerpGear(pet,HandleSet)
    end
    equip(HandleSet)
end
  -- Called when a player gains or loses a pet.
  -- pet == pet structure
  -- gain == true if the pet was gained, false if it was lost.
  function job_pet_change(petparam, gain)
  
    classes.CustomIdleGroups:clear()
  
    if gain then
      if avatars:contains(pet.name) then
        classes.CustomIdleGroups:append('Avatar')
      elseif spirits:contains(pet.name) then
        classes.CustomIdleGroups:append('Spirit')
      end
    end
  
  end
  
  -------------------------------------------------------------------------------------------------------------------
  -- User code that supplements standard library decisions.
  -------------------------------------------------------------------------------------------------------------------
  
  -- Custom spell mapping.
  function job_get_spell_map(spell)
  
    if spell.type == 'BloodPactRage' then
      if magicalRagePacts:contains(spell.english) then
        return 'MagicalBloodPactRage'
      else
        return 'PhysicalBloodPactRage'
      end
    elseif spell.type == 'BloodPactWard' and spell.target.type == 'MONSTER' then
      return 'DebuffBloodPactWard'
    end
    
  end
  
  -- Modify the default idle set after it was constructed.
  function customize_idle_set(idleSet)
  

    if pet.isvalid then
      idleSet = equipPerpGear(pet,idleSet)
      end
    
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
          
      if daytime then
        equip({hands="Garden bangles",waist="Lycopodium sash"})
      end
      

    idleSet = maybe_equip_crafting(idleSet,crafting_mode)
  
    return idleSet
  
  end
  
  -- Called by the 'update' self-command, for common needs.
  -- Set eventArgs.handled to true if we don't want automatic equipping of gear.
  function job_update(cmdParams, eventArgs)
  
    classes.CustomIdleGroups:clear()
  
    if pet.isvalid then
      if avatars:contains(pet.name) then
        classes.CustomIdleGroups:append('Avatar')
      elseif spirits:contains(pet.name) then
        classes.CustomIdleGroups:append('Spirit')
      end
    end
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

end


-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------
  -- Custom uber-handling of Elemental Siphon
  function handle_siphoning()
    if areas.Cities:contains(world.area) then
      add_to_chat(122, 'Cannot use Elemental Siphon in a city area.')
      return
    end
  
    local siphonElement
    local releasedAvatar
    local dontRelease
  
    -- If we already have a spirit out, just use that.
    if pet.isvalid and spirits:contains(pet.name) then
      siphonElement = pet.element
      dontRelease = true
    end
  
    -- If we decided to use a storm, set that as the spirit element to cast.
    if world.weather_element ~= 'None' and (get_weather_intensity() > 0 or world.weather_element ~= elements.weak_to[world.day_element]) then
      if world.weather_element ~= 'Lightning' or world.day_element ~= 'Lightning' then
        siphonElement = world.weather_element
      else
        add_to_chat("No Lightning Spirit, defaulting to Light Spirit")
        siphonElement = 'Light'
      end
    else
      siphonElement = world.day_element
    end
  
    local command = ''
    local releaseWait = 2
  
    if pet.isvalid and avatars:contains(pet.name) then
      command = command..'input /pet "Release" <me>;wait 1.1;'
      releasedAvatar = pet.name
      releaseWait = 10
    end
  
    if not (pet.isvalid and spirits:contains(pet.name)) then
      command = command..'input /ma "'..elements.spirit_of[siphonElement]..'" <me>;wait 4;'
      releaseWait = releaseWait - 4
    end
  
    command = command..'input /ja "Elemental Siphon" <me>;'
    releaseWait = releaseWait - 1
    releaseWait = releaseWait + 0.1
  
    if not dontRelease then
      if releaseWait > 0 then
        command = command..'wait '..tostring(releaseWait)..';'
      else
        command = command..'wait 1.1;'
      end
  
      command = command..'input /pet "Release" <me>;'
    end
  
    if releasedAvatar then
      command = command..'wait 1.1;input /ma "'..releasedAvatar..'" <me>'
    end
  
    send_command(command)
    
  end
  
  
  -- Handles executing blood pacts in a generic, avatar-agnostic way.
  -- cmdParams is the split of the self-command.
  -- gs c [pact] [pacttype]
  function handle_pacts(cmdParams)
  
    if areas.Cities:contains(world.area) then
      add_to_chat(122, 'You cannot use pacts in town.')
      return
    end
  
    if not pet.isvalid then
      add_to_chat(122,'No avatar currently available. Returning to default macro set.')
      return
    end
  
    if spirits:contains(pet.name) then
      add_to_chat(122,'Cannot use pacts with spirits.')
      return
    end
  
    if not cmdParams[2] then
      add_to_chat(123,'No pact type given.')
      return
    end
  
    local pact = cmdParams[2]:lower()
  
    if not pacts[pact] then
      add_to_chat(123,'Unknown pact type: '..tostring(pact))
      return
    end
  
    if pacts[pact][pet.name] then
      if pact == 'astralflow' and not buffactive['astral flow'] then
        add_to_chat(122,'Cannot use Astral Flow pacts at this time.')
        return
      end
      -- Leave out target; let Shortcuts auto-determine it.
      send_command('@input /pet "'..pacts[pact][pet.name]..'"')
    else
      add_to_chat(122,pet.name..' does not have a pact of type ['..pact..'].')
    end
    
  end

function equipPerpGear(pet,CustomSet)
  if pet.status == 'Engaged' then
    CustomSet = set_combine(CustomSet, sets.idle[state.LevelCap.current].Avatar.Melee)
  end
  
  if pet.element == world.day_element then
    CustomSet = set_combine(CustomSet, sets.perp[state.LevelCap.current].Day)
  end
  if pet.element == world.weather_element then
    CustomSet = set_combine(CustomSet, sets.perp[state.LevelCap.current].Weather)
  end
  if sets.perp[state.LevelCap.current][pet.name] then
    CustomSet = set_combine(CustomSet, sets.perp[state.LevelCap.current][pet.name])
  end
  
  gear.perp_staff.name = elements.perpetuance_staff_of[pet.element]
  
  if gear.perp_staff.name and (player.inventory[gear.perp_staff.name] or player.wardrobe[gear.perp_staff.name]) then
    CustomSet = set_combine(CustomSet, sets.perp[state.LevelCap.current].staff_and_grip)
  end
  return CustomSet
end

function handle_level_sync(gain)
  if gain then
    if player.main_job_level>59 then
      send_command('gs c set LevelCap Normal')
    elseif player.main_job_level>49 then
      send_command('gs c set LevelCap 50')
    elseif player.main_job_level>39 then
      send_command('gs c set LevelCap 40')
    elseif player.main_job_level>29 then
      send_command('gs c set LevelCap 30')
      end
  else
    send_command('gs c set LevelCap Normal')
  end
end
