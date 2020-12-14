extends TileMap

const size := 150
const cell_res = 160

var dirs := [Vector2(1, 0), Vector2(-1, 0), Vector2(0, 1), Vector2(0, -1)]
var grid := []

func _ready() -> void:
	maze(Vector2.ONE, [Vector2.ONE], [])
	maze(Vector2.ONE, [Vector2.ONE], [])
	maze(Vector2.ONE, [Vector2.ONE], [])

var player_spawned := false
var cards_spawned := false
func _process(delta: float) -> void:
	var world = get_parent().get_parent()
	
	if not player_spawned:
		player_spawned = true
		world.get_node("Player").position = map_to_world(grid[0][0]) + Vector2(cell_res/2, cell_res/2)
		world.get_node("Devil").position = map_to_world(grid[int(size / 2)][0]) + Vector2(cell_res/2, cell_res/2)
	
	if not cards_spawned:
		cards_spawned = true
		var card := preload("res://Card/Card.tscn")
		for i in 9:
			var card_instance := card.instance()
			var card_cell = grid[randi() % grid.size()][0]
			card_instance.position = map_to_world(card_cell) + Vector2.ONE * cell_res/2
			world.add_child(card_instance)
	
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()

func maze(current, visited, walls):
	randomize()
	
	while visited.size() < size:
		var rand_dir = dirs[randi() % dirs.size()]
		var rand_neighbor = current + rand_dir * 2
		
		if visited.find(rand_neighbor) == -1:
			grid.append([current + rand_dir, 1])
			grid.append([rand_neighbor, 1])
			visited.append(rand_neighbor)
		current = rand_neighbor
	
	for dir in [Vector2(1, 0), Vector2(-1, 0), Vector2(0, 1), Vector2(0, -1), Vector2(1, 1), Vector2(-1,-1), Vector2(-1,1), Vector2(1, -1)]:
		grid.append([dir + grid[0][0], 1])
		
	
	for cell in grid:
		set_cell(cell[0].x, cell[0].y, cell[1])
		
		for dir in dirs:
			if get_cellv(cell[0] + dir) == -1:
				set_cellv(cell[0] + dir, 0)
				walls.append(cell[0] + dir)
		
	for wall in walls:
		for dir in dirs:
			if get_cellv(wall + dir) == -1:
				set_cellv(wall + dir, 0)
