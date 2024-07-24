extends Node2D

@export var weapon_projectile_scene : PackedScene

func _on_player_throw(pos, dir):
	var potion = weapon_projectile_scene.instantiate()
	add_child(potion)
	potion.position = pos
	potion.direction = dir.normalized()
	potion.add_to_group("potions")
