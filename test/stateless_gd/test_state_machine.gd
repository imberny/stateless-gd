extends GutTest

enum BasicStates { IDLING, WALKING }
enum BasicTriggers { WALK, STOP }


func test_basic_state_machine():
	var sm := StatelessStateMachine.create(BasicStates.IDLING)

	sm.configure(BasicStates.IDLING).permit(BasicTriggers.WALK, BasicStates.WALKING)
	sm.configure(BasicStates.WALKING).permit(BasicTriggers.STOP, BasicStates.IDLING)

	assert_not_null(sm)
	assert_eq(sm.current_state, BasicStates.IDLING)

	sm.fire(BasicTriggers.WALK)

	assert_eq(sm.current_state, BasicStates.WALKING)

	sm.fire(BasicTriggers.STOP)

	assert_eq(sm.current_state, BasicStates.IDLING)
