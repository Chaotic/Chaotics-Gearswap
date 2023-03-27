function init_gear_sets()
  
  windower.send_command('sta !packets on')
  
  -- misc
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
                                          {})

  sets.midcast['Utsusemi: Ni'] = set_combine(sets.midcast.FastRecast,
                                              {})

  sets.midcast['Utsusemi: Ichi'] = set_combine(sets.midcast['Utsusemi: Ni'],
                                              {})

  -- idle
  sets.idle = {
    range="Rogetsurin",
    head="Empress Hairpin",
    body="Rapparee Harness",
    hands="Guerilla Gloves",
    legs="Beetle Subligar +1",
    feet="Bounding Boots",
    neck="Peacock Amulet",
    waist={ name="Velocious Belt", augments={'STR+3','Water resistance+20','Water resistance+30',}},
    left_ring="Warp Ring",
    right_ring="Balance Ring",
    back="Nomad's Mantle +1",
          }

  sets.idle.Town = set_combine(sets.idle,
                              {
                                  back="Nexus cape"
                              })

  -- defense
  sets.defense.Evasion = {}

  sets.defense.PDT = {}

  sets.defense.MDT = {}

  -- engaged
  sets.engaged = {
                      range="Rogetsurin",
                      head="Empress Hairpin",
                      body="Rapparee Harness",
                      legs="Beetle Subligar +1",
                      feet="Bounding Boots",
                      neck="Peacock Amulet",
                      waist={ name="Velocious Belt", augments={'STR+3','Water resistance+20','Water resistance+30',}},
                      left_ring="Balance Ring",
                      right_ring="Balance Ring",
                      back="Traveler's Mantle",
                    }

  sets.engaged.HybridAcc = set_combine(sets.engaged,
                                      {})

  sets.engaged.OffTank = set_combine(sets.engaged.HybridAcc,
                                      {})

  sets.engaged.Tank = set_combine(sets.engaged.OffTank,
                                  {})

  -- ws base
  sets.precast.WS = {}
     
  sets.precast.WS.HybridAcc = set_combine(sets.precast.WS,
                                          {})
  
  sets.precast.WS.Acc = set_combine(sets.precast.WS.HybridAcc,
                                  {})
  
  -- evisceration                 
  sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS,
                                                  {}) 
  
  sets.precast.WS['Evisceration'].HybridAcc = set_combine(sets.precast.WS.HybridAcc,
                                                          {}) 
  
  sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc,
                                                  {}) 
  
  sets.precast.WS['Evisceration'].Mod = set_combine(sets.precast.WS['Evisceration'],
                                                  {}) 
                 
  -- dancing edge / exenterator
  sets.precast.WS['Dancing Edge'] = set_combine(sets.precast.WS,
                                                  {})
                
  sets.precast.WS['Dancing Edge'].HybridAcc = set_combine(sets.precast.WS.HybridAcc,
                                                          {})
                
  sets.precast.WS['Dancing Edge'].Acc = set_combine(sets.precast.WS.Acc,
                                                  {})
                
  sets.precast.WS['Dancing Edge'].Mod = set_combine(sets.precast.WS['Dancing Edge'],
                                                      {})
                 
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
  initialize_crafting_sets(player.name)                        
end