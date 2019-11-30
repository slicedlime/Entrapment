# Prepare build area structure blocks for save/load

setblock ~-41 ~-3 ~1 minecraft:air
setblock ~-41 ~-3 ~1 minecraft:structure_block{ignoreEntities:0b,posX:2,posY:-32,posZ:0,sizeX:32,sizeY:3,sizeZ:32}
data modify block ~-41 ~-3 0 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[0]

setblock ~1 ~-3 ~1 minecraft:air
setblock ~1 ~-3 ~1 minecraft:structure_block{ignoreEntities:0b,posX:-8,posY:-32,posZ:0,sizeX:7,sizeY:3,sizeZ:32}
data modify block ~1 ~-3 0 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[3]

setblock ~-41 ~-3 ~33 minecraft:air
setblock ~-41 ~-3 ~33 minecraft:structure_block{ignoreEntities:0b,posX:2,posY:-32,posZ:0,sizeX:32,sizeY:3,sizeZ:32}
data modify block ~-41 ~-3 32 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[1]

setblock ~1 ~-3 ~33 minecraft:air
setblock ~1 ~-3 ~33 minecraft:structure_block{ignoreEntities:0b,posX:-8,posY:-32,posZ:0,sizeX:7,sizeY:3,sizeZ:32}
data modify block ~1 ~-3 32 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[4]

setblock ~-41 ~-3 ~65 minecraft:air
setblock ~-41 ~-3 ~65 minecraft:structure_block{ignoreEntities:0b,posX:2,posY:-32,posZ:0,sizeX:32,sizeY:3,sizeZ:31}
data modify block ~-41 ~-3 64 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[2]

setblock ~1 ~-3 ~65 minecraft:air
setblock ~1 ~-3 ~65 minecraft:structure_block{ignoreEntities:0b,posX:-8,posY:-32,posZ:0,sizeX:7,sizeY:3,sizeZ:31}
data modify block ~1 ~-3 64 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[5]

setblock ~-41 ~-1 ~1 minecraft:air
setblock ~-41 ~-1 ~1 minecraft:structure_block{ignoreEntities:0b,posX:2,posY:-31,posZ:0,sizeX:32,sizeY:32,sizeZ:32}
data modify block ~-41 ~-1 0 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[6]

setblock ~1 ~-1 ~1 minecraft:air
setblock ~1 ~-1 ~1 minecraft:structure_block{ignoreEntities:0b,posX:-8,posY:-31,posZ:0,sizeX:7,sizeY:32,sizeZ:32}
data modify block ~1 ~-1 0 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[9]

setblock ~-41 ~-1 ~33 minecraft:air
setblock ~-41 ~-1 ~33 minecraft:structure_block{ignoreEntities:0b,posX:2,posY:-31,posZ:0,sizeX:32,sizeY:32,sizeZ:32}
data modify block ~-41 ~-1 32 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[7]

setblock ~1 ~-1 ~33 minecraft:air
setblock ~1 ~-1 ~33 minecraft:structure_block{ignoreEntities:0b,posX:-8,posY:-31,posZ:0,sizeX:7,sizeY:32,sizeZ:32}
data modify block ~1 ~-1 32 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[10]

setblock ~-41 ~-1 ~65 minecraft:air
setblock ~-41 ~-1 ~65 minecraft:structure_block{ignoreEntities:0b,posX:2,posY:-31,posZ:0,sizeX:32,sizeY:32,sizeZ:31}
data modify block ~-41 ~-1 64 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[8]

setblock ~1 ~-1 ~65 minecraft:air
setblock ~1 ~-1 ~65 minecraft:structure_block{ignoreEntities:0b,posX:-8,posY:-31,posZ:0,sizeX:7,sizeY:32,sizeZ:31}
data modify block ~1 ~-1 64 name set from entity @e[type=armor_stand,scores={Selected=1..},limit=1] ArmorItems[3].tag.files[11]
