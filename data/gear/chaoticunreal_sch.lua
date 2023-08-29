function init_gear_sets()
  
    windower.send_command('sta !packets off; wait 1; gs equip sets.idle')
    

	-- misc
	sets.sublimation = {
		head="Scholar's M.board",
	}
     
    --base magic sets
    sets.MND = {
		head="Garrison Sallet",
		body="Scholar's Gown",
		hands="Scholar's Bracers",
		legs="Savage Loincloth",
		feet="Seer's Pumps +1",
		neck="Justice Badge",
		waist="Friar's Rope",
		right_ring="Tamas Ring",
	  }
	
	  sets.INT = {
		head="Scholar's M.board",
		body="Scholar's Gown",
		hands="Seer's Mitts +1",
		legs="Seer's Slacks +1",
		waist="Shaman's Belt",
		left_ear="Morion Earring",
		right_ear="Morion Earring",
		left_ring="Genius Ring",
		right_ring="Tamas Ring",
		back="Black Cape +1",
	  }
	
	-- idle/resting
    --idle
	sets.idle = {
		main=gear.Staff.PDT,
		sub="Lizard Strap",
		body="Royal Cloak",
		hands="Scholar's Bracers",
		legs="Scholar's Pants",
		feet="Scholar's Loafers",
		neck="Justice Badge",
		waist="Shaman's Belt",
		left_ear="Morion Earring",
		right_ear="Morion Earring",
		left_ring="Eremite's Ring",
		right_ring="Tamas Ring",
		back="Black Cape +1",
	  }
	sets.idle.DW = sets.idle
	sets.idle.Town = set_combine(sets.idle,
                    {
                        back="Nexus cape"
                    })
	sets.idle.Town.DW = sets.idle.Town
	sets.resting = {
					head="Sol Cap",
					main=gear.Staff.HMP,
					body="Seer's Tunic +1",
					}
	sets.resting.DW = sets.resting                                           
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
	initialize_level_30_gear()
    initialize_level_40_gear()
    initialize_level_50_gear()
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

sets.idle['30'].Town
= set_combine(sets.idle['30'],{
	   back="Nexus cape",
	   })
sets.idle['30'].Town.DW
= set_combine(sets.idle['30'].DW,{
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
sets.idle['40'] = set_combine(sets.idle['30'],
{
  left_ring="Vilma's Ring",
})
sets.resting['40'] = sets.resting['30']
sets.idle['40'].DW = set_combine(sets.idle['30'].DW,
{
  left_ring="Vilma's Ring",
})
sets.resting['40'].DW = sets.resting['30'].DW
sets.idle['40'].Town
= set_combine(sets.idle['40]'],{
back="Nexus cape",
})
sets.idle['40'].Town.DW
= set_combine(sets.idle['40'].DW,{
back="Nexus cape",
})
end
function initialize_level_50_gear()
--idle
sets.idle['50'] = set_combine(sets.idle['40'])
sets.resting['50'] = sets.resting['40']
sets.idle['50'].DW = set_combine(sets.idle['40'].DW)
sets.resting['50'].DW = sets.resting['40'].DW

sets.idle['50'].Town
= set_combine(sets.idle['50]'],{
back="Nexus cape",
})
sets.idle['50'].Town.DW
= set_combine(sets.idle['50'].DW,{
back="Nexus cape",
})
end