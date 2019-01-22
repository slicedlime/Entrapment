execute as @e[name=Game] run say Setting up @e[type=armor_stand,scores={Selected=1..}] for save. You will need to manually hit save on all 12 stucture blocks

execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~-1 ~ ~1 ~-1 ~ 942 33 0 replace
data merge block 942 33 0 {posX:2,posY:-32,posZ:0,sizeX:32,sizeY:3,sizeZ:32,mode:"SAVE"}
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~-1 ~ ~2 ~-1 ~ 984 33 0 replace
data merge block 984 33 0 {posX:-8,posY:-32,posZ:0,sizeX:7,sizeY:3,sizeZ:32,mode:"SAVE"}
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~-1 ~1 ~1 ~-1 ~1 942 33 32 replace
data merge block 942 33 32 {posX:2,posY:-32,posZ:0,sizeX:32,sizeY:3,sizeZ:32,mode:"SAVE"}
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~-1 ~1 ~2 ~-1 ~1 984 33 32 replace
data merge block 984 33 32 {posX:-8,posY:-32,posZ:0,sizeX:7,sizeY:3,sizeZ:32,mode:"SAVE"}
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~-1 ~2 ~1 ~-1 ~2 942 33 64 replace
data merge block 942 33 64 {posX:2,posY:-32,posZ:0,sizeX:32,sizeY:3,sizeZ:31,mode:"SAVE"}
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~-1 ~2 ~2 ~-1 ~2 984 33 64 replace
data merge block 984 33 64 {posX:-8,posY:-32,posZ:0,sizeX:7,sizeY:3,sizeZ:31,mode:"SAVE"}
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~ ~ ~1 ~ ~ 942 35 0 replace
data merge block 942 35 0 {posX:2,posY:-31,posZ:0,sizeX:32,sizeY:32,sizeZ:32,mode:"SAVE"}
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~ ~ ~2 ~ ~ 984 35 0 replace
data merge block 984 35 0 {posX:-8,posY:-31,posZ:0,sizeX:7,sizeY:32,sizeZ:32,mode:"SAVE"}
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~ ~1 ~1 ~ ~1 942 35 32 replace
data merge block 942 35 32 {posX:2,posY:-31,posZ:0,sizeX:32,sizeY:32,sizeZ:32,mode:"SAVE"}
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~ ~1 ~2 ~ ~1 984 35 32 replace
data merge block 984 35 32 {posX:-8,posY:-31,posZ:0,sizeX:7,sizeY:32,sizeZ:32,mode:"SAVE"}
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~1 ~ ~2 ~1 ~ ~2 942 35 64 replace
data merge block 942 35 64 {posX:2,posY:-31,posZ:0,sizeX:32,sizeY:32,sizeZ:31,mode:"SAVE"}
execute at @e[type=armor_stand,scores={Selected=1..}] run clone ~2 ~ ~2 ~2 ~ ~2 984 35 64 replace
data merge block 984 35 64 {posX:-8,posY:-31,posZ:0,sizeX:7,sizeY:32,sizeZ:31,mode:"SAVE"}
