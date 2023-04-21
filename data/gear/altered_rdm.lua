function init_gear_sets()
    
    windower.send_command('sta !packets off; wait 1; gs equip sets.idle')

	--Misc
	sets.MND = {
        main="Yew Wand +1",
        sub="Shell Shield",
        head="Garrison Sallet",
        neck="Justice Badge",
        body="Channeling Robe",
        hands="Zealot's Mitts",
        legs="Mithran Loincloth",
        feet="Mithran Gaiters",
        waist="Friar's Rope",
        left_ear="Morion Earring",
        right_ear="Morion Earring",
        left_ring="Turquoise Ring",
        right_ring="Turquoise Ring",
        back="White Cape +1"
    }
	   
	sets.INT = {
        main="Yew Wand +1",
        sub="Shell Shield",
        head="Horn Hairpin",
        body="Channeling Robe",
        hands="Garrison Gloves",
        legs="Mithran Loincloth",
        feet="Mithran Gaiters",
        waist="Shaman's Belt",
        left_ear="Morion Earring",
        right_ear="Morion Earring",
        left_ring="Eremite's Ring",
        right_ring="Eremite's Ring",
        back="Black Cape +1"
    }
	
	-- idle
	sets.idle = { 
        main="Brass Xiphos",
        sub="Maple Shield",
        head="Garrison Sallet",
        body="Garrison Tunica",
        hands="Garrison Gloves",
        legs="Linen Slops",
        feet="Scale Greaves",
        right_ring="Empress Band",
        back="Traveler's Mantle"
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
	
	sets.resting = {}
  
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
        main="Brass Xiphos",
        sub="Maple Shield",
        head="Garrison Sallet",
        body="Garrison Tunica",
        hands="Garrison Gloves",
        legs="Linen Slops",
        feet="Scale Greaves",
        right_ring="Empress Band",
        back="Traveler's Mantle"
    }
     
  --- sets.engaged.DW = set_combine(sets.engaged,{left_ear="Suppanomimi"})
  
  -- ws
    sets.precast.WS = {}

    initialize_crafting_sets(player.name)
end