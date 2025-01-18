
# Place a valid loot chest at the position of @s

scoreboard players operation Selected TreasureSpawn = @s TreasureSpawn
execute as @e[type=armor_stand,scores={TreasureBinding=1..}] if score @s TreasureBinding = Selected TreasureSpawn at @s run clone ~-1 ~ ~ ~-1 ~ ~ 1008 1 0
execute at @s run clone 1008 1 0 1008 1 0 ~ ~ ~
setblock 1008 1 0 air

data merge entity @s {CustomName:"\"OldTChest\""}
