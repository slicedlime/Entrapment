# Set up build arena for loading

say Loading @e[type=armor_stand,scores={Selected=1..}]

execute positioned 983 36 -1 run function entrapment:arenas/setbuild

data modify block 942 33 0 mode set value "LOAD"
data modify block 984 33 0 mode set value "LOAD"
data modify block 942 33 32 mode set value "LOAD"
data modify block 984 33 32 mode set value "LOAD"
data modify block 942 33 64 mode set value "LOAD"
data modify block 984 33 64 mode set value "LOAD"
data modify block 942 35 0 mode set value "LOAD"
data modify block 984 35 0 mode set value "LOAD"
data modify block 942 35 32 mode set value "LOAD"
data modify block 984 35 32 mode set value "LOAD"
data modify block 942 35 64 mode set value "LOAD"
data modify block 984 35 64 mode set value "LOAD"

setblock 942 34 0 redstone_block
setblock 984 34 0 redstone_block
setblock 942 34 32 redstone_block
setblock 984 34 32 redstone_block
setblock 942 34 64 redstone_block
setblock 984 34 64 redstone_block

setblock 942 34 0 air
setblock 984 34 0 air
setblock 942 34 32 air
setblock 984 34 32 air
setblock 942 34 64 air
setblock 984 34 64 air
