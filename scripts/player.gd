extends CharacterBody2D

# 定义移动速度
var speed = 200
@onready var animated_sprite_2d = $AnimatedSprite2D

func _process(delta):
	var motion = Vector2()

	# 检测按键输入
	if Input.is_action_pressed('ui_right'):
		motion.x += 1
	if Input.is_action_pressed('ui_left'):
		motion.x -= 1
	if Input.is_action_pressed('ui_down'):
		motion.y += 1
	if Input.is_action_pressed('ui_up'):
		motion.y -= 1

	# 根据输入更新位置
	motion = motion.normalized() * speed * delta
	position += motion

	# 根据移动方向更新动画
	if motion != Vector2.ZERO:
		if motion.x > 0:
			animated_sprite_2d.play("right")  # 确保动画名称匹配你在AnimatedSprite2D中设置的名称
		elif motion.x < 0:
			animated_sprite_2d.play("left")
		elif motion.y > 0:
			animated_sprite_2d.play("up")  # 如果有向上走的动画
		elif motion.y < 0:
			animated_sprite_2d.play("down")  # 添加向下走的动画处理
	else:
		animated_sprite_2d.play("idle")  # 停止当前动画

	# 如果停止移动，播放空闲动画
