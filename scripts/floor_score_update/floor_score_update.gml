{
    var player = instance_find(Player,0);
    var menu = noone;
    Simulation.score_keeper.game_collapse_bonus = min(Simulation.score_keeper.game_collapse_bonus, 20);
    if(instance_exists(player) and Player.floors_covered != 0)
    {
        if(Player.floors_covered != Simulation.final_floor)
        {
            Simulation.score_keeper.floor_enemies_left = 0;
            with(Creature)
            {
                Simulation.score_keeper.floor_enemies_left += 1;
                Simulation.score_keeper.game_enemies_left += 1;
            }
            
            var exploreable = 0;   
            var explored = 0;
            for(var xx = 0; xx < Simulation.grid_width; ++xx) for(var yy = 0; yy < Simulation.grid_height; ++yy)
            {
                if(is_possibly_passable(xx, yy))
                {
                    exploreable += 1;
                    if(Simulation.explored_grid[#xx,yy] == true)
                    {
                        explored += 1;
                    }
                }
            }
            Simulation.score_keeper.floor_exploration_percent = explored / exploreable;
            Simulation.score_keeper.game_exploration_percent = (Simulation.score_keeper.game_exploration_percent * (player.floors_covered-1) + Simulation.score_keeper.floor_exploration_percent) / (player.floors_covered)
            
            Simulation.score_keeper.game_full_heal_bonus += Simulation.score_keeper.floor_full_heal_bonus;        
            Simulation.score_keeper.floor_survival_bonus = player.fighter.hp > 0;        
            if(Simulation.score_keeper.floor_survival_bonus)
            {
                Simulation.score_keeper.game_survival_bonus += 1;
            }
            Simulation.score_keeper.game_idle_time += Simulation.score_keeper.floor_idle_time;
            if(player.hits_this_floor > 0)
            {
                Simulation.score_keeper.floor_accuracy = player.hits_this_floor / player.attacks_this_floor ;
            }
            else
            {
                Simulation.score_keeper.floor_accuracy = 0.0;
            }
            player.hits_this_floor =0;
            player.attacks_this_floor = 0;
            
            Simulation.score_keeper.game_accuracy = (Simulation.score_keeper.game_accuracy * (player.floors_covered-1) + Simulation.score_keeper.floor_accuracy) / (player.floors_covered)
            //floor scores
            var counter = 0;
            Simulation.score_keeper.floor_hits_taken_score = 0;
            for(var i = 10; i >= 0; --i)
            {
                counter += i;
                if(counter > Simulation.score_keeper.floor_hits_taken)
                {
                    Simulation.score_keeper.floor_hits_taken_score = i;
                    break;
                }   
            }
            
            Simulation.score_keeper.floor_exploration_score = round(((Simulation.score_keeper.floor_exploration_percent + 0.05)*10))
            Simulation.score_keeper.floor_accuracy_score = max(0,round(((Simulation.score_keeper.floor_accuracy)*20)-10))
            Simulation.score_keeper.floor_enemies_left_score = max(0, 10 - Simulation.score_keeper.floor_enemies_left);
            Simulation.score_keeper.floor_full_heal_bonus_score = max(0,10-(Simulation.score_keeper.game_full_heal_bonus * 2));
            Simulation.score_keeper.floor_idle_time_score = max(0,10-floor((Simulation.score_keeper.floor_idle_time/5)));
            Simulation.score_keeper.floor_survival_bonus_score = 10;
            if(Simulation.score_keeper.floor_survival_bonus != true)
            {
                Simulation.score_keeper.floor_survival_bonus_score = 0;   
            }
            //game scores
            Simulation.score_keeper.game_hits_taken_score += Simulation.score_keeper.floor_hits_taken_score;
            Simulation.score_keeper.game_exploration_score  += Simulation.score_keeper.floor_exploration_score ;
            Simulation.score_keeper.game_accuracy_score += Simulation.score_keeper.floor_accuracy_score;
            Simulation.score_keeper.game_enemies_left_score  += Simulation.score_keeper.floor_enemies_left_score ;
            Simulation.score_keeper.game_full_heal_bonus_score  += Simulation.score_keeper.floor_full_heal_bonus_score ;
            Simulation.score_keeper.game_idle_time_score  += Simulation.score_keeper.floor_idle_time_score ;
            Simulation.score_keeper.game_survival_bonus_score += Simulation.score_keeper.floor_survival_bonus_score;
            Simulation.score_keeper.game_collapse_bonus_score = Simulation.score_keeper.game_collapse_bonus;
        }
        
        //menu displaying scores
        menu = open_score_sheet();
        
        menu.text += "##Log:#"
        var grid_size = 16;
        var grid_height = Simulation.grid_height;
        var height = string_height_ext(string_hash_to_newline(menu.text), 16, grid_size * 40);
        height = floor(height);
        for(var i = 0; i <= ds_list_size(Player.history); i+=32)
        {
            menu.text += "#" ;//leave space
        }
        
        var color_log = instance_create(10*grid_size,0, Color_Log);
        color_log.height = height;
        ds_list_copy(color_log.history, Player.history);
        ds_list_copy(color_log.color_history, Player.color_history);
        
        //end reset
        Simulation.score_keeper.floor_idle_time = 0;
        Simulation.score_keeper.floor_survival_bonus = 0;
        Simulation.score_keeper.floor_full_heal_bonus = 0;
        Simulation.score_keeper.floor_exploration_percent = 0;
        Simulation.score_keeper.floor_enemies_left = 0;
        Simulation.score_keeper.floor_hits_taken = 0;
    }
    else
    {
        //game score resets
        with(Simulation.score_keeper){instance_destroy()}
        Simulation.score_keeper = instance_create(0,0, Score_Keeper);
    }
    
    return menu;
}
