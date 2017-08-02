//argument0 - unit we are calculating range for

unit = argument0;

with(obj_unit){
    if(army != other.unit.army){
        tempX = abs(gridX - other.unit.gridX);
        tempY = abs(gridY - other.unit.gridY);
        
        if(tempX <= 1 && tempY <= 1){
            map[gridX,gridY].attackTile = true;
            map[gridX,gridY].color = c_red;
        }
        
    }
    
}
