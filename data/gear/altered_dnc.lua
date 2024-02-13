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
      -- tights give 3 acc
      legs="Dancer's Tights",
      feet="Etoile Toe Shoes",
      left_ring="Lava's Ring",
      right_ring="Kusha's Ring",
  
    }
  
    sets.CHR = {
      head="Dancer's Tiara",
      body="Savage Separates",
      legs="Dancer's Tights",
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
    sets.precast.Waltz = set_combine(sets.CHR,{
      head="Etoile Tiara",
      body="Dancer's Casaque",
    })
  
    sets.precast.WaltzSelf = set_combine(sets.precast.Waltz,sets.VIT,{})
  
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz']= {}
  
    sets.precast.Samba = {
      head="Dancer's Tiara",
    }
  
    sets.precast.Jig = {
      feet="Dancer's Toe Shoes",
    }
  
    sets.precast.JA['Violent Flourish'] = {
      body="Etoile Casaque",
    }
  
    sets.precast.JA['Desperate Flourish'] = set_combine(sets.precast.Step,
                                                        {})
  
    sets.precast.JA['Wild Flourish'] = set_combine(sets.precast.JA['Desperate Flourish'])
  
    -- precast magic
    sets.precast.FC = {
      left_ear="Loquac. Earring",
    }
  
    -- midcast magic
    sets.midcast.FastRecast = set_combine(sets.precast.FC,
                                            {

                                              head="Walahra Turban",
                                              body="Rapparee Harness",
                                              waist="Velocious Belt",
                                              hands="Dusk Gloves",
                                              feet="Dusk Ledelsens",
                                          })
  
    sets.midcast['Utsusemi: Ni'] = set_combine(sets.midcast.FastRecast,{})

    sets.midcast['Utsusemi: Ichi'] = set_combine(sets.midcast['Utsusemi: Ni'],{})
                                        
  
    -- idle
    sets.idle = {
                  range="War Hoop",
                  head="Walahra Turban",
                  body="Rapparee Harness",
                  hands="Guerilla Gloves",
                  legs="Dancer's Tights",
                  feet="Bounding Boots",
                  neck="Peacock Amulet",
                  waist="Velocious Belt",
                  left_ear="Suppanomimi",
                  right_ear="Brutal Earring",
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
                              body="Scp. Harness +1",
                              hands="Etoile Bangles",
                              back="Nomad's Mantle +1",
                              waist="Scouter's Rope",
                            }
  
    sets.defense.PDT = {}
  
    sets.defense.MDT = {}
    -- ranged
    sets.precast.RA = {
      neck="Peacock Amulet",
      body="Rapparee Harness",
      right_ear="Drone Earring",
      left_ring="Scorpion Ring",
      right_ring="Scorpion Ring",
      legs="Bravo's Subligar",
    }
       
    sets.midcast.RA = {}
    -- engaged
    sets.engaged = {
                      range="War Hoop",
                      head="Walahra Turban",
                      body="Rapparee Harness",
                      legs="Dancer's Tights",
                      hands="Dusk Gloves",
                      feet="Dusk Ledelsens",
                      neck="Peacock Amulet",
                      waist="Velocious Belt",
                      left_ear="Suppanomimi",
                      right_ear="Brutal Earring",
                      left_ring="Sniper's Ring",
                      right_ring="Rajas Ring",
                      back="Cerberus Mantle",
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
    neck="Chivalrous Chain",
    body="Scp. Harness +1",
    waist="Life Belt",
    left_ring="Sniper's Ring",
    right_ring="Rajas Ring",
    back="Cerberus Mantle",
  }
    
  sets.precast.WS.Atk = set_combine(sets.precast.WS,{
    neck="Chivalrous Chain",
  }) 
  
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
    left_ring="Sniper's Ring",
    right_ring="Rajas Ring",
  })
  -- Evisceration
  -- DEX 50
  sets.precast.WS['Evisceration'] = set_combine(sets.DEX,{
                                                            head="Empress Hairpin",
                                                            body="Scp. Harness +1",
                                                            neck="Peacock amulet",
                                                            waist="Life Belt",
                                                            back="Cerberus Mantle",
                                                          })
  
  sets.precast.WS['Evisceration'].Atk = set_combine(sets.precast.WS['Evisceration'],{})
                 
  sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'],
  {
    neck="Peacock amulet",
    body="Scp. Harness +1",
    waist="Life Belt",
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
  })

  sets.precast.WS['Evisceration'].AtkAcc = set_combine(sets.precast.WS['Evisceration'].Atk,
  {
    neck="Peacock amulet",
    body="Scp. Harness +1",
    waist="Life Belt",
    left_ring="Sniper's Ring",
    right_ring="Rajas Ring",

  })

  -- Dancing Edge
  -- Dex 40 CHR 40
  sets.precast.WS['Dancing Edge'] = set_combine(sets.DEX,{
    head="Empress Hairpin",
    body="Scp. Harness +1",
    neck="Peacock amulet",
    waist="Life Belt",
    back="Cerberus Mantle",
})
    
  sets.precast.WS['Dancing Edge'].Atk = set_combine(sets.precast.WS['Dancing Edge'],{})
               
  sets.precast.WS['Dancing Edge'].Acc = set_combine(sets.precast.WS['Dancing Edge'],
  {
    neck="Peacock amulet",
    body="Scp. Harness +1",
    waist="Life Belt",
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
  })

  sets.precast.WS['Dancing Edge'].AtkAcc = set_combine(sets.precast.WS['Dancing Edge'].Atk,
  {
    neck="Peacock amulet",
    body="Scp. Harness +1",
    waist="Life Belt",
    left_ring="Sniper's Ring",
    right_ring="Rajas Ring",
  })

  -- Exenterator
  -- AGI 73
  sets.precast.WS['Exenterator'] = sets.precast.WS['Dancing Edge']
  
  sets.precast.WS['Exenterator'].Atk = sets.precast.WS['Dancing Edge'].Atk
  
  sets.precast.WS['Exenterator'].Acc = sets.precast.WS['Dancing Edge'].Acc
  
  sets.precast.WS['Exenterator'].AtkAcc = sets.precast.WS['Dancing Edge'].AtkAcc
                
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