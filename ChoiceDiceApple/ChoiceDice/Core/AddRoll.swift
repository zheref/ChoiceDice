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
        // Automatic action
        case binding(BindingAction<State>)

        // User actions
        case userWantsToAddOption
        case userFinishedAddRoll

        // Parent action
        case rollAction(Roll.DelegateAction)
    }

    var body: some ReducerProtocol<State, Action> {
        BindingReducer()

        Reduce { state, action in
            switch action {
            case .userWantsToAddOption:
                state.options.append(RollOption(name: state.newOption))
                return .none
            case .userFinishedAddRoll:
                let dice = Dice(
                    name: state.name,
                    options: state.options.map({ $0.name })
                )
                return .send(
                    .rollAction(.addNewDice(dice: dice))
                )
            case .rollAction:
                // Ignore parent actions
                return .none
            case .binding:
                return .none
            }
        }
    }

}
