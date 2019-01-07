# Check if ready check can be done, and if so activate it

# Error conditions:
execute unless entity @e[scores={Arena=1..,Selected=1..}] run tellraw @a[scores={Op=1..}] [{"text":"Please select an arena.","color":"red"}]
execute if entity @e[type=armor_stand,scores={Count=0}] run tellraw @a[scores={Op=1..}] [{"text":"Each team needs at least one player.","color":"red"}]

# Start ready check
execute if entity @e[scores={Arena=1..,Selected=1..}] if entity @p[team=red] if entity @p[team=blue] run function entrapment:lobby/startreadycheck
