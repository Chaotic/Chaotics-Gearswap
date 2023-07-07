

--[[  These are the states/modes that can be used
    -- General melee offense/defense modes, allowing for hybrid set builds, as well as idle/resting/weaponskill.
    -- This just defines the vars and sets the descriptions.  List modes with no values automatically
    -- get assigned a 'Normal' default value.
    state.OffenseMode         = M{['description'] = 'Offense Mode'}
    state.HybridMode          = M{['description'] = 'Hybrid Mode'}
    state.RangedMode          = M{['description'] = 'Ranged Mode'}
    state.WeaponskillMode     = M{['description'] = 'Weaponskill Mode'}
    state.CastingMode         = M{['description'] = 'Casting Mode'}
    state.IdleMode            = M{['description'] = 'Idle Mode'}
    state.RestingMode         = M{['description'] = 'Resting Mode'}

    state.DefenseMode         = M{['description'] = 'Defense Mode', 'None', 'Physical', 'Magical'}
    state.PhysicalDefenseMode = M{['description'] = 'Physical Defense Mode', 'PDT'}
    state.MagicalDefenseMode  = M{['description'] = 'Magical Defense Mode', 'MDT'}

    state.Kiting              = M(false, 'Kiting')
    state.SelectNPCTargets    = M(false, 'Select NPC Targets')
    state.PCTargetMode        = M{['description'] = 'PC Target Mode', 'default', 'stpt', 'stal', 'stpc'}

    state.EquipStop           = M{['description'] = 'Stop Equipping Gear', 'off', 'precast', 'midcast', 'pet_midcast'}

    state.CombatWeapon        = M{['description']='Combat Weapon', ['string']=''}
    state.CombatForm          = M{['description']='Combat Form', ['string']=''}
    ]]
    -- Auto equipped sets should look like
    -- sets.idle[idleScope][state.IdleMode][Pet[Engaged]][CustomIdleGroups]
    -- sets.resting[state.RestingMode]
    -- engaged Sets
    -- sets.engaged[state.CombatForm][state.CombatWeapon][state.OffenseMode][state.DefenseMode][classes.CustomMeleeGroups (any number)]



