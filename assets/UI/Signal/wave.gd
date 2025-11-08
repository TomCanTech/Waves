extends Node2D

const FREQ_INCREMENT: float = 0.6
@onready var rect_mat: ShaderMaterial = $ColorRect.material
@onready var rect_init_size: Vector2 = $ColorRect.size
@onready var size: Vector2 = $ColorRect.size

@onready var freq: float = rect_mat.get_shader_parameter('freq')
@onready var time_scale: float = rect_mat.get_shader_parameter('time_scale')
@onready var thickness: float = rect_mat.get_shader_parameter('size')

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_Q):
		change_amp(-50.0 * delta);
	if Input.is_key_pressed(KEY_E):
		change_amp(50.0 * delta)

func change_freq(freq_diff: float):
	var freq_change: float = freq_diff + freq
	clamp(freq_change, 1.0, 12.0)
	rect_mat.set_shader_parameter('freq', freq + freq_diff)
	freq = rect_mat.get_shader_parameter('freq')

func change_amp(amp_diff: float):
	var size_change: float = amp_diff + size.y
	size_change = clampf(size_change, 0.00001, rect_init_size.y)
	$ColorRect.set_size(Vector2(size.x, size_change))
	
	$ColorRect.position.y = ($ColorRect.position.y * $ColorRect.get_size().y) / size.y
	size = $ColorRect.get_size()
