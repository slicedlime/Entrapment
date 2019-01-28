# Function for the lobby state game loop

scoreboard players add $Game Tick 1
function entrapment:loop/loadarena

tp @e[type=armor_stand,name=JoinBlue] -13 251 130
tp @e[type=armor_stand,name=JoinRed] 13 251 130

# Team joining - particles
execute at @e[type=armor_stand,name=JoinBlue] run particle enchanted_hit ~ ~1 ~ 1 1 1 0 5 force
execute at @e[type=armor_stand,name=JoinRed] run particle crit ~ ~1 ~ 1 1 1 0 5 force
execute at @e[type=armor_stand,name=JoinNone] run particle ambient_entity_effect ~ ~1 ~ 1 1 1 0 5 force

# Team joining - leave teams
execute at @e[type=armor_stand,name=JoinBlue] run team leave @p[distance=..4,team=!blue]
execute at @e[type=armor_stand,name=JoinRed] run team leave @p[distance=..4,team=!red]
execute at @e[type=armor_stand,name=JoinNone] run team leave @p[distance=..4,team=!none]

# Join messages
execute at @e[type=armor_stand,name=JoinRed] if entity @p[distance=..4,team=!red] run tellraw @a [{"selector":"@p[distance=..4,team=!red]","color":"red"},{"text":" has joined team ","color":"white"},{"text":"Redstone!","color":"red"}]
execute at @e[type=armor_stand,name=JoinBlue] if entity @p[distance=..4,team=!blue] run tellraw @a [{"selector":"@p[distance=..4,team=!blue]","color":"blue"},{"text":" has joined team ","color":"white"},{"text":"Lapis!","color":"blue"}]
execute at @e[type=armor_stand,name=JoinRed] run team join red @p[distance=..4,team=!red]
execute at @e[type=armor_stand,name=JoinBlue] run team join blue @p[distance=..4,team=!blue]

# Player states

# Move everyone to adventure mode
gamemode adventure @a[gamemode=survival]
#gamemode adventure @a[gamemode=spectator]

# Clear inventories
clear @a[gamemode=adventure]

# Reset player state
effect give @a instant_health 3 1 true
effect give @a saturation 3 1 true
effect give @a[gamemode=adventure] weakness 2 255 true
experience set @a 0 levels
experience set @a 0 points

# Team counts
execute store result score @e[type=armor_stand,name=JoinRed] Count if entity @a[team=red]
execute store result score @e[type=armor_stand,name=JoinBlue] Count if entity @a[team=blue]

# Tutorial control
scoreboard players enable @a Help
scoreboard players add @a HelpPos 0
scoreboard players set @a[scores={HelpPos=..0,Help=1..}] HelpPos 50
scoreboard players add @a[scores={HelpPos=1..}] HelpPos 1

tellraw @a[tag=!HasPreviouslyJoined] ["",{"text":"\nGreetings and welcome to "},{"text":"Entrapment","color":"green"},{"text":" by ","color":"none"},{"text":"slicedlime","color":"gold","clickEvent":{"action":"open_url","value":"http://www.youtube.com/slicedlime"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"slicedlime on YouTube"}]}}},{"text":". If you want\nhelp, please ","color":"none"},{"text":"click here","color":"gold","clickEvent":{"action":"run_command","value":"/trigger Help set 1"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"Display help"}]}}},{"text":" or click the Help sign in the lobby.\n","color":"none"}]
tag @a[tag=!HasPreviouslyJoined] add HasPreviouslyJoined

scoreboard players set @a Help 0

execute if entity @a[scores={HelpPos=1..}] run function entrapment:lobby/tutorial

# Map control

# Operator actions:
scoreboard players enable @a Action
scoreboard players enable @a[scores={Op=1..}] ArenaSelection
# Action 1 - Select map
execute if entity @a[scores={Action=1,Op=1..}] run function entrapment:control/selectarena
execute if entity @p[scores={Op=1..,ArenaSelection=1..}] run function entrapment:lobby/arenaselected
# Action 2 - Cycle game length
execute if entity @a[scores={Action=2,Op=1..}] run function entrapment:control/cyclelength
# Action 3 - Ready check
execute if entity @a[scores={Action=3,Op=1..}] run function entrapment:control/readycheck
# Action 4 - Random arena
execute if entity @a[scores={Action=4,Op=1..}] run function entrapment:control/randomarena 
# Action 5 - Cycle additional game time
execute if entity @a[scores={Action=5,Op=1..}] run function entrapment:control/cycleaddedtime
# Action 6 - Previous arena
execute if entity @a[scores={Action=6,Op=1..}] run function entrapment:control/previousarena
# Action 7 - Next arena
execute if entity @a[scores={Action=7,Op=1..}] run function entrapment:control/nextarena
# Action 8 - Cycle max time added 
execute if entity @a[scores={Action=8,Op=1..}] run function entrapment:control/cyclemaxtimeadded
# Action 9 - Cycle danger time increase
execute if entity @a[scores={Action=9,Op=1..}] run function entrapment:control/cycledangertimeincrease
# Action 10 - Cycle min safe time
execute if entity @a[scores={Action=10,Op=1..}] run function entrapment:control/cycleminsafetime
# Action 11 - Cycle rounds before danger time increase
execute if entity @a[scores={Action=11,Op=1..}] run function entrapment:control/cyclesaferounds
# Action 12 - Toggle friendly fire
execute if entity @a[scores={Action=12,Op=1..}] run function entrapment:control/togglefriendlyfire
# Action 13 - Toggle spectator lock
execute if entity @a[scores={Action=13,Op=1..}] run function entrapment:control/togglespectators

# Realms special case:
#scoreboard players set @a Op 2

# Op management

scoreboard players add @a Op 0
tellraw @a[scores={Op=0,Action=1..}] [{"text":"Game settings can only be changed by operators. If you are\nan operator, ","color":"red"},{"text":"click here to authenticate","color":"gold","clickEvent":{"action":"run_command","value":"/scoreboard players set @p Op 1"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"Click to register as an operator"}]}}},{"text":" and then try again.","color":"red"}]
execute if entity @a[scores={Op=1}] run tellraw @a[scores={Op=1..}] ["",{"selector":"@a[scores={Op=1}]","color":"yellow"},{"text":" is now a game operator.","color":"none"}]
scoreboard players set @a[scores={Op=1}] Op 2

scoreboard players reset @a[scores={Action=1..}] Action

# Keep non-ops away from signs
execute as @a[scores={Op=0},x=-4,y=249,z=143,dx=9,dy=7,dz=3] at @s run teleport @s ~ ~ ~-0.5

# Keep players in lobby

scoreboard players set @a InLobby 0
scoreboard players set @a[x=-4,y=251,z=116,dx=9,dy=4,dz=30] InLobby 1
scoreboard players set @a[x=-14,y=251,z=125,dx=32,dy=4,dz=11] InLobby 1
teleport @a[gamemode=adventure,scores={InLobby=0,HelpPos=0}] 0 251 117 0 0

# Silence item frames
execute as @e[type=item_frame] run data merge entity @s {Silent:1}