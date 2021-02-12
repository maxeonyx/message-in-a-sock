extends TextureButton

var sock = preload("res://scenes/sock_spin.tscn")

export(bool) var has_treasure

func _ready():
    # the treasure hiding place isn't visible the first time you enter the scene
    # rude but good lol
    if has_treasure:
        visible = false
    connect("pressed", self, "onpress")

func onpress():
    $AudioStreamPlayer.play()

    if has_treasure:
        get_parent().get_parent().add_child(sock.instance())
