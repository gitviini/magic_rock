extends RigidBody2D

@export var MAX_SPEED := 80
@export var MIN_SPEED := 40
@export var sprite_falling_variant := 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SpriteRock.frame = randi_range(0, sprite_falling_variant)
	linear_velocity.y = randi_range(MIN_SPEED, MAX_SPEED)
	$AnimationPlayer.play("falling")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	destroy()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name in ["ground", "rock", "magic"] and body != $"."):
		destroy()
	if(body.name in ["ground", "magic"]):
		pass
		


func _on_timer_destroy_timeout() -> void:
	queue_free()

func destroy() -> void:
	$AnimationPlayer.play("break")
	$TimerDestroy.start(0.5)
	linear_velocity = Vector2.ZERO
