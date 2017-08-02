//argument0 - actors whos buttons to create

unit = argument0;

buttonList = ds_list_create();

for(ii = 0; ii < ds_list_size(unit.defaultActions); ii +=1){
    ds_list_add(buttonList, ds_list_find_value(unit.defaultActions, ii));
}

buttonY = room_height - 48;

buttonX = room_width/2 - (ds_list_size(buttonList)-1)*96;

for(ii = 0; ii < ds_list_size(buttonList); ii += 1){
    button = ds_list_find_value(buttonList, ii);
    
    switch(button){
        case "end turn":
            with(instance_create(buttonX + (ii * 192),buttonY,obj_button)){
                    sprite_index = sprt_buttonEndTurn;
                   title = "END TURN";
                   
                   text = "Finish turn of current character";
                   
                   hotKey = "e";
            }
        break;
    }
}

ds_list_destroy(buttonList);

