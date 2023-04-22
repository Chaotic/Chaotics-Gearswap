function init_gear_sets()
    
    windower.send_command('sta !packets off; wait 1; gs equip sets.idle')

    -- misc
    sets.enmity = {
      head="Valor Coronet",
      body="Gallant Surcoat",
      hands="Gallant Gauntlets",
      legs="Gallant Breeches",
      back="Cerberus Mantle",
      right_ring="Hercules' Ring",
    }
  
    sets.MND = {
        head="Gallant Coronet",
        neck="Justice Badge",
        hands="Savage Gauntlets",
        legs="Savage Loincloth",
    }
      -- precast ja
      sets.precast.Step = {
        neck="Peacock amulet",
        body="Haubergeon +1",
        waist="Life Belt",
        left_ring="Lava's Ring",
        right_ring="Kusha's Ring",
      }
  
      -- Waltz set (chr and vit)
      sets.precast.Waltz = {
        head="Noble's Ribbon",
        neck="Bird Whistle",
        body="Savage Separates",
        left_ring="Opal Ring",
        right_ring="Opal Ring",
        feet="Gallant Leggings",
        waist="Corsette +1",
      }
    
      sets.precast.WaltzSelf = set_combine(sets.precast.Waltz,
                                          {
                                            body="Gallant Surcoat",
                                            legs="Savage Loincloth",
                                            left_ear="Knight's earring",
                                            right_ear="Cassie Earring",
                                        })
    
      -- Don't need any special gear for Healing Waltz.
      sets.precast.Waltz['Healing Waltz']= {}

    -- buff
  
    -- precast ja
    sets.precast.JA = {}
  
    sets.precast.JA['Cover'] = {
      head="Gallant Coronet",
    } --body="Valor surcoat"
     
    sets.precast.JA['Rampart'] = {
            head="Valor Coronet",
  } 
     
    sets.precast.JA['Sentinel'] = {}
     
    sets.precast.JA['Shield Bash'] = {
      feet="Gallant Leggings",
    }
     
    sets.precast.JA['Holy Circle'] = {
      feet="Gallant Leggings",
    }
     
    sets.precast.JA['Chivalry'] = set_combine(
                                                sets.enmity,
                                                sets.MND,
                                                {}
                                            )
  
    -- precast magic
    sets.precast.FC = {}
  
    -- midcast magic
    sets.midcast.FastRecast = set_combine(
                                          sets.precast.FC,
                                          {
                                            head="Walahra Turban",
                                            waist="Velocious Belt",
                                            hands="Dusk Gloves",
                                            feet="Dusk Ledelsens",
                                          }
                                        )
  
    sets.midcast['Healing Magic'] = set_combine(
                                                sets.MND,
                                                sets.enmity,
                                                sets.midcast.FastRecast,
                                                {
                                                  left_ear="Hospitaler Earring",
                                                  head="Valor Coronet",
                                              }
                                            )
                  
    sets.midcast['Healing Magic'].self = set_combine(
                                                    sets.midcast['Healing Magic'],
                                                    {
                                                      left_ear="Hospitaler Earring",
                                                      head="Valor Coronet",
                                                    }
                                                )
                   
    sets.midcast['Enhancing Magic'] = set_combine(
                                                sets.enmity,
                                                sets.midcast.FastRecast,
                                                {
                                                  legs="Gallant Breeches",
                                                }
                                            )
                  
    sets.midcast['Divine Magic'] = set_combine(
                                                sets.enmity,
                                                sets.midcast.FastRecast,
                                                {
                                                  body="Gallant Surcoat",
                                                  left_ear="Knight's earring"
                                                }
                                            )
  
    sets.midcast['Utsusemi: Ni'] = set_combine(
                                                sets.enmity,
                                                sets.midcast.FastRecast,
                                                {left_ear="Knight's earring"}
                                            )
                   
    sets.midcast['Utsusemi: Ichi'] = set_combine(
                                                sets.midcast['Utsusemi: Ni'],
                                                {}
                                            )
  
    sets.midcast['Flash'] = set_combine(
                                        sets.enmity,
                                        sets.midcast.FastRecast,
                                        {}
                                    )
  
    -- defense
    sets.defense.PDT = {
      sub="Palmerin's Shield",
      ammo={ name="Bibiki Seashell", augments={'HP recovered while healing +5','MP recovered while healing +5','Phys. dmg. taken -3%',}},
      left_ring="Jelly Ring",
      right_ring="Nasatya's Ring",
    }
    sets.defense.SPDT = {
      main=gear.Staff.PDT,
      ammo={ name="Bibiki Seashell", augments={'HP recovered while healing +5','MP recovered while healing +5','Phys. dmg. taken -3%',}},
      left_ring="Jelly Ring",
      right_ring="Nasatya's Ring",
    }
    sets.defense.MDT = set_combine(
                                    sets.MND,
                                    {
                                      right_ring="Dasra's Ring",
                                    }
                                )
    sets.defense.Breath = {}
  
    -- idle
    sets.idle = {
                  ammo="Bibiki Seashell",
                  head="Walahra Turban",
                  body="Haubergeon +1",
                  hands="Pallas's Bracelets",
                  legs="Savage Loincloth",
                  feet="Bounding Boots",
                  neck="Peacock amulet",
                  left_ear="Knight's earring",
                  right_ear="Cassie Earring",
                  waist="Velocious Belt",
                  left_ring="Dasra's Ring",
                  right_ring="Nasatya's Ring",
                  back="Traveler's Mantle",
                }
       
	    sets.idle.Town = set_combine(
                                sets.idle,
                                {
                                  back="Nexus cape"
                                }
                            )
  
    sets.idle.SuperPDT = set_combine(
                                    sets.idle,
                                    sets.defense.PDT,
                                    {}
                                )
                   
    sets.idle.SuperMDT = set_combine(
                                    sets.idle,
                                    sets.defense.MDT
                                )
  
    
    sets.resting.Normal = {
                            main="Pluto's Staff",
                            ammo="Bibiki Seashell",
                            left_ear="Antivenom Earring",
                          }
    sets.resting.TP = {
                        ammo="Bibiki Seashell",
                        left_ear="Antivenom Earring",
                      }
  
    -- engaged
    sets.engaged = {
                    ammo="Bibiki Seashell",
                    head="Walahra Turban",
                    body="Haubergeon +1",
                    hands="Dusk Gloves",
                    legs="Dusk Trousers",
                    feet="Dusk Ledelsens",
                    neck="Peacock amulet",
                    left_ear="Knight's earring",
                    right_ear="Cassie Earring",
                    waist="Velocious Belt",
                    left_ring="Lava's Ring",
                    right_ring="Kusha's Ring",
                    back="Cerberus Mantle",
                   }
       
    sets.engaged.Acc = set_combine(
                                    sets.engaged,
                                    {
                                      neck="Peacock amulet",
                                      body="Haubergeon +1",
                                      waist="Life Belt",
                                      left_ring="Lava's Ring",
                                      right_ring="Kusha's Ring",
                                    }
                                    )
                   
    sets.engaged.Heavy = {}
       
    sets.engaged.Wyrm = set_combine(
                                    sets.engaged.Heavy,
                                    {}
                                )
    -- weaponskill
    sets.precast.WS = {
      neck="Peacock amulet",
      body="Haubergeon +1",
      hands="Pallas's Bracelets",
      feet="Savage Gaiters"
    }
       
    sets.precast.WS.Acc = set_combine(
                                    sets.precast.WS,
                                    {
                                    neck="Peacock amulet",
                                    body="Haubergeon +1",
                                    waist="Life Belt",
                                    left_ring="Lava's Ring",
                                    right_ring="Kusha's Ring",
                                  }
                                    )
  
