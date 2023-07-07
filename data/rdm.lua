function get_sets()

  mote_include_version = 2
  -- Includes 
  -- Motes is the main one
  include('Mote-Include.lua')
end

function job_setup()
  -- My functions
  include('Chaotic-include.lua')
  initialize_job()
end

--[[  These are the states/modes that can be used
    -- General melee offense/defense modes, allowing for hybrid set builds, as well as idle/resting/weaponskill.
    -- This just defines the vars and sets the descriptions.  List modes with no values automatically
    -- get assigned a 'Normal' default value.
    state.OffenseMode         = M{['description'] = 'Offense Mode'}
    state.HybridMode          = M{['description'] = 'Hybrid Mode'}
    state.RangedMode          = M{['description'] = 'Ranged Mode'}
    state.WeaponskillMode     = M{['description'] = 'Weaponskill Mode'}
    state.CastingMode         = M{['description'] = 'Casting Mode'}
    state.IdleMode            = M{['description'] = 'Idle Mode'}
    state.RestingMode         = M{['description'] = 'Resting Mode'}

    state.DefenseMode         = M{['description'] = 'Defense Mode', 'None', 'Physical', 'Magical'}
    state.PhysicalDefenseMode = M{['description'] = 'Physical Defense Mode', 'PDT'}
    state.MagicalDefenseMode  = M{['description'] = 'Magical Defense Mode', 'MDT'}

    state.Kiting              = M(false, 'Kiting')
    state.SelectNPCTargets    = M(false, 'Select NPC Targets')
    state.PCTargetMode        = M{['description'] = 'PC Target Mode', 'default', 'stpt', 'stal', 'stpc'}

    state.EquipStop           = M{['description'] = 'Stop Equipping Gear', 'off', 'precast', 'midcast', 'pet_midcast'}

    state.CombatWeapon        = M{['description']='Combat Weapon', ['string']=''}
    state.CombatForm          = M{['description']='Combat Form', ['string']=''}
    ]]


function user_setup()
    
  state.IdleMode:options('Normal','Combat')
  state.OffenseMode:options('Normal','DW')
  state.WeaponskillMode:options('Normal','HNM')
  state.PhysicalDefenseMode:options('PDT')
  state.MagicalDefenseMode:options('MDT')
  state.CastingMode:options('Normal','Acc','Combat')
  state.RestingMode:options('Normal','TP')
  state.LevelCap:options('Normal','30')
  CombatForm='Normal'

  sleeps            = S{'Sleep', 'Sleep II', 'Sleepga', 'Sleepga II', 'Bind'}
  elemental_debuffs = S{'Burn','Choke','Shock','Rasp','Drown','Frost'}

  spikes            = S{'Blaze Spikes','Shock Spikes','Ice Spikes'}

  casting_mode = ''

  -- ^ = Ctrl  ! = Alt   @ = Win
  send_command('bind !f9 gs c cycle IdleMode')


---------------------------------------------------
--    HUD Stuff Work in Progress
---------------------------------------------------
--  load_hud_info()
--  setupTextWindow()
---------------------------------------------------


end

function user_unload()

    windower.send_command('sta !packets on')

end

function job_precast(spell,action,spellMap,eventsArgs)
  handle_locks()
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

function job_update_tracker(command)
  return command..'wait 0.3;track add Cookies: ${inventory:Wizard Cookie};'
end

function job_buff_change(buff,gain)

  handle_standard_buffs(buff,gain)
  
  if buff == 'Elemental Seal' then
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

  crafting_mode = state.CraftingMode.value
  if (state.IdleMode.value == 'Normal' and state.CastingMode.value ~= 'Combat' and state.CastingMode.value ~= 'Combat') then 
    idleSet = set_combine(idleSet,{main=gear.Staff.PDT,sub=gear.ElementalGrip})
  end

  idleSet = maybe_equip_crafting(idleSet,crafting_mode)
  
  return idleSet

end

function job_status_change(new,old,eventArgs)
  -- add_to_chat('job status change  new:'..new.. ': old:'..old.. ': eventArgs:'..eventArgs..':')
	if new == 'Engaged' then
	  send_command('gs c set IdleMode Combat;gs c set CastingMode Combat')
  end
end

function custom_job_sub_job_change(new,old)
  --add_to_chat('custom job sub change  new:'..new.. ': old:'..old.. ':')
  if new == 'NIN' or new == 'DNC' then
    if state.OffenseMode.value ~= 'DW' then
      send_command('gs c set OffenseMode DW')
    end
  else
    if state.OffenseMode.value ~= 'Normal' then
      send_command('gs c set OffenseMode Normal')
    end
  end
end

function handle_level_sync(gain)
  if gain then
    if player.main_job_level>59 then
      send_command('gs c set LevelCap Normal')
    elseif player.main_job_level>29 then
      send_command('gs c set LevelCap 30')
      end
  else
    send_command('gs c set LevelCap Normal')
  end
