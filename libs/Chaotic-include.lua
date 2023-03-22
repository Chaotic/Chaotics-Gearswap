
--include('Chaotic-HUD.lua')

-- The Following were copied from Kay-include and then modified to work with my understanding of Motes

function job_self_command(commandArgs,eventArgs)

    if commandArgs[1] == 'trade' then
        handle_trades(commandArgs)
    elseif commandArgs[1] == 'regear' then
        regear()
    elseif commandArgs[1] == 'custom_treasure_cycle' then
        custom_treasure_cycle()
    elseif commandArgs[1]:lower() == 'siphon' then
        handle_siphoning()
        eventArgs.handled = true
    elseif commandArgs[1]:lower() == 'pact' then
        handle_pacts(commandArgs)
        eventArgs.handled = true
    elseif commandArgs[1] == 'reset_ward_flag' then
        wards.flag = false
        wards.spell = ''
        eventArgs.handled = true
--  elseif commandArgs[1] == 'handle_shot' then
--    handle_shot()
--    eventArgs.handled = true
    elseif commandArgs[1] == 'setskin' then
        setskin(player.main_job)
        eventArgs.handled = true
    elseif commandArgs[1] == 'craft' then
        select_default_macro_book(player.main_job,player.main_job)
        eventArgs.handled = true
    elseif commandArgs[1] == 'macro' then
        select_default_macro_book()
        eventArgs.handled = true
    elseif commandArgs[1]:lower() == 'scholar' then
        handle_scholar(commandArgs)
        eventArgs.handled = true
    elseif commandArgs[1] == 'tlock' then
        toggle_slots(commandArgs)
        eventArgs.handled = true
    end
end

function initialize_job()
    include('Era-Utilities.lua')
    fix_casting_times()

    initialize_skins(player.name)
    initialize_crafting_mode(player.name)
    check_buffs_on_load()
    load_lock_items()


    if custom_job_sub_job_change then
        custom_job_sub_job_change(player.sub_job,"")
    end

    state.Tank = M(false, 'Tank')
    state.Ranged = M(false, 'Ranged')
    
    gear.main = player.equipment.main
    gear.sub = player.equipment.sub
    
    select_default_macro_book()
    --set_custom_universal_keybinds()
    
    windower.register_event('zone change', 
    function(new, old)
        send_command('gs c update')
    end)

    windower.register_event('time change', time_change)
    
end



function job_sub_job_change(new,old)

    select_default_macro_book()
    if custom_job_sub_job_change then
        custom_job_sub_job_change(new,old)
    end

end

function select_default_macro_book(main,sub)
	
	local mainjobs = {'WAR','MNK','WHM','BLM','RDM','THF','PLD','DRK','BST','BRD','RNG','SAM','NIN','DRG','SMN','BLU','COR','PUP','DNC','SCH'}
	local commonsubs = {'NIN','DNC','WAR','SAM','THF','WHM','RDM','SCH','BLM','DRG'}
	local macro_main;
	local macro_sub;

	if main then
		macro_main = main
	else
		macro_main = player.main_job
	end
	if sub then
		macro_sub = sub
	else
		macro_sub = player.sub_job
	end
	local mainpage
	local subpage
	
	for mainjob = 1,20 do
		if macro_main == mainjobs[mainjob] then
			mainpage = mainjob
			add_to_chat('Main job '..macro_main..': Macro Book '..mainjob..'.')
		end
	end
	
	for subjob = 1,10 do
		if macro_sub == commonsubs[subjob] then
			subpage = subjob
			add_to_chat('Sub job '..macro_sub..': Macro Page '..subjob..'.')
		end
	end
		
		set_macro_page(subpage,mainpage)
	
end

function regear()
    
    equip({main=gear.main,sub=gear.sub})
    send_command('gs c update')
    add_to_chat('Regeared: ' .. gear.main .. ' and ' .. gear.sub)
    
end

function sleep_swap(name,gain)

    local neck = 'Opo-opo necklace'

    if name == 'sleep' then
        if gain then
            if player.main_job == 'WAR' or player.main_job == 'PLD' or player.main_job == 'DRK' or player.main_job == 'SAM' or player.main_job == 'DRG' then
              neck='Berserker\'s torque'
            elseif player.main_job == 'DNC' or player.main_job == 'THF' or player.main_job == 'MNK' or player.main_job == 'BST' then
              equip({head='Frenzy sallet'})
            end
            equip({neck=neck})
        else
            send_command('gs c update')
        end
    end

end

