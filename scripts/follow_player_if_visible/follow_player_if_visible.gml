{
    var player = instance_find(Player,0);
    if(player <= 0)
    {
        return false;
    }
    
    if (is_visible_quick(owner, player))
    {
        last_known_player_x = player.x
        last_known_player_y = player.y    
    }
    
    if(last_known_player_x == -1)
    {
        return false;
    }
    
    var nav_map = mp_grid_create(0,0,Simulation.grid_width,Simulation.grid_height,1,1);
    mp_grid_clear_all(nav_map)
    var path = path_add();
    
    with(Object)
    {
        if(not self.passable)
        {
            mp_grid_add_cell(nav_map, self.x, self.y)
        }
    }
    
    mp_grid_clear_cell(nav_map, owner.x, owner.y)
    mp_grid_clear_cell(nav_map, player.x, player.y)
    
    var found = (mp_grid_path(nav_map, path, owner.x, owner.y, player.x, player.y, true))
    if( not found)
    {
        mp_grid_destroy(nav_map);
        path_delete(path);
        return false
    }
    
    var xx = path_get_point_x(path, 1);
    var yy = path_get_point_y(path, 1);
    
    if(is_passable(xx,yy))
    {
        owner.x = xx;
        owner.y = yy;
    }
        
    mp_grid_destroy(nav_map);
    path_delete(path);
    return true
}
