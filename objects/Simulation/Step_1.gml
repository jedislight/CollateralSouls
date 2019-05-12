/// @description Input
input_up = false;
input_down = false;
input_left = false;
input_right = false;
input_down_right= false;
input_down_left = false;
input_up_right=false;
input_up_left=false;

var keyboard_up = ord("U");
var keyboard_down = ord("M");
var keyboard_left = ord("H");
var keyboard_right = ord("K");
var keyboard_up_right = ord("I");
var keyboard_up_left = ord("Y");
var keyboard_down_left = ord("N");
var keyboard_down_right = 188;
var keyboard_wait = ord("J");

if(Config.reals[?"vi_keyboard"])
{
    var keyboard_up = ord("K");
    var keyboard_down = ord("J");
    var keyboard_left = ord("H");
    var keyboard_right = ord("L");
    var keyboard_up_right = ord("U");
    var keyboard_up_left = ord("Y");
    var keyboard_down_left = ord("B");
    var keyboard_down_right = ord("N");
    var keyboard_wait = ord("G");
}

input_menu_confirm = keyboard_check_pressed(vk_return) or keyboard_check_pressed(vk_enter);
input_escape = keyboard_check_pressed(vk_escape);
input_help = keyboard_check_pressed(191) or (keyboard_check_pressed(ord("H")) and keyboard_check_direct(vk_control));
input_wait = keyboard_check_pressed(vk_numpad5)  or keyboard_check_pressed(keyboard_wait);
input_target_cycle_backwards = (keyboard_check_pressed(vk_tab) and keyboard_check_direct(vk_shift)) or keyboard_check_pressed(vk_subtract);
input_target_cycle = keyboard_check_pressed(vk_tab) or keyboard_check_pressed(vk_add);
input_ranged_attack = keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_numpad0);
input_character_sheet = keyboard_check_pressed(ord("C"));
input_insightful_sheet = keyboard_check_direct(vk_shift) and keyboard_check_pressed(ord("C"));

if(instance_number(Actor) >= 1)
{
    switch(Actor.chosen_input_response)
    {
        case 0: input_ranged_attack = true; break;
        case 1: input_down_left = true; break;
        case 2: input_down = true; break;
        case 3: input_down_right = true; break;
        case 4: input_left = true; break;
        case 5: input_wait = true; break;
        case 6: input_right = true; break;
        case 7: input_up_left = true; break;
        case 8: input_up = true; break;
        case 9: input_up_right = true; break;
        case 10: input_target_cycle = true; break;
        case 11: input_target_cycle_backwards = true; break;                     
        case 12: input_menu_confirm = true; break;
    }
}

var hold_delay = 15;
var hold_repeat = 1;

//
//pressed
//
if(keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_numpad8)  or keyboard_check_pressed(keyboard_up))
{
    input_up = true
}
else if(keyboard_check_pressed(vk_down) or keyboard_check_pressed(vk_numpad2) or keyboard_check_pressed(keyboard_down))
{
    input_down = true
}
else if(keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_numpad4) or keyboard_check_pressed(keyboard_left))
{
    input_left = true
}
else if(keyboard_check_pressed(vk_right) or keyboard_check_pressed(vk_numpad6) or keyboard_check_pressed(keyboard_right))
{
    input_right = true
    show_debug_message("input _ right");
}
else if(keyboard_check_pressed(vk_numpad7) or keyboard_check_pressed(keyboard_up_left))
{
    input_up_left = true
}
else if(keyboard_check_pressed(vk_numpad9) or keyboard_check_pressed(keyboard_up_right))
{
    input_up_right = true
}
else if(keyboard_check_pressed(vk_numpad3) or keyboard_check_pressed(keyboard_down_right))
{
    input_down_right = true
}
else if(keyboard_check_pressed(vk_numpad1) or keyboard_check_pressed(keyboard_down_left))
{
    input_down_left = true
}

//
//released
//
if(keyboard_check_released(vk_up) or keyboard_check_released(vk_numpad8)  or keyboard_check_released(keyboard_up))
{
    input_hold_up = 0;
}
else if(keyboard_check_released(vk_down) or keyboard_check_released(vk_numpad2) or keyboard_check_released(keyboard_down))
{
    input_hold_down = 0;
}
else if(keyboard_check_released(vk_left) or keyboard_check_released(vk_numpad4) or keyboard_check_released(keyboard_left))
{
    input_hold_left = 0;
}
else if(keyboard_check_released(vk_right) or keyboard_check_released(vk_numpad6) or keyboard_check_released(keyboard_right))
{
    input_hold_right = 0;
}
else if(keyboard_check_released(vk_numpad7) or keyboard_check_released(keyboard_up_left))
{
    input_hold_up_left = 0;
}
else if(keyboard_check_released(vk_numpad9) or keyboard_check_released(keyboard_up_right))
{
    input_hold_up_right = 0;
}
else if(keyboard_check_released(vk_numpad3) or keyboard_check_released(keyboard_down_right))
{
    input_hold_down_right = 0;
}
else if(keyboard_check_released(vk_numpad1) or keyboard_check_released(keyboard_down_left))
{
    input_hold_down_left = 0;
}

