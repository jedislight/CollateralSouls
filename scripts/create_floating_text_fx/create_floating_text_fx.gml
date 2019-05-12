/// @description create_floating_text_fx(x,y, text, color)
/// @param x
/// @param y
/// @param  text
/// @param  color
{
    var xx = argument0;
    var yy = argument1;
    var text = argument2;
    var color = argument3;
    var fx = instance_create(xx*Renderer.grid_size,yy*Renderer.grid_size, FX_Floating_Text);
    fx.text = string(argument2);
    fx.color = color;
    return fx;
}
