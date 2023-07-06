import ComposableArchitecture
import Foundation

struct AddRoll: ReducerProtocol {

    struct State: Equatable {
        var name: String = ""
        var options: [String] = []
    }

    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case userWantsToAddRoll
        case userFinishedAddRoll
    }

    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .userWantsToAddRoll:
                return .none
            case .userFinishedAddRoll:
                return .none
            case .binding:
                return .none
            }
        }
    }

}
