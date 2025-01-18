# Add added danger time per round

scoreboard players add @e[type=armor_stand,name=Game] DangerTimeInc 5
scoreboard players set @e[type=armor_stand,name=Game,scores={DangerTimeInc=35}] DangerTimeInc 0
data merge block -2 253 144 {front_text:{messages:['{"text":"Danger Time Added","color":"white"}','{"text":"Each Round:","color":"white"}','{"text":""}','[{"score":{"objective":"DangerTimeInc","name":"@e[type=armor_stand,name=Game]"},"color":"gold","clickEvent":{"action":"run_command","value":"/trigger Action set 9"}},{"text":" seconds","color":"gold"}]']}}
