# Cycle min time added

scoreboard players add @e[type=armor_stand,name=Game] MinSafeTime 10
scoreboard players set @e[type=armor_stand,name=Game,score_MinSafeTime_min=70] MinSafeTime 10
blockdata -3 253 144 {Text1:"{\"text\":\"Minimum Safe Time\"}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"\"}",Text4:"[{\"score\":{\"objective\":\"MinSafeTime\",\"name\":\"@e[type=armor_stand,name=Game]\"},\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger Action set 10\"}},{\"text\":\" seconds\",\"color\":\"blue\"}]"}
