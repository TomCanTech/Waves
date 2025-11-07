extends RigidBody2D

@export var acceleration: float = 5.0
@export var max_velocity: float = 40
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	var camera_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	linear_velocity.x = move_toward(linear_velocity.x,max_velocity * camera_direction.x, acceleration * delta)
	linear_velocity.y = move_toward(linear_velocity.y,max_velocity * camera_direction.y, acceleration * delta)
