var text = "Best:"+string(best_score);
text += "#Species:"+string(species);
text += "#Generation:"+string(generation);
text += "#Runs:"+string(runs);
text += "#Session:"+string(this_session);

draw_set_font(Courier_New);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_text_colour(0,16*40,string_hash_to_newline(text),c_fuchsia, c_fuchsia, c_fuchsia, c_fuchsia, 1.0);

