# Function for the lobby state game loop

function entrapment:loop/allmodes

tp @e[type=armor_stand,name=JoinBlue] -13 251 130
tp @e[type=armor_stand,name=JoinRed] 13 251 130

# Team joining - particles
execute @e[type=armor_stand,name=JoinBlue] ~ ~ ~ particle magicCrit ~ ~1 ~ 1 1 1 0 5 force
execute @e[type=armor_stand,name=JoinRed] ~ ~ ~ particle crit ~ ~1 ~ 1 1 1 0 5 force
execute @e[type=armor_stand,name=JoinNone] ~ ~ ~ particle mobSpellAmbient ~ ~1 ~ 1 1 1 0 5 force
# Team joining - leave teams
execute @e[type=armor_stand,name=JoinBlue] ~ ~ ~ scoreboard teams leave @p[r=4,team=!blue]
execute @e[type=armor_stand,name=JoinRed] ~ ~ ~ scoreboard teams leave @p[r=4,team=!red]
execute @e[type=armor_stand,name=JoinNone] ~ ~ ~ scoreboard teams leave @p[r=4,team=!none]
# Join messages
execute @e[type=armor_stand,name=JoinRed] ~ ~ ~ execute @p[r=4,team=!red] ~ ~ ~ tellraw @a [{"selector":"@p[r=4,team=!red]","color":"red"},{"text":" has joined team ","color":"white"},{"text":"Redstone!","color":"red"}]
execute @e[type=armor_stand,name=JoinBlue] ~ ~ ~ execute @p[r=4,team=!blue] ~ ~ ~ tellraw @a [{"selector":"@p[r=4,team=!blue]","color":"blue"},{"text":" has joined team ","color":"white"},{"text":"Lapis!","color":"blue"}]
execute @e[type=armor_stand,name=JoinRed] ~ ~ ~ scoreboard teams join red @p[r=4,team=!red]
execute @e[type=armor_stand,name=JoinBlue] ~ ~ ~ scoreboard teams join blue @p[r=4,team=!blue]

# Player states

# Move everyone to adventure mode
gamemode adventure @a[m=survival]
gamemode adventure @a[m=spectator]

# Clear inventories
clear @a[m=adventure,score_HelpPos=0]

# Reset player state
effect @a instant_health 3 1 true
effect @a saturation 3 1 true
effect @a[m=adventure] weakness 2 255 true
xp -2147483648L @a

# Team counts
scoreboard players set @e[type=armor_stand,name=JoinRed] Count 0
scoreboard players set @e[type=armor_stand,name=JoinBlue] Count 0
execute @a[team=red] ~ ~ ~ scoreboard players add @e[type=armor_stand,name=JoinRed] Count 1
execute @a[team=blue] ~ ~ ~ scoreboard players add @e[type=armor_stand,name=JoinBlue] Count 1

# Tutorial control
scoreboard players enable @a Help
scoreboard players add @a HelpPos 0
scoreboard players set @a[score_HelpPos=0,score_Help_min=1] HelpPos 50
scoreboard players add @a[score_HelpPos_min=1] HelpPos 1

tellraw @a[tag=!NewPlayer] ["",{"text":"\nGreetings and welcome to "},{"text":"Entrapment","color":"green"},{"text":" by ","color":"none"},{"text":"slicedlime","color":"gold","clickEvent":{"action":"open_url","value":"http://www.youtube.com/slicedlime"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"slicedlime on YouTube"}]}}},{"text":". If you want\nhelp, please ","color":"none"},{"text":"click here","color":"gold","clickEvent":{"action":"run_command","value":"/trigger Help set 1"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"Display help"}]}}},{"text":" or click the Help sign in the lobby.\n","color":"none"}]
scoreboard players tag @a[tag=!NewPlayer] add NewPlayer

scoreboard players set @a Help 0

function entrapment:lobby/tutorial if @a[score_HelpPos_min=1]

# Map control

