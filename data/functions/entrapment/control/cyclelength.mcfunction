# Cycle game length

scoreboard players add @e[type=armor_stand,name=Game,score_Length_min=5] Length 5
scoreboard players add @e[type=armor_stand,name=Game,score_Length=2,score_Length_min=2] Length 3
scoreboard players add @e[type=armor_stand,name=Game,score_Length=1] Length 1
scoreboard players set @e[type=armor_stand,name=Game,score_Length_min=15] Length 1

# Sign for length = 1
execute @e[type=armor_stand,name=Game,score_Length_min=1,score_Length=1] ~ ~ ~ blockdata -1 252 144 {Text1:"{\"text\":\"Round Length:\"}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"Blitz\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger Action set 2\"},\"color\":\"blue\"}",Text4:"{\"text\":\"(1 min)\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger Action set 2\"},\"color\":\"blue\"}"}
# Sign for length = 2
execute @e[type=armor_stand,name=Game,score_Length_min=2,score_Length=2] ~ ~ ~ blockdata -1 252 144 {Text1:"{\"text\":\"Round Length:\"}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"Short\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger Action set 2\"},\"color\":\"blue\"}",Text4:"{\"text\":\"(2 min)\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger Action set 2\"},\"color\":\"blue\"}"}
# Sign for length = 5
execute @e[type=armor_stand,name=Game,score_Length_min=5,score_Length=5] ~ ~ ~ blockdata -1 252 144 {Text1:"{\"text\":\"Round Length:\"}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"Slow\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger Action set 2\"},\"color\":\"blue\"}",Text4:"{\"text\":\"(5 min)\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger Action set 2\"},\"color\":\"blue\"}"}
# Sign for length = 10
execute @e[type=armor_stand,name=Game,score_Length_min=10,score_Length=10] ~ ~ ~ blockdata -1 252 144 {Text1:"{\"text\":\"Round Length:\"}",Text2:"{\"text\":\"\"}",Text3:"{\"text\":\"Marathon\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger Action set 2\"},\"color\":\"blue\"}",Text4:"{\"text\":\"(10 min)\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger Action set 2\"},\"color\":\"blue\"}"}