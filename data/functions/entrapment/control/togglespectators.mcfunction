# Toggle friendly fire

scoreboard players add @e[type=armor_stand,name=Game] SpectatorLock 1
scoreboard players set @e[type=armor_stand,name=Game,score_SpectatorLock_min=2] SpectatorLock 0
execute @e[type=armor_stand,name=Game,score_SpectatorLock=0,score_SpectatorLock_min=0] ~ ~ ~ blockdata -2 251 144 {Text1:"{\"text\":\"Spectators:\"}",Text2:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}",Text3:"[{\"text\":\"Free\",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger Action set 13\"}}]"}
execute @e[type=armor_stand,name=Game,score_SpectatorLock=1,score_SpectatorLock_min=1] ~ ~ ~ blockdata -2 251 144 {Text1:"{\"text\":\"Spectators:\"}",Text2:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}",Text3:"[{\"text\":\"Locked With Team\",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger Action set 13\"}}]"}
