/// @description AI_approach_player(exception_object_index)
/// @param exception_object_index
{
    var exception = argument0;
    var nav_map = mp_grid_create(0,0,Simulation.grid_width,Simulation.grid_height,1,1);
    mp_grid_clear_all(nav_map)
    var path = path_add();
    
    with(Object)
    {
        if(not self.passable and not object_is_ancestor(object_index, exception))
        {
            mp_grid_add_cell(nav_map, self.x, self.y)
        }
    }
    
    mp_grid_clear_cell(nav_map, owner.x, owner.y)
    
    var player = instance_find(Player, 0);
    if(instance_exists(player))
    {
        mp_grid_clear_cell(nav_map, player.x, player.y)
    }
    
    if(DEBUG and Simulation.debug_grid_overlay.mode == DEBUG_GRID_MODE_PATHFINDING)
    {
        for(var xx = 0; xx < Simulation.grid_width; xx++) for(var yy = 0; yy < Simulation.grid_height; yy++)
        {
            if(mp_grid_get_cell(nav_map, xx, yy) == -1)
            {
                Simulation.debug_grid_overlay.grid[#xx,yy] = c_red;
            }
            else
            {
                Simulation.debug_grid_overlay.grid[#xx,yy] = c_green;
            }
        }
    }
    
    var found = (mp_grid_path(nav_map, path, owner.x, owner.y, last_known_player_x, last_known_player_y, true))
    if( not found)
    {
        mp_grid_destroy(nav_map);
        path_delete(path);
        return false
    }
    
    var new_x = path_get_point_x(path, 1);
    var new_y = path_get_point_y(path, 1);
    if(is_passable(new_x, new_y))
    {
        owner.x = new_x
        owner.y = new_y
        if(instance_exists(owner.fighter))
        {
            owner.fighter.charged = false;
        }
    }
        
    mp_grid_destroy(nav_map);
    path_delete(path);
    return true;
}
