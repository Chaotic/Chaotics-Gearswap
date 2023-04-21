function init_gear_sets()
  
    windower.send_command('sta !packets off; wait 1; gs equip sets.idle')
    
    -- misc.
    sets.INT = {
      hands="Garrison Gloves",
      left_ear="Morion Earring",
      right_ear="Morion Earring",
      left_ring="Genius Ring",
      right_ring="Genius Ring",
    }
       
    sets.enmityUp = {}
  
    sets.enmityDown = {}
  
    -- precast ja
    sets.precast.Step = {}
  
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
  
    sets.precast.WaltzSelf = set_combine(sets.precast.Waltz,
                                        {})
  
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz']= {}

    sets.precast.JA['Violent Flourish'] = {}
  
    sets.precast.JA['Desperate Flourish'] = set_combine(sets.precast.Step,
                                                        {})
    -- precast magic
    sets.precast.FC = {}
  
    -- midcast magic
    sets.midcast.FastRecast = set_combine(sets.precast.FC,
                                            {
                                              waist="Velocious Belt",
                                              feet="Sarutobi Kyahan",
                                            }) 
  
    sets.midcast['Utsusemi: Ni'] = set_combine(sets.midcast.FastRecast,{})
                  
    sets.midcast['Utsusemi: Ichi'] = set_combine(sets.midcast['Utsusemi: Ni'],{})
                   
    sets.midcast.NinjutsuDebuff = set_combine(sets.INT,{
      --[[ These are lvl 60
         left_ear="Helenus's Earring",
      right_ear="Cass. Earring",
      ]]
      head='Ninja Hatsuburi'
    })
                   
    sets.midcast.ElementalNinjutsu = set_combine(sets.midcast.NinjutsuDebuff,{
  })
  
    -- idle
    sets.idle= {
                main="Sai",
                sub="Sai",
                range="Jr.Msk. Chakram",
                head="Empress Hairpin",
                body="Scorpion Harness",
                hands="Ochiudo's Kote",
                waist="Velocious Belt",
                legs="Ninja Hakama",
                feet="Ninja kyahan",
                neck="Peacock Amulet",
                left_ear="Dodge Earring",
                right_ear="Dodge Earring",
                left_ring="Lava's Ring",
                right_ring="Kusha's Ring",
                back="Traveler's Mantle",
                }
  
    sets.idle.Town = set_combine(sets.idle,
                                {
                                    back="Nexus cape"
                                })

    -- defense
    sets.defense.Evasion = {
      head="Empress Hairpin",
      left_ear="Dodge Earring",
      right_ear="Dodge Earring",
      body="Scorpion Harness",
      back="Traveler's Mantle",
    }
       
    sets.defense.PDT = {}
  
    sets.defense.MDT = {}
  
    -- engaged
    sets.engaged = {
                    main="Sai",
                    sub="Sai",
                    range="Jr.Msk. Chakram",
                    head="Empress Hairpin",
                    body="Scorpion Harness",
                    hands="Ochiudo's Kote",
                    waist="Velocious Belt",
                    legs="Ryl.Sqr. Breeches",
                    feet="Sarutobi Kyahan",
                    neck="Peacock Amulet",
                    left_ear="Dodge Earring",
                    right_ear="Dodge Earring",
                    left_ring="Lava's Ring",
                    right_ring="Kusha's Ring",
                    back="Traveler's Mantle",
                    }
       
    sets.engaged.HybridAcc = set_combine(sets.engaged,{})
                  
    sets.engaged.Acc = set_combine(sets.engaged.HybridAcc,{})
                   
    sets.engaged.Tank = set_combine(sets.engaged.Acc,{})
  
    -- ranged
    sets.precast.RA = {
                        neck="Peacock Amulet",
                        left_ring="Scorpion Ring +1",
                        right_ring="Scorpion Ring +1",
                        legs="Ninja Hakama",
                        feet="Bounding Boots",
                      }
  
    sets.midcast.RA = set_combine(sets.precast.RA,{})

    sets.midcast.RA.HNM = set_combine(sets.midcast.HNM,{})
  
    --ws
    sets.precast.WS = {
      waist="Life Belt",
    }
       
    sets.precast.WS.HNM = set_combine(sets.precast.WS,{})
  
    sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS,{})
                  
    sets.precast.WS['Blade: Jin'].HNM = set_combine(sets.precast.WS['Blade: Jin'],{})
  
    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS['Blade: Jin'],{})
                  
    sets.precast.WS['Blade: Shun'].HNM = set_combine(sets.precast.WS['Blade: Jin'].HNM,{})
  
    sets.precast.WS['Blade: Ku'] = set_combine(sets.precast.WS,{})
     
    sets.precast.WS['Blade: Ku'].HNM = set_combine(sets.precast.WS['Blade: Ku'],{})
  
    sets.precast.WS['Blade: Metsu'] = set_combine(sets.precast.WS,{})
                  
    sets.precast.WS['Blade: Metsu'].HNM = set_combine(sets.precast.WS['Blade: Metsu'],{})
  
    sets.precast.WS['Blade: Kamu'] = set_combine(sets.precast.WS,{})
                   
    sets.precast.WS['Blade: Kamu'].HNM = set_combine(sets.precast.WS['Blade: Kamu'],{})
  
  initialize_crafting_sets(player.name)
  sets.idle['Cooking'] = {
                          main="Hocho",
                          head="Chef's Hat",
                          body="Culinarian's Apron",
                         }
  end
