# Cycle game length

scoreboard players add @e[type=armor_stand,name=Game,scores={Length=5..}] Length 5
scoreboard players add @e[type=armor_stand,name=Game,scores={Length=2}] Length 3
scoreboard players add @e[type=armor_stand,name=Game,scores={Length=1}] Length 1
scoreboard players set @e[type=armor_stand,name=Game,scores={Length=15}] Length 1

# Sign for length = 1
execute if entity @e[type=armor_stand,name=Game,scores={Length=1}] run data merge block -1 252 144 {Text1:'{"text":"Round Length:","color":"white"}',Text2:'{"text":""}',Text3:'{"text":"Blitz","clickEvent":{"action":"run_command","value":"/trigger Action set 2"},"color":"gold"}',Text4:'{"text":"(1 min)","clickEvent":{"action":"run_command","value":"/trigger Action set 2"},"color":"gold"}'}
# Sign for length = 2
execute if entity @e[type=armor_stand,name=Game,scores={Length=2}] run data merge block -1 252 144 {Text1:'{"text":"Round Length:","color":"white"}',Text2:'{"text":""}',Text3:'{"text":"Short","clickEvent":{"action":"run_command","value":"/trigger Action set 2"},"color":"gold"}',Text4:'{"text":"(2 min)","clickEvent":{"action":"run_command","value":"/trigger Action set 2"},"color":"gold"}'}
# Sign for length = 5
execute if entity @e[type=armor_stand,name=Game,scores={Length=5}] run data merge block -1 252 144 {Text1:'{"text":"Round Length:","color":"white"}',Text2:'{"text":""}',Text3:'{"text":"Slow","clickEvent":{"action":"run_command","value":"/trigger Action set 2"},"color":"gold"}',Text4:'{"text":"(5 min)","clickEvent":{"action":"run_command","value":"/trigger Action set 2"},"color":"gold"}'}
# Sign for length = 10
execute if entity @e[type=armor_stand,name=Game,scores={Length=10}] run data merge block -1 252 144 {Text1:'{"text":"Round Length:","color":"white"}',Text2:'{"text":""}',Text3:'{"text":"Marathon","clickEvent":{"action":"run_command","value":"/trigger Action set 2"},"color":"gold"}',Text4:'{"text":"(10 min)","clickEvent":{"action":"run_command","value":"/trigger Action set 2"},"color":"gold"}'}