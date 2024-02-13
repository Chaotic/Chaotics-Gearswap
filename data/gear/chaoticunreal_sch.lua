function init_gear_sets()
  
    windower.send_command('sta !packets off; wait 1; gs equip sets.idle')

	-- misc
	sets.sublimation = {
		head="Scholar's M.board",
	}
 	-- idle/resting
	sets.idle = {
			main=gear.Staff.PDT,
			sub="Bugard Strap +1",
			ammo="Fortune Egg",
			neck="Wit Pendant",
			head="Yigit Turban",
			body="Yigit Gomlek",
			hands="Yigit Gages",
			legs="Yigit Seraweels",
			feet="Yigit Crackows",
			waist="Penitent's Rope",
			left_ear="Helenus's Earring",
			right_ear="Cass. Earring",
			left_ring="Jelly Ring",
			right_ring="Nasatya's Ring",
			back="Black Cape +1",
		}
	sets.idle.Town = set_combine(sets.idle,{
		main="Chatoyant Staff",
		back="Nexus cape",
		})
	sets.idle.DW = sets.idle
	sets.idle.Town.DW = sets.idle.Town
  -- Resting sets
  	sets.resting = {
			main=gear.Staff.HMP,
			head="Yigit Turban",
			neck="Grandiose Chain",
			body="Yigit Gomlek",
			hands="Yigit Gages",
			feet="Yigit Crackows",
			ammo="Bibiki Seashell",
			legs="Yigit Seraweels",
			left_ear="Antivenom Earring",
			right_ear="Relaxing Earring",
			back="Invigorating Cape",
			waist="Hierarch Belt",
		}
	sets.resting.DW = sets.resting         
    --base magic sets
    sets.MND = {
			head="Argute M.board",
			body="Errant Hpl.",
			hands="Yigit Gages",
			legs="Errant Slops",
			feet="Mahatma Pigaches",
			neck="Justice Badge",
			waist="Penitent's Rope",
			left_ring="Hale Ring",
			right_ring="Tamas Ring",
			back="White Cape +1"
		}
	
	sets.INT = {
			head="Scholar's M.board",
			hands="Yigit Gages",
			body="Errant Hpl.",
			waist="Penitent's Rope",
			legs="Errant Slops",
			feet="Yigit Crackows",
			left_ear="Morion Earring",
			right_ear="Morion Earring",
			left_ring="Genius Ring",
			right_ring="Tamas Ring",
			back="Black Cape +1",
			neck="Wit Pendant",
		}

	sets.MND["Normal"] = set_combine(sets.MND,{})
	sets.INT["Normal"] = set_combine(sets.INT,{})
	sets.MND["DW"] = sets.MND["Normal"]
	sets.INT["DW"] = sets.INT["Normal"]	
                                      
    --precast magic
    sets.precast.FC = {
		left_ear="Loquac. Earring",
	  }
  
		-- midcast
	sets.midcast.FastRecast = set_combine(sets.precast.FC,{})
	
    --non-cure healing magic
	sets.midcast['Healing Magic'] = set_combine(sets.MND[state.IdleMode.current],sets.midcast.FastRecast,{
		legs="Druid's Slops",
		feet="Argute Loafers",
	})

    sets.midcast['Divine Magic'] = set_combine(sets.MND[state.IdleMode.current],{
                                                  main=gear.ElementalStaff,
                                                  sub=gear.ElementalGrip,
                                                  waist=gear.ElementalObi,
                                                })
	
	sets.midcast['Enfeebling Magic'] = {
			main=gear.ElementalStaff,
			sub=gear.ElementalGrip,
			waist=gear.ElementalObi,
			hands="Argute Bracers",
		}
	
    sets.midcast['Enfeebling Magic']['BlackMagic'] = set_combine(sets.INT[state.IdleMode.current],{})
    sets.midcast['Enfeebling Magic']['BlackMagic'].Accuracy = set_combine(sets.INT[state.IdleMode.current],sets.midcast['Enfeebling Magic'],{})
    sets.midcast['Enfeebling Magic']['WhiteMagic'] = set_combine(sets.MND[state.IdleMode.current],{})
    sets.midcast['Enfeebling Magic']['WhiteMagic'].Accuracy = set_combine(sets.MND[state.IdleMode.current],sets.midcast['Enfeebling Magic'],{})

	sets.midcast['Elemental Magic'] = set_combine(sets.INT[state.IdleMode.current],{
		main=gear.ElementalStaff,
		sub=gear.ElementalGrip,
		waist=gear.ElementalObi,
		legs="Druid's Slops",
		head="Argute M.board",
	})

	sets.midcast['Elemental Magic'].HybridAcc = set_combine(sets.midcast['Elemental Magic'],{
		left_ear="Helenus's Earring",
		right_ear="Cass. Earring",
	})
	sets.midcast['Elemental Magic'].Accuracy = set_combine(sets.midcast['Elemental Magic'],{
		left_ear="Helenus's Earring",
		right_ear="Cass. Earring",
	})

	sets.midcast['Dark Magic'] = set_combine(sets.INT[state.IdleMode.current],{
		main=gear.ElementalStaff,
		sub=gear.ElementalGrip,
		waist=gear.ElementalObi,
		right_ear="Dark Earring",
		left_ear="Abyssal Earring",
		legs="Argute Pants",
	})	
	               
	sets.midcast['Dark Magic'].HybridAcc = set_combine(sets.midcast['Dark Magic'],{})
	sets.midcast['Dark Magic'].Acc = set_combine(sets.midcast['Dark Magic'],{})
	                                                   
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{})
	
    -- custom midcast sets
    sets.midcast.Cure = set_combine(sets.MND[state.IdleMode.current],{
                                      main=gear.ElementalStaff,
                                      sub=gear.ElementalGrip,
                                      waist=gear.ElementalObi,
                                      legs="Druid's Slops",
                                    })
                 
  	sets.midcast.Curaga = set_combine(sets.midcast.Cure,{})
	
	sets.midcast.Sleep = set_combine(sets.midcast.FastRecast,sets.midcast['Enfeebling Magic']['BlackMagic'],{})

    sets.midcast.EleEnfeebs = set_combine(sets.INT[state.IdleMode.current],{
                                              main=gear.ElementalStaff,
                                              sub=gear.ElementalGrip,
                                              waist=gear.ElementalObi,
                                            })

    sets.midcast.Spikes = set_combine(sets.INT[state.IdleMode.current],{})

    sets.midcast['Cursna'] = set_combine(sets.midcast['Healing Magic'],{})

    sets.midcast['Stoneskin'] = set_combine(sets.midcast['Enhancing Magic'],{})
                 
  	sets.midcast['Phalanx'] = set_combine(sets.midcast['Stoneskin'],{})
                
  	sets.midcast['Kaustra'] = set_combine(sets.midcast['Dark Magic'].Acc,{})

	    -- Level Sync Sets
	initialize_level_30_gear()
    initialize_level_40_gear()
    initialize_level_50_gear()

	initialize_crafting_sets(player.name)	
