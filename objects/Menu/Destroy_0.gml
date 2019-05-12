while(!ds_list_empty(menu_items))
{
    with(menu_items[|0]){instance_destroy()};
    ds_list_delete(menu_items, 0);
}
ds_list_destroy(menu_items);

