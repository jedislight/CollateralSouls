show_debug_message("Simulation Object Create Starting");
grid_width = 60
grid_height = 40
light_grid = ds_grid_create(grid_width,grid_height)
darkvision_light_grid = ds_grid_create(grid_width,grid_height)
light_color_grid = ds_grid_create(grid_width,grid_height)
explored_grid = ds_grid_create(grid_width, grid_height)
clair_grid = ds_grid_create(grid_width, grid_height)
visibility_grid = ds_grid_create(grid_width, grid_height)
light_blocking_grid = ds_grid_create(grid_width, grid_height)
temp_grid = ds_grid_create(grid_width, grid_height);
temp_grid2 = ds_grid_create(grid_width, grid_height);
temp_grid3 = ds_grid_create(grid_width, grid_height);
temp_grid4 = ds_grid_create(grid_width, grid_height);
temp_list = ds_list_create();
temp_path = path_add();
temp_queue = ds_queue_create();
temp_queue2 = ds_queue_create();
temp_queue3 = ds_queue_create();
light_path_grid = mp_grid_create(0,0,grid_width,grid_height,1,1);
targeting = instance_create(0,0, Targeting);
menu_system = instance_create(0,0, Menu_System);
debug_grid_overlay = instance_create(0,0, Debug_Grid_Overlay);
music_mixer = instance_create(0,0, MusicMixer);
config = config_load();
soak_test = false;
soak_target = noone;
frame = 0;
last_player_turn_taken_time = 0;
if(instance_exists(config))
{
    //show_message(string(config.reals))
    var session_num = config.reals[? "session_num"];

    var reals_map = config.reals;
    if(ds_exists(reals_map, ds_type_map))
    {
        ds_map_replace(reals_map, "session_num", session_num + 1);
    }
}


config_save();

game_exiting = false;
ds_grid_clear(explored_grid, false);
ds_grid_clear(clair_grid, true);
ds_grid_clear(darkvision_light_grid, 1.0);
light_minimum = 0.20;
randomize()
resting = false
final_floor = 15;
lore_init();
analytics = noone //instance_create(0,0, Analytics); // TODO broke on gm2 upgrade
nemesis = instance_create(0,0, Nemesis);
nemesis_load();
score_keeper = instance_create(0,0, Score_Keeper);
renderer = instance_create(0,0, Renderer);
input_up = false;
input_down = false;
input_left = false;
input_right = false;
input_down_right= false;
input_down_left = false;
input_up_right=false;
input_up_left=false;
input_hold_up = 0;
input_hold_down = 0;
input_hold_left = 0;
input_hold_right = 0;
input_hold_down_right= 0;
input_hold_down_left = 0;
input_hold_up_right=0;
input_hold_up_left=0;
input_menu_confirm = false;
input_escape = false;
input_help = false;
input_wait = false;
input_target_cycle_backwards = false;
input_target_cycle = false;
input_ranged_attack = false;
input_character_sheet = false;
input_insightful_sheet = false;
boon = false;
curse = false;
last_turn = current_time;
last_xp_gain = 0;
floor_cleared_for_count = 0;

show_debug_message("Simulation Object Create Making State Grid");

//state grid - all trinary true, false, neither (1,0, noone)
//1 2 3
//4 5 6
// 1 == passable grid
// 2 == visible grid
// 3 == creature grid
// 4 == explored grid
// 5 == usable grid
// 6 == player state data
state_loop_back_pad = 500
state_grid = ds_grid_create(grid_width*3+state_loop_back_pad,grid_height*2);
ds_grid_clear(state_grid, noone);

state_grid_overlay = instance_create(0,0, State_Grid_Overlay);

map_left = 0;
map_right = grid_width;
map_top = 0;
map_bottom = grid_height;

show_debug_message("Simulation Object Create Populating Boons And Curses");

//boon list
boons = ds_list_create();
boon_index = 0;
boons[| boon_index++] = Boon_Full_Heal
boons[| boon_index++] = Boon_Critical_Health_Creatures
boons[| boon_index++] = Boon_Learning
boons[| boon_index++] = Boon_All_Seeing
boons[| boon_index++] = Boon_Pathfinder
boons[| boon_index++] = Boon_Flamebearer

