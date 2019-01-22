execute as @e[name=Game] run say Loading @e[type=armor_stand,scores={Selected=1..}]
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~-1 ~ ~1 ~-1 ~ 944 3 0 replace
setblock 944 2 0 air
setblock 944 2 0 redstone_block
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~-1 ~ ~2 ~-1 ~ 976 3 0 replace
setblock 976 2 0 air
setblock 976 2 0 redstone_block
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~-1 ~1 ~1 ~-1 ~1 944 3 32 replace
setblock 944 2 32 air
setblock 944 2 32 redstone_block
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~-1 ~1 ~2 ~-1 ~1 976 3 32 replace
setblock 976 2 32 air
setblock 976 2 32 redstone_block
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~-1 ~2 ~1 ~-1 ~2 944 3 64 replace
setblock 944 2 64 air
setblock 944 2 64 redstone_block
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~-1 ~2 ~2 ~-1 ~2 976 3 64 replace
setblock 976 2 64 air
setblock 976 2 64 redstone_block
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~ ~ ~1 ~ ~ 944 35 0 replace
setblock 944 34 0 air
setblock 944 34 0 redstone_block
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~ ~ ~2 ~ ~ 976 35 0 replace
setblock 976 34 0 air
setblock 976 34 0 redstone_block
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~ ~1 ~1 ~ ~1 944 35 32 replace
setblock 944 34 32 air
setblock 944 34 32 redstone_block
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~ ~1 ~2 ~ ~1 976 35 32 replace
setblock 976 34 32 air
setblock 976 34 32 redstone_block
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~ ~2 ~1 ~ ~2 944 35 64 replace
setblock 944 34 64 air
setblock 944 34 64 redstone_block
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~ ~2 ~2 ~ ~2 976 35 64 replace
setblock 976 34 64 air
setblock 976 34 64 redstone_block
