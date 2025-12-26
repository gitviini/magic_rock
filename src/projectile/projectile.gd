extends Area2D


@export var SPEED := -100
@export var sprite_falling_variant := 1

var velocity = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SpriteProjectile.frame = randi_range(0, sprite_falling_variant)
	$AnimationPlayer.play()

func _physics_process(delta: float) -> void:
	velocity.y = SPEED * delta
	position += velocity


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("saiu")
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	Global.score += 1
	Global.change_stats.emit()
	$AnimationPlayer.play("break")
	$TimerDestroy.start()
	SPEED = 0

func _on_timer_destroy_timeout() -> void:
	queue_free()
