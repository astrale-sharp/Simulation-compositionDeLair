extends Node2D

func start():
	for c in get_children():
		if c.has_method("start"):
			c.start()

func stop():
	for c in get_children():
		if c.has_method("stop"):
			c.stop()

func count():
	"return number O2, number N2"
	var res = []
	var o2 = 0
	var n2 = 0
	for c in get_children():
		if c.has_method("get_type"):
			if c.type == 0:
				o2 += 1
			elif c.type == 1:
				n2 += 1
			else:
				print("panicking...")
				print("type : ")
				print(c.type)
	res.append(o2)
	res.append(n2)
	return res

