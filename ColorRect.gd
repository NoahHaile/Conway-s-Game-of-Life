extends ColorRect
const Cell = preload("res://cell.gd")
# Called when the node enters the scene tree for the first time.

var size = 30
var gap = 2
var number_of_rows = get_viewport_rect().size.x / size + gap

func _ready():
	# Set the initial color of the ColorRect to black.
	self.color = Color.DARK_GRAY
	self.size = get_viewport_rect().size
	
	for j in range( number_of_rows ):
		for i in range( number_of_rows ):
			var child_rect = Cell.new()
			child_rect.size = Vector2(size, size) 
			# Calculate a position offset for each child to avoid overlap.
			child_rect.position = Vector2(i * ( size + gap ), j * ( size + gap ))
			add_child(child_rect)

func get_colorRect_life():
	var cell_colors = []
	for child in self.get_children():
		if child is Cell:
			cell_colors.append(child.color == Color.WHITE if true else false)
			
	return cell_colors

func count_living_neighbors(index, cell_states):
	var living_neighbors_count = 0
	if( index - number_of_rows > 0 ):
		
		
	
func survival_check():
	var cell_states = get_colorRect_life()
	
# _process function can be removed if not used for other purposes.
func _process(delta):
	pass
