# Run commands for item frames
execute store result entity @n[type=item_frame,name=PreviewLR] Item.components.minecraft:map_id int 1 run scoreboard players get @e[scores={Selected=1},limit=1] PreviewLR
execute store result entity @n[type=item_frame,name=PreviewLL] Item.components.minecraft:map_id int 1 run scoreboard players get @e[scores={Selected=1},limit=1] PreviewLL
execute store result entity @n[type=item_frame,name=PreviewUR] Item.components.minecraft:map_id int 1 run scoreboard players get @e[scores={Selected=1},limit=1] PreviewUR
execute store result entity @n[type=item_frame,name=PreviewUL] Item.components.minecraft:map_id int 1 run scoreboard players get @e[scores={Selected=1},limit=1] PreviewUL
