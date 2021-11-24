extends ColorRect

onready var position_dajout = $position_dajout.position
const dioxygene = "dioxygène"
const diazote = "diazote"
var molecule
var my_color
func _ready() -> void:
	start()

func start():
	randomize()
	molecule =  dioxygene if randf() > 0.5 else diazote
	my_color = "red" if molecule == dioxygene else "blue"
	$bocal/gestion_spatiale_molecules.random_populate([preload("res://molecules/diazote.tscn"),preload("res://molecules/dioxygene.tscn")],10)
	$bocal.start()
	$Panel/VBoxContainer/question.bbcode_text = $Panel/VBoxContainer/question.consigne(molecule,my_color)



func validate():
	var answer_proportion_to_print = $Panel/VBoxContainer/question1/answer_proportion.text
	var answer_proportion = div2float(answer_proportion_to_print)
	var res = $bocal.count()
	var o2 = res[0]
	var n2 = res[1]
	
	var nombre  = o2 if molecule == dioxygene else n2
	var nombre_total = o2+n2
	
	var proportion_to_print = str(nombre) + "/" + str(nombre_total)
	var proportion = float(nombre) / float(nombre_total)
	
	var pourcentage = stepify(proportion *100,0.01)
	pourcentage = str(pourcentage)
	
	
	var success : bool = proportion == answer_proportion if answer_proportion else false
	$Panel/VBoxContainer/answers/validate_message.answer(
		success,
		answer_proportion_to_print,
		nombre,
		molecule,
		nombre_total,
		proportion_to_print,
		pourcentage
		)
	#peut il représenter l'air qu'on respire?
	var reponse = $Panel/VBoxContainer/question2/ItemList.get_selected_items()
	var answer_peut_representer = reponse[0] == 0
	var peut_representer = molecule == dioxygene and proportion == 1.0/5.0 or \
							molecule == diazote and proportion == 4.0/5.0 
	var reponse_juste = answer_peut_representer == peut_representer
	var represente : bool = molecule == dioxygene and proportion == 0.2\
					or molecule == diazote and proportion == 0.8
	$conclusion/conclusion.conclude(reponse_juste,str(proportion),molecule == dioxygene,represente)
	
	
func effacer_reponses():
	$Panel/VBoxContainer/answers/validate_message.bbcode_text = ""
	$conclusion/conclusion.bbcode_text = ""
	
func ajouter_diox():
	ajouter_molecule(preload("res://molecules/dioxygene.tscn"))

func ajouter_diaz():
	ajouter_molecule(preload("res://molecules/diazote.tscn"))
	
func ajouter_molecule(molec):
	effacer_reponses()
	var i = molec.instance()
	i.position = position_dajout
	$bocal.add_child(i)
	
	i.start()
	var count = $bocal.count()
	if count[0] + count[1] >= 25:
		_on_recommencer_pressed()




func _on_validate_button_down() -> void:
	validate()

func _on_Button_toggled(button_pressed: bool) -> void:
	if button_pressed:
		$bocal.start()
	else:
		$bocal.stop()


func _on_recommencer_pressed() -> void:
	for c in $bocal.get_children():
		if c.has_method("start"):
			c.queue_free()
	start()


func div2float(div : String) -> float:
	if "/" in div:
		var res = div.split("/")
		if len(res) < 2:
			return 0.0
		return float(res[0])/float(res[1])
	else: return str2var(div)
