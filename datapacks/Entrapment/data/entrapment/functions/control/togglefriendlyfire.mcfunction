# Toggle friendly fire

scoreboard players add @e[type=armor_stand,name=Game] FriendlyFire 1
scoreboard players set @e[type=armor_stand,name=Game,score_FriendlyFire_min=2] FriendlyFire 0
execute @e[type=armor_stand,name=Game,score_FriendlyFire=0,score_FriendlyFire_min=0] ~ ~ ~ blockdata -1 251 144 {Text1:"{\"text\":\"Friendly Fire:\"}",Text2:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}",Text3:"[{\"text\":\"Off\",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger Action set 12\"}}]"}
execute @e[type=armor_stand,name=Game,score_FriendlyFire=1,score_FriendlyFire_min=1] ~ ~ ~ blockdata -1 251 144 {Text1:"{\"text\":\"Friendly Fire:\"}",Text2:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}",Text3:"[{\"text\":\"On\",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger Action set 12\"}}]"}
