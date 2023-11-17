'''
Eric J. Estadt
10.29.23
'''
extends "res://addons/gut/test.gd"
'''
var Shooter = preload("res://Level1/Shooter.gd")

func test_shooter_input(): 
	var shooter = Shooter.new()
	var bulletPath = preload("res://Level1/Bullet.tscn")
	shooter.owner = Shooter
	var result = shooter.shoot1()
	
	assert_eq(result, true)
'''
var Options = preload("res://Scripts/Options2.gd")
var MainMenu = preload("res://Scripts/main_menu.gd")
func test_Options(): 
	var options = Options.new() 
	var result = options._on_master_slider_value_changed(1)
	assert_eq(result, true) 
	result = options._on_music_slider_value_changed(1)
	assert_eq(result, true) 
	result = options._on_sfx_slider_value_changed(1)
	assert_eq(result, true) 
	
func test_MainMenu():
	var mainmenu = MainMenu.new()
	var result = mainmenu._on_options_pressed()
	assert_eq(result, true) 
	result = mainmenu._on_play_pressed()
	assert_eq(result, true) 
'''
func test_pass():
	var x = 0
	x *= 100
	assert_eq(x, 0)
	
func test_fail():
	var x = 0
	x *= 100
	assert_eq(x, 100)
	
#Error messages
#vvvvvvvvvvvvvv
func test_pass_with_msg():
	var x = 0
	x *= 100
	assert_eq(x, 0, "0*100 is 0")
func test_fail_with_msg():
	var x = 0
	x *= 100
	assert_eq(x, 100, "0*100 is 0")

#Parameter tests
#Use this to replace values automatically if 
#you are testing multiple of the same thing
#vvvvvvvvvvvvvvv

var y = [0, 100]

func test_param_test(params=use_parameters(y)):
		assert_eq(y, 100)
'''




