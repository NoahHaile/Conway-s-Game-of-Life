extends ColorRect
const Cell = preload("res://cell.gd")
# Called when the node enters the scene tree for the first time.
func _ready():
	# Set the initial color of the ColorRect to black.
	self.color = Color.DARK_GRAY
	self.size = get_viewport_rect().size
	for i in range(20): # This will create 4 children as an example.
		var child_rect = Cell.new()
		# Calculate a position offset for each child to avoid overlap.
		child_rect.position = Vector2(i * 32, 0)
		add_child(child_rect)
	# Make sure the ColorRect is reacting to mouse input.

# Override the _input function to respond to mouse clicks.


# _process function can be removed if not used for other purposes.
