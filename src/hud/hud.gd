extends CanvasLayer

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.change_stats.connect(handle_stats)


func handle_stats() -> void:
	score = Global.score
	$Label.text = str(score)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
