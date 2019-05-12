{
    if(background_exists(Renderer.tile_background))
    {
        background_delete(Renderer.tile_background);
    }
    
    var file = argument0;
    if(not file_exists(file))
    {
        file = "tileset_ASCII.png";
    }
    Renderer.tile_background = background_add(file, false, false);
}
