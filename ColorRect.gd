extends ColorRect
const Cell = preload("res://cell.gd")
# Called when the node enters the scene tree for the first time.

var cellSize = 30
var gap = 2
var number_of_rows = get_viewport_rect().size.x / (cellSize + gap)

func _ready():
	# Set the initial color of the ColorRect to black.
	self.color = Color.DARK_GRAY
	self.size = get_viewport_rect().size
	number_of_rows = get_viewport_rect().size.x / (cellSize + gap)
	for j in range( number_of_rows ):
		for i in range( number_of_rows ):
			var child_rect = Cell.new()
			child_rect.size = Vector2(cellSize, cellSize) 
			# Calculate a position offset for each child to avoid overlap.
			child_rect.position = Vector2(i * ( cellSize + gap ), j * ( cellSize + gap ))
			add_child(child_rect)
	set_process_input(true)
	
func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_SPACE:
		var future_cell_states = survival_check()
		var i = 0
		for child in self.get_children():
			if child is Cell:
				if future_cell_states[i]:
					child.color =  Color.WHITE
				else:
					child.color = Color.BLACK
				i += 1

func get_colorRect_life():
	var cell_colors = []
	for child in self.get_children():
		if child is Cell:
			if child.color == Color.WHITE:
				cell_colors.append(true)
			else:
				cell_colors.append(false)
			
	return cell_colors

func count_living_neighbors(index, cell_states):
	var living_neighbors_count = 0
	
	if( index - number_of_rows >= 0 ):
		print("sdfadf")
		if cell_states[index - number_of_rows] == true:
			living_neighbors_count += 1
			
	if( index + number_of_rows < number_of_rows * number_of_rows ):
		if cell_states[index + number_of_rows] == true:
			living_neighbors_count += 1	
	
	if( index % int(number_of_rows) != 0 ):
		if cell_states[index - 1] == true:
			living_neighbors_count += 1	
			
	if( index % int(number_of_rows) != number_of_rows - 1 ):
		if cell_states[index + 1] == true:
			living_neighbors_count += 1
	
	if( index - number_of_rows >= 0):
		if ( index % int(number_of_rows) != 0):
			if cell_states[index - 1 - number_of_rows] == true:
				living_neighbors_count += 1
				
		if ( index % int(number_of_rows) != number_of_rows - 1):
			if cell_states[index + 1 - number_of_rows] == true:
				living_neighbors_count += 1
				
	
	if( index + number_of_rows < number_of_rows * number_of_rows ):
		if ( index % int(number_of_rows) != 0):
			if cell_states[index - 1 + number_of_rows] == true:
				living_neighbors_count += 1
		if ( index % int(number_of_rows) != number_of_rows - 1):
			if cell_states[index + 1 + number_of_rows] == true:
				living_neighbors_count += 1
	
	return living_neighbors_count
	
func survival_check():
	var cell_states = get_colorRect_life()
	
	var future_cell_states = []
	
	var i = 0
	for cell_life in cell_states:
		var living_neighbors_count = count_living_neighbors(i, cell_states)
		
		if cell_life:
			if living_neighbors_count == 2 || living_neighbors_count == 3:
				future_cell_states.append(true) 
			else:
				future_cell_states.append(false)
		else:
			if living_neighbors_count == 3:
				future_cell_states.append(true)
			else:
				future_cell_states.append(false)
	
	return future_cell_states
	
# _process function can be removed if not used for other purposes.
func _process(delta):
	pass