curses = ds_list_create();
curse_index = 0;
curses[| curse_index++] = Curse_Critical_Health;
curses[| curse_index++] = Curse_Healthy_Creatures;
curses[| curse_index++] = Curse_Experienced_Creatures;
curses[| curse_index++] = Curse_Forgetful;
curses[| curse_index++] = Curse_Hunted;
curses[| curse_index++] = Curse_MadQueen;
curses[| curse_index++] = Curse_Portal;

show_debug_message("Simulation Object Create Populating Perks");

//perk list
perks = ds_list_create();
var perk_index = 0;
perks[| perk_index++] = Perk_HP_Boost 
perks[| perk_index++] = Perk_Open_Minded
perks[| perk_index++] = Perk_Regeneration    
perks[| perk_index++] = Perk_Brawler
perks[| perk_index++] = Perk_Marksman     
perks[| perk_index++] = Perk_Sniper_Rifle
perks[| perk_index++] = Perk_Rifle   
perks[| perk_index++] = Perk_Insightfull
perks[| perk_index++] = Perk_Shotgun
perks[| perk_index++] = Perk_Armored
//perks[| perk_index++] = Perk_Melee_Specialist
perks[| perk_index++] = Perk_Demon_Armor
perks[| perk_index++] = Perk_Radiant_Armor
perks[| perk_index++] = Perk_Holy_Fire
perks[| perk_index++] = Perk_Paradox_Trigger
perks[| perk_index++] = Perk_Heartseeker
perks[| perk_index++] = Perk_Reaper
perks[| perk_index++] = Perk_Tentacle_Whip
perks[| perk_index++] = Perk_Storm_Of_Vengance
perks[| perk_index++] = Perk_Grace
perks[| perk_index++] = Perk_Chakra
perks[| perk_index++] = Perk_Ethereal
perks[| perk_index++] = Perk_Fury
perks[| perk_index++] = Perk_Wrath
perks[| perk_index++] = Perk_Focused
perks[| perk_index++] = Perk_Magically_Gifted
perks[| perk_index++] = Perk_Aura
perks[| perk_index++] = Perk_Clairvoyance
perks[| perk_index++] = Perk_Darkvision
perks[| perk_index++] = Perk_Shadow_Armor
perks[| perk_index++] = Perk_Void_Armor
perks[| perk_index++] = Perk_Phoenix_Armor
perks[| perk_index++] = Perk_Solar_Armor
perks[| perk_index++] = Perk_Lifesense
perks[| perk_index++] = Perk_Called_Shots
perks[| perk_index++] = Perk_First_Aid
perks[| perk_index++] = Perk_Beserker
perks[| perk_index++] = Perk_Initiative
perks[| perk_index++] = Perk_Volatile_Regeneration_Ritual
perks[| perk_index++] = Perk_Blood_Secret_Ritual
perks[| perk_index++] = Perk_Stone_Body_Ritual
perks[| perk_index++] = Perk_Inferno_Rounds_Ritual
perks[| perk_index++] = Perk_Flesh_Guise_Ritual
perks[| perk_index++] = Perk_Teleport_Ritual
perks[| perk_index++] = Perk_Background_Forgotton
perks[| perk_index++] = Perk_Background_Sinner
perks[| perk_index++] = Perk_Background_Saint
perks[| perk_index++] = Perk_Background_Seeker
perks[| perk_index++] = Perk_Background_Sadist
perks[| perk_index++] = Perk_Background_Scholar
perks[| perk_index++] = Perk_Background_Simple
perks[| perk_index++] = Perk_Background_Survivor
perks[| perk_index++] = Perk_Background_Switch
perks[| perk_index++] = Perk_Pact_Pistol
perks[| perk_index++] = Perk_Telescape_Pact
perks[| perk_index++] = Perk_Pact_Ritual
perks[| perk_index++] = Perk_Mindsight_Pact
//perks[| perk_index++] = Perk_Freezing_Pact
perks[| perk_index++] = Perk_Skill_Pact

show_debug_message("Simulation Object Create Setting AI Mode");

if(paramater_is_present("ai_mode"))
{
    instance_create(0,0, Actor);
}

show_debug_message("Simulation Object Create Setting Optimizations");
if(not DEBUG)
{
    gml_release_mode(true);
    gml_pragma("forceinline");
}

show_debug_message("Simulation Object Create Complete");

if(highscore_value(1) > 1000)
{
    highscore_clear();
}

