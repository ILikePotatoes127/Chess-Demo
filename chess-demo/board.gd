extends Node2D

var piece_resource = preload("res://piece.tscn")

var code_to_piece:Dictionary={
	"w ":preload("res://1-Bit/Pieces/Chess - white 1-bit/pixil-layer-0.png"),
	"wK":preload("res://1-Bit/Pieces/Chess - white 1-bit/pixil-layer-5.png"),
	"wQ":preload("res://1-Bit/Pieces/Chess - white 1-bit/pixil-layer-4.png"),
	"wR":preload("res://1-Bit/Pieces/Chess - white 1-bit/pixil-layer-3.png"),
	"wN":preload("res://1-Bit/Pieces/Chess - white 1-bit/pixil-layer-1.png"),
	"wB":preload("res://1-Bit/Pieces/Chess - white 1-bit/pixil-layer-2.png"),
	"b ":preload("res://1-Bit/Pieces/Chess - black 1-bit/pixil-layer-0.png"),
	"bK":preload("res://1-Bit/Pieces/Chess - black 1-bit/pixil-layer-5.png"),
	"bQ":preload("res://1-Bit/Pieces/Chess - black 1-bit/pixil-layer-4.png"),
	"bR":preload("res://1-Bit/Pieces/Chess - black 1-bit/pixil-layer-3.png"),
	"bN":preload("res://1-Bit/Pieces/Chess - black 1-bit/pixil-layer-1.png"),
	"bB":preload("res://1-Bit/Pieces/Chess - black 1-bit/pixil-layer-2.png")
}

var color_code:Dictionary = {
	"w":"white",
	"b":"black"
}

var code_to_type:Dictionary={
	" ":"pawn",
	"K":"king",
	"Q":"queen",
	"R":"rook",
	"N":"knight",
	"B":"bishop"
}

var starting_pos:Array[String]=[
	"bR07", "bN17", "bB27", "bQ37", "bK47", "bB57", "bN67", "bR77",
	"b 06", "b 16", "b 26", "b 36", "b 46", "b 56", "b 66", "b 76", 
	
	"wR00", "wN10", "wB20", "wQ30", "wK40", "wB50", "wN60", "wR70",
	"w 01", "w 11", "w 21", "w 31", "w 41", "w 51", "w 61", "w 71",
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	new_board()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func new_board():
	place_pieces(starting_pos)

func place_pieces(codes:Array[String])->void:
	for code in codes:
		var piece = piece_resource.instantiate()
		piece.color = color_code[code.substr(0,1)]
		piece.type = code_to_type[code.substr(1,1)]
		piece.texture = code_to_piece[code.substr(0,2)]
		piece.get_child(0).texture = piece.texture
		code = code.substr(2)
		piece.index = Vector2(int(code.substr(0,1)), int(code.substr(1,1)))
		add_child(piece)
		code = code.substr(2)
		piece.global_position = piece.index*Vector2(32, -32)+Vector2(16, -16)
	