# Operator actions:
scoreboard players enable @a Action
scoreboard players enable @a[score_Op_min=1] ArenaSelection
# Action 1 - Select map
function entrapment:control/selectarena if @a[score_Action=1,score_Action_min=1,score_Op_min=1]
function entrapment:lobby/arenaselected if @p[score_Op_min=1,score_ArenaSelection_min=1]
# Action 2 - Cycle game length
function entrapment:control/cyclelength if @a[score_Action=2,score_Action_min=2,score_Op_min=1]
# Action 3 - Ready check
function entrapment:control/readycheck if @a[score_Action=3,score_Action_min=3,score_Op_min=1]
# Action 4 - Random arena
function entrapment:control/randomarena if @a[score_Op_min=1,score_Action_min=4,score_Action=4]
# Action 5 - Cycle additional game time
function entrapment:control/cycleaddedtime if @a[score_Op_min=1,score_Action_min=5,score_Action=5]
# Action 6 - Previous arena
function entrapment:control/previousarena if @a[score_Op_min=1,score_Action_min=6,score_Action=6]
# Action 7 - Next arena
function entrapment:control/nextarena if @a[score_Op_min=1,score_Action_min=7,score_Action=7]
# Action 8 - Cycle max time added 
function entrapment:control/cyclemaxtimeadded if @a[score_Op_min=1,score_Action_min=8,score_Action=8]
# Action 9 - Cycle danger time increase
function entrapment:control/cycledangertimeincrease if @a[score_Op_min=1,score_Action_min=9,score_Action=9]
# Action 10 - Cycle min safe time
function entrapment:control/cycleminsafetime if @a[score_Op_min=1,score_Action_min=10,score_Action=10]
# Action 11 - Cycle rounds before danger time increase
function entrapment:control/cyclesaferounds if @a[score_Op_min=1,score_Action_min=11,score_Action=11]
# Action 12 - Toggle friendly fire
function entrapment:control/togglefriendlyfire if @a[score_Op_min=1,score_Action_min=12,score_Action=12]
# Action 13 - Toggle spectator lock
function entrapment:control/togglespectators if @a[score_Op_min=1,score_Action_min=13,score_Action=13]

# Realms special case:
scoreboard players set @a Op 2

# Op management

scoreboard players add @a Op 0
tellraw @a[score_Op=0,score_Action_min=1] [{"text":"Game settings can only be changed by operators. If you are\nan operator, ","color":"red"},{"text":"click here to authenticate","color":"gold","clickEvent":{"action":"run_command","value":"/scoreboard players set @p Op 1"},"hoverEvent":{"action":"show_text","value":{"text":"","extra":[{"text":"Click to register as an operator"}]}}},{"text":" and then try again.","color":"red"}]
execute @a[score_Op_min=1,score_Op=1] ~ ~ ~ tellraw @a[score_Op_min=1] ["",{"selector":"@a[score_Op_min=1,score_Op=1]","color":"yellow"},{"text":" is now a game operator.","color":"none"}]
scoreboard players set @a[score_Op_min=1,score_Op=1] Op 2

scoreboard players reset @a[score_Action_min=1] Action

# Keep non-ops away from signs
tp @a[score_Op=0,x=-4,y=249,z=143,dx=9,dy=7,dz=3] ~ ~ ~-0.5

# Keep players in lobby

scoreboard players set @a InLobby 0
scoreboard players set @a[x=-4,y=251,z=116,dx=9,dy=4,dz=30] InLobby 1
scoreboard players set @a[x=-14,y=251,z=125,dx=32,dy=4,dz=11] InLobby 1
tp @a[m=adventure,score_InLobby=0,score_HelpPos=0] 0 251 117 0 0

# Keep tutorial location loaded
summon area_effect_cloud 1008 10 10 {Tags:["ChunkLoader"],Duration:3}
spreadplayers -1020 8 1 2 @e[tag=ChunkLoader]
