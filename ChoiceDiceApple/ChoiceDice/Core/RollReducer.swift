import ComposableArchitecture
import Foundation

struct Roll: ReducerProtocol {
    
    struct State: Equatable {
        @BindingState var dices = [Dice]()
    }
    
    enum Action: BindableAction {
        case started
        
        case binding(BindingAction<State>)
    }
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .started:
                state.dices = [
                    .init(name: "Sede Bodytech", options: ["Rio Sur", "Viscaya", "Las Americas"])
                ]
                return .none
            case .binding:
                return .none
            }
        }
    }
    
}
