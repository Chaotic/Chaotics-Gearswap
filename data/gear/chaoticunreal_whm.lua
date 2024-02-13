function init_gear_sets()
  
    windower.send_command('sta !packets off; wait 1; gs equip sets.idle')

  -- misc
  sets.MND = {
    head="Yigit Turban",
    hands="Blessed Mitts",
    body="Errant Hpl.",
    feet="Mahatma Pigaches",
    neck="Ajari Necklace",
    waist="Penitent's Rope",
    left_ring="Hale Ring",
    right_ring="Tamas Ring",
    back="White Cape +1"
  }

  sets.INT = {
    head="Seer's Crown +1",
    body="Errant Hpl.",
    hands="Yigit Gages",
    waist="Penitent's Rope",
    legs="Errant Slops",
    left_ear="Morion Earring",
    right_ear="Morion Earring",
    left_ring="Genius Ring",
    right_ring="Tamas Ring",
    back="Black Cape +1",
  }

  -- Resting sets
  sets.resting.TP = {
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

  sets.resting = set_combine(sets.resting.TP,{
    main=gear.Staff.HMP,
  })

  -- Idle sets
  sets.idle = {
    main=gear.Staff.PDT,
    sub="Bugard Strap +1",
    ammo="Fortune Egg",
    head="Yigit Turban",
    body="Aristocrat's Coat",
    hands="Yigit Gages",
    legs="Yigit Seraweels",
    feet="Yigit Crackows",
    neck="Grandiose Chain",
    waist="Penitent's Rope",
    left_ear="Antivenom Earring",
    right_ear="Morion Earring",
    left_ring="Turquoise Ring",
    right_ring="Tamas Ring",
    back="White Cape +1"
  }
  sets.idle.PDT = set_combine(sets.idle,
                              {
                                main=gear.Staff.PDT,
                              })
  sets.idle.MDT = set_combine(sets.idle,{})

  sets.idle.Town = set_combine(sets.idle,
                            {
                              main="Chatoyant Staff",
                                back="Nexus cape"
                            })
  
  sets.Kiting = {}

  --Precast Magic
	sets.precast.FC = {
                      ammo="Bibiki Seashell",  -- This has spell interruption on it.
                      left_ear="Loquac. Earring",
                    }
	sets.precast.FC.Cure = set_combine(sets.precast.FC,
                                    {
                                      feet="Cure Clogs",
                                    })

  -- Haste
  sets.midcast.FastRecast = set_combine(sets.precast.FC,
                                        {
                                          head="Walahra Turban",
                                          waist="Headlong Belt",
                                          hands="Blessed Mitts",
                                          legs="Blessed Trousers",
                                          feet="Blessed Pumps",
                                        })

	--Midcast Magic
	sets.midcast['Enhancing Magic'] = {
    feet="Cleric's Duckbills",
  }
	sets.midcast['Enfeebling Magic'] = {
                                      main=gear.ElementalStaff,
                                      sub=gear.ElementalGrip,
                                      waist=gear.ElementalObi,
                                      neck="Spider Torque",
                                      body="Healer's Bliaut",
                                      head="Elite Beret",
                                      hands="Cleric's Mitts",
                                    }
	
	sets.midcast['Healing Magic'] = set_combine(sets.MND,sets.midcast.FastRecast,
                                              {
                                                hands="Healer's Mitts",
                                                legs="Druid's Slops",
                                              })
	sets.midcast['Divine Magic'] = set_combine(sets.MND,sets.midcast.FastRecast,
                                              {
                                                legs="Healer's Pantaln.",
                                              })
	sets.midcast['Enfeebling Magic']['WhiteMagic'] = set_combine(sets.MND,sets.midcast.FastRecast,{})
	sets.midcast['Enfeebling Magic']['WhiteMagic'].Resistant = set_combine(sets.MND,sets.midcast['Enfeebling Magic']['WhiteMagic'],{})
	
	sets.midcast.Regen = set_combine(sets.midcast['Healing Magic'],{})
	
	sets.midcast['Dark Magic'] = set_combine(sets.INT,sets.midcast.FastRecast,
                                          {
                                            main=gear.ElementalStaff,
                                            sub=gear.ElementalGrip,
                                            waist=gear.ElementalObi,
                                            right_ear="Dark Earring",
                                            left_ear="Abyssal Earring",
                                          })
  sets.midcast['Elemental Magic'] = set_combine(sets.INT,sets.midcast.FastRecast,
                                                {
                                                  main=gear.ElementalStaff,
                                                  sub=gear.ElementalGrip,
                                                  waist=gear.ElementalObi,
                                                  body="Yigit Gomlek",
                                                  legs="Druid's Slops",
                                                })
	sets.midcast['Enfeebling Magic']['BlackMagic'] = set_combine(sets.INT,sets.midcast.FastRecast,{})
	sets.midcast['Enfeebling Magic']['BlackMagic'].Resistant = set_combine(sets.INT,sets.midcast['Enfeebling Magic']['BlackMagic'],{})
	
  -- custom midcast sets
  sets.midcast.Cure = set_combine(sets.MND,sets.midcast['Healing Magic'],
                                  {
                                    main=gear.ElementalStaff,
                                    sub=gear.ElementalGrip,
                                    waist=gear.ElementalObi,
                                    body="Aristocrat's Coat",
                                  })

  sets.midcast.Curaga = set_combine(sets.midcast.Cure,{})
  
  sets.midcast.CureSelf = set_combine(sets.midcast['Healing Magic'],
                                      {
                                        main=gear.ElementalStaff,
                                        sub=gear.ElementalGrip,
                                        waist=gear.ElementalObi,
                                        body="Aristocrat's Coat",
                                        feet="Cure Clogs",
 	                                    })
	
	--Engaged Sets
  -- engaged
  sets.engaged = {
                  ammo={ name="Bibiki Seashell", augments={'HP recovered while healing +2','MP recovered while healing +2','Spell interruption rate down -3%',}},
                  head="Walahra Turban",
                  body="Aristocrat's Coat",
                  hands="Blessed Mitts",
                  legs="Blessed Trousers",
                  feet="Blessed Pumps",
                  neck="Peacock Amulet",
                  waist="Headlong Belt",
                  left_ear="Antivenom Earring",
                  right_ear="Brutal Earring",
                  left_ring="Lava's Ring",
                  right_ring="Kusha's Ring",
                  back="Invigorating Cape",
                }
	sets.engaged.Acc = set_combine(sets.engaged,{
    neck="Peacock Amulet",
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
    waist="Life Belt",
  })
	
	sets.engaged.DW	= set_combine(sets.engaged,{
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",

  })
	sets.engaged.AccDW = set_combine(sets.engaged.DW,{
    neck="Peacock Amulet",
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
    waist="Life Belt",
  })
	
	--Weaponskill Sets
	sets.precast.WS = {}
	sets.precast.WS.Acc = set_combine(sets.precast.WS,{})
	sets.precast.WS.DW = set_combine(sets.precast.WS,{})
	sets.precast.WS.AccDW = set_combine(sets.precast.WS,{})
	
	sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS,{})
	sets.precast.WS['Hexa Strike'].Acc = set_combine(sets.precast.WS['Hexa Strike'],{})
	sets.precast.WS['Hexa Strike'].AccDW = set_combine(sets.precast.WS['Hexa Strike'],{})
	sets.precast.WS['Hexa Strike'].DW = set_combine(sets.precast.WS['Hexa Strike'],{})

  initialize_crafting_sets(player.name)	
end
