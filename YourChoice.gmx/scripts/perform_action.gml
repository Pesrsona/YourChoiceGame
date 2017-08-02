//argumen0 - unit performing the action
//argument1 - action to be performed

unit = argument0;
action = argument1;

switch(action){
    case "END TURN":
        unit.state = "end turn";
        unit.attackTimer = 20;
        break;
}
