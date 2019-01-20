# Add a new treasure chest
scoreboard players add @e[name=Treasure] TreasureBinding 0
scoreboard players operation @e[name=Treasure,scores={TreasureBinding=0},limit=1] TreasureBinding = Next TreasureBinding
scoreboard players add Next TreasureBinding 1