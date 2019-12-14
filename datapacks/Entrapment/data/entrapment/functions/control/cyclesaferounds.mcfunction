# Cycle rounds before danger time starts increasing

scoreboard players add @e[type=armor_stand,name=Game] SafeRounds 1
scoreboard players set @e[type=armor_stand,name=Game,scores={SafeRounds=21..}] SafeRounds 0
execute as @e[type=armor_stand,name=Game] unless score @s SafeRounds matches 1 run data merge block -1 253 144 {Text1:'{"text":"Rounds Before","color":"white"}',Text2:'{"text":"Danger Time Add:","color":"white"}',Text3:'{"text":""}',Text4:'[{"score":{"objective":"SafeRounds","name":"@e[type=armor_stand,name=Game]"},"color":"gold","clickEvent":{"action":"run_command","value":"/trigger Action set 11"}},{"text":" rounds","color":"gold"}]'}
execute as @e[type=armor_stand,name=Game] if score @s SafeRounds matches 1 run data merge block -1 253 144 {Text1:'{"text":"Rounds Before","color":"white"}',Text2:'{"text":"Danger Time Add:","color":"white"}',Text3:'{"text":""}',Text4:'[{"score":{"objective":"SafeRounds","name":"@e[type=armor_stand,name=Game]"},"color":"gold","clickEvent":{"action":"run_command","value":"/trigger Action set 11"}},{"text":" round","color":"gold"}]'}
