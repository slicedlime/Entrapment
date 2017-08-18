# Add added danger time per round

scoreboard players add @e[type=armor_stand,name=Game] DangerTimeInc 5
scoreboard players set @e[type=armor_stand,name=Game,score_DangerTimeInc_min=35] DangerTimeInc 0
blockdata -2 253 144 {Text1:"{\"text\":\"Danger Time Added\"}",Text2:"{\"text\":\"Each Round:\"}",Text3:"{\"text\":\"\"}",Text4:"[{\"score\":{\"objective\":\"DangerTimeInc\",\"name\":\"@e[type=armor_stand,name=Game]\"},\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger Action set 9\"}},{\"text\":\" seconds\",\"color\":\"blue\"}]"}
