class_name StatelessStateRepresentation

var transitions: Dictionary

var _state: Variant


static func create(state: Variant) -> StatelessStateRepresentation:
	return StatelessStateRepresentation.new(state)


func _init(state: Variant) -> void:
	_state = state
