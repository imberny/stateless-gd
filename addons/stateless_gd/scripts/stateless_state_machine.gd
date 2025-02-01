class_name StatelessStateMachine

var current_state: Variant

var _state_representations: Dictionary


static func create(start_state: Variant) -> StatelessStateMachine:
	return StatelessStateMachine.new(start_state)


func _init(start_state: Variant) -> void:
	current_state = start_state


func get_representation(state: Variant) -> StatelessStateRepresentation:
	if not _state_representations.has(state):
		_state_representations[state] = StatelessStateRepresentation.create(state)

	return _state_representations[state]


func configure(state: Variant) -> StatelessStateConfiguration:
	return StatelessStateConfiguration.create(self, get_representation(state))


func fire(trigger: Variant) -> void:
	var state: StatelessStateRepresentation = _state_representations[current_state]
	if state.transitions.has(trigger):
		var next_state: Variant = state.transitions[trigger]
		current_state = next_state
