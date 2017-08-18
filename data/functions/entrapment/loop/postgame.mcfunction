gamemode adventure @a[m=survival]
gamemode adventure @a[m=spectator]

scoreboard players remove @e[type=armor_stand,name=Game] ResetTime 1
function entrapment:lobby/enterlobby if @e[type=armor_stand,name=Game,score_ResetTime=0]
execute @e[type=armor_stand,name=Game,score_ResetTime=0] ~ ~ ~ blockdata 1077 0 0 {auto:1}
