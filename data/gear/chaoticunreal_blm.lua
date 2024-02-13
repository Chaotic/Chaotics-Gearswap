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


    --misc.
    sets.lowHP = {}
  -- Auto equipped sets should look like
  -- sets.idle[idleScope][state.IdleMode][Pet[Engaged]][CustomIdleGroups]

  -- Idle sets
  sets.idle = {
    main=gear.Staff.PDT,
    sub="Bugard Strap +1",
    ammo="Fortune Egg",
    neck="Philomath Stole",
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
  sets.idle.DW = sets.idle

  sets.idle.Town = set_combine(sets.idle,{
    main="Chatoyant Staff",
    back="Nexus cape",
  })
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
    head="Yigit Turban",
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
    head="Wizard's Petasos",
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
    neck="Philomath Stole",
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
  sets.midcast['Healing Magic'] = set_combine(sets.MND[state.IdleMode.current],sets.midcast.FastRecast,{})

  sets.midcast['Divine Magic'] = set_combine(sets.MND[state.IdleMode.current],{
    main=gear.ElementalStaff,
    sub=gear.ElementalGrip,
    waist=gear.ElementalObi,
  })

  sets.midcast['Enfeebling Magic'] = {
    main=gear.ElementalStaff,
    sub=gear.ElementalGrip,
    waist=gear.ElementalObi,
    head="Sorcerer's Petas.",
    body="Wizard's Coat",
    left_ear="Helenus's Earring",
    right_ear="Cass. Earring",
  }

  sets.midcast['Enfeebling Magic']['BlackMagic'] = set_combine(sets.INT[state.IdleMode.current],{})
  sets.midcast['Enfeebling Magic']['BlackMagic'].Accuracy = set_combine(sets.INT[state.IdleMode.current],sets.midcast['Enfeebling Magic'],{})
  sets.midcast['Enfeebling Magic']['WhiteMagic'] = set_combine(sets.MND[state.IdleMode.current],{})
  sets.midcast['Enfeebling Magic']['WhiteMagic'].Accuracy = set_combine(sets.MND[state.IdleMode.current],sets.midcast['Enfeebling Magic'],{})

	sets.midcast['Elemental Magic'] = set_combine(sets.INT[state.IdleMode.current],{
    main=gear.ElementalStaff,
    sub=gear.ElementalGrip,
    waist=gear.ElementalObi,
    head="Sorcerer's Petas.",
    body="Igqira Weskit",
    left_ear="Helenus's Earring",
    right_ear="Cass. Earring",
    hands="Wizard's Gloves",
    legs="Druid's Slops",
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
  legs="Wizard's Tonban",
  right_ear="Dark Earring",
  left_ear="Abyssal Earring",
  hands="Sorcerer's Gloves",
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
--magic burst
sets.magic_burst = {}

sets.weather_day = {}

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
              left_ring="Eremite's Ring",
              right_ring="Tamas Ring",
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
                main="Pilgrim's Wand",
                body="Seer's Tunic +1",
              }
              sets.resting['30'].DW = {
              main="Yew Wand +1",
               sub="Pilgrim's Wand",
                body="Seer's Tunic +1",
              }
  end
  function initialize_level_40_gear()
    --idle
    sets.idle['40'] = {
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
    }
sets.idle['40'].DW = {
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
right_ring="Tamas Ring",
    }

sets.idle['40'].Town
= set_combine(sets.idle['40]'],{
       back="Nexus cape",
       })
sets.idle['40'].Town.DW
= set_combine(sets.idle['40'].DW,{
       back="Nexus cape",
       })

sets.resting['40'] = {
        main="Pilgrim's Wand",
        body="Seer's Tunic +1",
      }
      sets.resting['40'].DW = {
      main="Yew Wand +1",
       sub="Pilgrim's Wand",
        body="Seer's Tunic +1",
      }

  end
  function initialize_level_50_gear()
    --idle
    sets.idle['50'] = {
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
    }
sets.idle['50'].DW = {
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
right_ring="Tamas Ring",
    }

sets.idle['50'].Town
= set_combine(sets.idle['50]'],{
       back="Nexus cape",
       })
sets.idle['50'].Town.DW
= set_combine(sets.idle['50'].DW,{
       back="Nexus cape",
       })

sets.resting['50'] = {
        main="Pilgrim's Wand",
        body="Seer's Tunic +1",
      }
sets.resting['50'].DW = {
      main="Yew Wand +1",
       sub="Pilgrim's Wand",
        body="Seer's Tunic +1",
      }

  end