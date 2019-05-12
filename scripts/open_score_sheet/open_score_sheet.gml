/// @description open_score_sheet
{
 /*
 Floor Complete!

Floor ScoreGameScore
Hits Taken #####/10   ######/10#
Explored ###%##/10###%###/10#
Enemies Left####/10######/10#
Full Heal Perk###/10######/10#
Accuracy###%##/10###%###/10#
Survival BonusYES/NO1010#10#/10#
Idle Time###s##/10####s###/10#
Collapse Bonus##-----#####/20
*/   
    var text = "";
    var scored_floors = min(Player.floors_covered, Simulation.final_floor-1);
    text += "#";
    text += rpad("", 18-2) + lpad("Floor", 8) + lpad("Score", 8) + lpad("Game", 8) + lpad("Score", 8);

    text += rpad("##Hits Taken", 18)
    text += lpad(Simulation.score_keeper.floor_hits_taken, 8) 
    text += lpad(string(Simulation.score_keeper.floor_hits_taken_score)+"/10", 8) 
    text += lpad(Simulation.score_keeper.game_hits_taken, 8) 
    text += lpad(string(Simulation.score_keeper.game_hits_taken_score) + "/" + string(10*scored_floors), 8);
    
    text += rpad("##Explored", 18) + lpad(string(round(Simulation.score_keeper.floor_exploration_percent*100))+"%", 8) + lpad(string(Simulation.score_keeper.floor_exploration_score)+"/10", 8) + lpad(string(round(Simulation.score_keeper.game_exploration_percent*100))+"%", 8) + lpad(string(Simulation.score_keeper.game_exploration_score) + "/" + string(10*scored_floors),8);    
    text += rpad("##Enemies Left", 18) + lpad(Simulation.score_keeper.floor_enemies_left, 8) + lpad(string(Simulation.score_keeper.floor_enemies_left_score)+"/10", 8) + lpad(Simulation.score_keeper.game_enemies_left, 8) +  lpad(string(Simulation.score_keeper.game_enemies_left_score) + "/" + string(10*scored_floors),8);    
    text += rpad("##Full Heal Perk", 18) + lpad(Simulation.score_keeper.floor_full_heal_bonus, 8) + lpad(string(Simulation.score_keeper.floor_full_heal_bonus_score)+"/10", 8) + lpad(Simulation.score_keeper.game_full_heal_bonus, 8) +  lpad(string(Simulation.score_keeper.game_full_heal_bonus_score) + "/" + string(10*scored_floors),8);        
    text += rpad("##Accuracy", 18) + lpad(as_percent(Simulation.score_keeper.floor_accuracy), 8) + lpad(string(Simulation.score_keeper.floor_accuracy_score)+"/10", 8) + lpad(as_percent(Simulation.score_keeper.game_accuracy), 8) +  lpad(string(Simulation.score_keeper.game_accuracy_score) + "/" + string(10*scored_floors),8);        
    text += rpad("##Survival Bonus", 18) + lpad(Simulation.score_keeper.floor_survival_bonus, 8) + lpad(string(Simulation.score_keeper.floor_survival_bonus_score)+"/10", 8) + lpad(Simulation.score_keeper.game_survival_bonus, 8) +  lpad(string(Simulation.score_keeper.game_survival_bonus_score) + "/" + string(10*scored_floors),8);        
    text += rpad("##Idle Time", 18) + lpad(round(Simulation.score_keeper.floor_idle_time), 8) + lpad(string(Simulation.score_keeper.floor_idle_time_score)+"/10", 8) + lpad(round(Simulation.score_keeper.game_idle_time), 8) +  lpad(string(Simulation.score_keeper.game_idle_time_score) + "/" + string(10*scored_floors),8);            
    text += rpad("##Collapse Bonus", 18) + lpad(Simulation.score_keeper.floor_collapse_bonus, 8) + lpad("-----", 8) + lpad(Simulation.score_keeper.game_collapse_bonus, 8) +  lpad(string(Simulation.score_keeper.game_collapse_bonus_score) + "/" + "20",8);
    text += "####"
    text += "#Overal Score : " + string(get_game_score_total()) + "/1000";
    text += "##"
    
    // text += lpad("#Hits Taken", 18) + lpad(floor_stat, 8) + lpad(floor_score, 8) + lpad(game_stat, 8) + game_score;    
    var sheet = new_menu("Floor Complete!", text);    
    var menu_item_close_with_screencap = new_menu_item(sheet, Menu_Item_Close_With_Screencap, "Continue", "");
    menu_item_close_with_screencap.filename = Player.name + "_scoresheet.png"
    return sheet
}
