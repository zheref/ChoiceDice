import ComposableArchitecture
import Foundation

struct Roll: ReducerProtocol {
    
    struct State: Equatable {
//        @BindingState var dices: [Dice] = [
//            .init(name: "Sede Bodytech", options: ["Rio Sur", "Viscaya", "Las Americas"]),
//            .init(name: "Color de Ropa", options: ["Negro", "Amarillo", "Rojo", "Azul", "Blanco", "Verde"]),
//            .init(name: "Coworking Café", options: ["Pergamino", "Urbania", "Café Dragon", "Al Alma", "Juan Valdez", "Semilla"])
//        ]

        @BindingState var dices: [Dice] = []

        @PresentationState var destination: Destination.State?
    }

    struct Destination: ReducerProtocol {
        enum State: Equatable {
            case rollDetail(RollDetail.State)
            case addRoll(AddRoll.State)
        }

        enum Action {
            case rollDetail(RollDetail.Action)
            case addRoll(AddRoll.Action)
        }

        var body: some ReducerProtocolOf<Self> {
            Scope(state: /State.rollDetail, action: /Action.rollDetail) {
                RollDetail()
            }
            Scope(state: /State.addRoll, action: /Action.addRoll) {
                AddRoll()
            }
        }
    }
    
    enum Action: BindableAction {
        case started

        // User actions
        case navigateToDice(dice: Dice)
        case addNewRoll

        // Effect actions
        case installDices([Dice])

        // Automatic actions
        case destination(PresentationAction<Destination.Action>)
        case binding(BindingAction<State>)
    }

    enum DelegateAction {
        case addNewDice(dice: Dice)
    }

    let dicesKey = "dices"

    @Dependency(\.keyValueStorage) var keyValueStorage
    
    var body: some ReducerProtocolOf<Self> {
        Reduce { state, action in
            switch action {
            case .addNewRoll:
                state.destination = .addRoll(.init())
                return .none
            case .installDices(let dices):
                state.dices = dices
                return .none
            case .started:
                return .run { send in
                    let dices = keyValueStorage.readDices(dicesKey)
                    await send(.installDices(dices ?? []))
                }
            case .binding:
                return .none
            case .navigateToDice(let dice):
                state.destination = .rollDetail(.init(dice: dice))
                return .none
            case .destination(.presented(.addRoll(.rollAction(.addNewDice(dice: let dice))))):
                state.dices.append(dice)
                state.destination = nil
                return .run { [dices = state.dices] _ in
                    keyValueStorage.saveDices(dicesKey, dices)
                }
            case .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: /Action.destination) {
            Destination()
        }
    }
    
}
