/// @description create_floating_text_fx(x,y)
/// @param x
/// @param y
{
    var xx = argument0;
    var yy = argument1;
    var fx = instance_create(xx*Renderer.grid_size,yy*Renderer.grid_size, FX_Death_Splash);
    return fx;
}
