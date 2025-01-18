# Cycle game length

scoreboard players add @e[type=armor_stand,name=Game,scores={Length=5..}] Length 5
scoreboard players add @e[type=armor_stand,name=Game,scores={Length=2}] Length 3
scoreboard players add @e[type=armor_stand,name=Game,scores={Length=1}] Length 1
scoreboard players set @e[type=armor_stand,name=Game,scores={Length=15}] Length 1

function entrapment:control/lengthsign {length:1, description:"Blitz"}
function entrapment:control/lengthsign {length:2, description:"Short"}
function entrapment:control/lengthsign {length:5, description:"Slow"}
function entrapment:control/lengthsign {length:10, description:"Marathon"}
