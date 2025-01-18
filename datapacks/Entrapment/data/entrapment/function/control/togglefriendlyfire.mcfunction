# Toggle friendly fire

scoreboard players add @e[type=armor_stand,name=Game] FriendlyFire 1
scoreboard players set @e[type=armor_stand,name=Game,scores={FriendlyFire=2}] FriendlyFire 0
execute if entity @e[type=armor_stand,name=Game,scores={FriendlyFire=0}] run data merge block -1 251 144 {front_text:{messages:['{"text":"Friendly Fire:","color":"white"}','{"text":""}','[{"text":"Off","color":"gold","clickEvent":{"action":"run_command","value":"/trigger Action set 12"}}]','{"text":""}']}}
execute if entity @e[type=armor_stand,name=Game,scores={FriendlyFire=1}] run data merge block -1 251 144 {front_text:{messages:['{"text":"Friendly Fire:","color":"white"}','{"text":""}','[{"text":"On","color":"gold","clickEvent":{"action":"run_command","value":"/trigger Action set 12"}}]','{"text":""}']}}
