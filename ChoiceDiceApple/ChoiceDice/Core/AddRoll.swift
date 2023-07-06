import ComposableArchitecture
import Foundation

struct AddRoll: ReducerProtocol {

    struct RollOption: Equatable, Identifiable {
        let id = UUID()
        let name: String
    }

    struct State: Equatable {
        @BindingState var name: String = ""
        @BindingState var newOption: String = ""
        var options: [RollOption] = []
    }

    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case userWantsToAddRoll
        case userFinishedAddRoll
    }

    var body: some ReducerProtocol<State, Action> {
        BindingReducer()

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
