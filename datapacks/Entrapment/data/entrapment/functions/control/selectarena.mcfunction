# Trigger the "select map" op action

# Response management
scoreboard players enable @a[score_Op_min=1] ArenaSelection
scoreboard players tag @a[score_Op_min=1,score_Action=1,score_Action_min=1] add Response

# List arenas to chat
tellraw @a[tag=Response] [{"text":"Switch arena:"}]
function entrapment:arenas/list
tellraw @a[tag=Response] [{"text":"Click on the name of an arena to select it."}]
scoreboard players tag @a[tag=Response] remove Response
