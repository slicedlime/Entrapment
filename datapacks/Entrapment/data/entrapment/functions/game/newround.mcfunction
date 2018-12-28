# New round
scoreboard players add Total Round 1

# Check if odd or even round
scoreboard players add @e[type=armor_stand,name=Game] Round 1 
scoreboard players set @e[type=armor_stand,name=Game,score_Round_min=3] Round 1

# Team teleports
execute @e[type=armor_stand,name=Game,score_Round=1] ~ ~ ~ tp @a[team=red,m=!creative] -40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round_min=2] ~ ~ ~ tp @a[team=blue,m=!creative] -40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round_min=2] ~ ~ ~ tp @a[team=red,m=!creative] 40 236 -8 0 0
execute @e[type=armor_stand,name=Game,score_Round=1] ~ ~ ~ tp @a[team=blue,m=!creative] 40 236 -8 0 0
execute @a[m=survival] ~ ~ ~ spawnpoint @s

# Resistance effect to all players to get around bad interpolation causing withering effects
effect @a[m=0] minecraft:resistance 1 10 true

# Round length calculation
scoreboard players set @e[type=armor_stand,name=Game,score_Length=1] Tick 1200
scoreboard players set @e[type=armor_stand,name=Game,score_Length=2,score_Length_min=2] Tick 2400
scoreboard players set @e[type=armor_stand,name=Game,score_Length=5,score_Length_min=5] Tick 6000
scoreboard players set @e[type=armor_stand,name=Game,score_Length=10,score_Length_min=10] Tick 12000
scoreboard players operation AddedTicks TimeIncrease = AddedTime TimeIncrease
scoreboard players operation AddedTicks TimeIncrease *= 20 Const
scoreboard players operation @e[type=armor_stand,name=Game] Tick += AddedTicks TimeIncrease
scoreboard players operation AddedTime TimeIncrease += @e[type=armor_stand,name=Game] TimeIncrease
execute @e[type=armor_stand,name=Game,score_MaxTimeAdded_min=1] ~ ~ ~ scoreboard players operation AddedTime TimeIncrease < Seconds MaxTimeAdded

# New chests
summon armor_stand -60 255 0 {CustomName:NewNTChest,Invisible:1}
summon armor_stand 60 255 0 {CustomName:NewPTChest,Invisible:1}
scoreboard players reset @e[type=armor_stand,name=Treasure] Selected
scoreboard players reset @e[type=armor_stand,name=TreasureCD] Selected
scoreboard players set @r[type=armor_stand,name=Treasure] Selected 1

# Danger time
scoreboard players remove Remaining SafeRounds 1
stats entity @e[name=Game,type=armor_stand] set SuccessCount @e[name=Game,type=armor_stand] Success
scoreboard players set @e[type=armor_stand,name=Game] Success 0
execute @e[type=armor_stand,name=Game] ~ ~ ~ scoreboard players test Remaining SafeRounds * 0
execute @e[type=armor_stand,name=Game,score_Success_min=1] ~ ~ ~ scoreboard players operation Time DangerTime += @e[type=armor_stand,name=Game] DangerTimeInc
scoreboard players operation @e[type=armor_stand,name=Game] DangerTime = @e[type=armor_stand,name=Game] Tick
scoreboard players operation Ticks DangerTime = Time DangerTime
scoreboard players operation Ticks DangerTime *= 20 Const
scoreboard players operation @e[type=armor_stand,name=Game] DangerTime -= Ticks DangerTime
scoreboard players operation Ticks MinSafeTime = @e[name=Game,type=armor_stand] MinSafeTime
scoreboard players operation Ticks MinSafeTime *= 20 Const
scoreboard players operation @e[type=armor_stand,name=Game] DangerTime > Ticks MinSafeTime

execute @e[type=armor_stand,name=Gate] ~-2 ~ ~ fill ~ ~ ~ ~14 255 ~5 minecraft:air 0 replace minecraft:lava
execute @e[type=armor_stand,name=Gate] ~-2 ~ ~ fill ~ ~ ~ ~14 255 ~5 minecraft:air 0 replace minecraft:flowing_lava

# Move world border away
worldborder set 60000000

execute @a ~ ~ ~ playsound minecraft:block.note.pling master @s ~ ~ ~ 100 1 1