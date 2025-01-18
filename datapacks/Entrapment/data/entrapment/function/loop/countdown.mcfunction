# Countdown state
scoreboard players add $Game Tick 1

# Title countdown
execute if score $Game Tick matches ..299 run title @a subtitle [{"text":"Please stand by"}]
execute if score $Game Tick matches 300 run title @a subtitle [{"text":""}]
execute if score $Game Tick matches 300 run title @a title [{"text":"5"}]
execute if score $Game Tick matches 320 run title @a title [{"text":"4"}]
execute if score $Game Tick matches 340 run title @a title [{"text":"3"}]
execute if score $Game Tick matches 360 run title @a title [{"text":"2"}]
execute if score $Game Tick matches 380 run title @a title [{"text":"1"}]
execute if score $Game Tick matches 400 run function entrapment:game/startgame

# Countdown sounds
execute if score $Game Tick matches 300 as @a at @s run playsound minecraft:block.note_block.hat master @s
execute if score $Game Tick matches 320 as @a at @s run playsound minecraft:block.note_block.hat master @s
execute if score $Game Tick matches 340 as @a at @s run playsound minecraft:block.note_block.hat master @s
execute if score $Game Tick matches 360 as @a at @s run playsound minecraft:block.note_block.hat master @s
execute if score $Game Tick matches 380 as @a at @s run playsound minecraft:block.note_block.hat master @s

# Player control

clear @a

effect give @a instant_health 3 1 true
effect give @a[gamemode=adventure] weakness 2 255 true

kill @e[type=item,nbt={Item:{id:"minecraft:leather_helmet"}}]

# Arena loading

function entrapment:loop/loadarena
