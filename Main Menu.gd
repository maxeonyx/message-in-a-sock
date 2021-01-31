extends Control

var cutscene = preload("res://Cutscene.tscn")

func _input(event):
    if event.is_action_pressed("ui_cancel"):
        get_tree().quit()


func _on_Esc_pressed():
    get_tree().quit()


func _on_Play_pressed():
    get_tree().change_scene_to(cutscene)