//
//hold
//
if(keyboard_check(vk_up) or keyboard_check(vk_numpad8)  or keyboard_check(keyboard_up))
{
    if(check_key_repeat(hold_delay, hold_repeat, ++input_hold_up))
    {
        input_up = true;
    }
}
else if(keyboard_check(vk_down) or keyboard_check(vk_numpad2) or keyboard_check(keyboard_down))
{
    if(check_key_repeat(hold_delay, hold_repeat, ++input_hold_down))
    {
        input_down = true;
    }
}
else if(keyboard_check(vk_left) or keyboard_check(vk_numpad4) or keyboard_check(keyboard_left))
{
    if(check_key_repeat(hold_delay, hold_repeat, ++input_hold_left))
    {
        input_left = true;
    }
}
else if(keyboard_check(vk_right) or keyboard_check(vk_numpad6) or keyboard_check(keyboard_right))
{
    if(check_key_repeat(hold_delay, hold_repeat, ++input_hold_right))
    {
        input_right = true;
    }
}
else if(keyboard_check(vk_numpad7) or keyboard_check(keyboard_up_left))
{
    if(check_key_repeat(hold_delay, hold_repeat, ++input_hold_up_left))
    {
        input_up_left = true;
    }
}
else if(keyboard_check(vk_numpad9) or keyboard_check(keyboard_up_right))
{
    if(check_key_repeat(hold_delay, hold_repeat, ++input_hold_up_right))
    {
        input_up_right = true;
    }
}
else if(keyboard_check(vk_numpad3) or keyboard_check(keyboard_down_right))
{
    if(check_key_repeat(hold_delay, hold_repeat, ++input_hold_down_right))
    {
        input_down_right = true;
    }
}
else if(keyboard_check(vk_numpad1) or keyboard_check(keyboard_down_left))
{
    if(check_key_repeat(hold_delay, hold_repeat, ++input_hold_down_left))
    {
        input_down_left = true;
    }
}

if(soak_test == true)
{
    if(!instance_exists(get_active_menu()))
    {
        if(frame mod 9 == 0)
        {
            var player = instance_find(Player, 0);
            
            if(instance_number(Creature) == 0)
            {
                var key = irandom_range(1,9);
                switch(key)
                {
                    case 1: input_up = true; break;
                    case 2: input_down = true; break;
                    case 3: input_left = true; break;
                    case 4: input_right = true; break;
                    case 5: input_down_right = true; break;
                    case 6: input_down_left = true; break;
                    case 7: input_up_right = true; break;
                    case 8: input_up_left = true; break;
                    case 9: input_wait = true; break;
                }
            }
            else if (instance_exists(player))
            {
                if(!instance_exists(soak_target) or (soak_target.x == player.x && soak_target.y == player.y))
                {
                    soak_target = instance_nearest(player.x, player.y, Creature);   
                }
                if(targeting.target != instance_nearest(player.x, player.y, Creature))
                {
                    input_target_cycle_backwards = true;
                }
                var target = soak_target;
                var nav_map = mp_grid_create(0,0,grid_width,grid_height,1,1);
                mp_grid_clear_all(nav_map)
                var path = path_add();
                
                with(Object)
                {
                    if(not self.passable)
                    {
                        mp_grid_add_cell(nav_map, self.x, self.y)
                    }
                }
                
                mp_grid_clear_cell(nav_map, player.x, player.y)
                mp_grid_clear_cell(nav_map, target.x, target.y)
                                
                var found = (mp_grid_path(nav_map, path, player.x, player.y, target.x, target.y, true))
                if( not found)
                {
                    var key = irandom_range(1,9);
                    switch(key)
                    {
                        case 1: input_up = true; break;
                        case 2: input_down = true; break;
                        case 3: input_left = true; break;
                        case 4: input_right = true; break;
                        case 5: input_down_right = true; break;
                        case 6: input_down_left = true; break;
                        case 7: input_up_right = true; break;
                        case 8: input_up_left = true; break;
                        case 9: input_wait = true; break;
                    }
                    mp_grid_destroy(nav_map);
                    path_delete(path);
                    soak_target = instance_find(Floor, irandom_range(0, instance_number(Floor)-1));
                }
                else
                {
                    var new_x = path_get_point_x(path, 1);
                    var new_y = path_get_point_y(path, 1);
                    
                    var dx = new_x - player.x;
                    var dy = new_y - player.y;
                    
                    var key = 5;
                    key += dx;
                    key -= dy*3;
                    
                    switch(key)
                    {
                        case 1: input_down_left = true; break;
                        case 2: input_down = true; break;
                        case 3: input_down_right = true; break;
                        case 4: input_left = true; break;
                        case 5: input_wait = true; break;
                        case 6: input_right = true; break;
                        case 7: input_up_left = true; break;
                        case 8: input_up = true; break;
                        case 9: input_up_right = true; break;
                    }
                        
                    mp_grid_destroy(nav_map);
                    path_delete(path);
                }
            }
        }
        else
        {
            input_ranged_attack = true;
        }
    }
    else
    {
        input_menu_confirm = true;
    }
}

