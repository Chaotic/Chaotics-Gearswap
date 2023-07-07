function init_gear_sets()
  
    windower.send_command('sta !packets off; wait 1; gs equip sets.idle')
    

	-- misc
	sets.sublimation = {}
     
    --base magic sets
  -- misc
  sets.MND = {
		main="Yew Wand +1",
    head="Garrison Sallet",
    hands="Seer's Mitts +1",
    legs="Savage Loincloth",
    feet="Seer's Pumps +1",
    neck="Justice Badge",
    back="Mist Silk Cape",
    right_ring="Tamas Ring",
  }

  sets.INT = {
    main="Yew Wand +1",
    head="Seer's Crown +1",
    hands="Seer's Mitts +1",
    legs="Seer's Slacks +1",
    left_ring="Wisdom Ring",
    right_ring="Tamas Ring",
  }
     
	-- idle/resting
    --idle
	sets.idle = {
      main="Elm Staff",
      sub="Lizard Strap",
      head="Seer's Crown +1",
      body="Seer's Tunic +1",
      hands="Seer's Mitts +1",
      legs="Seer's Slacks +1",
      feet="Seer's Pumps +1",
      neck="Justice Badge",
      waist="Shaman's Belt",
      left_ear="Morion Earring",
      right_ear="Morion Earring",
      left_ring="Eremite's Ring",
      right_ring="Eremite's Ring",
	  }
    sets.idle.DW = {
      main="Yew Wand +1",
      sub="Yew Wand +1",
      head="Seer's Crown +1",
      body="Seer's Tunic +1",
      hands="Seer's Mitts +1",
      legs="Seer's Slacks +1",
      feet="Seer's Pumps +1",
      neck="Justice Badge",
      waist="Shaman's Belt",
      left_ear="Morion Earring",
      right_ear="Morion Earring",
      left_ring="Eremite's Ring",
      right_ring="Eremite's Ring",
	  }
	sets.idle.Town = set_combine(sets.idle,
                    {
                        back="Nexus cape"
                    })
  sets.idle.Town.DW = set_combine(sets.idle.DW,{
                                        back="Nexus cape",
                                      })
	sets.resting = {
					main="Pilgrim's Wand",
					body="Seer's Tunic +1",
					}
          sets.resting.DW = {
						main="Yew Wand +1",
						sub="Pilgrim's Wand",
						body="Seer's Tunic +1",
					  }                                                        
	-- precast                                         
	sets.precast.FC = {}
	
	-- midcast
	sets.midcast.FastRecast = set_combine(sets.precast.FC,
                                            {})
	
	sets.midcast['Healing Magic'] = set_combine(sets.MND,
                                                sets.midcast.FastRecast,
                                                {})
	               
	sets.midcast['Divine Magic'] = set_combine(sets.MND,
                                                {})
	
	sets.midcast['Enfeebling Magic'] = {}
	
	sets.midcast['Enfeebling Magic']['BlackMagic'] = set_combine(sets.INT,
                                                                sets.midcast['Enfeebling Magic'],
                                                                {})
	              
	sets.midcast['Enfeebling Magic']['BlackMagic'].Acc = set_combine(sets.midcast['Enfeebling Magic']['BlackMagic'],
                                                                    sets.midcast['Enfeebling Magic'],
                                                                    {})
	
	sets.midcast['Enfeebling Magic']['WhiteMagic'] = set_combine(sets.MND,
                                                                sets.midcast['Enfeebling Magic'],
                                                                {})

	               
	sets.midcast['Enfeebling Magic']['WhiteMagic'].Acc = set_combine(sets.midcast['Enfeebling Magic']['WhiteMagic'],
                                                                    sets.midcast['Enfeebling Magic'],
                                                                    {})
	
	sets.midcast['Elemental Magic'] = set_combine(sets.INT,
                                                    {})
	               
	sets.midcast['Elemental Magic'].Acc = set_combine(sets.midcast['Elemental Magic'],
                                                        {})
	
	sets.midcast['Dark Magic'] = set_combine(sets.INT,
                                            {})
	               
  sets.midcast['Dark Magic'].Acc = set_combine(sets.midcast['Dark Magic'],
                                                {})
	                                                   
	sets.midcast['Enhancing Magic'] = set_combine(sets.MND,
                                                sets.midcast.FastRecast,
                                                {})
	
	-- custom midcast
	sets.midcast.Cure = set_combine(sets.midcast['Healing Magic'],
                                    {
                                        main="Melampus Staff"
                                    })
                 
  sets.midcast.Curaga = set_combine(sets.midcast.Cure,
                                    {})
	
	sets.midcast.Sleep = set_combine(sets.midcast.FastRecast,
                                    sets.INT,
                                    sets.midcast['Enfeebling Magic'],
                                    {})

  sets.midcast.EleEnfeebs = set_combine(sets.INT,
                                        {})
  
  sets.midcast.Spikes = set_combine(sets.INT,
                                    {})
                
  sets.midcast['Cursna'] = set_combine(sets.midcast['Healing Magic'],
  {})
                
  sets.midcast['Stoneskin'] = set_combine(sets.midcast['Enhancing Magic'],
                                            {})
                 
  sets.midcast['Phalanx'] = set_combine(sets.midcast['Stoneskin'],
                                        {})
                
  sets.midcast['Kaustra'] = set_combine(sets.midcast['Dark Magic'].Acc,
                                        {})

	initialize_crafting_sets(player.name)	
end