end
function initialize_level_30_gear()
	--idle
	sets.idle['30'] = {
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
		right_ring="Tamas Ring",
		back="Black Cape +1",
	}
	sets.idle['30'].DW = {
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
		left_ring="Warp ring",
		right_ring="Eremite's Ring",
		back="Black Cape +1",
	}

	sets.idle['30'].Town = set_combine(sets.idle['30'],{
		back="Nexus cape",
	})
	sets.idle['30'].Town.DW = set_combine(sets.idle['30'].DW,{
	   	back="Nexus cape",
	})

	sets.resting['30'] = {
		head="Sol Cap",
		main="Pilgrim's Wand",
		body="Seer's Tunic +1",
	}
	sets.resting['30'].DW = {
		head="Sol Cap",
		main="Yew Wand +1",
	   	sub="Pilgrim's Wand",
		body="Seer's Tunic +1",
	}
end
function initialize_level_40_gear()
	--idle
	sets.idle['40'] = set_combine(sets.idle['30'],{
  		left_ring="Vilma's Ring",
	})
	sets.resting['40'] = sets.resting['30']
	sets.idle['40'].DW = set_combine(sets.idle['30'].DW,{
  		left_ring="Vilma's Ring",
	})
	sets.resting['40'].DW = sets.resting['30'].DW
	sets.idle['40'].Town = set_combine(sets.idle['40]'],{
		back="Nexus cape",
	})
	sets.idle['40'].Town.DW = set_combine(sets.idle['40'].DW,{
		back="Nexus cape",
	})
end
function initialize_level_50_gear()
	--idle
	sets.idle['50'] = set_combine(sets.idle['40'])
	sets.resting['50'] = sets.resting['40']
	sets.idle['50'].DW = set_combine(sets.idle['40'].DW)
	sets.resting['50'].DW = sets.resting['40'].DW

	sets.idle['50'].Town = set_combine(sets.idle['50]'],{
		back="Nexus cape",
	})
	sets.idle['50'].Town.DW = set_combine(sets.idle['50'].DW,{
		back="Nexus cape",
	})
end