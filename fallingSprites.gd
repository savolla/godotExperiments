########################################################################## 
# This script creates two nodes (Button and Sprite)
# and when the Button is pressed it spawns a Sprite at a random
# location then makes the sprite fall down. Then increments a number
# on the button
# 
# author: savolla
# type: shittyGames
# file: Godot script
##########################################################################

extends Node

var buttonObject = Button.new() # instantiating (creating) a button from Button class
var newlyCreatedSprite = Sprite.new() # instantiating (creating) a sprite obj from Sprite class
var numberToDisplayOnButtonObject = 1 # a number for displaying on button (press counter)

func _ready(): # this function is a built-in function of Godot game engine. it's like an initializer
	
	randomize() # sets a random seed (srand() like). we need it to spawn the sprite on random locations

	# initializing button object
	self.add_child(buttonObject) # adding button object as a child of Node2D. self is the script owner node
	buttonObject.text = "Press Me" # setting text to displaying on the button
	buttonObject.rect_position = Vector2(200,200) # setting buttons position on the screen. Vector2(x,y)
	
	# when button is pressed make the sprite fall down. self is the spript owner node
	buttonObject.connect("pressed", self, "userDefinedFallDownFunction")

func userDefinedFallDownFunction():
	self.add_child(newlyCreatedSprite) # adding a sprite node to make it fall
	newlyCreatedSprite.texture = preload("res://icon.png") # setting the texture of this sprite
	newlyCreatedSprite.position = Vector2( randi() % 500, randi() % 300 ) # spawn it on random locations
	buttonObject.text = str(numberToDisplayOnButtonObject) # incrment the number on the button
	numberToDisplayOnButtonObject += 1 # increment the number to display it later
	
	
func _process(delta): # another built-in function. This function is called every frame of the game
	newlyCreatedSprite.position.y += 30 # every frame increment Y coordinate of the sprite to make it fall


