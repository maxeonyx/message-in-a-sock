extends TextureButton

var sock = preload("res://scenes/sock_spin.tscn")

export(int) var button_number
var has_treasure = false

func _ready():
    connect("pressed", self, "onpress")


func onpress():
    $AudioStreamPlayer.play()

    if has_treasure:
        get_parent().get_parent().add_child(sock.instance())
