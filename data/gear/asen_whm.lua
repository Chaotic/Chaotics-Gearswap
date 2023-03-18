function init_gear_sets()
  
    windower.send_command('sta !packets on')
    
    

  -- misc
  sets.MND = {
    head="Garrison Sallet",
    hands="Seer's Mitts +1",
    legs="Savage Loincloth",
    feet="Seer's Pumps +1",
    neck="Justice Badge",
    back="Mist Silk Cape",
  }

  sets.INT = {
    head="Seer's Crown +1",
    hands="Seer's Mitts +1",
    legs="Seer's Slacks +1",
  }
	
	--Precast Magic
	sets.precast.FC 											= {}
	sets.precast.FC.Cure										= set_combine(sets.precast.FC,{})
	
	--Midcast Magic
	sets.midcast['Enhancing Magic'] 							= {}
	sets.midcast['Enfeebling Magic'] 							= {}
	
	sets.midcast['Healing Magic'] 								= set_combine(sets.MND,{})
	sets.midcast['Divine Magic']								= set_combine(sets.MND,{})
	sets.midcast['Enfeebling Magic']['WhiteMagic']				= set_combine(sets.MND,{})
	sets.midcast['Enfeebling Magic']['WhiteMagic'].Resistant	= set_combine(sets.MND,sets.midcast['Enfeebling Magic']['WhiteMagic'],{})
	
	sets.midcast.Regen  										= set_combine(sets.midcast['Healing Magic'],{})
	
	sets.midcast['Dark Magic']									= set_combine(sets.INT,{})
	sets.midcast['Elemental Magic']								= set_combine(sets.INT,{})
	sets.midcast['Enfeebling Magic']['BlackMagic']				= set_combine(sets.INT,{})
	sets.midcast['Enfeebling Magic']['BlackMagic'].Resistant	= set_combine(sets.INT,sets.midcast['Enfeebling Magic']['BlackMagic'],{})
	
	sets.midcast.CureSelf 										= set_combine(sets.midcast['Healing Magic'],{
 	})
	sets.midcast.FastRecast										= set_combine(sets.precast.FC,{})
	
  -- Resting sets
  sets.resting = {
    main="Pilgrim's Wand",
    body="Seer's Tunic +1",
  }
  -- Idle sets
  sets.idle = {
    main="Elm Staff +1",
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
    left_ring="Warp Ring",
    right_ring="Eremite's Ring",
  }
 
  sets.idle.Town = set_combine(sets.idle,
                                {
                                    back="Nexus cape"
                                })

	sets.Kiting													= {}
	
	sets.idle.PDT												= set_combine(sets.idle,{})
	sets.idle.MDT												= set_combine(sets.idle,{})
	
	--Engaged Sets
	sets.engaged												= {}
	sets.engaged.Acc											= set_combine(sets.engaged,{})
	
	sets.engaged.DW												= {}
	sets.engaged.DW.Acc											= set_combine(sets.engaged.DW,{})
	
	--Weaponskill Sets
	sets.precast.WS												= {}
	sets.precast.WS.Acc											= set_combine(sets.precast.WS,{})
	
	sets.precast.WS['Hexa Strike']								= set_combine(sets.precast.WS,{})
	sets.precast.WS['Hexa Strike'].Acc							= set_combine(sets.precast.WS['Hexa Strike'],{})

    -- custom midcast sets
    sets.midcast.Cure = set_combine(sets.MND,
                                    {
                                          main="Melampus Staff",
                                    })

    sets.midcast.Curaga = set_combine(sets.midcast.Cure,
                                    {})
 
  -- engaged
  sets.engaged = {
    main="Elm Staff +1",
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

  initialize_crafting_sets(player.name)	
end
