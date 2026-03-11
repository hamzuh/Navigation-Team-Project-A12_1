extends Button

@onready var topnode: Node = $"../../.."

func _on_pressed() -> void:
	topnode.new_select(self.text)
