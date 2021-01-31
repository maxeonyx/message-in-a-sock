extends TextureButton

var menu = load("res://Main Menu.tscn")

func _on_Replay_pressed():
    get_tree().change_scene_to(menu)