function ammo_recharge()

    if player.equipment.ammo == 'empty' then
        if player.inventory[gear.ammo] then
            add_to_chat("Replenishing "..gear.ammo.."s.")
            equip({ammo=gear.ammo})
        else
            add_to_chat("No more "..gear.ammo.."s.")
        end
    else
        gear.ammo = player.equipment.ammo
    end

end

function handle_locks()
    if equip_lock[player.equipment.left_ring] or equip_lock[player.equipment.right_ring] then
        disable('ring1','ring2')
    else
        enable('ring1','ring2')
    end
    if equip_lock[player.equipment.range] then
        disable('range','ammo')
    else
        enable('range','ammo')
    end
    if equip_lock[player.equipment.back] then
        disable('back')
    else
        enable('back')
    end
end

function load_lock_items()
    equip_lock = S{
        "Warp Ring",
        "Halcyon Rod",
        "Mithran Fish. Rod",
        "Comp. Fishing Rod",
        "S.H. Fishing Rod",
        "Carbon Fish. Rod",
        "Glass Fiber F. Rod",
        "Yew Fishing Rod",
        "Hume Fishing Rod",
        "Nexus Cape",
      }
    end

function toggle_slots()
    
end

function lock_ranged()
    
    if state.Range.value then
        disable("range","ammo")
    else
        enable("range","ammo")
    end
    
end

function handle_scholar(cmdParams)

    if not cmdParams[2] then
        add_to_chat(123,'Error: No strategem command given.')
        return
    end

    if cmdParams[2] == 'helix' then
        handle_helix()
    else
        handle_strategems(cmdParams)
    end
end
-- General handling of strategems in an Arts-agnostic way.
-- Format: gs c scholar <strategem>

function handle_strategems(cmdParams)
    -- cmdParams[1] == 'scholar'
    -- cmdParams[2] == strategem to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No strategem command given.')
        return
    end
    local strategem = cmdParams[2]:lower()

    if strategem == 'light' then
        if buffactive['light arts'] then
            send_command('input /ja "Addendum: White" <me>')
        elseif buffactive['addendum: white'] then
            add_to_chat(122,'Error: Addendum: White is already active.')
        else
            send_command('input /ja "Light Arts" <me>')
        end
    elseif strategem == 'dark' then
        if buffactive['dark arts'] then
            send_command('input /ja "Addendum: Black" <me>')
        elseif buffactive['addendum: black'] then
            add_to_chat(122,'Error: Addendum: Black is already active.')
        else
            send_command('input /ja "Dark Arts" <me>')
        end
    elseif buffactive['light arts'] or buffactive['addendum: white'] then
        if strategem == 'cost' then
            send_command('input /ja Penury <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Celerity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Accession <me>')
        elseif strategem == 'power' then
            send_command('input /ja Rapture <me>')
        elseif strategem == 'duration' then
            send_command('input /ja Perpetuance <me>')
        elseif strategem == 'accuracy' then
            send_command('input /ja Altruism <me>')
        elseif strategem == 'enmity' then
            send_command('input /ja Tranquility <me>')
        elseif strategem == 'skillchain' then
            add_to_chat(122,'Error: Light Arts does not have a skillchain strategem.')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: White" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    elseif buffactive['dark arts']  or buffactive['addendum: black'] then
        if strategem == 'cost' then
            send_command('input /ja Parsimony <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Alacrity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Manifestation <me>')
        elseif strategem == 'power' then
            send_command('input /ja Ebullience <me>')
        elseif strategem == 'duration' then
            add_to_chat(122,'Error: Dark Arts does not have a duration strategem.')
        elseif strategem == 'accuracy' then
            send_command('input /ja Focalization <me>')
        elseif strategem == 'enmity' then
            send_command('input /ja Equanimity <me>')
        elseif strategem == 'skillchain' then
            send_command('input /ja Immanence <me>')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: Black" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    else
        add_to_chat(123,'No arts has been activated yet.')
    end
end

function handle_helix()
    if areas.Cities:contains(world.area) then
      add_to_chat(122, 'Cannot use Healix in a city area.')
      return
    end
  
    local helixElement
  
        -- If we decided to use a storm, set that as the spirit element to cast.
    if world.weather_element ~= 'None' and (get_weather_intensity() > 0 or world.weather_element ~= elements.weak_to[world.day_element]) then
      if world.weather_element ~= 'Lightning' or world.day_element ~= 'Lightning' then
        helixElement = world.weather_element
      end
    else
      helixElement = world.day_element
    end
  
    local command = ''
  
      command = command..'input /ma "'..elements.helix_of[helixElement]..'" <t>;wait 4;'
  
    send_command(command)
    
  end

  function handle_trades(cmdParams)
    if not cmdParams[2] then
        add_to_chat(123,'Error: item given.')
        return
    end
    if cmdParams[2] == 'ring' then
        trade_ring()
    elseif cmdParams[2] == 'earring1' then
        trade_earring1()
    elseif cmdParams[2] == 'earring2' then
        trade_earring2()
    elseif cmdParams[2] == 'whistle' then
        trade_whistle()
    end
