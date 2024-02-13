function init_gear_sets()
  
    windower.send_command('sta !packets off; wait 1; gs equip sets.idle')
    
    

  -- misc
  sets.MND = {
    head="Garrison Sallet",
    hands="Zealot's Mitts",
    legs="Savage Loincloth",
    feet="Seer's Pumps +1",
    neck="Justice Badge",
    back="Mist Silk Cape",
    right_ring="Tamas Ring",
  }

  sets.INT = {
    head="Seer's Crown +1",
    hands="Seer's Mitts +1",
    legs="Seer's Slacks +1",
    waist="Shaman's Belt",
    right_ring="Tamas Ring",
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
    main="Yew Wand +1",
    ammo="Fortune Egg",
    head="Empress Hairpin",
    body="Seer's Tunic +1",
    hands="Zealot's Mitts",
    legs="Seer's Slacks +1",
    feet="Seer's Pumps +1",
    neck="Justice Badge",
    left_ear="Optical Earring",
    left_ring="Warp Ring",
    right_ring="San d'Orian Ring",
    waist="Shaman's Belt",
  }
 
  sets.idle.Town = set_combine(sets.idle,
                                {
                                  head="Seer's Crown +1",
                                  body="Seer's Tunic +1",
                                  hands="Seer's Mitts +1",
                                  legs="Seer's Slacks +1",
                                  feet="Seer's Pumps +1",
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
    main="Yew Wand +1",
    head="Empress Hairpin",
    body="Chocobo Shirt",
    hands="Zealot's Mitts",
    legs="Garrison Hose",
    feet="Mithran Gaiters",
    neck="Justice Badge",
    left_ear="Optical Earring",
    left_ring="Warp Ring",
    right_ring="San d'Orian Ring",
  }

  initialize_crafting_sets(player.name)	
end
