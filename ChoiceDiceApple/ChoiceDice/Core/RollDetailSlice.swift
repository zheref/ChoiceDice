import ComposableArchitecture
import Foundation

func getRandomOption(from options: [String]) -> String? {
    guard !options.isEmpty else {
        return nil
    }

    let randomIndex = Int.random(in: 0..<options.count)
    return options[randomIndex]
}

struct RollDetailSlice: ReducerProtocol {

    struct State: Equatable, Identifiable {
        let id = UUID()
        var dice: Dice
        var randomPick: String?
    }

    enum Action: BindableAction {
        case started
        case userTappedRegenerate
        case binding(BindingAction<State>)
    }

    var body: some ReducerProtocolOf<Self> {
        Reduce { state, action in
            switch action {
            case .started:
                state.randomPick = getRandomOption(from: state.dice.options)
                return.none
            case .userTappedRegenerate:
                state.randomPick = getRandomOption(from: state.dice.options)
                return.none
            case .binding:
                return .none
            }
        }
    }

}
