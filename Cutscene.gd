extends Node2D

var game = preload("res://Game.tscn")

func _on_AnimationPlayer_animation_finished(anim_name):
    get_tree().change_scene_to(game)
