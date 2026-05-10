# 1. Detect anvil near player
execute as @a at @s if entity @e[type=falling_block,nbt={BlockState:{Name:"minecraft:anvil"}},distance=..2] run tag @s add anvil_near
execute as @a at @s if entity @e[type=falling_block,nbt={BlockState:{Name:"minecraft:chipped_anvil"}},distance=..2] run tag @s add anvil_near
execute as @a at @s if entity @e[type=falling_block,nbt={BlockState:{Name:"minecraft:damaged_anvil"}},distance=..2] run tag @s add anvil_near

# 2. Detect NEW death (only players with increased death count)
execute as @a if score @s deaths matches 1.. run tag @s add just_died

# 3. Grant advancement ONLY if both are true
execute as @a[tag=just_died,tag=anvil_near] run advancement grant @s only tom_bingopack:bingo/die_to_anvil

# 4. Reset per-tick flags
tag @a remove anvil_near
tag @a remove just_died