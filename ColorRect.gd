extends ColorRect
const Cell = preload("res://cell.gd")
# Called when the node enters the scene tree for the first time.
func _ready():
	# Set the initial color of the ColorRect to black.
	self.color = Color.DARK_GRAY
	self.size = get_viewport_rect().size
	var size = 30
	var gap = 2
	for j in range(get_viewport_rect().size.x / size + gap ):
		for i in range(get_viewport_rect().size.x / size + gap ): # This will create 4 children as an example.
			var child_rect = Cell.new()
			child_rect.size = Vector2(size, size) 
			# Calculate a position offset for each child to avoid overlap.
			child_rect.position = Vector2(i * ( size + gap ), j * ( size + gap ))
			add_child(child_rect)
	# Make sure the ColorRect is reacting to mouse input.

# Override the _input function to respond to mouse clicks.


# _process function can be removed if not used for other purposes.
