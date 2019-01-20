# Set air to all the redstone block locations
execute if score $Game Tick matches 1 run setblock -59 222 1 air
execute if score $Game Tick matches 1 run setblock 21 222 1 air
execute if score $Game Tick matches 1 run setblock -27 222 1 air
execute if score $Game Tick matches 1 run setblock 53 222 1 air
execute if score $Game Tick matches 1 run setblock -59 222 33 air
execute if score $Game Tick matches 1 run setblock 21 222 33 air
execute if score $Game Tick matches 1 run setblock -27 222 1 air
execute if score $Game Tick matches 1 run setblock 53 222 33 air
execute if score $Game Tick matches 1 run setblock -59 222 65 air
execute if score $Game Tick matches 1 run setblock 21 222 65 air
execute if score $Game Tick matches 1 run setblock -27 222 65 air
execute if score $Game Tick matches 1 run setblock 53 222 65 air
execute if score $Game Tick matches 1 run setblock -59 254 1 air
execute if score $Game Tick matches 1 run setblock 21 254 1 air
execute if score $Game Tick matches 1 run setblock -27 254 1 air
execute if score $Game Tick matches 1 run setblock 53 254 1 air
execute if score $Game Tick matches 1 run setblock -59 254 33 air
execute if score $Game Tick matches 1 run setblock 21 254 33 air
execute if score $Game Tick matches 1 run setblock -27 254 33 air
execute if score $Game Tick matches 1 run setblock 53 254 33 air
execute if score $Game Tick matches 1 run setblock -59 254 65 air
execute if score $Game Tick matches 1 run setblock 21 254 65 air
execute if score $Game Tick matches 1 run setblock -27 254 65 air
execute if score $Game Tick matches 1 run setblock 53 254 65 air

# Clone 0 0 0 structure block
execute if score $Game Tick matches 1 at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~-1 ~ ~1 ~-1 ~ -59 223 1 replace
execute if score $Game Tick matches 1 run setblock -59 222 1 redstone_block

execute if score $Game Tick matches 4 at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~-1 ~ ~1 ~-1 ~ 21 223 1 replace
execute if score $Game Tick matches 4 run setblock 21 222 1 redstone_block

# Clone 1 0 0 structure block

execute if score $Game Tick matches 7 at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~-1 ~ ~2 ~-1 ~ -27 223 1 replace
execute if score $Game Tick matches 7 run setblock -27 222 1 redstone_block

execute if score $Game Tick matches 10 at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~-1 ~ ~2 ~-1 ~ 53 223 1 replace
execute if score $Game Tick matches 10 run setblock 53 222 1 redstone_block

# Clone 0 0 1 structure block
execute if score $Game Tick matches 13 at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~-1 ~1 ~1 ~-1 ~1 -59 223 33 replace
execute if score $Game Tick matches 13 run setblock -59 222 33 redstone_block

execute if score $Game Tick matches 16 at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~-1 ~1 ~1 ~-1 ~1 21 223 33 replace
execute if score $Game Tick matches 16 run setblock 21 222 33 redstone_block

# Clone 1 0 1 structure block

execute if score $Game Tick matches 19 at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~-1 ~1 ~2 ~-1 ~1 -27 223 33 replace
execute if score $Game Tick matches 19 run setblock -27 222 33 redstone_block

execute if score $Game Tick matches 22 at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~-1 ~1 ~2 ~-1 ~1 53 223 33 replace
execute if score $Game Tick matches 22 run setblock 53 222 33 redstone_block

# Clone 0 0 2 structure block

execute if score $Game Tick matches 25 at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~-1 ~2 ~1 ~-1 ~2 -59 223 65 replace
execute if score $Game Tick matches 25 run setblock -59 222 65 redstone_block

execute if score $Game Tick matches 28 at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~-1 ~2 ~1 ~-1 ~2 21 223 65 replace
execute if score $Game Tick matches 28 run setblock 21 222 65 redstone_block

# Clone 1 0 2 structure block

execute if score $Game Tick matches 31 at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~-1 ~2 ~2 ~-1 ~2 -27 223 65 replace
execute if score $Game Tick matches 31 run setblock -27 222 65 redstone_block

execute if score $Game Tick matches 34 at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~-1 ~2 ~2 ~-1 ~2 53 223 65 replace
execute if score $Game Tick matches 34 run setblock 53 222 65 redstone_block

# Clone 0 1 0 structure block

execute if score $Game Tick matches 37 at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~ ~ ~1 ~ ~ -59 255 1 replace
execute if score $Game Tick matches 37 run setblock -59 254 1 redstone_block

execute if score $Game Tick matches 40 at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~ ~ ~1 ~ ~ 21 255 1 replace
execute if score $Game Tick matches 40 run setblock 21 254 1 redstone_block

# Clone 1 1 0 structure block

execute if score $Game Tick matches 43 at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~ ~ ~2 ~ ~ -27 255 1 replace
execute if score $Game Tick matches 43 run setblock -27 254 1 redstone_block

execute if score $Game Tick matches 46 at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~ ~ ~2 ~ ~ 53 255 1 replace
execute if score $Game Tick matches 46 run setblock 53 254 1 redstone_block

# Clone 0 1 1 structure block

execute if score $Game Tick matches 49 at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~ ~1 ~1 ~ ~1 -59 255 33 replace
execute if score $Game Tick matches 49 run setblock -59 254 33 redstone_block

execute if score $Game Tick matches 52 at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~ ~1 ~1 ~ ~1 21 255 33 replace
execute if score $Game Tick matches 52 run setblock 21 254 33 redstone_block

# Clone 1 1 1 structure block

execute if score $Game Tick matches 55 at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~ ~1 ~2 ~ ~1 -27 255 33 replace
execute if score $Game Tick matches 55 run setblock -27 254 33 redstone_block

execute if score $Game Tick matches 58 at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~ ~1 ~2 ~ ~1 53 255 33 replace
execute if score $Game Tick matches 58 run setblock 53 254 33 redstone_block

# Clone 0 1 2 structure block

execute if score $Game Tick matches 61 at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~ ~2 ~1 ~ ~2 -59 255 65 replace
execute if score $Game Tick matches 61 run setblock -59 254 65 redstone_block

execute if score $Game Tick matches 64 at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~ ~2 ~1 ~ ~2 21 255 65 replace
execute if score $Game Tick matches 64 run setblock 21 254 65 redstone_block

# Clone 1 1 2 structure block

execute if score $Game Tick matches 67 at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~ ~2 ~2 ~ ~2 -27 255 65 replace
execute if score $Game Tick matches 67 run setblock -27 254 65 redstone_block

execute if score $Game Tick matches 70 at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~ ~2 ~2 ~ ~2 53 255 65 replace
execute if score $Game Tick matches 70 run setblock 53 254 65 redstone_block

kill @e[type=minecraft:item]
