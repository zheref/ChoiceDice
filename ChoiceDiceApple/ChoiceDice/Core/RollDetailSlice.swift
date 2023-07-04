import ComposableArchitecture
import Foundation

struct RollDetailSlice: ReducerProtocol {

    struct State: Equatable, Identifiable {
        let id = UUID()
        var dice: Dice
    }

    enum Action: BindableAction {
        case started
        case binding(BindingAction<State>)
    }

    var body: some ReducerProtocolOf<Self> {
        Reduce { state, action in
            switch action {
            case .started:
                return.none
            case .binding:
                return .none
            }
        }
    }

}
