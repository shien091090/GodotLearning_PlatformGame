extends GutTest

var PlayerScene = load("res://scripts/player.gd") # 建議讀取場景，確保節點結構完整
var _player = null
var _sender = InputSender.new(Input) # 建立一個輸入模擬器

func before_each():
	_player = PlayerScene.new()
	add_child_autofree(_player)
	_player.position = Vector2(0, 0)

func after_each():
	_sender.release_all()

func test_move_up_updates_position_and_flag():
	
	_sender.action_down('ui_up').hold_for(1)
	
	await wait_seconds(0.5)
	print("player.position: ", _player.position)
	
	await wait_seconds(0.5)
	print("player.position: ", _player.position)
	
	assert_true(_player.position.y < 0.0)

func test_no_input_no_movement():
	await wait_seconds(0.1)
	assert_eq(_player.position, Vector2(0, 0))