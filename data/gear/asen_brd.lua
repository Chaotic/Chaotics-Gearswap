-- Define sets and vars used by this job file.
function init_gear_sets()

    windower.send_command('sta !packets off; wait 1; gs equip sets.idle')
  -- misc
  sets.MND = {
    hands="Zealot's Mitts",
    legs="Savage Loincloth",
  }
  sets.INT = {}

  sets.CHR = {
    main="Monster Signa",
    head="Bard's Roundlet",
    neck="Bird Whistle",
    hands="Choral Cuffs",
    left_ring="Opal Ring",
    right_ring="Opal Ring",
    feet="Savage Gaiters",
    waist="Corsette +1",
    back="Lucent Cape",
    legs="Bard's Cannions",
  }
  
  sets.Singing = {
    head="Bard's Roundlet",
    hands="Choral Cuffs",
  }
  sets.Wind = set_combine(sets.Singing,{
    neck="Wind Torque",
    body="Minstrel's Coat",
    hands="Bard's Cuffs",
    legs="Choral Cannions",
    left_ring="Nereid Ring",
    right_ring="Nereid Ring",
  })
  sets.String = set_combine(sets.Singing,{
    body="Minstrel's Coat",
  })
  
--  These will be filled in as I get instruments / spells
sets.midcast['Minne'] = set_combine(sets.midcast.FastRecast,sets.CHR,sets.String,{
  range="Harp +1",
})
sets.midcast['Requiem'] = set_combine(sets.midcast.FastRecast,sets.CHR,sets.Wind,{
  main=gear.ElementalStaff,
  sub=gear.ElementalGrip,
  range="Hamelin Flute",
})
sets.midcast['Threnody'] = set_combine(sets.midcast.FastRecast,sets.CHR,sets.Wind,{
  range="Piccolo +1",
})
sets.midcast['Minuet'] = set_combine(sets.midcast.FastRecast,sets.CHR,sets.Wind,{
  range="Cornette +2",
})
sets.midcast['Lullaby'] = set_combine(sets.midcast.FastRecast,sets.CHR,sets.Wind,{
  main=gear.ElementalStaff,
  sub=gear.ElementalGrip,
  range="Mary's horn",
})
sets.midcast['March'] = set_combine(sets.midcast.FastRecast,sets.CHR,sets.Wind,{
  range="Iron Ram Horn",
})
sets.midcast['Mambo'] = set_combine(sets.midcast.FastRecast,sets.CHR,sets.Wind,{
  range="Gemshorn +1",
})
sets.midcast['Elegy'] = set_combine(sets.midcast.FastRecast,sets.CHR,sets.Wind,{
  main=gear.ElementalStaff,
  sub=gear.ElementalGrip,
  range="Horn +1",
})
sets.midcast['Madrigal'] = set_combine(sets.midcast.FastRecast,sets.CHR,sets.Wind,{
  range="Traversiere +2",
})
sets.midcast['Carol'] = set_combine(sets.midcast.FastRecast,sets.Wind,sets.CHR,{
  range="Crumhorn +1",
})
sets.midcast['Paeon'] = set_combine(sets.midcast.FastRecast,sets.String,sets.CHR,{
  range="Ebony Harp +1",
})
sets.midcast['Prelude'] = set_combine(sets.midcast.FastRecast,sets.Wind,sets.CHR,{
  range="Angel's Flute +1",
})
-- This doesn't boost ballad but nothing does beides relic so use it as a base.
sets.midcast['Ballad'] = set_combine(sets.midcast.FastRecast,sets.CHR,sets.Wind,{
  range="Iron Ram Horn",
})
sets.midcast['Etude'] = sets.midcast['Ballad']

  -- idle
  sets.idle = {
    main=gear.Staff.PDT,
    range="Iron Ram Horn",
    neck="Wind Torque",
    head="Yigit Turban",
    body="Yigit Gomlek",
    hands="Yigit Gages",
    legs="Yigit Seraweels",
    feet="Yigit Crackows",
    left_ear="Cass. Earring",
    right_ear="Helenus's Earring",
    left_ring="Nereid Ring",
    right_ring="Nereid Ring",
    back="Traveler's Mantle",
    waist="Corsette +1",
  }
     
  sets.idle.Town = set_combine(sets.idle,{
    main="Chatoyant Staff",
    back="Nexus cape",
  })

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
  }

  -- precast magic
  sets.precast.FC = {
    left_ear="Loquac. Earring",
  }
  sets.precast.FC['BardSong'] = set_combine(sets.precast.FC,{
    sub=gear.ElementalGrip,
    waist=gear.ElementalObi,
    body="Yigit Gomlek",
  })

  -- midcast magic
  sets.midcast.FastRecast = set_combine(sets.precast.FC,{
    head="Walahra Turban",
    waist="Velocious Belt",
    hands="Dusk Gloves",
    feet="Dusk Ledelsens",
  })
                 
  sets.midcast['Utsusemi: Ni'] = set_combine(sets.midcast.FastRecast,{})   
  sets.midcast['Utsusemi: Ichi'] = set_combine(sets.midcast['Utsusemi: Ni'],{})

  sets.midcast['Healing Magic'] = set_combine(sets.MND,sets.midcast.FastRecast,{
    main=gear.ElementalStaff,
    sub=gear.ElementalGrip,
    waist=gear.ElementalObi,
  })
                                                     
  sets.midcast['Divine Magic'] = set_combine(sets.MND,{
    main=gear.ElementalStaff,
    sub=gear.ElementalGrip,
    waist=gear.ElementalObi,
  })
  sets.midcast['Divine Magic'].Acc = set_combine(sets.midcast['Divine Magic'],{})

  sets.midcast['Enfeebling Magic'] = {
    main=gear.ElementalStaff,
    sub=gear.ElementalGrip,
    waist=gear.ElementalObi,
 }
  sets.midcast['Enfeebling Magic']['BlackMagic'] = set_combine(sets.INT,{})
  sets.midcast['Enfeebling Magic']['BlackMagic'].Acc = set_combine(sets.midcast['Enfeebling Magic']['BlackMagic'],sets.midcast['Enfeebling Magic'],{})
  sets.midcast['Enfeebling Magic']['WhiteMagic'] = set_combine(sets.MND,{})
  sets.midcast['Enfeebling Magic']['WhiteMagic'].Acc = set_combine(sets.midcast['Enfeebling Magic']['WhiteMagic'],sets.midcast['Enfeebling Magic'],{})
  
  sets.midcast['Elemental Magic'] = set_combine(sets.INT,
                {
                  main=gear.ElementalStaff,
                  sub=gear.ElementalGrip,
                  waist=gear.ElementalObi,
                  right_ear="Moldavite earring",
                })
  sets.midcast['Elemental Magic'].Acc = set_combine(sets.midcast['Elemental Magic'],{})
  
  sets.midcast['Dark Magic'] = set_combine(sets.INT,{
    main=gear.ElementalStaff,
    sub=gear.ElementalGrip,
    waist=gear.ElementalObi,
  })
  sets.midcast['Dark Magic'].Acc = set_combine(sets.midcast['Dark Magic'],{})

  sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{})
  -- custom midcast magic                            
  sets.midcast['Stoneskin'] = set_combine(sets.MND,{})
                 
  sets.midcast.Cure = set_combine(sets.midcast['Healing Magic'],{})
  sets.midcast.Curaga = set_combine(sets.midcast.Cure,{})

  sets.midcast['Cursna'] = set_combine(sets.midcast['Healing Magic'],{})
                 
  -- bard songs
  sets.midcast['BardSong'] = set_combine(sets.midcast.FastRecast,sets.CHR,{
    sub=gear.ElementalGrip,
  })
  sets.midcast.BardDebuff = set_combine(sets.CHR,{
      main=gear.ElementalStaff,
      sub=gear.ElementalGrip,
      waist=gear.ElementalObi,
      left_ear="Cass. Earring",
      right_ear="Helenus's Earring",
    })

  -- Defense sets
  sets.defense.PDT = {}
  sets.defense.MDT = {}

  -- Engaged sets
  sets.engaged = {}

  -- WS sets
  sets.precast.WS = {}
  sets.precast.WS.Acc = set_combine(sets.precast.WS,{})

  initialize_crafting_sets(player.name)
end