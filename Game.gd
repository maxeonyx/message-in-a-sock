extends Node2D

var menu = load("res://Main Menu.tscn")

onready var current_scene = $scenes/bigrocks

var soundtrack_changed = true

func _ready():

    enter_scene(current_scene)
    randomize()
    var lucky_button = randi() % 9
    for scene in $scenes.get_children():
        for button in scene.get_children():
            if button.button_number == lucky_button:
                button.has_treasure = true

func get_scene(sc_name):
    for child in $scenes.get_children():
        if child.name == sc_name:
            return child
    print("Scene" + sc_name + " not found")

func enter_scene(scene):
    
    for child in $scenes.get_children():
        child.visible = false
    
    soundtrack_changed = soundtrack_changed or current_scene.soundtrack != scene.soundtrack
        
    if soundtrack_changed:
        $Soundtrack.stream = $Soundtrack.get_node(scene.soundtrack).soundtrack
        $Soundtrack.play()
        soundtrack_changed = false
    
    scene.visible = true
    
    for button in $UI.get_children():
        button.visible = false
    $UI/Esc.visible = true
    
    if scene.left != null and scene.left != "":
        $UI/Left.visible = true
    if scene.right != null and scene.right != "":
        $UI/Right.visible = true
    if scene.forward != null and scene.forward != "":
        $UI/Forward.visible = true
    if scene.back != null and scene.back != "":
        $UI/Back.visible = true
    
    current_scene = scene
    
    
func _input(event):
    if event.is_action_pressed("ui_cancel"):
        get_tree().change_scene_to(menu)

func _on_Esc_pressed():
    get_tree().change_scene_to(menu)

func _on_Left_pressed():
    enter_scene(get_scene(current_scene.left))

func _on_Right_pressed():
    enter_scene(get_scene(current_scene.right))

func _on_Forward_pressed():
    enter_scene(get_scene(current_scene.forward))

func _on_Back_pressed():
    enter_scene(get_scene(current_scene.back))

var num_buttons = 0
func get_button_number():
    var num = num_buttons
    num_buttons += 1
    return num

