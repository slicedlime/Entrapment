# Run commands for item frames
execute store result entity @e[type=item_frame,name=PreviewLR,limit=1] Item.tag.map int 1 run scoreboard players get @e[scores={Selected=1},limit=1] PreviewLR
execute store result entity @e[type=item_frame,name=PreviewLL,limit=1] Item.tag.map int 1 run scoreboard players get @e[scores={Selected=1},limit=1] PreviewLL
execute store result entity @e[type=item_frame,name=PreviewUR,limit=1] Item.tag.map int 1 run scoreboard players get @e[scores={Selected=1},limit=1] PreviewUR
execute store result entity @e[type=item_frame,name=PreviewUL,limit=1] Item.tag.map int 1 run scoreboard players get @e[scores={Selected=1},limit=1] PreviewUL
