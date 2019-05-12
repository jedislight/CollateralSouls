/// @description fighter_attack(attacker, target, ranged, [spread=0, true_damage=0, custom_hit_description="", no_fx=false])
/// @param attacker
/// @param  target
/// @param  ranged
/// @param  [spread=0
/// @param  true_damage=0
/// @param  custom_hit_description=""
/// @param  no_fx=false]
{
    var attacker = argument[0];
    var target = argument[1];
    var ranged = argument[2];
    var true_damage = 0;
    var custom_hit_description = "";
    var no_fx = false
    var bonus_damage_modifier = 1.0
    var paradox = false;
    if(argument_count > 6)
    {
        no_fx = argument[6];
    }
    if(argument_count > 4)
    {
        true_damage = argument[4];
    }
    if(argument_count > 5)
    {
        custom_hit_description = argument[5];
    }
    var spread = 0;
    Simulation.resting = false;
    
    if(ranged && attacker.charges && attacker.charged == false)
    {
        attacker.charged = true;
        var fx = instance_create(attacker.owner.x ,attacker.owner.y, FX_Charge);
        fx.color_start = attacker.ranged_color_start
        fx.color_end = attacker.ranged_color_end
        return 0;
    }
    attacker.charged = false;
    
    attacker.attacked_this_turn = true;
    if(not ranged and perk_exists(attacker.owner, Perk_Chakra))
    {
        attacker.attacked_this_turn = false;
    }
    
    if(attacker.owner.object_index == Player)
    {
        attacker.owner.attacked_this_turn = true;
    }
    
    if(argument_count > 3)
    {
        spread = argument[3];
    }
    
    if(perk_exists(attacker.owner, Perk_Flesh_Guise_Ritual))
    {
        var perk = perk_get(attacker.owner, Perk_Flesh_Guise_Ritual);
        perk.active = false;
        perk.remaining = 0;
    }
    
    if(ranged and perk_exists(attacker.owner, Perk_Shotgun) and spread == 0)
    {
        spread += 2;
        if( perk_exists(attacker.owner, Perk_Storm_Of_Vengance))
        {
            spread += 2;
        }
    }
    
    if (spread > 0)
    {
        for(var xx = target.owner.x - spread; xx < target.owner.x + spread; ++xx) 
        for(var yy = target.owner.y - spread; yy < target.owner.y + spread; ++yy)    
        {
            var secondary = is_fightable(xx,yy);
            
            if(instance_exists(secondary) and secondary != attacker.owner and secondary.fighter != target)
            {
                if(is_visible_quick(attacker.owner, secondary))
                {
                    fighter_attack(attacker, secondary.fighter, ranged, -1);
                }
            }
        }
    }
    if(spread != -1)
    {
        if(perk_exists(attacker.owner, Perk_Teleport_Ritual) and ranged)
        {
            var ritual = perk_get(attacker.owner, Perk_Teleport_Ritual);
            if(ritual.active)
            {
                var teleport_grid = ds_grid_create(3,3);
                ds_grid_clear(teleport_grid, false);
                for(var xx = 0; xx < 3; ++xx)for(var yy = 0; yy < 3; ++yy)
                {
                    teleport_grid[#xx, yy] = is_passable(target.owner.x+xx-1, target.owner.y+yy-1);
                }
                if(ds_grid_get_max(teleport_grid, 0,0,2,2))
                {
                    while(true)
                    {
                        var xx = irandom_range(0,2);
                        var yy = irandom_range(0,2);
                        if(teleport_grid[#xx,yy])
                        {
                            if(attacker.owner.visible)
                            {
                                instance_create(attacker.owner.x, attacker.owner.y, FX_Teleport_Source);
                            }
                            attacker.owner.x = target.owner.x+xx-1;
                            attacker.owner.y = target.owner.y+yy-1;
                            
                            instance_create(attacker.owner.x, attacker.owner.y, FX_Teleport_Target);
                            break;
                        }
                    }
                }
                ds_grid_destroy(teleport_grid);
            }
        }
    }
    
    if(perk_exists(attacker.owner, Perk_Telescape_Pact) and ranged and is_melee(attacker.owner, target.owner))
    {
        var tile = instance_choose(Object);

        var max_tries = 10;
        while(tile != noone and not is_passable(tile.x, tile.y) and max_tries > 0)
        {
            tile = instance_choose(Object);
            --max_tries;
        }
        if(max_tries > 0 and tile)
        {
            instance_create(attacker.owner.x, attacker.owner.y, FX_Teleport_Source);
            attacker.owner.x = tile.x;
            attacker.owner.y = tile.y;
            instance_create(attacker.owner.x, attacker.owner.y, FX_Teleport_Target);
        }
    }    
    
    var roll = random_range(0.0,1.0);
    var accuracy = attacker.accuracy;
    if(ranged)
    {
        accuracy = attacker.ranged_accuracy;
    }
    
    var attack_accuracy = accuracy
    //show_debug_message("base accuracy:" + string(attack_accuracy))
    if(ranged)
    {
        var ranged_penalty = get_range_penalty(attacker.owner, target.owner);
        //show_debug_message("ranged pen:" + string(ranged_penalty))
        var cover_penalty = (1-clamp(get_cover(attacker.owner, target.owner), 0.0,1.0));
        var armor = target.armor;
        
        //show_debug_message("cover_penalty:" + string(cover_penalty));

        if(perk_exists(attacker.owner, Perk_Storm_Of_Vengance))
        {
            armor = -armor;
        }
        if(perk_exists(attacker.owner, Perk_Holy_Fire) or perk_exists(attacker.owner, Perk_Pact_Pistol))
        {
            armor = 0.0;
        }
        if(perk_exists(attacker.owner, Perk_Called_Shots) and cover_penalty = 0.0)
        {
            armor = 0.0;   
            bonus_damage_modifier += perk_get(attacker.owner, Perk_Called_Shots).value;
        }
        
        if(perk_exists(attacker.owner, Perk_Shotgun) or perk_exists(attacker.owner, Perk_Pact_Pistol))
        {
            cover_penalty = 0.0;
        }
     
        //show_debug_message("target_armor:" + string(armor));
        attack_accuracy -= armor;
        attack_accuracy -= ranged_penalty;
        attack_accuracy -= cover_penalty;
    }
    else
    {
        var armor = target.armor;
        if(perk_exists(target.owner, Perk_Melee_Specialist))
        {
            armor += perk_get(target.owner, Perk_Melee_Specialist).defense;
        }
        if(perk_exists(attacker.owner, Perk_Ethereal))
        {
            armor = 0.0;
        }
        //show_debug_message("target_armor:" + string(armor));
        attack_accuracy -= armor;
    }
    //show_debug_message("attack accuracy pre-roll:" + string(attack_accuracy));
    attack_accuracy += roll;
    //show_debug_message("attack accuracy post-roll:" + string(attack_accuracy));
    var hit = random_range(-1.0, 0.0) < attack_accuracy;
    
    var dodged = false;
    if(perk_exists(target.owner, Perk_Ethereal) and target.attacked_this_turn == false and hit)
    {
        hit = random_range(0.0, 1.0) > perk_get(target.owner, Perk_Ethereal).value;
        if(hit == false)
        {
            dodged = true;
            log_message(target.owner.name + " fades out and avoids " + attacker.owner.name + "'s attack")
            if(attacker.owner.object_index == Player)
            {
                attacker.owner.hit_this_turn = true;
            }
        }
    }
    
    if( not ranged and perk_exists(attacker.owner, Perk_Beserker))
    {
        var beserker_perk = perk_get(attacker.owner, Perk_Beserker);
        var turns_since_damaged = attacker.owner.turns_taken - attacker.last_hit_taken_on - 1;
        var bonus = max(0.0, beserker_perk.value - beserker_perk.falloff * turns_since_damaged);
        show_debug_message("Beserker damage bonus: " + string(bonus) + " after " + string(turns_since_damaged) + " turns");
        bonus_damage_modifier += bonus;
    }
    
    if( perk_exists(target.owner, Perk_Initiative))
    {
        var init_perk = perk_get(target.owner, Perk_Initiative);
        var turns_since_damaged = target.owner.turns_taken - target.last_hit_taken_on - 1;
        var bonus = min(init_perk.value, init_perk.falloff * turns_since_damaged);
        show_debug_message("Initiative damage reduction: " + string(bonus) + " after " + string(turns_since_damaged) + " turns");
        bonus_damage_modifier -= bonus;
    }
    
    var base_damage = attacker.damage;
    base_damage *= bonus_damage_modifier;
    if(ranged)
    {
        base_damage = attacker.ranged_damage;
        if(perk_exists(attacker.owner, Perk_Heartseeker))
        {
            base_damage += target.seeker_bonus;
            target.seeker_bonus = 0;
        }
    }
    if(perk_exists(target.owner, Perk_Grace) and target.attacked_this_turn == false)
    {
        var grace_modifier = 1.0 - perk_get(target.owner, Perk_Grace).value;
        base_damage *= grace_modifier;   
    }
    //show_debug_message("Base damage: " + string(base_damage));
    var damage = ceil(max(1.0, attack_accuracy * base_damage));
    //show_debug_message("Final damage: " + string(damage));
    
    if(perk_exists(target.owner, Perk_Void_Armor))
    {
        damage = max(damage - perk_get(target.owner, Perk_Void_Armor).value, 0.0);
    }
    
    var heart_seeker_hit = false;
    var freezing_hit = false;
    if(true_damage != 0.0)
    {
        damage = true_damage;
        hit = true;
    }
    if(target.owner.frozen > 0)
    {
        damage = 0;
        var freezing_hit = true;
    }
    if(perk_exists(attacker.owner, Perk_Holy_Fire))
    {
        var perk = perk_get(attacker.owner, Perk_Holy_Fire);
        var burn_duration = perk.value;
        
        instance_deactivate_object(target.owner);
        instance_deactivate_object(attacker.owner);
        
        var c;
        do
        {
            c = noone;
            for(var xx = 0; xx <= 1; ++xx) for(var yy = 0; yy <= 1; ++yy)
            {
                if(c == noone)
                {
                    c = collision_line(attacker.owner.x+xx, attacker.owner.y+yy, target.owner.x, target.owner.y, Creature, false, false);
                }
                if(c == noone)
                {
                    c = collision_line(attacker.owner.x, attacker.owner.y, target.owner.x+xx, target.owner.y+yy, Creature, false, false);
                }
            }
            if(c != noone)
            {   
                c.fighter.burn_duration = burn_duration;
                c.fighter.burn_inflictor = attacker.owner;
                instance_deactivate_object(c.id);
            }
        }until(c == noone);
        
        instance_activate_all();
    }
    if(perk_exists(attacker.owner, Perk_Reaper) && attacker.chaining == false)
    {       
        var tx = target.owner.x;
        var ty = target.owner.y;
        instance_deactivate_object(target.owner);
        instance_deactivate_object(attacker.owner);
        
        var c;
        do
        {
            c = noone;
            for(var xx = 0; xx <= 1; ++xx) for(var yy = 0; yy <= 1; ++yy)
            {
                if(c == noone)
                {
                    c = collision_line(attacker.owner.x+xx, attacker.owner.y+yy, tx, ty, Creature, false, false);
                }
                if(c == noone)
                {
                    c = collision_line(attacker.owner.x, attacker.owner.y, tx+xx, ty+yy, Creature, false, false);
                }
            }
            if(c != noone)
            {   
                attacker.chaining = true;
                if(target != c.fighter)
                {
                    fighter_attack(attacker, c.fighter, ranged, spread, true_damage, custom_hit_description, true);
                }
                attacker.chaining = false;
                if(instance_exists(c))
                {
                    instance_deactivate_object(c.id);
                }
            }
        }until(c == noone);
        
        instance_activate_all();
    }
    var dead = false;
    if( hit )
    {
        if(damage > 0 and target.owner.object_index == Player)
        {
            Simulation.score_keeper.floor_hits_taken += 1;
            Simulation.score_keeper.game_hits_taken += 1;
        }
        if(attacker.owner.object_index == Player)
        {
            Player.hit_this_turn = true;
        }
        if(damage > 0 and target.level > 0 and perk_exists(attacker.owner, Perk_Skill_Pact))
        {
            attacker.ranged_accuracy += 0.001;
        }
        if(perk_exists(attacker.owner, Perk_Tentacle_Whip) and true_damage == 0 and target.level > 0)
        {
            var leechable_portion = min(target.hp, damage);
            var leech = power(power(leechable_portion/7.5, 2), 0.6);

            attacker.hp += leech;
            attacker.hp = clamp(attacker.hp, 0.0, attacker.hp_max);
            var fx = instance_create(target.owner.x*16, target.owner.y*16, FX_Regen);
            fx.target = attacker.owner;
        }
        if(ranged)
        {
            if(damage <= 1.0)
            {
                paradox = true;
            }
            if(perk_exists(attacker.owner, Perk_Inferno_Rounds_Ritual))
            {
                var perk = perk_get(attacker.owner, Perk_Inferno_Rounds_Ritual);
                if(perk.active)
                {
                    target.burn_duration += perk.value;
                    target.burn_inflictor = attacker.owner;
                }
            }
            if(perk_exists(attacker.owner, Perk_Holy_Fire))
            {
                var perk = perk_get(attacker.owner, Perk_Holy_Fire);
                target.burn_duration += perk.value;
                target.burn_inflictor = attacker.owner;
            }
            if(perk_exists(attacker.owner, Perk_Mindsight_Pact))
            {
                instance_create(target.owner.x,target.owner.y, One_Turn_Visibility_Source);
            }
            if(perk_exists(attacker.owner, Perk_Freezing_Pact) and target.hp == target.hp_max)
            {
                target.owner.frozen = 4;
                damage = 1;
                freezing_hit = true;
            }
        }
        var hit_description = attacker.hit_description;
        if(ranged)
        {
            hit_description = attacker.hit_description_ranged;   
        }
        
        if(custom_hit_description != "")
        {
            hit_description = custom_hit_description;
        }
        
        log_message(attacker.owner.name + hit_description + target.owner.name + " for " + string(damage) + " damage")
        target.hp -= damage;
        if(perk_exists(target.owner, Perk_Blood_Secret_Ritual))
        {
            var ritual = perk_get(target.owner, Perk_Blood_Secret_Ritual)
            if(ritual.active)
            {
                if(target.hp < ritual.limit)
                {
                    fighter_gain_xp(target, damage);
                    log_message(target.owner.name + " gains " + string(floor(damage)) + "XP from Blood Ritual");
                    ritual.limit = target.hp
                    show_debug_message("new blood ritual limit:" + string(ritual.limit));
                }
            }
        }
        var turn = target.owner.turns_taken;
        if(turn != target.last_hit_taken_on or damage > target.last_hit_taken and damage > 0)
        {
            target.last_hit_taken_on = turn;
            target.last_hit_taken = damage;
        }
        ga_design_value_event("damage:"+object_get_name(attacker.owner.object_index) + ":" + object_get_name(target.owner.object_index), damage);
        text_fx_color = target.owner.damage_fx_color;
        if(heart_seeker_hit)
        {
            text_fx_color = make_colour_rgb(255,196,119);
            show_debug_message("heartseeker_hit");
        }
        if(freezing_hit)
        {
            text_fx_color = make_colour_rgb(165,243,242);
        }
        create_floating_text_fx(target.owner.x, target.owner.y, damage, text_fx_color);
        dead = false;
        if(perk_exists(target.owner, Perk_Phoenix_Armor) and target.hp <= 0.0)
        {
            target.hp_max += target.hp-1.0;
            if(target.hp_max < 1.0)
            {
                dead = true;
            }
            else
            {
                target.hp = 1.0;
            }
        }
        else if(target.hp <= 0.0)
        {
            dead = true;
        }
        if(ranged)
        {
            if(not no_fx)
            {
                create_ranged_fx(attacker.owner, target.owner, 0, attacker.burst*2);
                if(dead and attacker.burst > 1)
                {
                    for(var i = attacker.burst; i > 0; --i)
                    {
                        create_ranged_fx(attacker.owner, target.owner, 0, i*2);
                    }
                }
            }
        }
        if(dead)
        {
            if(target.owner.nemesis and ds_map_exists(Simulation.nemesis.creatures, target.owner.name))
            {
                ds_map_delete(Simulation.nemesis.creatures, target.owner.name);
                nemesis_save();
            }
            create_death_fx(target.owner.x, target.owner.y);
            log_message(target.owner.name + " has perished")
            if(attacker.owner.object_index == Player and target.no_history==false and target.level > 0)
            {
                log_history(target.owner.glyph, target.owner.color);
            }
            
            if(target != attacker)
            {
                fighter_gain_xp(attacker, target.level)
                ga_design_value_event("kill:"+object_get_name(attacker.owner.object_index) + ":" + object_get_name(target.owner.object_index), damage);
                attacker.owner.kills += 1;
                if(perk_exists(attacker.owner, Perk_Background_Switch) && target.level > 0 && target.owner.no_mirror == false)
                {
                    mirror_stats(attacker.owner, target.owner);
                }
            }

            if(perk_exists(attacker.owner, Perk_Background_Sadist) and not condition_exists(Condition_No_Regeneration) and target.level > 0)
            {
                attacker.hp += attacker.hp_max/45.0;
                attacker.hp = min(attacker.hp_max, attacker.hp);
                var fx = instance_create(target.owner.x*16, target.owner.y*16, FX_Regen);
                fx.target = attacker.owner;
            }
            if(target.owner.object_index == Player and attacker.owner.object_index != Player)
            {
                if(not condition_exists(Condition_Seeded) and instance_number(Actor) == 0)
                {
                    nemesis_promote(attacker.owner);
                }
            }
            show_debug_message("Combat destroy instance");
            with(target.owner){instance_destroy()}
            if(perk_exists(attacker.owner, Perk_Flesh_Guise_Ritual))
            {
                var perk = perk_get(attacker.owner, Perk_Flesh_Guise_Ritual);
                perk.ready = true;
            }
        }
    }    
    else
    {
        ga_design_value_event("miss:"+object_get_name(attacker.owner.object_index) + ":" + object_get_name(target.owner.object_index), damage);
        if(ranged)
        {
            create_ranged_fx(attacker.owner, target.owner, 1.0, attacker.burst*2);
        }
        if (not dodged)
        {
            log_message(attacker.owner.name + attacker.miss_description + target.owner.name)
        }
        paradox = true;
    }
    
    if(paradox and perk_exists(attacker.owner, Perk_Paradox_Trigger) and attacker.owner.object_index == Player)
    {
        var nextClosestTarget = noone;
        var targeting = Simulation.targeting;
        var targets = targeting.targets;
        var index = ds_list_find_index(targets, target.owner) - 1;
        
        if(index >= 0)
        {
            nextClosestTarget = targets[|index];
        }
        
        if(nextClosestTarget != noone)
        {
            fighter_attack(attacker, nextClosestTarget.fighter, ranged, spread, true_damage, custom_hit_description, no_fx);               
        }
    }
    
    if(attacker.burst > 1 and ranged)
    {
        var burst_backup = attacker.burst;
        var acc_backup = attacker.ranged_accuracy;
        attacker.burst -= 1;
        attacker.ranged_accuracy -= 1.0;
        if(not dead)
        {
            fighter_attack(attacker, target, ranged, spread, true_damage, custom_hit_description, no_fx);
        }
        attacker.burst = burst_backup;
        attacker.ranged_accuracy = acc_backup;
    }
}
