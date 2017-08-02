//argument0 - tile where unit starts
//argument1 - units movements range
//argument2 - units remaining action points

//reset all tile data
wipe_tiles();

var open, closed;
var start, current, neighbor;
var tempGScore, range, costMod;

//declare relevant variables from arguments
start = argument0;
range = argument1 * argument2

//create data structures
open = ds_priority_create();
closed = ds_list_create();

//add starting node to open list
ds_priority_add(open, start, start.GScore);

//while open queue is NOT empty
//repeat following until all tiles have been checked
while(ds_priority_size(open) > 0){
    //remove tile with lowest GScore from open
    current = ds_priority_delete_min(open);
    
    //add taht tile to the closed list
    ds_list_add(closed, current);
    
    //step through all of current neighbors
    for(ii = 0; ii < ds_list_size(current.neighbors); ii += 1){
        //store current neighbor in neighbor var
        neighbor = ds_list_find_value(current.neighbors, ii);
        
        //add neighbor to open list of it qualifies
        //conditions: is passable, is not occupied, neighbors GSCORE is less than movement range, not on closed lst already
        if(ds_list_find_index(closed,neighbor) < 0 && neighbor.passable && neighbor.occupant == noone && neighbor.moveCost + current.GScore <= range){
            //calculate GScore for neighbor, if not already done so
            
            if(ds_priority_find_priority(open, neighbor) == 0 || ds_priority_find_priority(open, neighbor) == undefined){
                costMod = 1;
                
                //give neighbor appropriate parent
                neighbor.parent = current;
                
                //if tile is diagonal, create appropriate costMod
                if(neighbor.gridX != current.gridX && neighbor.gridY != current.gridY){
                    costMod = 1.5;
                }
                
                //calculate GScore of neighbor, with costMod in place
                neighbor.GScore = current.GScore + (neighbor.moveCost * costMod);
                
                //add neighbor to the open list so it can be checked out too;
                ds_priority_add(open, neighbor, neighbor.GScore);
                
            }else{
                //if GScore was already calculated for open list. Is there less costly path?
                costMod = 1;
                
                //if tile is diagonal, create costMod
                if(neighbor.gridX != current.gridX && neighbor.gridY != current.gridY){
                    costMod = 1.5;
                }
                tempGScore = current.GScore + (neighbor.moveCost * costMod)
                
                //check if GScore would be lower
                if(tempGScore < neighbor.GScore){
                    neighbor.parent = current;
                    neighbor.GScore = tempGScore;
                    ds_priority_change_priority(open, neighbor, neighbor.GScore);
                }
                
            }
        }
    }
} 

//round down all GScore for movement calculations
with(obj_tile){
    GScore = floor(GScore);
}

//release the memory
ds_priority_destroy(open);

//lets color move tiles

for(ii = 0; ii < ds_list_size(closed); ii += 1){
    current = ds_list_find_value(closed,ii);
    current.moveTile = true;
    
    color_move_tiles(current, argument1, argument2)
}

start.moveTile = false;
start.color = c_white;

//release memory
ds_list_destroy(closed);

start.moveTile = false;

create_buttons(start.occupant);


