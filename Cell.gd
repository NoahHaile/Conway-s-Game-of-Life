extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	# Set the initial color of the ColorRect to black.
	self.color = Color.BLACK
	self.size = Vector2(30, 30)
	# Make sure the ColorRect is reacting to mouse input.
	set_process_input(true)
	
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Check if the click is within the ColorRect area.
		if get_rect().has_point(event.position):
			# If the color is black, change it to white, and vice versa.
			self.color = Color.WHITE if self.color == Color.BLACK else Color.BLACK

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
