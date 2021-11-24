extends RichTextLabel


func conclude(reponse_juste : bool, true_proportion: String,is_dioxygene, represente):
	var molec = "dioxygène" if is_dioxygene else "diazote"
	var air_prop = "1/5 (=0.2) ou 20%"  if is_dioxygene else "4/5 (=0.8) ou 80%"
	var t = "[color=black][b]Pour le bocal qui pourrait représenter l'air:[/b][/color]\n\n"
	t+= "[b]"
	t += "Bravo!" if reponse_juste else "Ce n'est pas encore tout à fait compris!"
	t+= "[/b]"
	t+= "\nLa proportion de " + molec + " dans l'air est de: "+air_prop+"."
	t += "\nLa proportion de "+molec+" dans le bocal est de "+true_proportion
	if represente: t+= " donc le bocal [color=red]pourrait[/color] représenter l'air"
	else: t+= " donc le bocal [b]ne pourrait pas[/b] représenter l'air"
	bbcode_enabled = true
	bbcode_text = t
