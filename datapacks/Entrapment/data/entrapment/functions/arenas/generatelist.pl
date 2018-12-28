#!/usr/bin/perl

open(FILE, ">list.mcfunction");

for (my $i = 1; $i < 100; $i++) {
	print FILE 'execute @e[score_Arena_min=' . $i . ',score_Arena=' . $i .'] ~ ~ ~ tellraw @a[tag=Response] [{"text":" - "},{"selector":"@s","color":"gold","clickEvent":{"action":"run_command","value":"/trigger ArenaSelection set ' . $i . '"}},{"text":" by ","color":"none"},{"selector":"@e[score_Author_min=1,c=1]","color":"yellow"}]' . "\n";
}
