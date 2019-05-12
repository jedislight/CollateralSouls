/// @description get_menu_text(menu)
/// @param menu
{
    var menu = argument0;
    
    var text = menu.title + "#" + menu.text;
    var selected = noone;
    var max_items = 11;
    var index_start = menu.selected_index - max_items;
    var index_end =  menu.selected_index + max_items;
    
    var extra_front = -min(0,index_start);
    var extra_end = max(0, index_end - ds_list_size(menu.menu_items));
    
    index_start -= extra_end;
    index_end += extra_front;
    
    index_start = max(0, index_start)
    index_end = min(ds_list_size(menu.menu_items), index_end);
    
    if(index_start != 0)
    {
        text += "# . . ."
    }
    for( var i = index_start; i < index_end; ++i)
    {
        var menu_item = menu.menu_items[|i];
        var header = "# ";
        if(i == menu.selected_index)
        {
            header = "#>";
            selected = menu_item;
        }   
        
        text += header + menu_item.text;
    }
    if(index_end != ds_list_size(menu.menu_items))
    {
        text += "# . . ."
    }
    if(instance_exists(selected))
    {
        text += "##" + selected.detail;
    }
    
    return text;
}