function init_gear_sets()
    
    windower.send_command('sta !packets off; wait 1; gs equip sets.idle')

    -- Auto equipped sets should look like
    -- sets.idle[idleScope][state.IdleMode][Pet[Engaged]][CustomIdleGroups]


	--Misc
	sets.MND = {
        neck="Justice Badge",
        body="Errant Hpl.",
        hands="Zealot's Mitts",
        legs="Errant Slops",
        feet="Mahatma Pigaches",
        waist="Penitent's Rope",
        left_ring="Turquoise Ring",
        right_ring="Tamas Ring",
        back="White Cape +1"
    }
	   
	sets.INT = {
        head="Warlock's Chapeau",
        body="Errant Hpl.",
        hands="Duelist's Gloves",
        waist="Penitent's Rope",
        legs="Errant Slops",
        left_ear="Morion Earring",
        right_ear="Morion Earring",
        left_ring="Genius Ring",
        right_ring="Tamas Ring",
        back="Black Cape +1",
        neck="Philomath Stole",
    }

	-- idle
	sets.idle = { 
        neck="Philomath Stole",
        body="Royal Cloak",
        hands="Duelist's Gloves",
        legs="Yigit Seraweels",
        feet="Duelist's Boots",
        waist="Penitent's Rope",
        left_ear="Helenus's Earring",
        right_ear="Cass. Earring",
        right_ring="Tamas Ring",
        left_ring="Vilma's Ring",
        back="White Cape +1"
}
     
  sets.idle.Town = set_combine(sets.idle,
                {
                  back="Nexus cape"
                })
   
  sets.idle.Combat = set_combine(sets.idle,{})
   
  sets.idle.Town.Combat = set_combine(sets.idle.Combat,
                {})
	
    -- sets.resting[state.RestingMode]
  sets.resting = {
    main=gear.Staff.HMP,
    body="Errant Hpl.",
    ammo="Bibiki Seashell",
    legs="Yigit Seraweels",
    left_ear="Antivenom Earring",
    right_ear="Relaxing Earring",

  }
  sets.resting.TP = {
    body="Errant Hpl.",
    ammo="Bibiki Seashell",
    legs="Yigit Seraweels",
    left_ear="Antivenom Earring",
    right_ear="Relaxing Earring",
  }
  -- precast magic
  sets.precast.FC= {
    head="Warlock's Chapeau",
    ammo="Bibiki Seashell",  -- This has spell interruption on it.
  }
	                                                   
	-- midcast magic                                   
	sets.midcast.FastRecast = set_combine(sets.precast.FC,
  {
    waist="Velocious Belt",
    hands="Dusk Gloves",
    feet="Dusk Ledelsens",
  })
	               
  sets.midcast['Utsusemi: Ni'] = set_combine(sets.midcast.FastRecast,{})

	sets.midcast['Utsusemi: Ichi'] = set_combine(sets.midcast['Utsusemi: Ni'],{})

  sets.midcast['Healing Magic'] = set_combine(sets.MND,sets.midcast.FastRecast,{
    legs="Warlock's Tights",
  })
                                                     
  sets.midcast['Divine Magic'] = set_combine(sets.MND,sets.midcast.FastRecast,{
    main=gear.ElementalStaff,
    sub=gear.ElementalGrip,
    head="Elite Beret",
  })
                 
  sets.midcast['Divine Magic'].Acc = set_combine(sets.midcast['Divine Magic'],{
    left_ear="Helenus's Earring",
    right_ear="Cass. Earring",
  })
                                                     
  sets.midcast['Enfeebling Magic'] = {
    main=gear.ElementalStaff,
    sub=gear.ElementalGrip,
    neck="Spider Torque",
    body="Warlock's Tabard",
    head="Elite Beret",
  }
                                                     
  sets.midcast['Enfeebling Magic']['BlackMagic'] = set_combine(sets.INT,sets.midcast.FastRecast,{})
   
  sets.midcast['Enfeebling Magic']['BlackMagic'].Acc = set_combine(sets.midcast['Enfeebling Magic']['BlackMagic'],
                                                                   sets.midcast['Enfeebling Magic'],
                                                                   {
                                                                    left_ear="Helenus's Earring",
                                                                    right_ear="Cass. Earring",
                                                                  })
  
  sets.midcast['Enfeebling Magic']['WhiteMagic'] = set_combine(sets.MND,sets.midcast.FastRecast,
  {
   left_ear="Helenus's Earring",
   right_ear="Cass. Earring",
 })
   
  sets.midcast['Enfeebling Magic']['WhiteMagic'].Acc = set_combine(sets.midcast['Enfeebling Magic']['WhiteMagic'],
                                                                   sets.midcast['Enfeebling Magic'],
                                                                   {
                                                                    left_ear="Helenus's Earring",
                                                                    right_ear="Cass. Earring",
                                                                  })  
  sets.midcast['Elemental Magic'] = set_combine(sets.INT,sets.midcast.FastRecast,{
    main=gear.ElementalStaff,
    sub=gear.ElementalGrip,
    head="Warlock's Chapeau",
  })
   
  sets.midcast['Elemental Magic'].Acc = set_combine(sets.midcast['Elemental Magic'],{
    left_ear="Helenus's Earring",
    right_ear="Cass. Earring",
  })
                                                     
  sets.midcast['Dark Magic'] = set_combine(sets.INT,sets.midcast.FastRecast,{
    right_ear="Dark Earring",
    left_ear="Abyssal Earring",
  })
                 
  sets.midcast['Dark Magic'].Acc = set_combine(sets.midcast['Dark Magic'],{
    left_ear="Helenus's Earring",
    right_ear="Cass. Earring",
  })
                                                     
  sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,sets.midcast.FastRecast,{
    hands="Duelist's Gloves",
    legs="Warlock's Tights",
  })
                                                     
  -- custom midcast magic                            
  sets.midcast['Stoneskin'] = set_combine(sets.MND,sets.midcast['Enhancing Magic'],sets.midcast.FastRecast,{})
                 
  sets.midcast['Phalanx'] = set_combine(sets.midcast['Stoneskin'],{})
                
  sets.midcast['Blink'] = set_combine(sets.midcast['Stoneskin'],{})
                
  sets.midcast['Aquaveil'] = set_combine(sets.midcast['Stoneskin'],{})
                 
  sets.midcast.Cure = set_combine(sets.midcast['Healing Magic'],sets.midcast.FastRecast,
                                  {
                                    main="Iridal Staff"
                                  })
                 
  sets.midcast.Curaga = set_combine(sets.midcast.Cure,{})

  sets.midcast['Cursna'] = set_combine(sets.midcast['Healing Magic'],{})
                
  sets.midcast.Sleep = set_combine(sets.midcast.FastRecast,sets.INT,sets.midcast['Enfeebling Magic'],{})
                
  sets.midcast.EleEnfeebs = set_combine(sets.INT,sets.midcast.FastRecast,{})
                
  sets.midcast.Spikes = set_combine(sets.INT,sets.midcast.FastRecast,{})
  
  -- engaged Sets
 -- sets.engaged[state.CombatForm][state.CombatWeapon][state.OffenseMode][state.DefenseMode][classes.CustomMeleeGroups (any number)]
   
  sets.engaged= {
                  head="Walahra Turban",
                  neck="Peacock amulet",
                  body="Scp. Harness +1",
                  hands="Dusk Gloves",
                  legs="Yigit Seraweels",
                  feet="Dusk Ledelsens",
                  waist="Velocious Belt",
                  left_ear="Dodge Earring",
                  right_ear="Dodge Earring",
                  left_ring="Lava's Ring",
                  right_ring="Kusha's Ring",
                  back="Cerberus Mantle",
                }
   sets.engaged.Sword = set_combine(sets.engaged,{
                  left_ear="Suppanomimi"
                })

    sets.engaged.DW = set_combine(sets.engaged,{
                  left_ear="Suppanomimi"
                })
  
   sets.engaged.Sword.DW = set_combine(sets.engaged.Sword,sets.engaged.DW,{})
  -- ws
  sets.precast.WS = {}

