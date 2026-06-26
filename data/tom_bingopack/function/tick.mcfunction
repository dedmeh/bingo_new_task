#Detect die_to_anvil
# 1. Detect anvil near player
execute as @a at @s if entity @e[type=falling_block,nbt={BlockState:{Name:"minecraft:anvil"}},distance=..2] run scoreboard players set @s anvil_near 5
execute as @a at @s if entity @e[type=falling_block,nbt={BlockState:{Name:"minecraft:chipped_anvil"}},distance=..2] run scoreboard players set @s anvil_near 5
execute as @a at @s if entity @e[type=falling_block,nbt={BlockState:{Name:"minecraft:damaged_anvil"}},distance=..2] run scoreboard players set @s anvil_near 5

# 2. Detect NEW death (only players with increased death count)
execute as @a if score @s deaths > @s deathPrev run tag @s add just_died

# 3. Grant advancement ONLY if both are true
execute as @a[tag=just_died,scores={anvil_near=1..}] run advancement grant @s only tom_bingopack:bingo/die_to_anvil

# 4. Reset per-tick flags
tag @a remove just_died
execute as @a run scoreboard players operation @s deathPrev = @s deaths
scoreboard players remove @a[scores={anvil_near=1..}] anvil_near 1

#Detect wear_full_copper
execute if entity @s[nbt={equipment:
    {head:{id:"minecraft:copper_helmet",count:1}}
}] run advancement grant @s only tom_bingopack:bingo/wear_full_copper