extends Node2D

const FREQ_INCREMENT: float = 0.6
@onready var sine_wave_mat = $ColorRect.material

var freq: float
var time_scale: float
var size: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	freq = sine_wave_mat.get_shader_parameter('freq')
	time_scale = sine_wave_mat.get_shader_parameter('time_scale')
	size = sine_wave_mat.get_shader_parameter('size')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_Q):
		sine_wave_mat.set_shader_parameter('freq', freq - delta * FREQ_INCREMENT)
		freq = sine_wave_mat.get_shader_parameter('freq')
	if Input.is_key_pressed(KEY_E):
		sine_wave_mat.set_shader_parameter('freq', freq + delta * FREQ_INCREMENT)
		freq = sine_wave_mat.get_shader_parameter('freq')
