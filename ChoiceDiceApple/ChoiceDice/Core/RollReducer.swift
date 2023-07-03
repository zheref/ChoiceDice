import ComposableArchitecture
import Foundation

struct Roll: ReducerProtocol {
    
    struct State: Equatable {
        @BindingState var dices: [Dice] = [
            .init(name: "Sede Bodytech", options: ["Rio Sur", "Viscaya", "Las Americas"]),
            .init(name: "Color de Ropa", options: ["Negro", "Amarillo", "Rojo", "Azul", "Blanco", "Verde"]),
            .init(name: "Coworking Café", options: ["Pergamino", "Urbania", "Café Dragon", "Al Alma", "Juan Valdez", "Semilla"])
        ]
    }
    
    enum Action: BindableAction {
        case started
        
        case binding(BindingAction<State>)
    }
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .started:
                return .none
            case .binding:
                return .none
            }
        }
    }
    
}
