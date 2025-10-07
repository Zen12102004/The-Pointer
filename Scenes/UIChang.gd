extends CanvasLayer
@onready var PointLabel = $Control/Panel/PointLabel
@onready var HealthLabel = $Control/Panel2/HealthLabel
func _ready():
	PointLabel.text = "Points : 0"
	HealthLabel.text = "Health : 100"
	System.point_changed.connect(_on_point_changed)
	System.health_changed.connect(_om_health_changed)

func _on_point_changed(new_value: int):
	print("Points", new_value)	
	PointLabel.text = "Points : " + str(new_value)

func _om_health_changed(new_value:int):
	HealthLabel.text = "Health :" + str(new_value)
