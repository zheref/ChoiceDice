import ComposableArchitecture
import SwiftUI

struct RollView: View {
    let store: StoreOf<Roll>
    
    struct DicesViewState: Equatable {
        @BindingViewState var dices: [Dice]
        
        init(store: BindingViewStore<Roll.State>) {
            self._dices = store.$dices
        }
    }
    
    var body: some View {
        WithViewStore(store, observe: \.dices) { viewStore in
            List {
                ForEach(viewStore.state, id: \.name) { dice in
                    Text(dice.name)
                }
            }
        }
        .navigationTitle("Roll a dice")
        .task {
            store.send(.started)
        }
        
    }
}

struct RollView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RollView(store: Store(
                initialState: Roll.State(),
                reducer: Roll()
            ))
        }
    }
}
