extends Control

@onready var PointLabel = $HBoxContainer/Label2
# Called when the node enters the scene tree for the first time.
func _ready():
	PointLabel.text = str(System._point) + " Points"
