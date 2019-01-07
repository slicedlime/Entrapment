# Countdown state
scoreboard players add $Game Tick 1

# Title countdown
execute if score $Game Tick matches 20 run title @a subtitle [{"text":""}]
execute if score $Game Tick matches 200 run title @a title [{"text":"5"}]
execute if score $Game Tick matches 220 run title @a title [{"text":"4"}]
execute if score $Game Tick matches 240 run title @a title [{"text":"3"}]
execute if score $Game Tick matches 260 run title @a title [{"text":"2"}]
execute if score $Game Tick matches 280 run title @a title [{"text":"1"}]
execute if score $Game Tick matches 300 run function entrapment:game/startgame

# Countdown sounds
execute if score $Game Tick matches 200 as @a at @s run playsound minecraft:block.note.hat master @s
execute if score $Game Tick matches 220 as @a at @s run playsound minecraft:block.note.hat master @s
execute if score $Game Tick matches 240 as @a at @s run playsound minecraft:block.note.hat master @s
execute if score $Game Tick matches 260 as @a at @s run playsound minecraft:block.note.hat master @s
execute if score $Game Tick matches 280 as @a at @s run playsound minecraft:block.note.hat master @s

# Player control

clear @a

effect give @a instant_health 3 1 true
effect give @a[gamemode=adventure] weakness 2 255 true

kill @e[type=item,nbt={Item:{id:"minecraft:leather_helmet"}}]

# Arena loading

function entrapment:loop/loadarena
