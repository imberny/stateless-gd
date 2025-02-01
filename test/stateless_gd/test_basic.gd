extends GutTest

enum States { IDLING, WALKING }
enum Triggers { WALK, STOP }


func test_basic_state_machine():
	var sm := StatelessStateMachine.create(States.IDLING)

	sm.configure(States.IDLING).permit(Triggers.WALK, States.WALKING)
	sm.configure(States.WALKING).permit(Triggers.STOP, States.IDLING)

	assert_not_null(sm)
	assert_eq(sm.current_state, States.IDLING)

	sm.fire(Triggers.WALK)

	assert_eq(sm.current_state, States.WALKING)

	sm.fire(Triggers.STOP)

	assert_eq(sm.current_state, States.IDLING)
