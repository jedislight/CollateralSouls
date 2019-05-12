{
    var xx = argument0;
    var yy = argument1;
    var tex = argument2;
    var value = argument3;
    var node_radius = argument4;
    var z = argument5;
    var network_value = Simulation.state_grid[#xx,yy];
    if(network_value != value)
    {
        return 0;
    }        
    var px = xx;
    var py = yy;
    var pz = z;
    d3d_draw_block(px-node_radius,py-node_radius,pz-node_radius,px+node_radius,py+node_radius,pz+node_radius, tex, 1, 1);
}
