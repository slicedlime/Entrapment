#!/usr/bin/perl

open(FILE, ">list.mcfunction");

for (my $i = 1; $i < 100; $i++) {
	print FILE 'execute as @e[scores={Arena=' . $i . '}] at @s run tellraw @a[tag=Response] [{"text":" - "},{"selector":"@s","color":"gold","clickEvent":{"action":"run_command","value":"/trigger ArenaSelection set ' . $i . '"}},{"text":" by "},{"selector":"@e[scores={Author=1..},sort=nearest,limit=1]","color":"yellow"}]' . "\n";
}
