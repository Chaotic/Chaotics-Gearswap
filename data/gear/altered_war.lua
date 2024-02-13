function init_gear_sets()

  windower.send_command('sta !packets off; wait 1; gs equip sets.idle')

   --Misc.
  sets.enmityUp = {}
     
  sets.enmityDown = {}

  --Precast JAs
  sets.precast.JA['Provoke'] = {}
  sets.precast.JA['Warcry'] = {}
  sets.precast.JA['Tomahawk'] = {}
   
  -- Waltz set (chr and vit)
  sets.precast.Waltz = {}
  sets.precast.WaltzSelf = set_combine(sets.precast.Waltz,{
      body="Savage Separates",
      neck="Bird Whistle",
      hands="Savage Gauntlets",
      legs="Savage Loincloth",
    })

  --Precast Magic
  sets.precast.FC = {}

  --Midcast Magic
  sets.midcast.FastRecast = set_combine(sets.precast.FC,{})
  sets.midcast['Utsusemi: Ni'] = set_combine(sets.midcast.FastRecast,{})
  sets.midcast['Utsusemi: Ichi'] = set_combine(sets.midcast['Utsusemi: Ni'],{})

  --Idle Sets
  sets.idle = {
    head="Empress Hairpin",
    body="Savage Separates",
    hands="Savage Gauntlets",
    legs="Beetle Subligar +1",
    feet="Bounding Boots",
    neck="Spike Necklace",
    left_ring="Balance Ring",
    right_ring="Rajas Ring",
    back="Nomad's Mantle +1",
  }
     
  sets.idle.Town = set_combine(sets.idle,{
    back="Nexus cape"
  })

  --Defense Sets
  sets.defense.PDT = {}
  sets.defense.MDT = {}

  -- default engaged
  sets.engaged = {
    head="Empress Hairpin",
    body="Savage Separates",
    hands="Savage Gauntlets",
    legs="Beetle Subligar +1",
    feet="Bounding Boots",
    neck="Spike Necklace",
    left_ring="Balance Ring",
    right_ring="Rajas Ring",
    back="Nomad's Mantle +1",
  }
     
  sets.engaged.Acc = set_combine(sets.engaged,{
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

  -- dual wield engaged
  sets.engaged.DW = set_combine(sets.engaged,{})
  sets.engaged.DW.Acc = set_combine(sets.engaged.DW,{})

  --Weaponskill Sets
  sets.precast.WS = {}
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

  ----Greatsword
  sets.precast.WS['Scourge'] = set_combine(sets.precast.WS,{})
  sets.precast.WS['Scourge'].Acc = set_combine(sets.precast.WS['Scourge'],{})

  sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{})
  sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS['Resolution'],{})
  initialize_crafting_sets(player.name)  
end
