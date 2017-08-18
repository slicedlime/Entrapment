# Set arena selection for the correct marker
execute @e[score_Arena_min=-2147483648] ~ ~ ~ scoreboard players operation @s Arena -= @p[score_Op_min=1,score_ArenaSelection_min=1] ArenaSelection
scoreboard players set @e[score_Arena_min=0,score_Arena=0] Selected 2
execute @e[score_Arena_min=-2147483648] ~ ~ ~ scoreboard players operation @s Arena += @p[score_Op_min=1,score_ArenaSelection_min=1] ArenaSelection
scoreboard players reset @a ArenaSelection

scoreboard players reset @e[score_Selected=1] Selected
scoreboard players set @e[score_Selected_min=2] Selected 1
# Chat message
execute @e[score_Selected_min=1] ~ ~ ~ tellraw @a ["",{"text":"Loading arena \""},{"selector":"@s","color":"yellow"},{"text":"\" by ","color":"none"},{"selector":"@e[type=armor_stand,score_Author_min=1,c=1]","color":"yellow"},{"text":"...","color":"none"}]
# Update sign
execute @e[score_Selected_min=1] ~ ~ ~ blockdata ~ ~1 ~ {Text1:"{\"text\":\"Arena:\"}",Text2:"{\"text\":\"\"}",Text3:"[{\"selector\":\"@e[score_Selected_min=1,score_Arena_min=1]\",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"trigger Action set 1\"}}]",Text4:"[{\"text\":\"by \"},{\"selector\":\"@e[type=armor_stand,score_Author_min=1,c=1]\",\"color\":\"blue\"}]"}
execute @e[type=armor_stand,score_Selected_min=1] ~ ~ ~ clone ~ ~1 ~ ~ ~1 ~ 3 253 144 replace
# Run commands for item frames
execute @e[type=armor_stand,score_Arena_min=1,score_Selected_min=1] ~ ~ ~ blockdata ~ ~ ~ {auto:1}