end

function check_buffs_on_load()
    
    if buffactive['Level Restriction'] or buffactive['Level Sync'] or buffactive['Battlefield'] then
        if handle_level_sync then
            handle_level_sync('true')  -- I'll leave this to the job file to handle
        end 
    end
end

function handle_standard_buffs(buff,gain)

    --  These ones should be handled the same regardless of the job so handle them in the include.

    --add_to_chat(122, 'Buff:'..tostring(buff)..': gain:'..tostring(gain)..':')
    if buff == 'Level Restriction' or buff == 'Level Sync' or buff == 'Battlefield' then
        if handle_level_sync then
            handle_level_sync(gain)  -- I'll leave this to the job file to handle
        end 
    end
    if buff == 'Mounted' then
        if gain then
            windower.send_command('timers create "Mount" 300 down')
        end
    end
        
    sleep_swap(buff,gain)

end

-----------------------------------------------------------------------------------------------------
--  Crafting Stuff to handle equiping gear when needed 

--  This function sets up the crafting sets based on the character name.  Since Chaoticunreal does my crafting while the other two mine/gather he has more
function initialize_crafting_sets(name)
    if name == "Chaoticunreal" then
        sets.idle['Alchemy'] = {
                    main="Caduceus",
                    body="Alchemist's Apron",
                }
        sets.idle['Bonecraft'] = {}
        sets.idle['Clothcraft'] = {}
        sets.idle['Cooking'] = {
                    head="Chef's Hat",
                    body="Culinarian's Apron",
                }
        sets.idle['Fishing'] = {
                    body="Angler's Tunica",
                    hands="Angler's Gloves",
                    legs="Angler's Hose",
                    feet="Waders",
                }
        sets.idle['Goldsmithing'] = {
                    head="Shaded Specs.",
                    body="Goldsmith's Apron",
                }
        sets.idle['Leathercraft'] = {
                    body="Tanner's Apron",
                    hands="Tanner's Gloves",
                }
        sets.idle['Smithing'] = {
                    body="Blacksmith's Apn.",
                    hands="Smithy's Mitts",
                }
        sets.idle['Woodworking'] = {}
        sets.idle['Gathering'] = {
                    body="Field Tunica",
                    hands="Field Gloves",
                    legs="Field Hose",
                    feet="Field Boots",
                }
        sets.idle['Alchemy-Ring'] = set_combine(sets.idle['Alchemy'],
                            {
                                left_ring="Alchemist's Ring",
                            })
        sets.idle['Bonecraft-Ring'] = set_combine(sets.idle['Bonecraft'],{})
        sets.idle['Clothcraft-Ring'] = set_combine(sets.idle['Clothcraft'],{})
        sets.idle['Cooking-Ring'] = set_combine(sets.idle['Cooking'],
                            {
                                left_ring="Chef's Ring",
                            })
        sets.idle['Goldsmithing-Ring'] = set_combine(sets.idle['Goldsmithing'],
                            {
                                left_ring="Goldsmith's Ring",
                            })
        sets.idle['Leathercraft-Ring'] = set_combine(sets.idle['Leathercraft'],
                            {
                                left_ring="Tanner's Ring",
                            })
        sets.idle['Smithing-Ring'] = set_combine(sets.idle['Smithing'],
                            {
                                left_ring="Smith's Ring",
                            })
        sets.idle['Woodworking-Ring'] = set_combine(sets.idle['Woodworking'],{})
elseif name == "Asen" then
    sets.idle['Fishing'] = {
                                body="Fsh. Tunica",
                                legs="Fisherman's Hose",
                            }
        sets.idle['Gathering'] = {
                                  body="Field Tunica",
                                  hands="Field Gloves",
                                  legs="Field Hose",
                                  feet="Field Boots",
                            }
    elseif name == "Altered" then
        sets.idle['Fishing'] = {
                                body="Fsh. Tunica",
                                hands="Fsh. Gloves",
                                legs="Fisherman's Hose",
                                feet="Angler's Boots",
                            }
        sets.idle['Digging'] = {
                                body="Choc. Jack Coat",
                                hands="Chocobo Gloves",
                                legs="Chocobo Hose",
                                feet="Chocobo Boots",
                            }
    end
