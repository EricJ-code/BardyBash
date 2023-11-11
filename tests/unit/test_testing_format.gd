'''
Eric J. Estadt
10.29.23
'''
extends "res://addons/gut/test.gd"

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





