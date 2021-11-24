extends RichTextLabel


func answer(success,their_answers,nombre,molecule,nombre_total,proportion,pourcentage):
	var t = "[color=black][b]Pour la proportion :[/b][/color]\n\n"
	t += "[b]"
	t += "Bravo!" if success else "Ce n'est pas encore compris!" 
	t += "[/b]"
	t += "\nTu as répondu : "
	t+= their_answers #prends compte de si la fraction et le pourcentage donné corresponde
	t += ". Il y a " + str(nombre) + " particules de " + molecule
	t += " sur " + str(nombre_total) + " particules au total.\n"
	t += "donc la proportion est de : " + str(proportion)
	t += "\n(ou encore de " + pourcentage + " %.)"
	bbcode_enabled = true
	bbcode_text = t
