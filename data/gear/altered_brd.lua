-- Define sets and vars used by this job file.
function init_gear_sets()

    windower.send_command('sta !packets off; wait 1; gs equip sets.idle')
  -- misc
  sets.MND = {
  }

  sets.INT = {}

  sets.CHR = {
  }
  
  sets.Singing = {}
  sets.Wind = set_combine(sets.Singing,{})
  sets.String = set_combine(sets.Singing,{})
--  These will be filled in as I get instruments / spells
sets.midcast['Minne'] = set_combine(sets.midcast.FastRecast,sets.String,sets.CHR,{
})
sets.midcast['Requiem'] = set_combine(sets.midcast.FastRecast,sets.Wind,sets.CHR,{
})
sets.midcast['Threnody'] = set_combine(sets.midcast.FastRecast,sets.Wind,sets.CHR,{
})
sets.midcast['Minuet'] = set_combine(sets.midcast.FastRecast,sets.Wind,sets.CHR,{
})
sets.midcast['Lullaby'] = set_combine(sets.midcast.FastRecast,sets.Wind,sets.CHR,{
})
sets.midcast['March'] = set_combine(sets.midcast.FastRecast,sets.Wind,sets.CHR,{
})
sets.midcast['Mambo'] = set_combine(sets.midcast.FastRecast,sets.Wind,sets.CHR,{
})
sets.midcast['Madrigal'] = sets.midcast['March']
sets.midcast['Prelude'] = sets.midcast['March']
sets.midcast['Etude'] = sets.midcast['March']
sets.midcast['Ballad'] = sets.midcast['March']
sets.midcast['Paeon'] = sets.midcast['Minne']
sets.midcast['Carol'] = sets.midcast['March']
sets.midcast['Elegy'] = sets.midcast['March']
--[[
sets.midcast['Madrigal'] = set_combine(sets.midcast.FastRecast,sets.Wind,sets.CHR,{
  range="Maple Harp +1",
})
sets.midcast['Prelude'] = set_combine(sets.midcast.FastRecast,sets.Wind,sets.CHR,{
  range="Maple Harp +1",
})
sets.midcast['Etude'] = set_combine(sets.midcast.FastRecast,sets.Wind,sets.CHR,{
  range="Maple Harp +1",
})
sets.midcast['Ballad'] = set_combine(sets.midcast.FastRecast,sets.Wind,sets.CHR,{
  range="Maple Harp +1",
})
sets.midcast['Paeon'] = set_combine(sets.midcast.FastRecast,sets.Wind,sets.CHR,{
  range="Maple Harp +1",
})
sets.midcast['Carol'] = set_combine(sets.midcast.FastRecast,sets.Wind,sets.CHR,{
  range="Maple Harp +1",
})
sets.midcast['Elegy'] = set_combine(sets.midcast.FastRecast,sets.Wind,sets.CHR,{
  range="Maple Harp +1",
})
]]

  -- idle
  sets.idle = {
  }
     
  sets.idle.Town = set_combine(sets.idle,
                    {

                    })

  sets.resting = {}

  -- precast magic
  sets.precast.FC = {}

  sets.precast.FC['BardSong'] = set_combine(sets.precast.FC,{})

  -- midcast magic
  sets.midcast.FastRecast = set_combine(sets.precast.FC,{})
                 
  sets.midcast['Utsusemi: Ni'] = set_combine(sets.midcast.FastRecast,{})
   
  sets.midcast['Utsusemi: Ichi'] = set_combine(sets.midcast['Utsusemi: Ni'],{})
  
                                                     
  sets.midcast['Healing Magic'] = set_combine(sets.MND,sets.midcast.FastRecast,{})
                                                     
  sets.midcast['Divine Magic'] = set_combine(sets.MND,{})
                 
  sets.midcast['Divine Magic'].Acc = set_combine(sets.midcast['Divine Magic'],{})
                                                     
  sets.midcast['Enfeebling Magic'] = {}
                                                     
  sets.midcast['Enfeebling Magic']['BlackMagic'] = set_combine(sets.INT,{})
   
  sets.midcast['Enfeebling Magic']['BlackMagic'].Acc = set_combine(sets.midcast['Enfeebling Magic']['BlackMagic'],sets.midcast['Enfeebling Magic'],{})
  
  sets.midcast['Enfeebling Magic']['WhiteMagic'] = set_combine(sets.MND,{})
   
  sets.midcast['Enfeebling Magic']['WhiteMagic'].Acc = set_combine(sets.midcast['Enfeebling Magic']['WhiteMagic'],sets.midcast['Enfeebling Magic'],{})
  
  sets.midcast['Elemental Magic'] = set_combine(sets.INT,{})
   
  sets.midcast['Elemental Magic'].Acc = set_combine(sets.midcast['Elemental Magic'],{})
                                                     
  sets.midcast['Dark Magic'] = set_combine(sets.INT,{})
                 
  sets.midcast['Dark Magic'].Acc = set_combine(sets.midcast['Dark Magic'],{})
                                                     
  sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{})
                                                     
  -- custom midcast magic                            
  sets.midcast['Stoneskin'] = set_combine(sets.MND,{})
                 
  sets.midcast.Cure = set_combine(sets.midcast['Healing Magic'],{})
                 
  sets.midcast.Curaga = set_combine(sets.midcast.Cure,{})

  sets.midcast['Cursna'] = set_combine(sets.midcast['Healing Magic'],{})
                 
  -- bard songs
  sets.midcast['BardSong'] = set_combine(sets.midcast.FastRecast,sets.CHR,{})
                 
  sets.midcast.BardDebuff = set_combine(sets.CHR,{})

  -- Defense sets
  sets.defense.PDT = {}
     
  sets.defense.MDT = {}

  -- Engaged sets
  sets.engaged = {}

  -- WS sets
  sets.precast.WS = {}
   
  sets.precast.WS.Acc = set_combine(sets.precast.WS,{})

  initialize_crafting_sets(player.name)
end