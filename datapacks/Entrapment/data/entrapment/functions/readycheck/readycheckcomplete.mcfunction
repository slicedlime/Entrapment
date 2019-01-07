# Load the arena and start the countdown

# Activate load selected arena line
tellraw @a [{"text":"Ready check passed. Stand by, preparing arenas..."}]

scoreboard players set @e[type=armor_stand,name=Game] State 2
scoreboard players set $Game Tick 0
