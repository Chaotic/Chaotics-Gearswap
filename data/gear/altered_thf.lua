function init_gear_sets()
  
    windower.send_command('sta !packets off; wait 1; gs equip sets.idle')
    
  -- misc sets
  sets.postPrecast = {}
  
  sets.TreasureHunter = {
    sub="Thief's Knife",
    hands="Assassin's Armlets",
  }

  sets.enmityUp = {
    head="Assassin's Bonnet",
    body="Assassin's Vest",
    hands="Assassin's Armlets",
    feet="Assassin's Pouln.",
  }
     
  sets.enmityDown = {}

	--These 3 sets are used in the SA TA SATA WS sets just didn't want to repeat gear endlessly
  sets.DEX = {
    head="Empress Hairpin",
    body="Dragon Harness",
    feet="Bounding Boots",
  }
  
  sets.AGI = {
    head="Empress Hairpin",
    body="Dragon Harness",
    feet="Bounding Boots",
    back="Nomad's Mantle +1",
    left_ear="Drone Earring",
    right_ear="Drone Earring",
    waist="Scouter's Rope",
   }  

   sets.DEXAGI = {
    head="Empress Hairpin",
    body="Dragon Harness",
    feet="Bounding Boots",
    back="Nomad's Mantle +1",
    left_ear="Drone Earring",
    right_ear="Drone Earring",
    waist="Scouter's Rope",
     }  

     sets.CHR = {
      body="Savage Separates",
      hands="Assassin's Armlets",
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
    
  sets.Crossbow = {
                    range="Staurobow",
                  }
  sets['Normal'] = set_combine(sets.Crossbow,{
                    ammo="Crossbow Bolt"
                  })
  
  sets['Acid'] = set_combine(sets.Crossbow,{
                    ammo="Acid Bolt"
                  })
                
  sets['Bloody'] = set_combine(sets.Crossbow,{
                    ammo="Bloody Bolt"
                  })
                
  sets['Sleep'] = set_combine(sets.Crossbow,{
                    ammo="Sleep Bolt"
                  })
  sets['Blind'] = set_combine(sets.Crossbow,{
                    ammo="Blind Bolt"
                  })

  sets.Regen = {}

  sets.Regen.daytime = set_combine(sets.Regen,{})

  -- buff
  sets.buff['Sneak Attack'] = {}
     
  sets.buff['Trick Attack'] = {}

  -- precast ja
  sets.precast.JA['Flee'] = {
    feet="Rogue's Poulaines",
  }
   
  sets.precast.JA['Steal'] = set_combine(sets.engaged,
    {
      head="Rogue's Bonnet",
      neck="Rabbit Charm",
      hands="Rogue's Armlets",
      legs="Rogue's Culottes",
      feet="Rogue's Poulaines",
    }
  )
     
  sets.precast.JA['Mug'] = {
    head="Assassin's Bonnet",
  }
   
  sets.precast.JA['Hide'] = {
		body="Rogue's Vest",
	}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = set_combine(sets.CHR,{
    })
  
    sets.precast.WaltzSelf = set_combine(sets.precast.Waltz,sets.VIT,
                                        {})
  
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz']= {}

  -- precast magic
  sets.precast.FC = {
    left_ear="Loquac. Earring",
  }

  -- midcast magic
  sets.midcast.FastRecast = set_combine(sets.precast.FC,{
    head="Walahra Turban",
    body="Rapparee Harness",
    legs="Bravo's Subligar",
    waist="Velocious Belt",
    hands="Dusk Gloves",
    feet="Dusk Ledelsens",
  })

  sets.midcast['Utsusemi: Ni'] = set_combine(sets.midcast.FastRecast,{})
                 
  sets.midcast['Utsusemi: Ichi'] = set_combine(sets.midcast['Utsusemi: Ni'],{})

  -- idle
  sets.idle = {
    range="Staurobow",
    head="Walahra Turban",
    neck="Peacock amulet",
    body="Rapparee Harness",
    hands="Assassin's Armlets",
    waist="Velocious Belt",
    legs="Bravo's Subligar",
    feet="Trotter Boots",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
    back="Nomad's Mantle +1",
  }
     
  sets.idle.Town = set_combine(sets.idle,{
    back="Nexus Cape",
  })

  -- defense
  sets.defense.Evasion = {
    head="Empress Hairpin",
    body="Scp. Harness +1",
    back="Nomad's Mantle +1",
    waist="Scouter's Rope",
  }
  sets.defense.SubtleBlow = set_combine(sets.defense.Evasion,{
    body="Dragon Harness",
    left_ring="Sniper's Ring",
    right_ring="Rajas Ring",
  })
  
  sets.defense.PDT = {}
     
  sets.defense.MDT = {}

  -- engaged
  sets.engaged = {
    range="Power Crossbow",
    head="Walahra Turban",
    neck="Peacock amulet",
    body="Rapparee Harness",
    hands="Dusk Gloves",
    waist="Velocious Belt",
    legs="Bravo's Subligar",
    feet="Dusk Ledelsens",
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
                 
  sets.engaged.Acc = set_combine(sets.engaged.HybridAcc,{})
                
  sets.engaged.MDT = set_combine(sets.engaged.Acc,{})

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
  
  -- BASE WEAPONSKILL SETS
  sets.precast.WS  = {
    body="Scp. Harness +1",
    neck="Chivalrous Chain",
  }
    
  sets.precast.WS.Atk = set_combine(sets.precast.WS,{
    left_ring="Sniper's Ring",
    right_ring="Rajas Ring",
  }) 
  
  sets.precast.WS.Acc = set_combine(sets.precast.WS,
  {
    neck="Peacock amulet",
    body="Scp. Harness +1",
    waist="Life Belt",
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
  })

  sets.precast.WS.AtkAcc = set_combine(sets.precast.WS.Atk,
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
                                                            body="Dragon Harness",
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
    body="Dragon Harness",
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
                
  -- Mercy Stroke
  -- STR 80
  sets.precast.WS['Mercy Stroke'] = {
    
        back="Cerberus Mantle",
        waist="Potent Belt",
      }
    
  sets.precast.WS['Mercy Stroke'].Atk = set_combine(sets.precast.WS['Mercy Stroke'],{})
                
  sets.precast.WS['Mercy Stroke'].Acc = set_combine(sets.precast.WS['Mercy Stroke'],
  {
    neck="Peacock amulet",
    body="Scp. Harness +1",
    waist="Potent Belt",
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
  })

  sets.precast.WS['Mercy Stroke'].AtkAcc = set_combine(sets.precast.WS['Mercy Stroke'].Atk,
  {
    neck="Peacock amulet",
    body="Scp. Harness +1",
    waist="Life Belt",
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
  })

  -- SA
  sets.precast.WS['Mercy Stroke'].SA = set_combine(sets.precast.WS['Mercy Stroke'],sets.DEX,{
  })
               
  sets.precast.WS['Mercy Stroke'].Atk.SA = set_combine(sets.precast.WS['Mercy Stroke'].Atk,sets.DEX,{
  })
               
  sets.precast.WS['Mercy Stroke'].Acc.SA = set_combine(sets.precast.WS['Mercy Stroke'].Acc,sets.DEX,{
  })

  sets.precast.WS['Mercy Stroke'].AtkAcc.SA = set_combine(sets.precast.WS['Mercy Stroke'].AtkAcc,sets.DEX,{
  })

  --TA
  sets.precast.WS['Mercy Stroke'].TA = set_combine(sets.precast.WS['Mercy Stroke'],sets.AGI,{
  })
               
  sets.precast.WS['Mercy Stroke'].Atk.TA = set_combine(sets.precast.WS['Mercy Stroke'].Atk,sets.AGI,{
  })
               
  sets.precast.WS['Mercy Stroke'].Acc.TA = set_combine(sets.precast.WS['Mercy Stroke'].Acc,sets.AGI,{
  })
               
  sets.precast.WS['Mercy Stroke'].AtkAcc.TA = set_combine(sets.precast.WS['Mercy Stroke'].AtkAcc,sets.AGI,{
  })
  
  --SATA
  sets.precast.WS['Mercy Stroke'].SATA = set_combine(sets.precast.WS['Mercy Stroke'],sets.DEXAGI,{})
               
  sets.precast.WS['Mercy Stroke'].Atk.SATA = set_combine(sets.precast.WS['Mercy Stroke'].Atk,sets.DEXAGI,{})
               
  sets.precast.WS['Mercy Stroke'].Acc.SATA = set_combine(sets.precast.WS['Mercy Stroke'].Acc,sets.DEXAGI,{})
               
  sets.precast.WS['Mercy Stroke'].AtkAcc.SATA = set_combine(sets.precast.WS['Mercy Stroke'].AtkAcc,sets.DEXAGI,{})
               
                
  -- Mandalic Stab
  -- DEX
  sets.precast.WS['Mandalic Stab'] = set_combine(sets.DEX,{
    body="Dragon Harness",
    back="Cerberus Mantle",
})
  
  sets.precast.WS['Mandalic Stab'].Atk = set_combine(sets.precast.WS['Mandalic Stab'],{})  
  
  sets.precast.WS['Mandalic Stab'].Acc = set_combine(sets.precast.WS['Mandalic Stab'],
  {
    neck="Peacock amulet",
    body="Scp. Harness +1",
    waist="Life Belt",
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
  })

  sets.precast.WS['Mandalic Stab'].AtkAcc = set_combine(sets.precast.WS['Mandalic Stab'],
  {
    neck="Peacock amulet",
    body="Scp. Harness +1",
    waist="Life Belt",
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
  })

  -- SA
  sets.precast.WS['Mandalic Stab'].SA = set_combine(sets.precast.WS['Mandalic Stab'],sets.DEX,{})
               
  sets.precast.WS['Mandalic Stab'].Atk.SA = set_combine(sets.precast.WS['Mandalic Stab'],sets.DEX,{})
               
  sets.precast.WS['Mandalic Stab'].Acc.SA = set_combine(sets.precast.WS['Mandalic Stab'],sets.DEX,{})
               
  sets.precast.WS['Mandalic Stab'].AtkAcc.SA = set_combine(sets.precast.WS['Mandalic Stab'],sets.DEX,{})
  
  --TA
  sets.precast.WS['Mandalic Stab'].TA = set_combine(sets.precast.WS['Mandalic Stab'],sets.AGI,{})
               
  sets.precast.WS['Mandalic Stab'].Atk.TA = set_combine(sets.precast.WS['Mandalic Stab'].Atk,sets.AGI,{})
               
  sets.precast.WS['Mandalic Stab'].Acc.TA = set_combine(sets.precast.WS['Mandalic Stab'].Acc,sets.AGI,{})
               
  sets.precast.WS['Mandalic Stab'].AtkAcc.TA = set_combine(sets.precast.WS['Mandalic Stab'].AtkAcc,sets.AGI,{})
  
  --SATA
  sets.precast.WS['Mandalic Stab'].SATA = set_combine(sets.precast.WS['Mandalic Stab'],sets.DEXAGI,{})
               
  sets.precast.WS['Mandalic Stab'].Atk.SATA = set_combine(sets.precast.WS['Mandalic Stab'].Atk,sets.DEXAGI,{})
               
  sets.precast.WS['Mandalic Stab'].Acc.SATA = set_combine(sets.precast.WS['Mandalic Stab'].Acc,sets.DEXAGI,{})
               
  sets.precast.WS['Mandalic Stab'].AtkAcc.SATA = set_combine(sets.precast.WS['Mandalic Stab'].AtkAcc,sets.DEXAGI,{})
               
                
  -- Shark Bite
  -- DEX 40 AGI 40
  sets.precast.WS['Shark Bite'] = set_combine(sets.DEXAGI,{
  head="Empress Hairpin",
  body="Dragon Harness",
  back="Cerberus Mantle",
})
    
  sets.precast.WS['Shark Bite'].Atk = set_combine(sets.precast.WS['Shark Bite'],{}) 
  
  sets.precast.WS['Shark Bite'].Acc = set_combine(sets.precast.WS['Shark Bite'], 
  {
    neck="Peacock amulet",
    body="Scp. Harness +1",
    waist="Life Belt",
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
  })
  
  sets.precast.WS['Shark Bite'].AtkAcc = set_combine(sets.precast.WS['Shark Bite'], 
  {
    neck="Peacock amulet",
    body="Scp. Harness +1",
    waist="Life Belt",
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
  })

  -- SA
  sets.precast.WS['Shark Bite'].SA = set_combine(sets.precast.WS['Shark Bite'],sets.DEX,{})
  
  sets.precast.WS['Shark Bite'].Atk.SA = set_combine(sets.precast.WS['Shark Bite'].Atk,sets.DEX,{})
  
  sets.precast.WS['Shark Bite'].Acc.SA = set_combine(sets.precast.WS['Shark Bite'].Acc,sets.DEX,{})
  
  sets.precast.WS['Shark Bite'].AtkAcc.SA = set_combine(sets.precast.WS['Shark Bite'].AtkAcc,sets.DEX,{})
  
  
  --TA
  sets.precast.WS['Shark Bite'].TA = set_combine(sets.precast.WS['Shark Bite'],sets.AGI,{})
               
  sets.precast.WS['Shark Bite'].Atk.TA = set_combine(sets.precast.WS['Shark Bite'].Atk,sets.AGI,{})
               
  sets.precast.WS['Shark Bite'].Acc.TA = set_combine(sets.precast.WS['Shark Bite'].Acc,sets.AGI,{})
               
  sets.precast.WS['Shark Bite'].AtkAcc.TA = set_combine(sets.precast.WS['Shark Bite'].AtkAcc,sets.AGI,{})
  
  --SATA
  sets.precast.WS['Shark Bite'].SATA = set_combine(sets.precast.WS['Shark Bite'],sets.DEXAGI,{})
               
  sets.precast.WS['Shark Bite'].Atk.SATA = set_combine(sets.precast.WS['Shark Bite'].Atk,sets.DEXAGI,{})
               
  sets.precast.WS['Shark Bite'].Acc.SATA = set_combine(sets.precast.WS['Shark Bite'].Acc,sets.DEXAGI,{})
               
  sets.precast.WS['Shark Bite'].AtkAcc.SATA = set_combine(sets.precast.WS['Shark Bite'].AtkAcc,sets.DEXAGI,{})
  

  initialize_crafting_sets(player.name)  
end
