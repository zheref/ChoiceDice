import ComposableArchitecture
import Foundation

struct RollDetailSlice: ReducerProtocol {

    struct State: Equatable {
        var dice: Dice
        var randomPick: String?
    }

    enum Action: BindableAction {
        case started
        case userTappedRegenerate
        case binding(BindingAction<State>)
    }

    @Dependency(\.getRandomOption) var getRandomOption

    var body: some ReducerProtocolOf<Self> {
        Reduce { state, action in
            switch action {
            case .started:
                state.randomPick = getRandomOption(state.dice.options)
                return.none
            case .userTappedRegenerate:
                state.randomPick = getRandomOption(state.dice.options)
                return.none
            case .binding:
                return .none
            }
        }
    }

}
