# Set the game into running state
scoreboard players set @e[type=armor_stand,name=Game] State 2
gamerule gameLoopFunction entrapment:loop/game

scoreboard players reset * ReadyCheck

# Show in-game UI stuff
title @a title [{"text":"Game starting!"}]
scoreboard objectives setdisplay sidebar Time
scoreboard objectives setdisplay list Health

# Set up score tracking
scoreboard players set @e[type=armor_stand,name=Game] Round 0
scoreboard players reset * Deaths

# Set up environment
gamerule naturalRegeneration false
time set day
gamerule doDaylightCycle true
kill @e[type=Item]

# Set player state
gamemode survival @a[team=!none]

# Summon AS markers for gates
summon armor_stand -45 235 -2 {CustomName:Gate,NoGravity:1,Invisible:1,Marker:1,Invulnerable:1}
summon armor_stand 35 235 -2 {CustomName:Gate,NoGravity:1,Invisible:1,Marker:1,Invulnerable:1}

# Set up time tracking
scoreboard players set AddedTime TimeIncrease 0
scoreboard players operation Seconds MaxTimeAdded = @e[type=armor_stand,name=Game] MaxTimeAdded
scoreboard players operation Seconds MaxTimeAdded *= 60 Const

# Safe time tracking
scoreboard players operation Remaining SafeRounds = @e[type=armor_stand,name=Game] SafeRounds
scoreboard players set Time DangerTime 15
scoreboard players add Remaining SafeRounds 1
scoreboard players set Total Round 0

# Team setup
scoreboard teams option red collisionRule always
scoreboard teams option blue collisionRule always
execute @e[type=armor_stand,name=Game,score_FriendlyFire=0] ~ ~ ~ scoreboard teams option red friendlyfire false
execute @e[type=armor_stand,name=Game,score_FriendlyFire=0] ~ ~ ~ scoreboard teams option blue friendlyfire false
execute @e[type=armor_stand,name=Game,score_FriendlyFire_min=1] ~ ~ ~ scoreboard teams option red friendlyfire true
execute @e[type=armor_stand,name=Game,score_FriendlyFire_min=1] ~ ~ ~ scoreboard teams option blue friendlyfire true

# Trigger new round
function entrapment:game/newround

recipe give @a *
