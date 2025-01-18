# Toggle friendly fire

scoreboard players add @e[type=armor_stand,name=Game] SpectatorLock 1
scoreboard players set @e[type=armor_stand,name=Game,scores={SpectatorLock=3}] SpectatorLock 0
execute if entity @e[type=armor_stand,name=Game,scores={SpectatorLock=0}] run data merge block -2 251 144 {front_text:{messages:['{"text":"Spectators:","color":"white"}','{"text":""}','[{"text":"Free","color":"gold","clickEvent":{"action":"run_command","value":"/trigger Action set 13"}}]','{"text":""}']}}
execute if entity @e[type=armor_stand,name=Game,scores={SpectatorLock=1}] run data merge block -2 251 144 {front_text:{messages:['{"text":"Spectators:","color":"white"}','{"text":""}','[{"text":"Locked With Team","color":"gold","clickEvent":{"action":"run_command","value":"/trigger Action set 13"}}]','{"text":""}']}}
execute if entity @e[type=armor_stand,name=Game,scores={SpectatorLock=2}] run data merge block -2 251 144 {front_text:{messages:['{"text":"Spectators:","color":"white"}','{"text":""}','[{"text":"Locked On Player","color":"gold","clickEvent":{"action":"run_command","value":"/trigger Action set 13"}}]','{"text":""}']}}
