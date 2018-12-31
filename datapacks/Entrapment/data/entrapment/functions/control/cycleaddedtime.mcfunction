# Cycle time added each round
scoreboard players add @e[type=armor_stand,name=Game] TimeIncrease 5
scoreboard players set @e[type=armor_stand,name=Game,scores={TimeIncrease=35..}] TimeIncrease 0
data merge block -2 252 144 {Text1:"{\"text\":\"Time Added\"}",Text2:"{\"text\":\"Each Round:\"}",Text3:"{\"text\":\"\"}",Text4:"[{\"score\":{\"objective\":\"TimeIncrease\",\"name\":\"@e[type=armor_stand,name=Game]\"},\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger Action set 5\"}},{\"text\":\" seconds\",\"color\":\"blue\"}]"}
