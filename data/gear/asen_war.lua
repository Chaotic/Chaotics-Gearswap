function init_gear_sets()

    windower.send_command('sta !packets off; wait 1; gs equip sets.idle')

   --Misc.
  sets.enmityUp = {
    head="Fighter's Mask",
    body="Fighter's Lorica",
    hands="Fighter's Mufflers",
    legs="Fighter's Cuisses",
    feet="Fighter's Calligae",
    back="Cerberus Mantle",
    right_ring="Hercules' Ring",
    left_ring="Sattva Ring",
  }
     
  sets.enmityDown = {}

  --Precast JAs
  sets.precast.JA['Provoke'] = set_combine(sets.enmityUp,{})
  sets.precast.JA['Warcry'] = {
    head="Warrior's Mask",
  }
  sets.precast.JA['Tomahawk'] = {}
   
  -- Waltz set (chr and vit)
  sets.precast.Waltz = {
    head="Noble's Ribbon",
    neck="Bird Whistle",
    body="Savage Separates",
    left_ring="Opal Ring",
    right_ring="Opal Ring",
    waist="Corsette +1",
  }

  sets.precast.WaltzSelf = set_combine(sets.enmityUp,sets.precast.Waltz,{
    legs="Savage Loincloth",
    left_ear="Knight's earring",
    right_ear="Cassie Earring",
  })

  --Precast Magic
  sets.precast.FC = {
    left_ear="Loquac. Earring",
  }

  --Midcast Magic
  sets.midcast.FastRecast = set_combine(sets.precast.FC,{
    head="Walahra Turban",
    waist="Velocious Belt",
    hands="Dusk Gloves",
    feet="Dusk Ledelsens",
  })

  sets.midcast['Utsusemi: Ni'] = set_combine(sets.midcast.FastRecast,{
    waist="Velocious Belt",
  })

  sets.midcast['Utsusemi: Ichi'] = set_combine(sets.midcast['Utsusemi: Ni'],{})

  --Idle Sets
  sets.idle = {
    ammo="Bibiki Seashell",
    head="Walahra Turban",
    neck="Peacock Amulet",
    left_ear="Velocity Earring",
    right_ear="Brutal Earring",
    body="Haubergeon +1",
    hands="Ryl.Sqr. Mufflers",
    left_ring="Dasra's Ring",
    right_ring="Nasatya's Ring",
    back="Traveler's mantle",
    waist="Velocious Belt",
    legs="Fighter's Cuisses",
    feet="Fighter's Calligae",
  }
     
  sets.idle.Town = set_combine(sets.idle,{
    back="Nexus cape"
  })

  --Defense Sets
  sets.defense.PDT = {}
     
  sets.defense.MDT = {}


  -- default engaged
  sets.engaged = {
    ammo="Bibiki Seashell",
    head="Walahra Turban",
    neck="Peacock amulet",
    left_ear="Velocity Earring",
    right_ear="Brutal Earring",
    body="Haubergeon +1",
    hands="Dusk Gloves",
    left_ring="Sniper's Ring",
    right_ring="Rajas Ring",
    back="Cerberus Mantle",
    waist="Velocious Belt",
    legs="Fighter's Cuisses",
    feet="Dusk Ledelsens",
  }
     
  sets.engaged.Acc = set_combine(sets.engaged,{
    hands="Ryl.Sqr. Mufflers",
    legs="Fighter's Cuisses",
    neck="Peacock amulet",
    body="Haubergeon +1",
    waist="Life Belt",
    left_ring="Lava's Ring",
    right_ring="Kusha's Ring",
    right_ear="Brutal Earring",
  })
  -- dual wield engaged
	sets.engaged.DW	= set_combine(sets.engaged,{
    left_ear="Suppanomimi",
  })
	sets.engaged.AccDW = set_combine(sets.engaged.Acc,sets.engaged.DW,{
  })
  -- bravura engaged (normal) [[Rose strap]]
  sets.engaged.Bravura = set_combine(sets.engaged,{})
  sets.engaged.Bravura.Acc = set_combine(sets.engaged.Bravura,{})

  -- bravura engaged (SAM) [[Rose strap]]
  sets.engaged.Bravura.SAM = set_combine(sets.engaged,{})
  sets.engaged.Bravura.SAM.Acc = set_combine(sets.engaged.Bravura.SAM,{})

  -- ragnarok engaged [[Rose strap]]
  sets.engaged.Ragnarok = {}
  sets.engaged.Ragnarok.Acc = set_combine(sets.engaged.Ragnarok,{})

  -- ragnarok engaged (SAM)
  sets.engaged.Ragnarok.SAM = {}
  sets.engaged.Ragnarok.SAM.Acc = set_combine(sets.engaged.Ragnarok.SAM,{})



  --Weaponskill Sets
  sets.precast.WS = {
    left_ring="Courage Ring",
    right_ring="Rajas Ring",
    neck="Spike Necklace",
    body="Haubergeon +1",
    hands="Pallas's Bracelets",
    feet="Savage Gaiters",
    waist="Barbarian's Belt",
    back="Cerberus Mantle",
  }
     
  sets.precast.WS.Acc = set_combine(sets.precast.WS,{})

  ----Sword
  sets.precast.WS['Vorpal Blade'] = set_combine(sets.precast.WS,{})
  sets.precast.WS['Vorpal Blade'].Acc = set_combine(sets.precast.WS['Vorpal Blade'],{})
  sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS['Vorpal Blade'],{})
  sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS['Vorpal Blade'].Acc,{})

  ----Sword MS
  sets.precast.WS['Vorpal Blade'].MS = set_combine(sets.precast.WS['Vorpal Blade'],{})
  sets.precast.WS['Vorpal Blade'].Acc.MS = set_combine(sets.precast.WS['Vorpal Blade'].MS,{})
  sets.precast.WS['Requiescat'].MS = set_combine(sets.precast.WS['Vorpal Blade'].MS,{})
  sets.precast.WS['Requiescat'].Acc.MS = set_combine(sets.precast.WS['Vorpal Blade'].Acc.MS,{})

  ----Great Axe
  sets.precast.WS['Raging Rush'] = set_combine(sets.precast.WS,{})
  sets.precast.WS['Raging Rush'].Acc = set_combine(sets.precast.WS['Raging Rush'],{})
  sets.precast.WS['Upheaval'] = set_combine(sets.precast.WS['Raging Rush'],{})
  sets.precast.WS['Upheaval'].Acc = set_combine(sets.precast.WS['Raging Rush'].Acc,{})
  sets.precast.WS['Metatron Torment'] = set_combine(sets.precast.WS,{})
  sets.precast.WS['Metatron Torment'].Acc = set_combine(sets.precast.WS['Metatron Torment'],{})
  sets.precast.WS['Steel Cyclone'] = set_combine(sets.precast.WS,{})
  sets.precast.WS['Steel Cyclone'].Acc = set_combine(sets.precast.WS['Steel Cyclone'],{})

  ----Great Axe MS
  sets.precast.WS['Raging Rush'].MS = set_combine(sets.precast.WS['Raging Rush'],{})
  sets.precast.WS['Raging Rush'].Acc.MS = set_combine(sets.precast.WS['Raging Rush'].MS,{})
  sets.precast.WS['Upheaval'].MS  = set_combine(sets.precast.WS['Raging Rush'].MS,{})
  sets.precast.WS['Upheaval'].Acc.MS= set_combine(sets.precast.WS['Raging Rush'].Acc.MS,{})

  ----Axe
  sets.precast.WS['Rampage'] = set_combine(sets.precast.WS,{})
  sets.precast.WS['Rampage'].Acc = set_combine(sets.precast.WS['Rampage'],{})
  sets.precast.WS['Calamity'] = set_combine(sets.precast.WS,{})
  sets.precast.WS['Calamity'].Acc = set_combine(sets.precast.WS['Calamity'],{})
  sets.precast.WS['Mistral Axe'] = set_combine(sets.precast.WS,{})
  sets.precast.WS['Mistral Axe'].Acc = set_combine(sets.precast.WS['Mistral Axe'],{})
  sets.precast.WS['Decimation'] = set_combine(sets.precast.WS,{})
  sets.precast.WS['Decimation'].Acc = set_combine(sets.precast.WS['Decimation'],{})
  sets.precast.WS['Onslaught'] = set_combine(sets.precast.WS,{})
  sets.precast.WS['Onslaught'].Acc = set_combine(sets.precast.WS['Onslaught'],{})
  sets.precast.WS['Primal Rend'] = set_combine(sets.precast.WS,{})
  sets.precast.WS['Primal Rend'].Acc = set_combine(sets.precast.WS['RampPrimal Rendage'],{})

  ----Axe MS
  sets.precast.WS['Rampage'].MS = set_combine(sets.precast.WS['Rampage'],{})
  sets.precast.WS['Rampage'].Acc.MS = set_combine(sets.precast.WS['Rampage'].MS,{})
  sets.precast.WS['Calamity'] = set_combine(sets.precast.WS['Calamity'],{})
  sets.precast.WS['Calamity'].Acc = set_combine(sets.precast.WS['Calamity'].MS,{})
  sets.precast.WS['Mistral Axe'] = set_combine(sets.precast.WS['Mistral Axe'],{})
  sets.precast.WS['Mistral Axe'].Acc = set_combine(sets.precast.WS['Mistral Axe'].MS,{})
  sets.precast.WS['Decimation'] = set_combine(sets.precast.WS['Decimation'],{})
  sets.precast.WS['Decimation'].Acc = set_combine(sets.precast.WS['Decimation'].MS,{})
  sets.precast.WS['Onslaught'] = set_combine(sets.precast.WS['Onslaught'],{})
  sets.precast.WS['Onslaught'].Acc = set_combine(sets.precast.WS['Onslaught'].MS,{})
  sets.precast.WS['Primal Rend'] = set_combine(sets.precast.WS['Primal Rend'],{})
  sets.precast.WS['Primal Rend'].Acc = set_combine(sets.precast.WS['Primal Rend'].MS,{})

  ----Greatsword
  sets.precast.WS['Scourge'] = set_combine(sets.precast.WS,{})
  sets.precast.WS['Scourge'].Acc = set_combine(sets.precast.WS['Scourge'],{})
  sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{})
  sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'],{})
  initialize_crafting_sets(player.name)
end
