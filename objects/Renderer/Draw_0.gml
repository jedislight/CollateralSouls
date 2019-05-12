//obey config
if(Config.reals[?"Smooth_Rendering"])
{
    texture_set_interpolation(true);
}
else
{
    texture_set_interpolation(false);
}
//setup variables
grid_size = 16
frame += 1;
var grid_width = Simulation.grid_width
var grid_height = Simulation.grid_height
var object_render_grid = ds_grid_create(grid_width,grid_height)
var light_grid = Simulation.light_grid
var light_color_grid = Simulation.light_color_grid
var explored_grid = Simulation.explored_grid
var player = instance_find(Player, 0);
var bright_mod = Config.reals[?"bright_mod"];
var clair_mode = instance_exists(player) and perk_exists(player, (Perk_Clairvoyance));
if( instance_exists(player) and perk_exists(player, (Perk_Darkvision)))
{
    light_grid = Simulation.darkvision_light_grid;
}

draw_set_font(Courier_New)
draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

//build render list
ds_grid_clear(overdraw_grid, noone)
ds_grid_clear(object_render_grid, noone)
with(Object)
{
    if (x < grid_width and y < grid_height)
    {
        var fow_visible = (fow_memerable and (explored_grid[#x,y] == true or clair_mode))
        var obj = object_render_grid[#x,y];
        if(fow_visible or self.visible or always_bright)
        {
            if(overdraw)
            {
                var obj = other.overdraw_grid[#x,y];
                if(obj == noone)
                {
                    other.overdraw_grid[#x,y] = id;
                }
                else if(obj != noone and obj._layer < self._layer)
                {
                    other.overdraw_grid[#x,y] = id;
                }
            }
            else if ( obj == noone )
            {
                object_render_grid[#x, y] = id;     
            }
            else
            {            
                if(obj != noone and obj._layer < self._layer)
                {
                    object_render_grid[#x, y] = id;                
                }
            }
        }
    }
}
//render play area
if(Config.reals[?"Draw_FoW"])
{
    var fow_background_color=make_colour_rgb(6,6,6);
    for(var xx = 0; xx < grid_width; xx++) for(var yy = 0; yy < grid_height; yy++)
    {
        var object = object_render_grid[#xx, yy];
        if(object != noone)
        {
            var fow_visible = (object.fow_memerable and explored_grid[#xx,yy] == true)
            if((not object.visible and fow_visible))
            {
                draw_rectangle_colour(xx*grid_size, yy*grid_size, (xx+1)*grid_size, (yy+1)*grid_size, fow_background_color, fow_background_color, fow_background_color, fow_background_color, false);
            }
        }
    }
}
var pair;
pair[0] = noone;
pair[1] = noone;
//render objects
for(var xx = 0; xx < grid_width; xx++) for(var yy = 0; yy < grid_height; yy++)
{
    pair[0] = object_render_grid[#xx, yy];
    pair[1] = overdraw_grid[#xx,yy];
    for(var i = 0; i < 2; ++i)
    {
        var object = pair[i];
        if(object != noone)
        {
            var fow_visible = (object.fow_memerable and explored_grid[#xx,yy] == true)
            var bright = clamp(light_grid[#xx,yy], 0.0, 1.0)
            var fow_bright = Simulation.light_minimum;
            var fow_color = c_dkgray;
            if( clair_mode and explored_grid[#xx,yy] == false)
            {
                fow_color = c_blue;
            }
            if(object.always_bright)
            {
                fow_color = object.color;
                fow_bright = 1.0;
                bright = 1.0;
            }
            if((not object.visible and (fow_visible or clair_mode)))
            {
                var adjusted_bright = power(fow_bright, bright_mod);      
    
                draw_background_part_ext(tile_background, object.glyph_tile_x*16, object.glyph_tile_y*16, 16, 16, xx * grid_size, yy * grid_size, 1.0, 1.0, fow_color, adjusted_bright);
            }
            else if (object.visible)
            {
                var light = light_color_grid[#xx,yy];
                var object_color = object.color;
                if(object.frozen > 0)
                {
                    object_color = make_colour_rgb(165,242,243);
                }
                var rmod = 1.0;
                var gmod = 1.0;
                var bmod = 1.0;
                if(perk_exists(object, Perk_Beserker))
                {
                    var turns_since_damaged = object.turns_taken - object.fighter.last_hit_taken_on - 1;
                    if(turns_since_damaged < 5)
                    {
                        gmod = 0.5
                        bmod = 0.5
                    }
                }
                var r = min(colour_get_red(light), colour_get_red(object_color)) * rmod;
                var g = min(colour_get_green(light), colour_get_green(object_color)) * gmod;
                var b = min(colour_get_blue(light), colour_get_blue(object_color)) * bmod;
                var color = make_colour_rgb(r,g,b);
                var adjusted_bright = power(bright, bright_mod);

                var override_shader = noone;    
                if(perk_exists(object, Perk_Ethereal) and object.fighter != noone and object.fighter.attacked_this_turn == false)
                {
                    override_shader = fs_ethereal;     
                }
                
                if(override_shader != noone)
                {
                    shader_set(override_shader);
                    var uniform = shader_get_uniform(fs_ethereal, "time");
                    shader_set_uniform_f(uniform, get_timer()/1000000.0);
                }
                draw_background_part_ext(tile_background, object.glyph_tile_x*16, object.glyph_tile_y*16, 16, 16, xx * grid_size, yy * grid_size, 1.0, 1.0, color, adjusted_bright);
                if(override_shader != noone)
                {
                    shader_reset();
                }
            }
            
            if(object.nemesis)
            {
                draw_background_part_ext(tile_background, 15*16, 15*16, 16, 16, xx * grid_size, yy * grid_size, 1.0, 1.0, c_yellow, 1.0);
            }
        }
    }
}

//render insight health bars
if(instance_exists(player) and perk_exists(player, Perk_Insightfull))
{
    with(Creature)
    {
        if(visible and light_grid[#x,y] >0.1)
        {
            var amount = ceil((fighter.hp/fighter.hp_max)*100);
            if(amount < 100)
            {
                draw_healthbar(x*16,y*16, (x+1)*16, y*16+1, amount, c_black, c_red, c_red, 0, true, false);
            }
        }
    }
}

//render target highlight
if(instance_exists(Simulation.targeting.target))
{
    var target = Simulation.targeting.target;
    var tx = target.x
    var ty = target.y
    
    draw_rectangle_colour(tx * grid_size, ty * grid_size, (tx+1)*grid_size, (ty+1)*grid_size, c_yellow, c_yellow, c_yellow, c_yellow, true);
}

//render player location hint
if(instance_exists(player) and ((player.glyph != "@") or (player.luminosity == 0 and light_grid[#player.x, player.y] <= Simulation.light_minimum)))
{
    draw_rectangle_colour(player.x*grid_size, player.y*grid_size, (player.x+1)*grid_size, (player.y+1)*grid_size, player.color,player.color,player.color,player.color,true);
}
//render play area border
for(var yy = 0; yy < grid_height; yy++)
{
    draw_text_colour(grid_width * grid_size + .5*grid_size, yy * grid_size + .5*grid_size, string_hash_to_newline("|"), c_white, c_white, c_white, c_white, 1.0)    
}
for(var xx = 0; xx < grid_width; xx++)
{
    draw_text_colour(xx * grid_size + .5*grid_size, grid_height * grid_size + .5*grid_size, string_hash_to_newline("-"), c_white, c_white, c_white, c_white, 1.0)    
}

draw_text_colour(grid_width * grid_size + .5*grid_size, grid_height * grid_size + .5*grid_size, string_hash_to_newline("/"), c_white, c_white, c_white, c_white, 1.0)    

ds_grid_destroy(object_render_grid)

//render log
with(Log)
{
    draw_set_font(Courier_New);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    draw_text_ext(x,y-3, string_hash_to_newline(self.text), 16, Simulation.grid_width * 16);
    draw_set_blend_mode_ext(bm_dest_colour, bm_src_colour);
    draw_rectangle_colour(x, y-3, Simulation.grid_width * 16, room_height, c_white, c_white, c_black, c_black, false);
    draw_set_blend_mode(bm_normal);
}

//render menu
var menu = get_active_menu();
if(instance_exists(menu))
{
    var largest_height = 0;
    var original_selection = menu.selected_index;
    for(var i = 0; i < ds_list_size(menu.menu_items); ++i)
    {
        menu.selected_index = i;
        var i_height = string_height_ext(string_hash_to_newline(get_menu_text(menu)), grid_size, grid_size * 40);   
        if(i_height > largest_height)
        {
            largest_height = i_height;
        }
    }
    menu.selected_index = original_selection;
    var text = get_menu_text(menu);
    var text_height = largest_height;
    var middle = room_height * 0.5;
    var top = middle - text_height * 0.5;
    var bottom = middle + text_height * 0.5;
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    draw_rectangle_colour(10 * grid_size, top , 50 * grid_size, bottom, c_black, c_black, c_black, c_black, false)
    draw_rectangle_colour(10 * grid_size, top , 50 * grid_size, bottom, c_white, c_white, c_white, c_white, true)
    draw_text_ext(10 * grid_size, round(top), string_hash_to_newline(text), grid_size, grid_size * 40);
}
//draw color log
with(Color_Log)
{
    draw_set_font(Courier_New_Half)
    var cx = x;
    var cy = top + height+8;
    var width = Renderer.grid_size * 40;
    for(var i = 0; i < ds_list_size(history); ++i)
    {
        draw_set_color(color_history[|i]);
        if(history[|i] == "?")
        {
            draw_set_color(lore_color_cycle(Renderer.frame));
        }  
        draw_text(round(cx), round(cy), string_hash_to_newline(history[|i]));
        cx += string_width(string_hash_to_newline("  "));
        if(cx - x > width-12)
        {
            cx = x;
            cy += Renderer.grid_size;
        }
    }
    
    draw_set_color(c_black);
}

if(DEBUG and draw_debug_grid_mouse_tooltip)
{
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text(mouse_x, mouse_y+grid_size, string_hash_to_newline(string(mouse_x div grid_size)+","+string(mouse_y div grid_size) + "["+string(Simulation.light_grid[#mouse_x div grid_size, mouse_y div grid_size])+","+string(Simulation.light_color_grid[#mouse_x div grid_size, mouse_y div grid_size])+"]"));
}

if(DEBUG and draw_debug_grid_overlay)
{
    draw_set_alpha(0.25);
    for(var xx = 0; xx < grid_width; xx++) for(var yy = 0; yy < grid_height; yy++)
    {
        var color = Simulation.debug_grid_overlay.grid[#xx,yy];
        draw_rectangle_colour(xx*grid_size, yy*grid_size, (xx+1)*grid_size-1, (yy+1)*grid_size-1, color, color, color, color, false);
        draw_rectangle_colour(xx*grid_size, yy*grid_size, (xx+1)*grid_size-1, (yy+1)*grid_size-1, color, color, color, color, true);
    }
    draw_set_alpha(1.0);
    
    var ds_map_count = 0;
    var ds_map_max = 0;
    var ds_map_largest = 0;
    var counter = 0;
    while(counter < ds_map_count + 10000)
    {
        if(ds_exists(counter, ds_type_map))
        {
            ++ds_map_count;
            ds_map_max = counter;
            ds_map_largest = max(ds_map_largest, ds_map_size(counter));
        }
        ++counter;
    }
    
    var ds_list_count = 0;
    var ds_list_max = 0;
    var ds_list_largest = 0;
    counter = 0;
    while(counter < ds_list_count + 10000)
    {
        if(ds_exists(counter, ds_type_list))
        {
            ++ds_list_count;
            ds_list_max = counter;
            ds_list_largest = max(ds_list_largest, ds_list_size(counter));
        }
        ++counter;
    }
    
    var ds_queue_count = 0;
    var ds_queue_max = 0;
    var ds_queue_largest = 0;
    counter = 0;
    while(counter < ds_queue_count + 10000)
    {
        if(ds_exists(counter, ds_type_queue))
        {
            ++ds_queue_count;
            ds_queue_max = counter;
            ds_queue_largest = max(ds_queue_largest, ds_queue_size(counter));
        }
        ++counter;
    }
    
    var ds_grid_count = 0;
    var ds_grid_max = 0;
    counter = 0;
    while(counter < ds_grid_count + 10000)
    {
        if(ds_exists(counter, ds_type_grid))
        {
            ++ds_grid_count;
            ds_grid_max = counter;
        }
        ++counter;
    }
    
    var ds_path_count = 0;
    var ds_path_max = 0;
    counter = 0;
    while(counter < ds_path_count + 10000)
    {
        if(path_exists(counter))
        {
            ++ds_path_count;
            ds_path_max = counter;
        }
        ++counter;
    }
    
    
    var instance_max = instance_find(all,instance_count-1);
    line = 0;
    draw_text(0, 16 + ++line * 16, string_hash_to_newline("MAP COUNT:" + string(ds_map_count)));
    draw_text(0, 16 + ++line * 16, string_hash_to_newline("PATH COUNT:" + string(ds_path_count)));
    draw_text(0, 16 + ++line * 16, string_hash_to_newline("LIST COUNT:" + string(ds_list_count)));
    draw_text(0, 16 + ++line * 16, string_hash_to_newline("QUEUE COUNT:" + string(ds_queue_count)));
    draw_text(0, 16 + ++line * 16, string_hash_to_newline("GRID COUNT:" + string(ds_grid_count)));
    draw_text(0, 16 + ++line * 16, string_hash_to_newline("INSTANCE COUNT:" + string(instance_count)));
    ++line;
    draw_text(0, 16 + ++line * 16, string_hash_to_newline("MAP MAX:" + string(ds_map_max)));
    draw_text(0, 16 + ++line * 16, string_hash_to_newline("PATH MAX:" + string(ds_path_max)));
    draw_text(0, 16 + ++line * 16, string_hash_to_newline("LIST MAX:" + string(ds_list_max)));
    draw_text(0, 16 + ++line * 16, string_hash_to_newline("QUEUE MAX:" + string(ds_queue_max)));
    draw_text(0, 16 + ++line * 16, string_hash_to_newline("GRID MAX:" + string(ds_grid_max)));
    draw_text(0, 16 + ++line * 16, string_hash_to_newline("INSTANCE MAX:" + string(instance_max)));
    ++line;
    draw_text(0, 16 + ++line * 16, string_hash_to_newline("MAP LARGEST:" + string(ds_map_largest)));
    draw_text(0, 16 + ++line * 16, string_hash_to_newline("LIST LARGEST:" + string(ds_list_largest)));
    draw_text(0, 16 + ++line * 16, string_hash_to_newline("QUEUE LARGEST:" + string(ds_queue_largest)));
    
}
var draw_3d_NN = keyboard_check_direct(vk_f5);
if(draw_3d_NN and instance_number(Actor) > 0)
{
    d3d_start();
    draw_set_blend_mode(bm_add);
    d3d_set_culling(true);
    d3d_set_hidden(false)
    var scaled_y = mouse_y / 6.5;
    var state_offset = 300;
    var c_dkred = color_set_brightness(c_red, 0.1);
    var c_dkgreen = color_set_brightness(c_green, 0.1);
    var c_dkgrey = color_set_brightness(c_white, 0.01);
    d3d_set_projection_ext(Actor.network_width*0.5+sin(mouse_x*.01)*scaled_y,Actor.network_height*0.5+cos(mouse_x*.01)*scaled_y, mouse_y-room_height*0.5,Actor.network_width*0.5,Actor.network_height*0.5,0,0,0,1,90, room_width/room_height, 1, 1600);
    
    var state_width = ds_grid_width(Simulation.state_grid);
    var state_height = ds_grid_height(Simulation.state_grid);
    
    var node_radius = 0.25;
    var tex = background_get_texture(tex_red);
    for(var xx = 0; xx < Actor.network_width; ++xx) for(var yy = 0; yy < Actor.network_height; ++yy)
    {
        renderer_draw_node(xx, yy, tex, 0, node_radius, 0);
    }
    for(var xx = 0; xx < state_width; ++xx) for(var yy = 0; yy < state_height; ++yy)
    {
        renderer_draw_state_node(xx, yy, tex, 0, node_radius, state_offset);
    }
    var tex = background_get_texture(tex_gray);
    for(var xx = 0; xx < Actor.network_width; ++xx) for(var yy = 0; yy < Actor.network_height; ++yy)
    {
        renderer_draw_node(xx, yy, tex, noone, node_radius, 0);
    }
    for(var xx = 0; xx < state_width; ++xx) for(var yy = 0; yy < state_height; ++yy)
    {
        renderer_draw_state_node(xx, yy, tex, noone, node_radius, state_offset);
    }
    var tex = background_get_texture(tex_green);
    for(var xx = 0; xx < Actor.network_width; ++xx) for(var yy = 0; yy < Actor.network_height; ++yy)
    {
        renderer_draw_node(xx, yy, tex, 1, node_radius, 0);
    }
    for(var xx = 0; xx < state_width; ++xx) for(var yy = 0; yy < state_height; ++yy)
    {
        renderer_draw_state_node(xx, yy, tex, 1, node_radius, state_offset);
    }
    
    d3d_primitive_begin(pr_linelist);
    for(var xx = 0; xx < Actor.network_width; ++xx) for(var yy = 0; yy < Actor.network_height; ++yy)
    {
        if(Actor.input_is_local[#xx,yy] == true)
        {
            //|_|
            
            //stock
            var color = c_dkgrey;
            var vx = Actor.input_x[#xx,yy];
            var vy = Actor.input_y[#xx,yy];
            var value = Actor.network[#vx,vy];
            if(value == 1)
            {
                color = c_dkgreen;
            }
            else if(value == 0)
            {
                color = c_dkred;
            }
            draw_set_color(color);
            //|
            d3d_vertex(Actor.input_x[#xx,yy], Actor.input_y[#xx,yy], 0);
            d3d_vertex(Actor.input_x[#xx,yy], Actor.input_y[#xx,yy], -3);
            
            // _
            d3d_vertex(Actor.input_x[#xx,yy], Actor.input_y[#xx,yy], -3);
            d3d_vertex(xx, yy, -3);
            
            //  |
            d3d_vertex(xx, yy, -3);
            d3d_vertex(xx, yy, 0);
            
            //prime
            color = c_dkgrey;
            vx = Actor.input_x_prime[#xx,yy];
            vy = Actor.input_y_prime[#xx,yy];
            value = Actor.network[#vx,vy];
            if(value == 1)
            {
                color = c_dkgreen;
            }
            else if(value == 0)
            {
                color = c_dkred;
            }
            draw_set_color(color);
            //|
            d3d_vertex(Actor.input_x_prime[#xx,yy], Actor.input_y_prime[#xx,yy], 0);
            d3d_vertex(Actor.input_x_prime[#xx,yy], Actor.input_y_prime[#xx,yy], -3);
            
            // _
            d3d_vertex(Actor.input_x_prime[#xx,yy], Actor.input_y_prime[#xx,yy], -3);
            d3d_vertex(xx, yy, -3);
            
            //  |
            d3d_vertex(xx, yy, -3);
            d3d_vertex(xx, yy, 0);
        }
        else if(Actor.input_is_local[#xx,yy] != noone)
        {
            //>
            var color = c_dkgrey;
            var vx = Actor.input_x[#xx,yy];
            var vy = Actor.input_y[#xx,yy];
            var value = Simulation.state_grid[#vx,vy];
            if(value == 1)
            {
                color = c_dkgreen;
            }
            else if(value == 0)
            {
                color = c_dkred;
            }
            draw_set_color(color);
            d3d_vertex(Actor.input_x[#xx,yy], Actor.input_y[#xx,yy], state_offset);
            d3d_vertex(xx, yy, 0);
            
            color = c_dkgrey;
            vx = Actor.input_x_prime[#xx,yy];
            vy = Actor.input_y_prime[#xx,yy];
            value = Simulation.state_grid[#vx,vy];
            if(value == 1)
            {
                color = c_dkgreen;
            }
            else if(value == 0)
            {
                color = c_dkred;
            }
            draw_set_color(color);
            d3d_vertex(Actor.input_x_prime[#xx,yy], Actor.input_y_prime[#xx,yy], state_offset);
            d3d_vertex(xx, yy, 0);
        }
    }
    d3d_primitive_end();
    
    draw_set_blend_mode(bm_normal);
    d3d_set_projection_ortho(0,0, room_width, room_height, 0);
    d3d_end();
}

