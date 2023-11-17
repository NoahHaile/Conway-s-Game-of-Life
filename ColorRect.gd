extends ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set the initial color of the ColorRect to black.
	self.color = Color.BLACK
	self.size = get_viewport_rect().size
	
	
	# Make sure the ColorRect is reacting to mouse input.
	set_process_input(true)

# Override the _input function to respond to mouse clicks.
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Calculate the local position by subtracting the global position of the ColorRect.
		var local_position = event.position - global_position
		# Check if the click is within the ColorRect area.
		if get_rect().has_point(local_position):
			# If the color is black, change it to white, and vice versa.
			self.color = Color.WHITE if self.color == Color.BLACK else Color.BLACK

# _process function can be removed if not used for other purposes.