-- STR 60
    sets.precast.WS['Vorpal Blade'] = set_combine(
                                                    sets.precast.WS,
                                                    {
                                                      hands="Pallas's Bracelets",
                                                      back="Cerberus Mantle",
                                                      waist="Potent Belt",
                                                    }
                                                )
     
    sets.precast.WS['Vorpal Blade'].Acc = set_combine(
                                                        sets.precast.WS['Vorpal Blade'],
                                                        {
                                                          neck="Peacock amulet",
                                                          body="Haubergeon +1",
                                                          waist="Potent Belt",
                                                          left_ring="Lava's Ring",
                                                          right_ring="Kusha's Ring",
                                                        }
                                                    )

-- STR 50 MND 50 
sets.precast.WS['Swift Blade'] = set_combine(
  sets.precast.WS,
  {
    waist="Potent Belt",
    back="Cerberus Mantle",
  }
)

sets.precast.WS['Swift Blade'].Acc = set_combine(
      sets.precast.WS['Swift Blade'],
      {
        neck="Peacock amulet",
        body="Haubergeon +1",
        waist="Life Belt",
        left_ring="Lava's Ring",
        right_ring="Kusha's Ring",
      }
  )                         

-- MND 73  
    sets.precast.WS['Requiescat'] = set_combine(
                                                sets.precast.WS['Vorpal Blade'],
                                                {}
                                            )
                  
    sets.precast.WS['Requiescat'].Acc = set_combine(
                                                    sets.precast.WS['Vorpal Blade'].Acc,
                                                    {
                                                      neck="Peacock amulet",
                                                      body="Haubergeon +1",
                                                      waist="Life Belt",
                                                      left_ring="Lava's Ring",
                                                      right_ring="Kusha's Ring",
                                                    }
                                                )
  
    sets.precast.WS['Atonement'] = set_combine(
                                                sets.enmity,
                                                {}
                                            )
                  
    sets.precast.WS['Atonement'].Acc = set_combine(
                                                    sets.precast.WS['Atonement'],
                                                    {
                                                      neck="Peacock amulet",
                                                      body="Haubergeon +1",
                                                      waist="Life Belt",
                                                      left_ring="Lava's Ring",
                                                      right_ring="Kusha's Ring",
                                                    }
                                                )
    initialize_crafting_sets(player.name)  
  end
  