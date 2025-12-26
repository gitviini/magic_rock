extends CharacterBody2D

const SPEED = 50
var can_shoot := true
@export var projectile := preload("res://src/projectile/projectile.tscn")

func animation() -> void:
	if(velocity.length() != 0):
		$Sprite2D.flip_h = velocity.x < 0
	if(Input.is_action_pressed("ui_up") and can_shoot):
		shoot()
		return
	$AnimationPlayer.play("normal")

func _physics_process(_delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * SPEED

	animation()
	move_and_slide()

func shoot():
	var new_projectile = projectile.instantiate()
	new_projectile.global_position = global_position
	new_projectile.global_position.y -= 10
	get_parent().add_child(new_projectile)
	$projectile.visible = false
	can_shoot = false
	$TimerShootCoolDown.start()


func _on_timer_shoot_cool_down_timeout() -> void:
	can_shoot = true
	$projectile.visible = true
	
