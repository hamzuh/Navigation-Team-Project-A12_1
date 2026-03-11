extends Control

signal position_selected(new_loc)

func new_select(location):
	position_selected.emit(location)
