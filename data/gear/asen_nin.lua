function init_gear_sets()
  
    windower.send_command('sta !packets on')
    
    -- misc.
    sets.INT = {
      hands="Garrison Gloves"
    }
       
    sets.enmityUp = {}
  
    sets.enmityDown = {}
  
    -- precast ja
  
    -- precast magic
    sets.precast.FC = {}
  
    -- midcast magic
    sets.midcast.FastRecast = set_combine(sets.precast.FC,
                                            {}) 
  
    sets.midcast['Utsusemi: Ni'] = set_combine(sets.midcast.FastRecast,
                                                {})
                  
    sets.midcast['Utsusemi: Ichi'] = set_combine(sets.midcast['Utsusemi: Ni'],
                                                {})
                   
    sets.midcast.NinjutsuDebuff = set_combine(sets.INT,
                                            {})
                   
    sets.midcast.ElementalNinjutsu = set_combine(sets.midcast.NinjutsuDebuff,
                                                {})
  
    -- idle
    sets.idle= {
      main="Shinobi-Gatana",
    sub="Shinobi-Gatana",
    head="Empress Hairpin",
    body="Bone Harness",
    hands="Bone Mittens +1",
    legs="Brass Subligar",
    feet="Bounding Boots",
    neck="Justice Badge",
    left_ear="Cassie Earring",
    left_ring="Warp Ring",
    right_ring="Courage Ring",
    back="Traveler's Mantle",
                }
  
    sets.idle.Town = set_combine(sets.idle,
                                {
                                    ring2="Warp ring",
                                    back="Nexus cape"
                                })
  
    -- defense
    sets.defense.Evasion = {}
       
    sets.defense.PDT = {}
  
    sets.defense.MDT = {}
  
    -- engaged
    sets.engaged = {
      main="Shinobi-Gatana",
    sub="Shinobi-Gatana",
    head="Empress Hairpin",
    body="Bone Harness",
    hands="Bone Mittens +1",
    legs="Brass Subligar",
    feet="Bounding Boots",
    neck="Justice Badge",
    left_ear="Cassie Earring",
    left_ring="Courage Ring",
    right_ring="Courage Ring",
    back="Traveler's Mantle",
                    }
       
    sets.engaged.HybridAcc = set_combine(sets.engaged,
                                        {})
                  
    sets.engaged.Acc = set_combine(sets.engaged.HybridAcc,
                                    {})
                   
    sets.engaged.Tank = set_combine(sets.engaged.Acc,
                                    {})
  
    -- ranged
    sets.precast.RA = {}
  
    sets.midcast.RA = set_combine(sets.precast.RA,
                                    {})

    sets.midcast.RA.HNM = set_combine(sets.midcast.HNM,
                                    {})
  
    --ws
    sets.precast.WS = {}
       
    sets.precast.WS.HNM = set_combine(sets.precast.WS,
                                        {})
  
    sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS,
                                                {})
                  
    sets.precast.WS['Blade: Jin'].HNM = set_combine(sets.precast.WS['Blade: Jin'],
                                                    {})
  
    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS['Blade: Jin'],
                                                {})
                  
    sets.precast.WS['Blade: Shun'].HNM = set_combine(sets.precast.WS['Blade: Jin'].HNM,
                                                    {})
  
    sets.precast.WS['Blade: Ku'] = set_combine(sets.precast.WS,
                                                {})
     
    sets.precast.WS['Blade: Ku'].HNM = set_combine(sets.precast.WS['Blade: Ku'],
                                                    {})
  
    sets.precast.WS['Blade: Metsu'] = set_combine(sets.precast.WS,
                                                    {})
                  
    sets.precast.WS['Blade: Metsu'].HNM = set_combine(sets.precast.WS['Blade: Metsu'],
                                                        {})
  
    sets.precast.WS['Blade: Kamu'] = set_combine(sets.precast.WS,
                                                {})
                   
    sets.precast.WS['Blade: Kamu'].HNM = set_combine(sets.precast.WS['Blade: Kamu'],
                                                    {})
  
  end
