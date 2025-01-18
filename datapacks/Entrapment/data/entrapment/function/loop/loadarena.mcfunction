# Kill anything remaining from before
execute if score $Game Tick matches 1 run tp @e[x=-72,y=210,z=-15,dx=144,dy=60,dz=120,type=!player] 0 -100 0

# Set air to all the redstone block locations
execute if score $Game Tick matches 1 positioned -59 221 1 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 21 221 1 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -27 221 1 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 53 221 1 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -59 221 33 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 21 221 33 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -27 221 33 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 53 221 33 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -59 221 65 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 21 221 65 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -27 221 65 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 53 221 65 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -59 224 1 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 21 224 1 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -27 224 1 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 53 224 1 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -59 224 33 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 21 224 33 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -27 224 33 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 53 224 33 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -59 224 65 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 21 224 65 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned -27 224 65 run function entrapment:arenas/prepare
execute if score $Game Tick matches 1 positioned 53 224 65 run function entrapment:arenas/prepare

# 0 0 0 structure block
execute if score $Game Tick matches 1 run data modify block -59 221 1 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[0]
execute if score $Game Tick matches 1 run setblock -59 222 1 redstone_block

execute if score $Game Tick matches 4 run data modify block 21 221 1 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[0]
execute if score $Game Tick matches 4 run setblock 21 222 1 redstone_block

# 1 0 0 structure block

execute if score $Game Tick matches 7 run data modify block -27 221 1 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[3]
execute if score $Game Tick matches 7 run setblock -27 222 1 redstone_block

execute if score $Game Tick matches 10 run data modify block 53 221 1 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[3]
execute if score $Game Tick matches 10 run setblock 53 222 1 redstone_block

# 0 0 1 structure block
execute if score $Game Tick matches 13 run data modify block -59 221 33 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[1]
execute if score $Game Tick matches 13 run setblock -59 222 33 redstone_block

execute if score $Game Tick matches 16 run data modify block 21 221 33 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[1]
execute if score $Game Tick matches 16 run setblock 21 222 33 redstone_block

# 1 0 1 structure block

execute if score $Game Tick matches 19 run data modify block -27 221 33 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[4]
execute if score $Game Tick matches 19 run setblock -27 222 33 redstone_block

execute if score $Game Tick matches 22 run data modify block 53 221 33 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[4]
execute if score $Game Tick matches 22 run setblock 53 222 33 redstone_block

# 0 0 2 structure block

execute if score $Game Tick matches 25 run data modify block -59 221 65 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[2]
execute if score $Game Tick matches 25 run setblock -59 222 65 redstone_block

execute if score $Game Tick matches 28 run data modify block 21 221 65 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[2]
execute if score $Game Tick matches 28 run setblock 21 222 65 redstone_block

# 1 0 2 structure block

execute if score $Game Tick matches 31 run data modify block -27 221 65 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[5]
execute if score $Game Tick matches 31 run setblock -27 222 65 redstone_block

execute if score $Game Tick matches 34 run data modify block 53 221 65 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[5]
execute if score $Game Tick matches 34 run setblock 53 222 65 redstone_block

# 0 1 0 structure block

execute if score $Game Tick matches 37 run data modify block -59 224 1 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[6]
execute if score $Game Tick matches 37 run setblock -59 225 1 redstone_block

execute if score $Game Tick matches 40 run data modify block 21 224 1 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[6]
execute if score $Game Tick matches 40 run setblock 21 225 1 redstone_block

# 1 1 0 structure block

execute if score $Game Tick matches 43 run data modify block -27 224 1 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[9]
execute if score $Game Tick matches 43 run setblock -27 225 1 redstone_block

execute if score $Game Tick matches 46 run data modify block 53 224 1 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[9]
execute if score $Game Tick matches 46 run setblock 53 225 1 redstone_block

# 0 1 1 structure block

execute if score $Game Tick matches 49 run data modify block -59 224 33 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[7]
execute if score $Game Tick matches 49 run setblock -59 225 33 redstone_block

execute if score $Game Tick matches 52 run data modify block 21 224 33 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[7]
execute if score $Game Tick matches 52 run setblock 21 225 33 redstone_block

# 1 1 1 structure block

execute if score $Game Tick matches 55 run data modify block -27 224 33 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[10]
execute if score $Game Tick matches 55 run setblock -27 225 33 redstone_block

execute if score $Game Tick matches 58 run data modify block 53 224 33 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[10]
execute if score $Game Tick matches 58 run setblock 53 225 33 redstone_block

# 0 1 2 structure block

execute if score $Game Tick matches 61 run data modify block -59 224 65 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[8]
execute if score $Game Tick matches 61 run setblock -59 225 65 redstone_block

execute if score $Game Tick matches 64 run data modify block 21 224 65 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[8]
execute if score $Game Tick matches 64 run setblock 21 225 65 redstone_block

# 1 1 2 structure block
 
execute if score $Game Tick matches 67 run data modify block -27 224 65 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[11]
execute if score $Game Tick matches 67 run setblock -27 225 65 redstone_block

execute if score $Game Tick matches 70 run data modify block 53 224 65 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].components.minecraft:custom_data.files[11]
execute if score $Game Tick matches 70 run setblock 53 225 65 redstone_block

kill @e[type=minecraft:item]
