class_name GdUnitExampleTest
extends GdUnitTestSuite

var Options = preload("res://Scripts/Options2.gd")
var MainMenu = preload("res://Scripts/main_menu.gd")

func test_example():
 assert_str("This is a example message")\
   .has_length(25)\
   .starts_with("This is a ex")

func test_Options(): 
 var options = Options.new() 
 var result = options._on_master_slider_value_changed(1)
 options.queue_free()
 assert_bool(result) 
 result = options._on_music_slider_value_changed(1)
 assert_bool(result) 
 result = options._on_sfx_slider_value_changed(1)
 assert_bool(result) 

func test_MainMenu():
 var mainmenu = MainMenu.new()
 var result = mainmenu._on_options_pressed()
 assert_bool(result) 
 result = mainmenu._on_play_pressed()
 assert_bool(result) 
