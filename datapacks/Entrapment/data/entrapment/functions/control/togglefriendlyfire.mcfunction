# Toggle friendly fire

scoreboard players add @e[type=armor_stand,name=Game] FriendlyFire 1
scoreboard players set @e[type=armor_stand,name=Game,scores={FriendlyFire=2}] FriendlyFire 0
execute if entity @e[type=armor_stand,name=Game,scores={FriendlyFire=0}] run data merge block -1 251 144 {Text1:"{\"text\":\"Friendly Fire:\"}",Text2:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}",Text3:"[{\"text\":\"Off\",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger Action set 12\"}}]"}
execute if entity @e[type=armor_stand,name=Game,scores={FriendlyFire=1}] run data merge block -1 251 144 {Text1:"{\"text\":\"Friendly Fire:\"}",Text2:"{\"text\":\"\"}",Text4:"{\"text\":\"\"}",Text3:"[{\"text\":\"On\",\"color\":\"blue\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"/trigger Action set 12\"}}]"}
