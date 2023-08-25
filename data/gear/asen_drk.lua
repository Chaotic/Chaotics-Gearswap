function init_gear_sets()

    windower.send_command('sta !packets off; wait 1; gs equip sets.idle')
    --misc.
    sets.INT = {}
  
    sets.enmityUp = {}
       
    sets.enmityDown = {}
  
    --precast ja
    sets.precast.JA['Last Resort'] = {}
     
    sets.precast.JA['Arcane Circle'] = {}
     
    sets.precast.JA['Weapon Bash'] = {}
  
    --precast magic
    sets.precast.FC = {}
  
    --midcast magic
    sets.midcast.FastRecast = set_combine(sets.precast.FC,{})
  
    sets.midcast['Utsusemi: Ni'] = set_combine(sets.midcast.FastRecast,{})
                   
    sets.midcast['Utsusemi: Ichi'] = set_combine(sets.midcast['Utsusemi: Ni'],{})
  
    sets.midcast['Dark Magic'] = set_combine(sets.INT,sets.midcast.FastRecast,{})
                   
    sets.midcast['Dark Magic'].Acc = set_combine(sets.midcast['Dark Magic'],{})
  
    sets.midcast['Elemental Magic'] = set_combine(sets.INT,{})
     
    sets.midcast['Elemental Magic'].Acc = set_combine(sets.midcast['Elemental Magic'],{})
  
    sets.midcast['Enfeebling Magic'] = set_combine(sets.INT,sets.midcast.FastRecast,{})
                   
    sets.midcast['Enfeebling Magic'].Acc = set_combine(sets.midcast['Enfeebling Magic'],{})
  
    sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'].Acc,{})
                   
    sets.midcast.Sleep = set_combine(sets.midcast['Enfeebling Magic'].Acc,{})
  
    sets.midcast['Stun'] = set_combine(sets.midcast['Dark Magic'].Acc,{})
                   
    sets.midcast['Dread Spikes'] = set_combine(sets.midcast.FastRecast,{})
  
    --idle
    sets.idle = {
        main="Brz. Zaghnal +1",
        range="Shortbow",
        ammo="Wooden Arrow",
        head="Brass Cap",
        body="Chocobo Shirt",
        hands="Brass Mittens",
        legs="Brass Subligar",
        feet="Bounding Boots",
        neck="Justice Badge",
        right_ear="Cassie Earring",
        left_ring="San d'Orian Ring",
        right_ring="Anniversary Ring",
        back="Traveler's Mantle",
    }
       
    sets.idle.Town = set_combine(sets.idle,{})

    sets.resting = {}
  
    --defense
    sets.defense.PDT = {}
       
    sets.defense.MDT = {}
  
    --default engaged
    sets.engaged = {
        main="Brz. Zaghnal +1",
        range="Shortbow",
        ammo="Wooden Arrow",
        head="Brass Cap",
        body="Chocobo Shirt",
        hands="Brass Mittens",
        legs="Brass Subligar",
        feet="Bounding Boots",
        neck="Justice Badge",
        right_ear="Cassie Earring",
        left_ring="San d'Orian Ring",
        right_ring="Anniversary Ring",
        back="Traveler's Mantle",
    }
       
    sets.engaged.HybridAcc = set_combine(sets.engaged,{})
                  
    sets.engaged.Tank = set_combine(sets.engaged.HybridAcc,{})
  
    --apoc engaged ROSE STRAP
    sets.engaged.Apocalypse = {}
       
    sets.engaged.Apocalypse.HybridAcc = set_combine(sets.engaged.Apocalypse,{})
                   
    sets.engaged.Apocalypse.Tank = set_combine(sets.engaged.Apocalypse.HybridAcc,{})
  
    --apoc engaged (sam) ROSE STRAP
    sets.engaged.Apocalypse.SAM = {}
       
    sets.engaged.Apocalypse.HybridAcc.SAM = set_combine(sets.engaged.Apocalypse.SAM,{})
                   
    sets.engaged.Apocalypse.Tank.SAM = set_combine(sets.engaged.Apocalypse.HybridAcc.SAM,{})
  
    --rag engaged (no sam) ROSE STRAP
    sets.engaged.Ragnarok = {}
       
    sets.engaged.Ragnarok.HybridAcc = set_combine(sets.engaged.Ragnarok,{})
  
    --rag engaged (sam)
    sets.engaged.Ragnarok.SAM = {}
       
    sets.engaged.Ragnarok.HybridAcc.SAM = set_combine(sets.engaged.Ragnarok,{})
  
    --zerg engaged
    sets.engaged.Zerg = {}
    
    --[[
      * ATS - attack/str
      * ACC - accuracy
      * MOD - modifiers
    ]]
    
    --no MOD sets for default set
    sets.precast.WS = {}
       
    sets.precast.WS.ACC = set_combine(sets.precast.WS,{})
                    
    sets.precast.WS.ATSACC = set_combine(sets.precast.WS,{})
       
     --Scythe specific
     --[[Guillotine (ERA)
         MODS: 25% STR, 25% MND
         HITS: 4
         xATT: 1.0 ]]
    sets.precast.WS['Guillotine'] = set_combine(sets.precast.WS,{})
                  
    sets.precast.WS['Guillotine'].MOD = set_combine(sets.precast.WS['Guillotine'],{})
                  
    sets.precast.WS['Guillotine'].ACC = set_combine(sets.precast.WS.Acc,{})
                  
    sets.precast.WS['Guillotine'].ATSMOD = set_combine(sets.precast.WS['Guillotine'],{})
                  
    sets.precast.WS['Guillotine'].ATSACC = set_combine(sets.precast.WS['Guillotine'],{})
                  
    sets.precast.WS['Guillotine'].MODACC = set_combine(sets.precast.WS['Guillotine'].MOD,{})
                   
     --[[Entropy (ERA)
         MODS: 25% STR, 25% DEX
         HITS: 4
         xATT: 1.0 ]]
    sets.precast.WS['Entropy'] = set_combine(sets.precast.WS['Guillotine'],{})
    
    sets.precast.WS['Entropy'].MOD = set_combine(sets.precast.WS['Guillotine'].MOD,{})
    
    sets.precast.WS['Entropy'].ACC = set_combine(sets.precast.WS['Guillotine'].ACC,{})
    
    sets.precast.WS['Entropy'].ATSMOD = set_combine(sets.precast.WS['Guillotine'].ATSMOD,{})
    
    sets.precast.WS['Entropy'].ATSACC = set_combine(sets.precast.WS['Guillotine'].ATSACC,{})
    
    sets.precast.WS['Entropy'].MODACC = set_combine(sets.precast.WS['Guillotine'].MODACC,{})
                   
     --[[Catastrophe (ERA)
         MODS: 40% AGI, 40% INT
         HITS: 1
         xATT: 1.0 ]]
    sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS,{}) 
                   
    sets.precast.WS['Catastrophe'].MOD = set_combine(sets.precast.WS,{}) 
    
    sets.precast.WS['Catastrophe'].ACC = set_combine(sets.precast.WS.ACC,{})
    
    sets.precast.WS['Catastrophe'].ATSMOD = set_combine(sets.precast.WS['Catastrophe'].MOD,{})
    
    sets.precast.WS['Catastrophe'].ATSACC = set_combine(sets.precast.WS.ATSACC,{})
    
    sets.precast.WS['Catastrophe'].MODACC = set_combine(sets.precast.WS['Catastrophe'].ACC,{})
                  
    --Greatsword specific
    --[[Resolution (ERA)
        MODS: 30% STR, 30% INT
        HITS: 1
        xATT: 1.5 ]]
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{})  
                  
    sets.precast.WS['Resolution'].MOD = set_combine(sets.precast.WS,{})  
                  
    sets.precast.WS['Resolution'].ACC = set_combine(sets.precast.WS.ACC,{})  
                  
    sets.precast.WS['Resolution'].ATSMOD = set_combine(sets.precast.WS,{})  
                  
    sets.precast.WS['Resolution'].ATSACC = set_combine(sets.precast.WS,{})  
                  
    sets.precast.WS['Resolution'].MODACC = set_combine(sets.precast.WS,{})  
                  
    --[[Ground Strike (ERA)
        MODS: 50% STR, 50% INT
        HITS: 1
        xATT: 1.75 ]]
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})  
                  
    sets.precast.WS['Ground Strike'].MOD = set_combine(sets.precast.WS,{})  
                  
    sets.precast.WS['Ground Strike'].ACC = set_combine(sets.precast.WS,{})  
                  
    sets.precast.WS['Ground Strike'].ATSMOD = set_combine(sets.precast.WS,{})  
                  
    sets.precast.WS['Ground Strike'].ATSACC = set_combine(sets.precast.WS,{})  
                  
    sets.precast.WS['Ground Strike'].MODACC = set_combine(sets.precast.WS,{})  
                  
    --[[Scourge (ERA)
        MODS: 40% MND, 40% CHR
        HITS: 1
        xATT: 1.0 ]]
    sets.precast.WS['Scourge'] = set_combine(sets.precast.WS,{})  
                  
    sets.precast.WS['Scourge'].MOD = set_combine(sets.precast.WS,{})  
                  
    sets.precast.WS['Scourge'].ACC = set_combine(sets.precast.WS.ACC,{})  
                  
    sets.precast.WS['Scourge'].ATSMOD = set_combine(sets.precast.WS,{})  
                  
    sets.precast.WS['Scourge'].ATSACC = set_combine(sets.precast.WS,{})  
                  
    sets.precast.WS['Scourge'].MODACC = set_combine(sets.precast.WS,{})

    initialize_crafting_sets(player.name)        
  end
  