end

  --[[  I'm not a fan of most of this.  Doubly so euiping gear in these functions.  Since I don't use most of it comment it out for now
function job_post_midcast(spell,action,spellMap,eventsArgs)

    if spell.skill == 'Enhancing Magic' or (spell.skill == 'Healing Magic' and not (spellMap == 'Cure' or spellMap == 'Curaga')) then
      if player.status == 'Idle' and state.IdleMode.value == 'Normal' and state.CastingMode.value ~= 'Combat' then
        ---equip({main="Seveneyes",sub="Muse tariqah"})
      end
    elseif (spellMap == 'Cure' or spellMap == 'Curaga') and (state.IdleMode.value ~= 'Combat' and state.CastingMode.value ~= 'Combat') then
        equip(set_combine(sets.staff[spell.element],sets.grip[spell.element]))
      ---,sub="Raptor leather strap +1"}
    else
      if player.status == 'Idle' and state.IdleMode.value == 'Normal' and state.CastingMode.value ~= 'Combat' then
        
        if spell.skill == 'Enfeebling Magic' then
          
          if state.CastingMode.value == 'Normal' then
            ---equip({main="Alkalurops"})
          else
            ---equip({main="Chatoyant staff"})
          end
          
          if spell.type == 'WhiteMagic' then
            ---equip({sub="Raptor leather strap +1"})
          elseif spell.type == 'BlackMagic' then
            ---equip({sub="Bugard leather strap +1"})
          end 
          
        end
        
        if player.status ~= 'Engaged' then
          equip(sets.grip[spell.element],sets.staff[spell.element])
        end
       
      end
    end
  
    if spell.skill ~= 'Enhancing Magic' or spell.skill ~= 'Enfeebling Magic' then
      if spell.element == world.weather_element or spell.element == world.day_element then
        
        if world.weather_element ~= 'Dark' and spellMap == 'Cure' then
          --equip({waist="Hachirin-no-obi"})
        end
        
     end
    end
    
  
  end
]]
  

--  Still working on this.

function load_hud_info()
  --------------------------------------------------------------------------------------------------------------
-- HUD Initial setup and Positioning
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
hud_x_pos = 1475    --important to update these if you have a smaller screen
hud_y_pos = 300     --important to update these if you have a smaller screen
hud_draggable = true
hud_font_size = 10
hud_transparency = 0 -- a value of 0 (invisible) to 255 (no transparency at all)
hud_font = 'Impact'
hud_padding = 10
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
-- Customize HUD looks and content
-- Colors: ('red', 'blue', 'green', 'white', 'yellow', 'cyan', 'magenta', 'black', 'orange')

sectionsColors:set('orange')
keybindsColors:set('yellow')
optionsColors:set('white')
selectionColors:set('blue')   

textHideMode:set(false)
textHideOptions:set(false)
textHideJob:set(false)
textHideBattle:set(false)
textHideHUD:set(false)
useLiteMode:set(false)
keybinds:set(false)

--[[
    This gets passed in when the Keybinds is turned on.
    IF YOU CHANGED ANY OF THE KEYBINDS ABOVE, edit the ones below so it can be reflected in the hud using the "//gs c hud keybinds" command
]]
--[[  Need to set these up with the actual binds I use but I like the concept will return to it.
-- Setup your Key Bindings here:
windower.send_command('bind insert gs c nuke cycle')            -- Insert Cycles Nuke element
windower.send_command('bind !insert gs c nuke cycledown')       -- ALT+Insert Cycles Nuke element in reverse order 

windower.send_command('bind f9 gs c toggle idlemode')           -- F9 to change Idle Mode    
windower.send_command('bind f8 gs c toggle meleemode')          -- F8 to change Melee Mode  
windower.send_command('bind !f9 gs c toggle melee')             -- Alt-F9 Toggle Melee mode on / off, locking of weapons
windower.send_command('bind home gs c toggle mainweapon')       -- Home Toggle Main Weapon
windower.send_command('bind !home gs c toggle subweapon')       -- ALT-Home Toggle sub Weapon.
windower.send_command('bind !` input /ma Stun <t>')             -- Alt-` Quick Stun Shortcut.
windower.send_command('bind delete gs c nuke enspellup')        -- delete Cycle Enspell Up
windower.send_command('bind !delete gs c nuke enspelldown')     -- Alt-delete Cycle Enspell Down
windower.send_command('bind !f10 gs c toggle nukemode')         -- Alt-F10 to change Nuking Mode
windower.send_command('bind f10 gs c toggle matchsc')           -- F10 to change Match SC Mode         
windower.send_command('bind !end gs c hud lite')                -- Alt-End to toggle light hud version       
windower.send_command('bind ^end gs c hud keybinds')            -- CTRL-End to toggle Keybinds  

keybinds_on = {}
keybinds_on['key_bind_idle'] = '(F9)'
keybinds_on['key_bind_melee'] = '(F8)'
keybinds_on['key_bind_casting'] = '(ALT-F10)'
keybinds_on['key_bind_mainweapon'] = '(HOME)'
keybinds_on['key_bind_subweapon'] = '(Alt-HOME)'
keybinds_on['key_bind_element_cycle'] = '(INS)'
keybinds_on['key_bind_enspell_cycle'] = '(DEL)'
keybinds_on['key_bind_lock_weapon'] = '(ALT-F9)'
keybinds_on['key_bind_matchsc'] = '(F10)'
]]
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
-- HUD STUFF -- TO BE EXTERNALIZED
--------------------------------------------------------------------------------------------------------------
meleeing = M('AUTO', 'OFF', 'ON')
lock = M('OFF', 'ON')
mBurst = M(false)
runspeed = M('OFF', 'ON')
oldElement = elements.current
mBurstOldValue = mBurst.value
matchsc = M('AUTO', 'OFF', 'ON')
MB_Window = 0   
time_start = 0
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
end