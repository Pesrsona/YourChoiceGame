//argument0 = unit performing the ranged attack

unit = argument0;

with(obj_unit){
    tempUnit = other.unit;
    
    if(army != tempUnit.army){
        if(!collision_line(x+GRID_SIZE/2,y+GRID_SIZE/2,tempUnit.x+GRID_SIZE/2,tempUnit.y+GRID_SIZE/2,obj_wall,false,false)){
            map[gridX,gridY].attackTile = true;
            map[gridX,gridY].color = c_red;
        }
        
    }    
}
