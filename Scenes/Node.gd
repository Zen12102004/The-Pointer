extends Node

var objectcollectable = preload("res://Scenes/collectable.tscn")
var objectbomb = preload("res://Scenes/bomb.tscn")
var spinblade = preload("res://Scenes/spin_ball.tscn")
var hobj = preload("res://Scenes/healing.tscn")
var goldgem = preload("res://Scenes/GoldGem.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	gen_collec(Vector2(rng.randf_range(10,1000),rng.randf_range(10,500)))
	$Timer.start()

var rng = RandomNumberGenerator.new()

func gen_collec(pos):
	var spawn = objectcollectable.instantiate()
	spawn.position = pos
	add_child(spawn)

func gen_bomb(pos):
	var spawn = objectbomb.instantiate()
	spawn.position = pos
	add_child(spawn)

func gen_sblade(pos):
	var spawn = spinblade.instantiate()
	spawn.position = pos
	add_child(spawn)

func gen_hgem(pos):
	var spawn = hobj.instantiate()
	spawn.position = pos
	add_child(spawn)

func gen_ggem(pos):
	var spawn = goldgem.instantiate()
	spawn.position = pos
	add_child(spawn)
func _on_timer_timeout():
	if(System.aoc < 7):
		var random_Call = rng.randi_range(2,5)
		var decide_consumable = rng.randi_range(0,System.LimitSpawn)
		if(decide_consumable in range(0,6)):
			for n in range(1,random_Call):
				var rweidth = rng.randf_range(10,1000)
				var rheight = rng.randf_range(10,500)
				gen_collec(Vector2(rweidth,rheight))
				System.aoc += 1
		elif decide_consumable in range(6,11):
			var rweidth = rng.randf_range(10,1000)
			var rheight = rng.randf_range(10,500)
			gen_bomb(Vector2(rweidth,rheight))
		elif decide_consumable in range(10,16):
			var rweidth = rng.randf_range(10,1000)
			var rheight = rng.randf_range(10,500)
			gen_sblade(Vector2(rweidth,rheight))
		elif  decide_consumable in range(16,19):
			var rweidth = rng.randf_range(10,1000)
			var rheight = rng.randf_range(10,500)
			gen_hgem(Vector2(rweidth,rheight))
		elif  decide_consumable in range(19,20):
			var rweidth = rng.randf_range(10,1000)
			var rheight = rng.randf_range(10,500)
			gen_ggem(Vector2(rweidth,rheight))
