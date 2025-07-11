extends Panel

@onready var label = $Label

func _ready():
	self.modulate.a = 0.5
	self.mouse_filter = Control.MOUSE_FILTER_IGNORE

func _process(_delta):
	var fps = Performance.get_monitor(Performance.Monitor.TIME_FPS)
	var mem = Performance.get_monitor(Performance.Monitor.MEMORY_STATIC) / (1024.0 * 1024.0)
	var draw_calls = Performance.get_monitor(Performance.Monitor.RENDER_TOTAL_DRAW_CALLS_IN_FRAME)
	var physics_time = Performance.get_monitor(Performance.Monitor.TIME_PHYSICS_PROCESS)
	var object_count = Performance.get_monitor(Performance.Monitor.OBJECT_COUNT)

	label.text = \
	"Debug Overlay\n" +\
	"FPS:           %d         \n" % fps +\
	"Memory:        %.2f MB    # RAM-Verbrauch\n" % mem +\
	"Draw Calls:    %d         # Rendering Load\n" % draw_calls +\
	"Physics Time:  %.3f ms    # Physik-Performance\n" % (physics_time * 1000.0) +\
	"Object Count:    %d         # Godot-Objekte\n" % object_count
