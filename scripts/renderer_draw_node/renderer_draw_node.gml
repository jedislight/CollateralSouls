{
    var xx = argument0;
    var yy = argument1;
    var tex = argument2;
    var value = argument3;
    var node_radius = argument4;
    var z = argument5;
    var network_value = Actor.network[#xx,yy];
    var block = Actor.input_is_anding[#xx,yy];
    if(network_value != value or block == noone)
    {
        return 0;
    }        
    var px = xx;
    var py = yy;
    var pz = z;
    if(block)
    {
        d3d_draw_block(px-node_radius,py-node_radius,pz-node_radius,px+node_radius,py+node_radius,pz+node_radius, tex, 1, 1);
    }
    else
    {
        d3d_draw_ellipsoid(px-node_radius,py-node_radius,pz-node_radius,px+node_radius,py+node_radius,pz+node_radius, tex, 1, 1, 1);
    }
}
