# Cycle rounds before danger time starts increasing

scoreboard players add @e[type=armor_stand,name=Game] SafeRounds 1
scoreboard players set @e[type=armor_stand,name=Game,score_SafeRounds_min=21] SafeRounds 0
blockdata -1 253 144 {Text1:"{\"text\":\"Rounds Before 1st\"}",Text2:"{\"text\":\"Danger Time Increase:\"}",Text3:"{\"text\":\"\"}",Text4:"[{\"score\":{\"objective\":\"SafeRounds\",\"name\":\"@e[type=armor_stand,name=Game]\"},\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger Action set 11\"}},{\"text\":\" rounds\",\"color\":\"blue\"}]"}
execute @e[type=armor_stand,name=Game,score_SafeRounds=1,score_SafeRounds_min=1] ~ ~ ~ blockdata -1 253 144 {Text1:"{\"text\":\"Rounds Before 1st\"}",Text2:"{\"text\":\"Danger Time Increase:\"}",Text3:"{\"text\":\"\"}",Text4:"[{\"score\":{\"objective\":\"SafeRounds\",\"name\":\"@e[type=armor_stand,name=Game]\"},\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger Action set 11\"}},{\"text\":\" round\",\"color\":\"blue\"}]"}
