# New round
scoreboard players add Total Round 1

# Check if odd or even round
scoreboard players add @e[type=armor_stand,name=Game] Round 1
scoreboard players set @e[type=armor_stand,name=Game,scores={Round=3}] Round 1

# Team teleports
execute if score @e[type=armor_stand,name=Game,limit=1] Round matches 1 run tp @a[team=red,gamemode=!creative] -40 236 -8 0 0
execute if score @e[type=armor_stand,name=Game,limit=1] Round matches 2 run tp @a[team=blue,gamemode=!creative] -40 236 -8 0 0
execute if score @e[type=armor_stand,name=Game,limit=1] Round matches 2 run tp @a[team=red,gamemode=!creative] 40 236 -8 0 0
execute if score @e[type=armor_stand,name=Game,limit=1] Round matches 1 run tp @a[team=blue,gamemode=!creative] 40 236 -8 0 0
execute as @a[gamemode=survival] run spawnpoint @s

# Resistance effect to all players to get around bad interpolation causing withering effects
effect give @a[gamemode=survival] minecraft:resistance 1 10 true

# Round length calculation
scoreboard players set @e[type=armor_stand,name=Game,scores={Length=1}] Tick 1200
scoreboard players set @e[type=armor_stand,name=Game,scores={Length=2}] Tick 2400
scoreboard players set @e[type=armor_stand,name=Game,scores={Length=5}] Tick 6000
scoreboard players set @e[type=armor_stand,name=Game,scores={Length=10}] Tick 12000
scoreboard players operation AddedTicks TimeIncrease = AddedTime TimeIncrease
scoreboard players operation AddedTicks TimeIncrease *= 20 Const
scoreboard players operation @e[type=armor_stand,name=Game] Tick += AddedTicks TimeIncrease
scoreboard players operation AddedTime TimeIncrease += @e[type=armor_stand,name=Game] TimeIncrease
execute if score @e[type=armor_stand,name=Game,limit=1] MaxTimeAdded matches 1.. run scoreboard players operation AddedTime TimeIncrease < Seconds MaxTimeAdded

# New chests
summon armor_stand -60 255 0 {CustomName:"\"NewNTChest\"",Invisible:1}
summon armor_stand 60 255 0 {CustomName:"\"NewPTChest\"",Invisible:1}
scoreboard players reset @e[type=armor_stand,name=Treasure] Selected
scoreboard players reset @e[type=armor_stand,name=TreasureCD] Selected
scoreboard players set @e[type=armor_stand,name=Treasure,sort=random,limit=1] Selected 1
scoreboard players operation @e[type=armor_stand,name=NewNTChest] TreasureSpawn = @e[type=armor_stand,name=Treasure,scores={Selected=1}] TreasureBinding
scoreboard players operation @e[type=armor_stand,name=NewPTChest] TreasureSpawn = @e[type=armor_stand,name=Treasure,scores={Selected=1}] TreasureBinding

# Danger time
scoreboard players remove Remaining SafeRounds 1
execute if score Remaining SafeRounds matches ..0 run scoreboard players operation Time DangerTime += @e[type=armor_stand,name=Game,limit=1] DangerTimeInc
scoreboard players operation @e[type=armor_stand,name=Game] DangerTime = @e[type=armor_stand,name=Game] Tick

scoreboard players operation Ticks DangerTime = Time DangerTime
scoreboard players operation Ticks DangerTime *= 20 Const
scoreboard players operation @e[type=armor_stand,name=Game] DangerTime -= Ticks DangerTime
scoreboard players operation Ticks MinSafeTime = @e[name=Game,type=armor_stand] MinSafeTime
scoreboard players operation Ticks MinSafeTime *= 20 Const
scoreboard players operation @e[type=armor_stand,name=Game] DangerTime > Ticks MinSafeTime

execute at @e[type=armor_stand,name=Gate] positioned ~-2 ~ ~ run fill ~ ~ ~ ~14 255 ~5 minecraft:air replace minecraft:lava

# Move world border away
worldborder set 60000000

execute as @a at @s run playsound minecraft:block.note.pling master @s ~ ~ ~ 100 1 1
