function init_gear_sets()
  
  windower.send_command('sta !packets off; wait 1; gs equip sets.idle')

  -- misc
  sets.MND = {
                head="Garrison Sallet",
                body="Errant Hpl.",
                hands="Seer's Mitts +1",
                legs="Errant Slops",
                feet="Seer's Pumps +1",
                neck="Justice Badge",
              }

  sets.INT = {
                head="Seer's Crown +1",
                body="Errant Hpl.",
                hands="Seer's Mitts +1",
                legs="Errant Slops",
                            }
  
  sets.grip                        
   = {Fire      = {sub="Fire Grip"}
     ,Earth     = {sub="Earth Grip"}
     ,Water     = {sub="Water Grip"}
     ,Wind      = {sub="Wind Grip"}
     ,Ice       = {sub="Ice Grip"}
     ,Lightning = {sub="Thunder Grip"}
     ,Light     = {sub="Light Grip"}
     ,Dark      = {sub="Dark Grip"}}
     
  sets.enmityUp = {}
     
  sets.enmityDown = {}

  -- precast JA
  sets.precast.JA['Elemental Siphon'] = {
    head="Evoker's Horn",
    waist="Summoning Belt",
    left_ring="Evoker's Ring",
  }

  -- bp precast
  sets.precast.BloodPactWard = set_combine(sets.precast.JA['Elemental Siphon'],{
    body="Yinyang Robe",
  })
                 
  sets.precast.BloodPactRage = set_combine(sets.precast.BloodPactWard,{})

  -- Fast cast sets for spells
  sets.precast.FC = {}
     
  sets.midcast.FastRecast = set_combine(sets.precast.FC,{
    waist="Velocious Belt",
  })

  -- midcast magic
  sets.midcast['Healing Magic'] = set_combine(sets.MND,sets.midcast.FastRecast,{})
                 
  sets.midcast['Divine Magic'] = set_combine(sets.MND,{})
                
  sets.midcast['Divine Magic'].Acc = set_combine(sets.midcast['Divine Magic'],{})

  sets.midcast['Enfeebling Magic'] = {}
     
  sets.midcast['Enfeebling Magic']['BlackMagic'] = set_combine(sets.INT,{})
                
  sets.midcast['Enfeebling Magic']['BlackMagic'].Acc = set_combine(sets.midcast['Enfeebling Magic']['BlackMagic'],sets.midcast['Enfeebling Magic'],{})
                              
  sets.midcast['Enfeebling Magic']['WhiteMagic'] = set_combine(sets.MND,{})
                              
  sets.midcast['Enfeebling Magic']['WhiteMagic'].Acc = set_combine(sets.MND,sets.midcast['Enfeebling Magic'],{})

  sets.midcast['Elemental Magic'] = set_combine(sets.INT,{})
                 
  sets.midcast['Elemental Magic'].Acc = set_combine(sets.midcast['Elemental Magic'],{})

  sets.midcast['Dark Magic'] = set_combine(sets.midcast.FastRecast,{})


  sets.midcast['Dark Magic'].Acc = set_combine(sets.INT,{})
                 
  -- custom midcast magic                            
  sets.midcast['Stoneskin'] = set_combine(sets.midcast.FastRecast,sets.MND,{})
                 
  sets.midcast['Phalanx'] = set_combine(sets.midcast.FastRecast,{})                 
                
  sets.midcast['Blink'] = set_combine(sets.midcast['Phalanx'],{})
                
  sets.midcast['Aquaveil'] = set_combine(sets.midcast['Phalanx'],{})
                 
  sets.midcast.Cure = set_combine(sets.midcast['Healing Magic'],{
    main="Iridal Staff",
  })
                 
  sets.midcast.Curaga = set_combine(sets.midcast.Cure,{})

  sets.midcast['Cursna'] = set_combine(sets.midcast['Healing Magic'],{})
                
  sets.midcast.Sleep = set_combine(sets.midcast.FastRecast,sets.INT,sets.midcast['Enfeebling Magic'],{})
                
  sets.midcast.EleEnfeebs = set_combine(sets.INT,{})
                
  sets.midcast.Spikes = set_combine(sets.INT,{})

  -- avatar pacts
  sets.midcast.Pet.BloodPactWard = set_combine(sets.precast.JA['Elemental Siphon'],{})
   
  sets.midcast.DebuffBloodPactWard = set_combine(sets.midcast.Pet.BloodPactWard,{})
   
  sets.midcast.PhysicalBloodPactRage = set_combine(sets.midcast.Pet.BloodPactWard,{})
   
  sets.midcast.MagicalBloodPactRage = set_combine(sets.midcast.Pet.BloodPactWard,{})


  -- Spirits cast magic spells, which can be identified in standard ways.
  sets.midcast.Pet.WhiteMagic = set_combine(sets.midcast.Pet.MagicalBloodPactRage,{})
   
  sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage,{})

  -- Resting sets
  sets.resting = {
    main=gear.Staff.HMP,
    body="Errant Hpl.",
    ammo="Bibiki Seashell",
    legs="Yigit Seraweels",
    left_ear="Antivenom Earring",
  }
  -- Idle sets
  sets.idle = {
    main=gear.Staff.PDT,
    ammo="Bibiki Seashell",
    head="Evoker's Horn",  
    body="Yinyang Robe",
    hands="Evoker's Bracers",
    legs="Evoker's Spats",
    feet="Evoker's Pigaches",
    neck="Justice Badge",
    waist="Summoning Belt",
    left_ear="Bloodbead Earring",
    right_ring="Vilma's Ring",
    left_ring="Evoker's Ring",
  }
     
  sets.idle.Avatar = set_combine(sets.idle,{
    left_ring="Evoker's Ring",
    legs="Evoker's Spats",
    feet="Evoker's Pigaches",
  })
                 
  sets.idle.Spirit = set_combine(sets.idle,{
    left_ring="Evoker's Ring",
    legs="Evoker's Spats",
    feet="Evoker's Pigaches",
  })
                 
  sets.idle.Town = set_combine(sets.idle,{
    head="Evoker's Horn",  
    body="Yinyang Robe",
    hands="Evoker's Bracers",
    legs="Evoker's Spats",
    feet="Evoker's Pigaches",
    left_ring="Evoker's Ring",
    back="Nexus cape"
  })

  -- Favor uses Caller's Horn instead of Convoker's Horn for refresh
  sets.idle.Avatar.Melee = set_combine(sets.idle.Avatar,{})

  sets.perp = {
                left_ring="Evoker's Ring",
              }
     
  sets.perp.Day = {}
   
  sets.perp.Weather = {}
   
  sets.perp.Carbuncle = {hands="Carbuncle mitts"}
   
  sets.perp.Garuda = {}
   
  sets.perp.Alexander = set_combine(sets.midcast.Pet.BloodPactWard,{})

  sets.perp.staff_and_grip = {main=gear.perp_staff}

  -- engaged
  sets.engaged = {
    main="Iridal Staff",
    ammo="Bibiki Seashell",
    head="Evoker's Horn",  
    body="Yinyang Robe",
    hands="Evoker's Bracers",
    legs="Evoker's Spats",
    feet="Evoker's Pigaches",
    neck="Justice Badge",
    waist="Summoning Belt",
    left_ear="Bloodbead Earring",
    right_ring="Vilma's Ring",
    left_ring="Evoker's Ring",
  }

  -- ws
  sets.precast.WS = set_combine(sets.INT,{})

    -- Level Sync Sets
          -- Idle sets
          sets.idle['30'] = {
            main="Elm Staff",
            sub="Lizard Strap",
            ammo="Bibiki Seashell",
            head="Seer's Crown +1",
            body="Seer's Tunic +1",
            hands="Seer's Mitts +1",
            legs="Seer's Slacks +1",
            feet="Seer's Pumps +1",
            neck="Justice Badge",
            left_ring="Warp Ring",
          }
          sets.idle['40'] = set_combine(sets.idle['30'],
          {
            right_ring="Vilma's Ring",
          })
          sets.idle['50'] = sets.idle['40']
          -- Resting sets
          sets.resting['30'] = {
            main="Pilgrim's Wand",
            body="Seer's Tunic +1",
          }
          sets.resting['40'] = sets.resting['30']
          sets.resting['50'] = sets.resting['40']
        -- engaged
        sets.engaged['30'] = {
          main="Elm Staff",
          head="Seer's Crown +1",
          body="Seer's Tunic +1",
          hands="Seer's Mitts +1",
          legs="Seer's Slacks +1",
          feet="Seer's Pumps +1",
          neck="Justice Badge",
        }
        sets.idle['30'].Avatar = set_combine(sets.idle['30'],{})
        sets.idle['30'].Spirit = set_combine(sets.idle['30'],{})
        sets.perp['30'] = {}
        sets.perp['30'].Day = {}
        sets.perp['30'].Weather = {}
        sets.perp['30'].Carbuncle = {hands="Carbuncle mitts"}
        sets.perp['30'].Garuda = {}
        sets.perp['30'].staff_and_grip = {}
        sets.idle['40'].Avatar = sets.idle['30'].Avatar
        sets.idle['40'].Spirit = sets.idle['30'].Spirit
        sets.perp['40'] = sets.perp['30']
        sets.perp['40'].Day = sets.perp['30'].Day
        sets.perp['40'].Weather = sets.perp['30'].Weather
        sets.perp['40'].Carbuncle = sets.perp['30'].Carbuncle
        sets.perp['40'].Garuda = sets.perp['30'].Garuda
        sets.perp['40'].staff_and_grip = sets.perp['30'].staff_and_grip
        sets.idle['50'].Avatar = sets.idle['40'].Avatar
        sets.idle['50'].Spirit = sets.idle['40'].Spirit
        sets.perp['50'] = sets.perp['40']
        sets.perp['50'].Day = sets.perp['40'].Day
        sets.perp['50'].Weather = sets.perp['40'].Weather
        sets.perp['50'].Carbuncle = sets.perp['40'].Carbuncle
        sets.perp['50'].Garuda = sets.perp['40'].Garuda
        sets.perp['50'].staff_and_grip = sets.perp['40'].staff_and_grip


  initialize_crafting_sets(player.name)

end
