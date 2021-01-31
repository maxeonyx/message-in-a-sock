extends TextureButton

var next_scene = preload("res://Endscreen.tscn")

func _ready():
    connect("pressed", self, "onpress")

func onpress():
    $AudioStreamPlayer.play()
    $Timer.start()
    yield($Timer, "timeout")
    get_tree().change_scene_to(next_scene)
