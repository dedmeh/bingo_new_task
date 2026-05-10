execute as @a at @s if entity @e[type=falling_block,nbt={BlockState:{Name:"minecraft:anvil"}},distance=..1] run scoreboard players set @s anvilDeath 1

execute as @a[scores={deaths=1..,anvilDeath=1}] run advancement grant @s only tom_bingopack:bingo/anvil_death

scoreboard players reset @a[scores={deaths=1..}] deaths
scoreboard players set @a anvilDeath 0