# Chaotics-Gearswap
My Gearswap files based off others.
This makes use of my modified Motes Library that can be found at https://github.com/Chaotic/Mote-libs

I'm not going to be reincluding those files here however.
These were also based of Kayrah's Gearswap files.  I've included the Kay-Include file but it isn't used (I've copied the functions and changed them to Chaotic-include)

# Changes from the offical Motes
Support for Level syncing.
Support for the Elemental Grips

# Other interesting functions
    Some of these were copied from Kay-include or other files

Era speficic functions (These are located in the Era-Utilities.lua file)
Better Summon Pact handling (From Kay's include)
Automatic elemental selection for Elemental siphon (will select the best one cast siphon and release then recast if you had an avatar out.)
Automatic selection of the best Helix spell (Based off the Siphon code)
Ability to set a crafting mode to automatically equip your crafting gear.
Better Scholar handling (1 command for both light/dark arts)



# How Level Sync support works
This requires some explaining.

First you need to set a state variable in the user_setup of the job file like this

> state.LevelCap:options('Normal','30','40','50')

For instance this will allow you to set gear sets for 30, 40, 50, and uncapped.

The gear sets themselves should look something like this
>   sets.idle['30'] = {
>    main="Elm Staff +1",
>    sub="Lizard Strap",
>    head="Seer's Crown +1",
>    body="Seer's Tunic +1",
>    hands="Seer's Mitts +1",
>    legs="Seer's Slacks +1",
>    feet="Seer's Pumps +1",
>    neck="Justice Badge",
>    left_ear="Morion Earring",
>    right_ear="Morion Earring",
>    left_ring="Warp Ring",
>    right_ring="Eremite's Ring",
>  }

Then you need to add code to the 
> function job_buff_change(buff, gain)

To handle the following buffs 
> buff == 'Level Restriction' or buff == 'Level Sync' or buff == 'Battlefield' 

(I have a function called handle_standard_buffs in chaotic-include that handles these and calls handle_level_sync)
I've left the handle_level_sync function in the individual job files so each job can decide which level sets they want.

The handle_level_sync should look like this
> function handle_level_sync(gain)
>   if gain then
>     if player.main_job_level>59 then
>       send_command('gs c set LevelCap Normal')
>     elseif player.main_job_level>49 then
>       send_command('gs c set LevelCap 50')
>     elseif player.main_job_level>39 then
>       send_command('gs c set LevelCap 40')
>     elseif player.main_job_level>29 then
>       send_command('gs c set LevelCap 30')
>       end
>   else
>     send_command('gs c set LevelCap Normal')
>   end
> end

There is one final function to look at check_buffs_on_load in chaotic-include.  This function checks the buffs that are active for if you reload your gearswap or sign in already under the effects of level sync (It kept coming up when I was testing ;-) )