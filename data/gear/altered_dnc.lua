function init_gear_sets()
  
    windower.send_command('sta !packets off; wait 1; gs equip sets.idle')
    
    -- misc
    sets.enmityUp = {}
  
    sets.enmityDown = {}
  
    -- precast ja
    sets.precast.Step = {
      neck="Peacock Amulet",
      waist="Life Belt",
      body="Scp. Harness +1",
      hands="Dancer's Bangles",
    }
  
    sets.CHR = {
      head="Entrancing Ribbon",
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
    -- Waltz set (chr and vit)
    sets.precast.Waltz = set_combine(sets.CHR,{})
  
    sets.precast.WaltzSelf = set_combine(sets.precast.Waltz,sets.VIT,
                                        {})
  
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz']= {}
  
    sets.precast.Samba = {}
  
    sets.precast.Jig = {}
  
    sets.precast.JA['Violent Flourish'] = {}
  
    sets.precast.JA['Desperate Flourish'] = set_combine(sets.precast.Step,
                                                        {})
  
    sets.precast.JA['Wild Flourish'] = set_combine(sets.precast.JA['Desperate Flourish'])
  
    -- precast magic
    sets.precast.FC = {}
  
    -- midcast magic
    sets.midcast.FastRecast = set_combine(sets.precast.FC,
                                            {
                                              body="Rapparee Harness",
                                              waist="Velocious Belt",
                                          })
  
    sets.midcast['Utsusemi: Ni'] = set_combine(sets.midcast.FastRecast,{})

    sets.midcast['Utsusemi: Ichi'] = set_combine(sets.midcast['Utsusemi: Ni'],{})
                                        
  
    -- idle
    sets.idle = {
                  range="War Hoop",
                  head="Empress Hairpin",
                  body="Rapparee Harness",
                  hands="Guerilla Gloves",
                  legs="Beetle Subligar +1",
                  feet="Bounding Boots",
                  neck="Peacock Amulet",
                  waist={ name="Velocious Belt", augments={'STR+3','Water resistance+20','Water resistance+30',}},
                  left_ear="Drone Earring",
                  right_ear="Drone Earring",
                  left_ring="Lava's Ring",
                  right_ring="Kusha's Ring",
                  back="Nomad's Mantle +1",
                }
  
    sets.idle.Town = set_combine(sets.idle,
                                {
                                    back="Nexus cape"
                                })
  
    -- defense
    sets.defense.Evasion = {
                              head="Empress Hairpin",
                              body="Scp. Harness +1",
                              back="Nomad's Mantle +1",
                              waist="Scouter's Rope",
                            }
  
    sets.defense.PDT = {}
  
    sets.defense.MDT = {}
  
    -- engaged
    sets.engaged = {
                      range="War Hoop",
                      head="Empress Hairpin",
                      body="Rapparee Harness",
                      legs="Beetle Subligar +1",
                      feet="Bounding Boots",
                      neck="Peacock Amulet",
                      waist={ name="Velocious Belt", augments={'STR+3','Water resistance+20','Water resistance+30',}},
                      left_ear="Drone Earring",
                      right_ear="Drone Earring",
                      left_ring="Lava's Ring",
                      right_ring="Kusha's Ring",
                      back="Traveler's Mantle",
                    }
  
  sets.engaged.HybridAcc = set_combine(sets.engaged,
  {
    neck="Peacock amulet",
    body="Scp. Harness +1",
    waist="Life Belt",
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
  })
  
    sets.engaged.OffTank = set_combine(sets.engaged.HybridAcc,
                                        {})
  
    sets.engaged.Tank = set_combine(sets.engaged.OffTank,
                                    {})
  
    -- ws base
  -- BASE WEAPONSKILL SETS
  sets.precast.WS  = {
    body="Scp. Harness +1",
  }
    
  sets.precast.WS.Atk = set_combine(sets.precast.WS,{}) 
  
  sets.precast.WS.Acc = set_combine(sets.precast.WS,
  {
    neck="Peacock amulet",
    body="Scp. Harness +1",
    waist="Life Belt",
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
  })

  sets.precast.WS.HybridAcc = set_combine(sets.precast.WS.Atk,
  {
    neck="Peacock amulet",
    body="Scp. Harness +1",
    waist="Life Belt",
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
  })
   
  -- Evisceration
  -- DEX 50              
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS,
                                                    {}) 
    
    sets.precast.WS['Evisceration'].HybridAcc = set_combine(sets.precast.WS.HybridAcc,
                                                            {
                                                              neck="Peacock amulet",
                                                              body="Scp. Harness +1",
                                                              waist="Life Belt",
                                                              left_ring="Lava's Ring",
                                                              right_ring="Kusha's Ring",
                                                            }) 
    
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc,
                                                    {
                                                      neck="Peacock amulet",
                                                      body="Scp. Harness +1",
                                                      waist="Life Belt",
                                                      left_ring="Lava's Ring",
                                                      right_ring="Kusha's Ring",
                                                  }) 
    
    sets.precast.WS['Evisceration'].Mod = set_combine(sets.precast.WS['Evisceration'],
                                                    {}) 
                   
  -- Dancing Edge
  -- Dex 40 CHR 40
    sets.precast.WS['Dancing Edge'] = set_combine(sets.precast.WS,
                                                    {})
                  
    sets.precast.WS['Dancing Edge'].HybridAcc = set_combine(sets.precast.WS.HybridAcc,
                                                            {})
                  
    sets.precast.WS['Dancing Edge'].Acc = set_combine(sets.precast.WS.Acc,
                                                    {})
                  
    sets.precast.WS['Dancing Edge'].Mod = set_combine(sets.precast.WS['Dancing Edge'],
                                                        {})
  -- Exenterator
  -- AGI 73                   
    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS['Dancing Edge'],
                                                {})
                   
    sets.precast.WS['Exenterator'].HybridAcc = set_combine(sets.precast.WS['Dancing Edge'].HybridAcc,
                                                            {})
                   
    sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Dancing Edge'].Acc,
                                                    {})
                   
    sets.precast.WS['Exenterator'].Mod = set_combine(sets.precast.WS['Dancing Edge'].Mod,
                                                    {})
  
    -- pyrrhic kleos
    sets.precast.WS['Pyrrhic Kleos'] = set_combine(sets.precast.WS,
                                                    {})
                   
    sets.precast.WS['Pyrrhic Kleos'].HybridAcc = set_combine(sets.precast.WS.HybridAcc,
                                                            {})
                   
    sets.precast.WS['Pyrrhic Kleos'].Acc = set_combine(sets.precast.WS.Acc,
                                                        {})
                   
    sets.precast.WS['Pyrrhic Kleos'].Mod = set_combine(sets.precast.WS,
                                                        {})

  -- Shark Bite
  -- DEX 40 AGI 40
  sets.precast.WS['Shark Bite'] = {}
    
  sets.precast.WS['Shark Bite'].Mod = set_combine(sets.precast.WS['Shark Bite'],{}) 
  
  sets.precast.WS['Shark Bite'].Acc = set_combine(sets.precast.WS['Shark Bite'], 
  {
    neck="Peacock amulet",
    body="Scp. Harness +1",
    waist="Life Belt",
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
  })
  
  sets.precast.WS['Shark Bite'].HybridAcc = set_combine(sets.precast.WS['Shark Bite'], 
  {
    neck="Peacock amulet",
    body="Scp. Harness +1",
    waist="Life Belt",
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
  })

    initialize_crafting_sets(player.name)                        
  end