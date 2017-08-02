///color move tiles
//argument0 - tile ID to color
//argument1 - selected unit move
//argument2 - selected units actionPoints

var tile, move, actions;
tile = argument0;
move = argument1;
actions = argument2;

if(actions > 1){
    if(tile.GScore > move){
        tile.color = c_yellow;
    }else{
        tile.color = c_aqua;
    }
}else{
    tile.color = c_yellow;
}
