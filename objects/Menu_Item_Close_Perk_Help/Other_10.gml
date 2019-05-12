var active = get_active_menu();
while(active != noone and active.title == "Perk Guide")
{
    pop_active_menu();
    active = get_active_menu()
}
pop_active_menu()

