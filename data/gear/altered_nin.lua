function init_gear_sets()
  
  windower.send_command('sta !packets off; wait 1; gs equip sets.idle')
    
  -- misc.
  sets.INT = {
    left_ear="Morion Earring",
    right_ear="Morion Earring",
    left_ring="Genius Ring",
    right_ring="Genius Ring",
  }
  sets.CHR = {
    body="Savage Separates",
    neck="Bird Whistle",
    left_ring="Vilma's Ring",
  }

  sets.VIT = {
    hands="Savage Gauntlets",
    legs="Savage Loincloth",
  }  

  sets.CHRVIT = {
    body="Savage Separates",
    neck="Bird Whistle",
    left_ring="Vilma's Ring",
    hands="Savage Gauntlets",
    legs="Savage Loincloth",
  }  
       
  sets.enmityUp = {
    feet="Arhat's Sune-Ate",
    back="Cerberus Mantle",
  }
  
  sets.enmityDown = {}
  
  -- precast ja
  sets.precast.Step = {
    neck="Peacock Amulet",
    waist="Life Belt",
    body="Scp. Harness +1",
    -- tights give 3 acc
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
  }

  
  sets.precast.Waltz = set_combine(sets.CHR,{})
  sets.precast.WaltzSelf = set_combine(sets.precast.Waltz,sets.VIT,{})
  -- Don't need any special gear for Healing Waltz.
  sets.precast.Waltz['Healing Waltz']= {}
  sets.precast.JA['Violent Flourish'] = set_combine(sets.enmityUp,{})
  sets.precast.JA['Desperate Flourish'] = set_combine(sets.precast.Step,{})

  sets.precast.JA['Provoke'] = set_combine(sets.enmityUp,{})

  -- precast magic
  sets.precast.FC = {
    left_ear="Loquac. Earring",
  }

  -- midcast magic
  sets.midcast.FastRecast = set_combine(sets.precast.FC,
  {
    head="Walahra Turban",
    hands="Dusk Gloves",
    waist="Velocious Belt",
    feet="Sarutobi Kyahan",
  }) 

  sets.midcast['Utsusemi: Ni'] = set_combine(sets.midcast.FastRecast,{})
  sets.midcast['Utsusemi: Ichi'] = set_combine(sets.midcast['Utsusemi: Ni'],{})
                  
  sets.midcast.NinjutsuDebuff = set_combine(sets.INT,{
    left_ear="Helenus's Earring",
    right_ear="Cass. Earring",
    head='Ninja Hatsuburi',
    feet="Koga Kyahan",
  })

  sets.midcast.ElementalNinjutsu = set_combine(sets.midcast.NinjutsuDebuff,{
    head="Koga Hatsuburi",
  })

  -- idle
  sets.idle= {
    main="Fudo",
    sub="Fudo",
    range="Rogetsurin",
    head="Empress Hairpin",
    body="Scp. Harness +1",
    hands="Ochiudo's Kote",
    waist="Velocious Belt",
    legs="Ninja Hakama",
    feet="Ninja kyahan",
    neck="Peacock Amulet",
    left_ear="Suppanomimi",
    right_ear="Drone Earring",
    left_ring="Sniper's Ring",
    right_ring="Rajas Ring",
    back="Nomad's Mantle +1",
  }

  sets.idle.Town = set_combine(sets.idle,
  {
      back="Nexus cape"
  })

  -- defense
  sets.defense.Evasion = {
      head="Empress Hairpin",
      left_ear="Suppanomimi",
      right_ear="Velocity Earring",
      body="Scp. Harness +1",
      back="Amemet Mantle",
    }
      
  sets.defense.PDT = {}
  sets.defense.MDT = {}
  
  -- engaged
  sets.engaged = {
    main="Fudo",
    sub="Fudo",
    range="Rogetsurin",
    head="Walahra Turban",
    body="Scp. Harness +1",
    hands="Dusk Gloves",
    waist="Velocious Belt",
    legs="Ryl.Kgt. Breeches",
    feet="Sarutobi Kyahan",
    neck="Peacock Amulet",
    left_ear="Suppanomimi",
    right_ear="Drone Earring",
    left_ring="Sniper's Ring",
    right_ring="Rajas Ring",
    back="Cerberus Mantle",
  }
       
  sets.engaged.HybridAcc = set_combine(sets.engaged,{
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
  })
  sets.engaged.Acc = set_combine(sets.engaged.HybridAcc,{})
  sets.engaged.Tank = set_combine(sets.engaged.Acc,{})

    -- ranged
  sets.precast.RA = {
    neck="Peacock Amulet",
    hands="Ninja Tekko",
    left_ring="Scorpion Ring +1",
    right_ring="Scorpion Ring +1",
    legs="Ninja Hakama",
    feet="Bounding Boots",
  }
  sets.midcast.RA = set_combine(sets.precast.RA,{})
  sets.midcast.RA.HNM = set_combine(sets.midcast.HNM,{})
  
  --ws
  sets.precast.WS = {
    neck="Chivalrous Chain",
    waist="Potent Belt",
    hands="Ochiudo's Kote",
    legs="Ryl.Kgt. Breeches",
    right_ear="Brutal Earring",
    left_ring="Sniper's Ring",
    right_ring="Rajas Ring",
    back="Cerberus Mantle",
  }
  sets.precast.WS.HNM = set_combine(sets.precast.WS,{})

  -- STR:30% DEX:30%
  sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS,{
    head="Empress Hairpin",
    neck="Chivalrous Chain",
    feet="Bounding Boots",
    hands="Pallas's Bracelets",
  })
  sets.precast.WS['Blade: Jin'].HNM = set_combine(sets.precast.WS['Blade: Jin'],{})

  -- STR:30% DEX:30%
  sets.precast.WS['Blade: Ku'] = set_combine(sets.precast.WS,{
    head="Empress Hairpin",
    neck="Chivalrous Chain",
    feet="Bounding Boots",
    hands="Pallas's Bracelets",
  })
  sets.precast.WS['Blade: Ku'].HNM = set_combine(sets.precast.WS['Blade: Ku'],{})
  
  --[[
    -- DEX:80%
    sets.precast.WS['Blade: Metsu'] = set_combine(sets.precast.WS,{})
                  
    sets.precast.WS['Blade: Metsu'].HNM = set_combine(sets.precast.WS['Blade: Metsu'],{})
  
    -- STR:60% INT:60%
    sets.precast.WS['Blade: Kamu'] = set_combine(sets.precast.WS,{})
                   
    sets.precast.WS['Blade: Kamu'].HNM = set_combine(sets.precast.WS['Blade: Kamu'],{})
  ]]
  
initialize_crafting_sets(player.name)
  end
