# Trigger the "select map" op action

# Response management
scoreboard players enable @a[scores={Op=1..}] ArenaSelection
tag @a[scores={Op=1..,Action=1}] add Response

# List arenas to chat
tellraw @a[tag=Response] [{"text":"Switch arena:"}]
function entrapment:arenas/list
tellraw @a[tag=Response] [{"text":"Click on the name of an arena to select it."}]
tag @a[tag=Response] remove Response
