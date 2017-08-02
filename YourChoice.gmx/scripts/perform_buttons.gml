//argument0 - unit performing the action
//argument1 - button pressed

unit = argument0;
button = argument1;

switch(button.title){
    case "END TURN":
        unit.state = "perform action";
        unit.readiedAction = "END TURN";
        unit.TargetingType = "none";
        
        wipe_tiles();

}
