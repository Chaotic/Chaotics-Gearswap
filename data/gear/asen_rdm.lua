function init_gear_sets()
    
    windower.send_command('sta !packets off; wait 1; gs equip sets.idle')

	--Misc
	sets.MND = {
        neck="Justice Badge",
        hands="Zealot's Mitts",
        head="Garrison Sallet",
    }
	   
	sets.INT = {
        hands="Garrison Gloves",

    }
	
	-- idle
	sets.idle = { 
        main="Tuck",
        sub="Kaiser Sword",
        ammo="Fortune Egg",
        head="Empress Hairpin",
        body="Bone Harness",
        hands="Bone Mittens +1",
        legs="Garrison Hose",
        feet="Bounding Boots",
        neck="Justice Badge",
        waist="Barbarian's Belt",
        left_ear="Cassie Earring",
        right_ear="Optical Earring",
        left_ring="Courage Ring",
        right_ring="Rajas Ring",
        back="Traveler's Mantle",
    }
     
  sets.idle.Combat = set_combine(sets.idle,{})
   
  sets.idle.Town = set_combine(sets.idle,
                {
                    back="Nexus cape"
                })
   
  sets.idle.Combat = set_combine(sets.idle,{})
   
  sets.idle.Town.Combat = set_combine(sets.idle.Combat,
                {
                    back="Nexus cape"
                })
	
                sets.resting = {
                    main="Pilgrim's Wand",
                  }
  
  -- precast magic
    sets.precast.FC= {}
	                                                   
	-- midcast magic                                   
	sets.midcast.FastRecast = set_combine(sets.precast.FC,{})
	               
    sets.midcast['Utsusemi: Ni'] = set_combine(sets.midcast.FastRecast,{})

	sets.midcast['Utsusemi: Ichi'] = set_combine(sets.midcast['Utsusemi: Ni'],{})

    sets.midcast['Healing Magic'] = set_combine(sets.MND,sets.midcast.FastRecast,{})
                                                     
    sets.midcast['Divine Magic'] = set_combine(sets.MND,{})
                 
    sets.midcast['Divine Magic'].Acc = set_combine(sets.midcast['Divine Magic'],{})
                                                     
    sets.midcast['Enfeebling Magic'] = {}
                                                     
    sets.midcast['Enfeebling Magic']['BlackMagic'] = set_combine(sets.INT,{})
   
    sets.midcast['Enfeebling Magic']['BlackMagic'].Acc = set_combine(sets.midcast['Enfeebling Magic']['BlackMagic'],
                                                                     sets.midcast['Enfeebling Magic'],{})
  
    sets.midcast['Enfeebling Magic']['WhiteMagic'] = set_combine(sets.MND,{})
   
    sets.midcast['Enfeebling Magic']['WhiteMagic'].Acc = set_combine(sets.midcast['Enfeebling Magic']['WhiteMagic'],
                                                                     sets.midcast['Enfeebling Magic'],{})
  
    sets.midcast['Elemental Magic'] = set_combine(sets.INT,{})
   
    sets.midcast['Elemental Magic'].Acc = set_combine(sets.midcast['Elemental Magic'],{})
                                                     
    sets.midcast['Dark Magic'] = set_combine(sets.INT,{})
                 
    sets.midcast['Dark Magic'].Acc = set_combine(sets.midcast['Dark Magic'],{})
                                                     
    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{})
                                                     
  -- custom midcast magic                            
    sets.midcast['Stoneskin'] = set_combine(sets.MND,sets.midcast.FastRecast,{})
                 
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Stoneskin'],{})
                
    sets.midcast['Blink'] = set_combine(sets.midcast['Stoneskin'],{})
                
    sets.midcast['Aquaveil'] = set_combine(sets.midcast['Stoneskin'],{})
                 
    sets.midcast.Cure = set_combine(sets.midcast['Healing Magic'],{main="Melampus Staff"})
                 
    sets.midcast.Curaga = set_combine(sets.midcast.Cure,{})

    sets.midcast['Cursna'] = set_combine(sets.midcast['Healing Magic'],{})
                
    sets.midcast.Sleep = set_combine(sets.midcast.FastRecast,sets.INT,sets.midcast['Enfeebling Magic'],{})
                
    sets.midcast.EleEnfeebs = set_combine(sets.INT,{})
                
    sets.midcast.Spikes = set_combine(sets.INT,{})
  
  -- engaged
    sets.engaged= {
        main="Tuck",
        sub="Kaiser Sword",
        head="Empress Hairpin",
        body="Bone Harness",
        hands="Bone Mittens +1",
        legs="Garrison Hose",
        feet="Bounding Boots",
        neck="Justice Badge",
        waist="Barbarian's Belt",
        left_ear="Cassie Earring",
        right_ear="Optical Earring",
        left_ring="Courage Ring",
        right_ring="Rajas Ring",
        back="Traveler's Mantle",
    }
     
  --- sets.engaged.DW = set_combine(sets.engaged,{left_ear="Suppanomimi"})
  
  -- ws
    sets.precast.WS = {}

    initialize_crafting_sets(player.name)
end