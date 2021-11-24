extends TileMap


var width : int= 28
var height : int = 42
var diametre = 7
var safe_diametre = 7
var max_by_line = width / safe_diametre
var max_by_col = height / safe_diametre
var unit = 8 #pixel

func get_available_positions():
	cell_size = Vector2.ONE *7 * 8
	var res = []
	for x in max_by_line:
		for y in max_by_col:
			res.append(map_to_world(Vector2(x,y)) +cell_size/2 )
	return res

func random_populate(molecule_list,max_):
	var count = 0
	for pos in get_available_positions():
		var molec = molecule_list[randi() % 2] #random choose molec
		var instance = molec.instance()
		instance.position = pos
		get_parent().add_child(instance)
		count += 1
		if count == max_: return