-- STR 60
sets.precast.WS['Vorpal Blade'] = set_combine(sets.precast.WS,
                {
                  back="Cerberus Mantle",
                  hands="Pallas's Bracelets",
                  waist="Potent Belt",
                })

sets.precast.WS['Vorpal Blade'].Acc = set_combine(sets.precast.WS['Vorpal Blade'],
      {
        neck="Peacock amulet",
        body="Scp. Harness +1",
        waist="Potent Belt",
        left_ring="Lava's Ring",
        right_ring="Kusha's Ring",
      }
  )
    -- Level Sync Sets
    
    initialize_level_30_gear()
    initialize_crafting_sets(player.name)
	
end

function initialize_level_30_gear()
        -- Idle sets

        -- All this gear needs to be fixed
        sets.idle['30'] = {
          main="Elm Staff +1",
          sub="Lizard Strap",
          ammo="Bibiki Seashell",
          head="Seer's Crown +1",
          body="Seer's Tunic +1",
          hands="Seer's Mitts +1",
          legs="Seer's Slacks +1",
          feet="Seer's Pumps +1",
          neck="Justice Badge",
          left_ear="Morion Earring",
          right_ear="Morion Earring",
          left_ring="Warp Ring",
          right_ring="Eremite's Ring",
        }
        sets.idle['40'] = set_combine(sets.idle['30'],
        {
          right_ring="Vilma's Ring",
        })
        sets.idle['50'] = sets.idle['40']
        -- Resting sets
        sets.resting['30'] = {
          main="Pilgrim's Wand",
        }
      -- engaged
      sets.engaged['30'] = {
        main="Elm Staff +1",
        sub="Lizard Strap",
        head="Seer's Crown +1",
        body="Seer's Tunic +1",
        hands="Seer's Mitts +1",
        --hands="Carbuncle mitts",
        legs="Seer's Slacks +1",
        feet="Seer's Pumps +1",
        neck="Justice Badge",
        waist="Shaman's Belt",
        left_ear="Morion Earring",
        right_ear="Morion Earring",
      }
    end
