import ComposableArchitecture
import Foundation

struct Roll: ReducerProtocol {
    
    struct State: Equatable {
        @BindingState var dices: [Dice] = [
            .init(name: "Sede Bodytech", options: ["Rio Sur", "Viscaya", "Las Americas"]),
            .init(name: "Color de Ropa", options: ["Negro", "Amarillo", "Rojo", "Azul", "Blanco", "Verde"]),
            .init(name: "Coworking Café", options: ["Pergamino", "Urbania", "Café Dragon", "Al Alma", "Juan Valdez", "Semilla"])
        ]

        @PresentationState var destination: Destination.State?
    }

    struct Destination: ReducerProtocol {
        enum State: Equatable {
            case rollDetail(RollDetailSlice.State)
        }

        enum Action {
            case rollDetail(RollDetailSlice.Action)
        }

        var body: some ReducerProtocolOf<Self> {
            Scope(state: /State.rollDetail, action: /Action.rollDetail) {
                RollDetailSlice()
            }
        }
    }
    
    enum Action: BindableAction {
        case started

        case destination(PresentationAction<Destination.Action>)
        case navigateToDice(dice: Dice)
        
        case binding(BindingAction<State>)
    }
    
    var body: some ReducerProtocolOf<Self> {
        Reduce { state, action in
            switch action {
            case .started:
                return .none
            case .binding:
                return .none
            case .navigateToDice(let dice):
                state.destination = .rollDetail(.init(dice: dice))
                return .none
            case .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: /Action.destination) {
            Destination()
        }
    }
    
}
