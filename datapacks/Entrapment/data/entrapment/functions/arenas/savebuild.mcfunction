# Set up build arena for saving

say Setting up @e[type=armor_stand,scores={Selected=1..}] for save. You will need to manually hit save on all 12 stucture blocks

execute positioned 983 36 -1 run function entrapment:arenas/setbuild

data modify block 942 33 0 mode set value "SAVE"
data modify block 984 33 0 mode set value "SAVE"
data modify block 942 33 32 mode set value "SAVE"
data modify block 984 33 32 mode set value "SAVE"
data modify block 942 33 64 mode set value "SAVE"
data modify block 984 33 64 mode set value "SAVE"
data modify block 942 35 0 mode set value "SAVE"
data modify block 984 35 0 mode set value "SAVE"
data modify block 942 35 32 mode set value "SAVE"
data modify block 984 35 32 mode set value "SAVE"
data modify block 942 35 64 mode set value "SAVE"
data modify block 984 35 64 mode set value "SAVE"
