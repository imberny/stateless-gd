class_name StatelessStateConfiguration

var _machine: StatelessStateMachine
var _state: StatelessStateRepresentation


static func create(
	machine: StatelessStateMachine, state: StatelessStateRepresentation
) -> StatelessStateConfiguration:
	return StatelessStateConfiguration.new(machine, state)


func _init(machine: StatelessStateMachine, state: StatelessStateRepresentation) -> void:
	_machine = machine
	_state = state


func permit(trigger: Variant, to_state: Variant) -> StatelessStateConfiguration:
	_state.transitions[trigger] = to_state
	return self
