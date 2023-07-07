
-------------------------------------------------------------------------------------------------------------------
-- Functions to set user-specified binds, generally on load and unload.
-- Kept separate from the main include so as to not get clobbered when the main is updated.
-------------------------------------------------------------------------------------------------------------------

-- Function to bind GearSwap binds when loading a GS script.
function global_on_load()

    
	-- ^ = Ctrl  ! = Alt   @ = Win
	
    --[[ Most of these I don't use and there is some overlap Saving for when I find a use
    send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind ^f9 gs c cycle HybridMode')
	send_command('bind !f9 gs c cycle RangedMode')
	send_command('bind @f9 gs c cycle WeaponskillMode')]]
	send_command('bind ^f1 game_forceambientlight')

	send_command('bind f10 gs c set DefenseMode Physical')
	send_command('bind ^f10 gs c cycle PhysicalDefenseMode')
	send_command('bind !f10 gs c toggle Kiting')
	send_command('bind f11 gs c set DefenseMode Magical')
	send_command('bind !f11 gs c cycle CastingMode')
	send_command('bind f12 gs c update user')
	send_command('bind !f12 gs c reset DefenseMode')

	--[[
		send_command('bind ^- gs c toggle selectnpctargets')
	send_command('bind ^= gs c cycle pctargetmode')
      
	  -- Defensive cycles
	  send_command('bind f10 gs c set DefenseMode Physical')
	  send_command('bind f11 gs c set DefenseMode Magical')
	  send_command('bind f12 gs c reset DefenseMode')
	  
	  -- Offensive cycles
	  ]]
      send_command('bind ^f9 gs c cycle OffenseMode')
	  --send_command('bind ^f10 gs c cycle WeaponskillMode')
	  
      send_command('bind ^f11 gs c cycle RangedMode')
	  --[[
      send_command('bind ^f12 gs c cycle CastingMode')
	  
	  -- Misc. cycles
	  -- F9 left out for customs
	  send_command('bind !f10 gs c toggle Tank')
	  send_command('bind !f11 gs c regear')
	  send_command('bind !f12 gs reload')
	  
	  -- Trade functions
	  send_command('bind !z input /pcmd leader '..player.name)
	  send_command('bind !x gs c trade_earring1')
	  send_command('bind !c gs c trade_earring2')
	  send_command('bind !v gs c trade_ring')
      send_command('bind !q gs c trade_whistle')
	]]
	  -- other misc
	  send_command('bind !b gs c setskin')
	  send_command('bind !n ffo me')
	  send_command('bind !m ffo stopall')
	  send_command('bind !, gs c warp_out')
end

-- Function to revert binds when unloading.
function global_on_unload()
	send_command('unbind ^f1')
	send_command('unbind f9')
	send_command('unbind ^f9')
	send_command('unbind !f9')
	send_command('unbind @f9')
	send_command('unbind f10')
	send_command('unbind ^f10')
	send_command('unbind !f10')
	send_command('unbind f11')
	send_command('unbind ^f11')
	send_command('unbind !f11')
	send_command('unbind f12')
	send_command('unbind ^f12')
	send_command('unbind !f12')

	send_command('unbind ^-')
	send_command('unbind ^=')
    send_command('unbind !b')
    send_command('unbind !n')
	send_command('unbind !m')
	send_command('unbind !,')
end

-------------------------------------------------------------------------------------------------------------------
-- Global event-handling functions.
-------------------------------------------------------------------------------------------------------------------

-- Global intercept on precast.
function user_precast(spell, action, spellMap, eventArgs)
    cancel_conflicting_buffs(spell, action, spellMap, eventArgs)
    refine_waltz(spell, action, spellMap, eventArgs)
end

-- Global intercept on midcast.
function user_midcast(spell, action, spellMap, eventArgs)
	-- Default base equipment layer of fast recast.
	local midcastSet;
	if spell.action_type == 'Magic' and sets.midcast and sets.midcast.FastRecast then
  		if spell.skill == 'Enfeebling Magic' then
    		midcastSet = set_combine(sets.midcast[spell.skill][spell.type],sets.midcast.FastRecast)
  		else
    		midcastSet = set_combine(sets.midcast[spell.skill],sets.midcast.FastRecast)
  		end
  	end
  	equip(midcastSet)
end

function user_post_midcast(spell,action,spellMap,eventsArgs)
	 if spell.skill == 'Enfeebling Magic' then
		equip(sets.midcast[spell.skill][spell.type])
	  else 
		equip(sets.midcast[spell.skill])
	  end
end
-- Global intercept on buff change.
function user_buff_change(buff, gain, eventArgs)
	-- Create a timer when we gain weakness.  Remove it when weakness is gone.
	if buff:lower() == 'weakness' then
		if gain then
			send_command('timers create "Weakness" 300 up abilities/00255.png')
		else
			send_command('timers delete "Weakness"')
		end
	end
end

function user_status_change(new,old)
	handle_locks()
    if new == 'Resting' then
        if player.tp > 50 then
			if state.RestingMode.value ~= 'DW' then
           		 if state.RestingMode.value ~= 'TP' then
                	send_command('gs c set RestingMode TP')
            	end
        		else
            	if state.RestingMode.value ~= 'Normal' then
	                send_command('gs c set RestingMode Normal')
    	        end
        	end
		end
    end
end