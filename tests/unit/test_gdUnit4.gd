class_name GdUnitExampleTest
extends GdUnitTestSuite

# Load necessary scripts
var Options = preload("res://Scripts/Options2.gd")
var MainMenu = preload("res://Scripts/main_menu.gd")

# Define a test case for an example
func test_example():
 assert_str("This is a example message")\
   .has_length(25)\
   .starts_with("This is a ex")

# Define a test case for the Options script
func test_Options(): 
# Instantiate the Options script
 var options = Options.new() 
# Invoke a method and store the result
 var result = options._on_master_slider_value_changed(1)
 # Free the instantiated Options script
 options.queue_free()
 # Assert the result is a boolean value
 assert_bool(result) 
  # Invoke another method and store the result
 result = options._on_music_slider_value_changed(1)
# Assert the result is a boolean value
 assert_bool(result) 
# Invoke another method and store the result
 result = options._on_sfx_slider_value_changed(1)
# Assert the result is a boolean value
 assert_bool(result) 

# Define a test case for the MainMenu script
func test_MainMenu():
# Instantiate the MainMenu script
 var mainmenu = MainMenu.new()
# Invoke a method and store the result
 var result = mainmenu._on_options_pressed()
 # Assert the result is a boolean value
 assert_bool(result) 
 # Invoke another method and store the result
 result = mainmenu._on_play_pressed()
 # Assert the result is a boolean value
 assert_bool(result) 

