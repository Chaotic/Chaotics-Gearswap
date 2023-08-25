function init_gear_sets()
  
    windower.send_command('sta !packets off; wait 1; gs equip sets.idle')
    
  -- misc sets
  sets.postPrecast = {}
  
  sets.TreasureHunter = {
  }

  sets.enmityUp = {}
     
  sets.enmityDown = {}

	--These 3 sets are used in the SA TA SATA WS sets just didn't want to repeat gear endlessly
  sets.DEX = {
  }
  
  sets.AGI = {
   }  

   sets.DEXAGI = {
     }  

  sets.Crossbow = {
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
     
  sets.precast.JA['Mug'] = {}
   
  sets.precast.JA['Hide'] = {
		body="Rogue's Vest",
	}
    
  sets.precast.Waltz = {}

  sets.precast.WaltzSelf = set_combine(sets.precast.Waltz,{})

  -- precast magic
  sets.precast.FC = {}

  -- midcast magic
  sets.midcast.FastRecast = set_combine(sets.precast.FC,{
  })

  sets.midcast['Utsusemi: Ni'] = set_combine(sets.midcast.FastRecast,{})
                 
  sets.midcast['Utsusemi: Ichi'] = set_combine(sets.midcast['Utsusemi: Ni'],{})

  -- idle
  sets.idle = {
    main="Cesti",
    head="Brass Cap",
    body="Chocobo Shirt",
    hands="Brass Mittens",
    legs="Brass Subligar",
    feet="Bounding Boots",
    neck="Justice Badge",
    back="Traveler's Mantle",
}
     
  sets.idle.Town = set_combine(sets.idle,{
  })

  -- defense
  sets.defense.Evasion = {
  }
  sets.defense.SubtleBlow = set_combine(sets.defense.Evasion,{
  })
  
  sets.defense.PDT = {}
     
  sets.defense.MDT = {}

  -- engaged
  sets.engaged = {
        main="Cesti",
        head="Brass Cap",
        body="Chocobo Shirt",
        hands="Brass Mittens",
        legs="Brass Subligar",
        feet="Bounding Boots",
        neck="Justice Badge",
        back="Traveler's Mantle",
  }
     
  sets.engaged.HybridAcc = set_combine(sets.engaged,
  {
  })
                 
  sets.engaged.Acc = set_combine(sets.engaged.HybridAcc,{})
                
  sets.engaged.MDT = set_combine(sets.engaged.Acc,{})

  -- ranged
  sets.precast.RA = {
  }
     
  sets.midcast.RA = {}
  
  -- BASE WEAPONSKILL SETS
  sets.precast.WS  = {
  }
    
  sets.precast.WS.Atk = set_combine(sets.precast.WS,{
  }) 
  
  sets.precast.WS.Acc = set_combine(sets.precast.WS,
  {
  })

  sets.precast.WS.AtkAcc = set_combine(sets.precast.WS.Atk,
  {
  })

  -- Evisceration
  -- DEX 50
  sets.precast.WS['Evisceration'] = set_combine(sets.DEX,{
                                                          })
  
  sets.precast.WS['Evisceration'].Atk = set_combine(sets.precast.WS['Evisceration'],{})
                 
  sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'],
  {
  })

  sets.precast.WS['Evisceration'].AtkAcc = set_combine(sets.precast.WS['Evisceration'].Atk,
  {
  })

  -- Dancing Edge
  -- Dex 40 CHR 40
  sets.precast.WS['Dancing Edge'] = set_combine(sets.DEX,{
})
    
  sets.precast.WS['Dancing Edge'].Atk = set_combine(sets.precast.WS['Dancing Edge'],{})
               
  sets.precast.WS['Dancing Edge'].Acc = set_combine(sets.precast.WS['Dancing Edge'],
  {
  })

  sets.precast.WS['Dancing Edge'].AtkAcc = set_combine(sets.precast.WS['Dancing Edge'].Atk,
  {
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
      }
    
  sets.precast.WS['Mercy Stroke'].Atk = set_combine(sets.precast.WS['Mercy Stroke'],{})
                
  sets.precast.WS['Mercy Stroke'].Acc = set_combine(sets.precast.WS['Mercy Stroke'],
  {
  })

  sets.precast.WS['Mercy Stroke'].AtkAcc = set_combine(sets.precast.WS['Mercy Stroke'].Atk,
  {
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
})
  
  sets.precast.WS['Mandalic Stab'].Atk = set_combine(sets.precast.WS['Mandalic Stab'],{})  
  
  sets.precast.WS['Mandalic Stab'].Acc = set_combine(sets.precast.WS['Mandalic Stab'],
  {
  })

  sets.precast.WS['Mandalic Stab'].AtkAcc = set_combine(sets.precast.WS['Mandalic Stab'],
  {
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
})
    
  sets.precast.WS['Shark Bite'].Atk = set_combine(sets.precast.WS['Shark Bite'],{}) 
  
  sets.precast.WS['Shark Bite'].Acc = set_combine(sets.precast.WS['Shark Bite'], 
  {
  })
  
  sets.precast.WS['Shark Bite'].AtkAcc = set_combine(sets.precast.WS['Shark Bite'], 
  {

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
