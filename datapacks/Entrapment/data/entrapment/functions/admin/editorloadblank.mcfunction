scoreboard players reset * Selected
scoreboard players set @e[name=Blank,type=armor_stand] Selected 1

execute at @e[scores={Selected=1}] run data merge block ~ ~1 ~ {Text1:"{\"text\":\"Arena:\"}",Text3:"{\"text\":\"No Arena\",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"trigger Action set 1\"}}"}
execute at @e[scores={Selected=1}] run clone ~ ~1 ~ ~ ~1 ~ 3 253 144 replace

function entrapment:lobby/applypreview

function entrapment:admin/editorloadarena