end

--  This sets up the valid crafting modes. They are switched via macros
function initialize_crafting_mode(name)
    if name == "Chaoticunreal" then
        state.CraftingMode = M{['description'] = 'Crafting Mode','None','Alchemy','Alchemy-Ring','Bonecraft','Bonecraft-Ring','Clothcraft','Clothcraft-Ring','Cooking','Cooking-Ring','Fishing','Goldsmithing','Goldsmithing-Ring','Leathercraft','Leathercraft-Ring','Smithing','Smithing-Ring','Woodworking','Woodworking-Ring','Gathering'}
    elseif name == "Asen" then
        state.CraftingMode = M{['description'] = 'Crafting Mode','None','Fishing','Gathering'}
    elseif name == "Altered" then
        state.CraftingMode = M{['description'] = 'Crafting Mode','None','Fishing','Digging'}
    end
end

-- If we are in a crafting mode equip it.  This is called from the customize_idle_set function
--  This might get folded into the global file if I move the customize_idle_set there.
function maybe_equip_crafting(idleSet,crafting_mode)
    return set_combine(idleSet, sets.idle[crafting_mode])
end
-----------------------------------------------------------------------------------------------------

function handle_cor_rolls(roll)
   
    rolls = {
        ["Corsair's Roll"]   = {lucky=5, unlucky=9, bonus="Experience Points"},
        ["Ninja Roll"]       = {lucky=4, unlucky=8, bonus="Evasion"},
        ["Hunter's Roll"]    = {lucky=4, unlucky=8, bonus="Accuracy"},
        ["Chaos Roll"]       = {lucky=4, unlucky=8, bonus="Attack"},
        ["Magus's Roll"]     = {lucky=2, unlucky=6, bonus="Magic Defense"},
        ["Healer's Roll"]    = {lucky=3, unlucky=7, bonus="Cure Potency Received"},
        ["Puppet Roll"]      = {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
        ["Choral Roll"]      = {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
        ["Monk's Roll"]      = {lucky=3, unlucky=7, bonus="Subtle Blow"},
        ["Beast Roll"]       = {lucky=4, unlucky=8, bonus="Pet Attack"},
        ["Samurai Roll"]     = {lucky=2, unlucky=6, bonus="Store TP"},
        ["Evoker's Roll"]    = {lucky=5, unlucky=9, bonus="Refresh"},
        ["Rogue's Roll"]     = {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
        ["Warlock's Roll"]   = {lucky=4, unlucky=8, bonus="Magic Accuracy"},
        ["Fighter's Roll"]   = {lucky=5, unlucky=9, bonus="Double Attack Rate"},
        ["Drachen Roll"]     = {lucky=3, unlucky=7, bonus="Pet Accuracy"},
        ["Gallant's Roll"]   = {lucky=3, unlucky=7, bonus="Defense"},
        ["Wizard's Roll"]    = {lucky=5, unlucky=9, bonus="Magic Attack"},
        ["Dancer's Roll"]    = {lucky=3, unlucky=7, bonus="Regen"},
        ["Scholar's Roll"]   = {lucky=2, unlucky=6, bonus="Conserve MP"},
        ["Bolter's Roll"]    = {lucky=3, unlucky=9, bonus="Movement Speed"},
        ["Caster's Roll"]    = {lucky=2, unlucky=7, bonus="Fast Cast"},
        ["Courser's Roll"]   = {lucky=3, unlucky=9, bonus="Snapshot"},
        ["Blitzer's Roll"]   = {lucky=4, unlucky=9, bonus="Attack Delay"},
        ["Tactician's Roll"] = {lucky=5, unlucky=8, bonus="Regain"},
        ["Allies's Roll"]    = {lucky=3, unlucky=10, bonus="Skillchain Damage"},
        ["Miser's Roll"]     = {lucky=5, unlucky=7, bonus="Save TP"},
        ["Companion's Roll"] = {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
        ["Avenger's Roll"]   = {lucky=4, unlucky=8, bonus="Counter Rate"},
    }
    
    rollinfo = rolls[roll]
    if rollinfo then
        add_to_chat(roll..': '..rollinfo.bonus..'.')
        add_to_chat('Lucky: '..tostring(rollinfo.lucky)..', Unlucky: '..tostring(rollinfo.unlucky)..'.')
    end
end