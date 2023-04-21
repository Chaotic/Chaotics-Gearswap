----------------------------------------------------------------------------------------------------------------
--         These are functions to handle custom commands / options on the Era Private server
----------------------------------------------------------------------------------------------------------------
function initialize_skins(name)
        if name == "Asen" then
            skins = {
                ['BLM'] = {set=285},
                ['PLD'] = {set=157},
                ['SMN'] = {head=116,body=578,hands=215,legs=577,feet=577}
            }
        elseif name == "Chaoticunreal" then
            skins = {
                ['BLM'] = {set=285},
                ['RDM'] = {body=334,hands=334,legs=334,feet=334},
                ['SMN'] = {head=116,body=578,hands=215,legs=577,feet=577},
                ['NIN'] = {head=186,body=196,hands=89,legs=294,feet=294}
            }
        elseif name == "Altered" then
            skins = {
                ['BLM'] = {set=285},
                ['THF'] = {set=225,main=756,sub=756},
                ['SMN'] = {head=116,body=578,hands=215,legs=577,feet=577}
            }
      end
    end
    function setskin(job)
    
        ids = skins[job]
        slots = {"head","body","hands","legs","feet","main","sub","ranged","ammo","set"}
        
        local command = ''
        for slot = 1,10 do
          if ids[slots[slot]] then
            command = command..'wait 2;input /s !setskin '..slots[slot]..' '..ids[slots[slot]]..';'
          end
        end 
        send_command('input /lockstyle off;wait 2;gs c update;'..command..'wait 10; input /lockstyle on')
      
      end
    
    function trade_ring()
        
        local currentRing
        
        if player.inventory['Rajas Ring'] then
            currentRing = 'Rajas Ring'
        elseif player.inventory['Tamas Ring'] then
            currentRing = 'Tamas Ring'
        elseif player.inventory['Sattva Ring'] then
            currentRing = 'Sattva Ring'
        end
        
        if player.target.name == "Runga-Kopunga" then
            send_command('input /item "'..currentRing..'" <t> ')
        else
            add_to_chat("Please target Runga-Kopunga!")
            return
        end
        
    end
    
    function trade_earring1()
        local currentEarring    
        
        if player.inventory['Abyssal Earring'] then
            currentEarring = 'Abyssal Earring'
        elseif player.inventory['Beastly Earring'] then
            currentEarring = 'Beastly Earring'
        elseif player.inventory['Bushinomimi'] then
            currentEarring = 'Bushinomimi'
        elseif player.inventory["Knight\'s Earring"] then
            currentEarring = 'Knight\'s Earring'
        elseif player.inventory['Suppanomimi'] then
            currentEarring = 'Suppanomimi'
        end
        
        if player.target.name == "Runga-Kopunga" then
            send_command('input /item "'..currentEarring..'" <t> ')
        else
            add_to_chat("Please target Runga-Kopunga!")
            return
        end
        
    end
    
    function trade_earring2()
        
        local currentEarring    
        
        if player.inventory['Ethereal Earring'] then
            currentEarring = 'Ethereal Earring'
        elseif player.inventory['Hollow Earring'] then
            currentEarring = 'Hollow Earring'
        elseif player.inventory['Magnetic Earring'] then
            currentEarring = 'Magnetic Earring'
        elseif player.inventory['Static Earring'] then
            currentEarring = 'Static Earring'
        end
        
        if player.target.name == "Runga-Kopunga" then
            send_command('input /item "'..currentEarring..'" <t> ')
        else
            add_to_chat("Please target Runga-Kopunga!")
            return
        end
        
    end
    
    function trade_whistle()
    
      if player.target.name == "Honorine" then
        equip({neck="Chocobo Whistle"})
        send_command('wait 0.25;input /item "Chocobo Whistle" <t>')
      else
        add_to_chat("Please target Honorine!")
        return
      end
    
    end
    
    function fix_casting_times()
        local res = require('resources')
    
        if not res.eraPatched then
            local cast_times = require('spell_cast_times')
    
            for i, o in ipairs(cast_times) do
                res.spells[i].cast_time = o.cast_time
            end
    
            res.eraPatched = true
        end
    end

    function find_skins(slot,num)
        slots = S{"head","body","hands","legs","feet","main","sub","ranged","ammo","set"}
        if not slots:contains(slot) then
            add_to_chat(123,'Unknown slot: '..tostring(slot))
            return
        end
        local command = ''
        send_command('input /lockstyle off;')
        for item = num,num+100 do
            command = command..'wait 2;input /s !setskin '..slot..' '..item..';'
        end
        send_command(command)
    end