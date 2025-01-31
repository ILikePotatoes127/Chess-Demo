extends Node2D

class_name Piece

@onready var button: TextureButton = $TextureButton

var color:String 
var index:Vector2
var type:String
var texture:CompressedTexture2D

func _ready() -> void:
	print(color)
	print(index)
	print(type)
	print(texture)
	

func _on_piece_pressed() -> void:
	print("huioeasg")
