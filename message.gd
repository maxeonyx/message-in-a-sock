extends TextureButton

var next_scene = preload("res://Endscreen.tscn")
var clicked = false

func _ready():
    connect("pressed", self, "onpress")

func onpress():
    if not clicked:
        clicked = true
        $AudioStreamPlayer.play()
        $Timer.start()
        yield($Timer, "timeout")
        get_tree().change_scene_to(next_scene)
