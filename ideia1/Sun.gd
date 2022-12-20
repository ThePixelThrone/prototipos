extends DirectionalLight


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dayDuration = 20 #seconds
var timeOfDay = 0
var yellowNoonHSV = Color().from_hsv(60.0/255, 77.0/255, 100.0/255)
var midNightHSV = Color().from_hsv(235.0/255, 100.0/255, 53.0/255)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timeOfDay += delta
	timeOfDay = fmod(timeOfDay,dayDuration)
	var weight = (timeOfDay / dayDuration)
	var newColor = yellowNoonHSV.linear_interpolate(midNightHSV, weight)
	self.light_color = newColor
	print(weight)
