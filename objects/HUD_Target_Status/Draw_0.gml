var player = instance_find(Player, 0);
var text = "";
if(instance_exists(Simulation.targeting.target) and instance_exists(player))
{
    var target = Simulation.targeting.target;
    var target_name = target.name;
    var target_cover = clamp(100 - floor(get_cover(player, target) * 100), 0, 100);
    if(perk_exists(player, Perk_Shotgun) or perk_exists(player, Perk_Pact_Pistol))
    {
        target_cover = 0.0;
    }
    var target_distance = distance(target, player);
    var target_out_of_range = out_of_range_by(player.fighter.ranged_distance_min, player.fighter.ranged_distance_max, target_distance);
    var target_range_penalty = get_range_penalty(player, target);
    var total_penalty = abs(target_cover*.01) + abs(target_range_penalty)
    var final_accuracy = player.fighter.ranged_accuracy - total_penalty + 0.5
        
    text = target_name+"#Cover: "+ string(target_cover) + "%";    
    text += "#Distance: "+string(target_distance)+"m"
    if(target_out_of_range != 0)
    {
        var plus = "";
        if(target_out_of_range>0)
        {
            plus = "+"
        }
        text += "("+plus+string(target_out_of_range)+"m)"
    }
    text += "#Distance Penalty: "+string(round(abs(target_range_penalty)*100.0))+"%"
    text += "##Pre-Defense"
    if(final_accuracy > 0.0)
    {
        text += "#Chance to hit: "+string(clamp(round(final_accuracy*100.0), 0.0, 100.0))+"%"
    }
    else
    {
        var glance = 0.0;
        if(final_accuracy < 0.0 and final_accuracy > -1.0)
        {
            glance = 1.0 - abs(final_accuracy);
        }
        text += "#Chance to glance: "+string(clamp(round(glance*100.0), 0.0, 100.0))+"%"
    }
}
else if (instance_exists(player))
{

}
draw_set_font(Courier_New);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(x,y, string_hash_to_newline(text));

