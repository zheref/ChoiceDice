import ComposableArchitecture
import SwiftUI

struct RollView: View {
    let store: StoreOf<Roll>
    
    var body: some View {
        WithViewStore(store, observe: \.dices) { viewStore in
            Text("Hay \(viewStore.state.count) dados")
        }
        .task {
//            store.send(.started)
        }
        
    }
}

struct RollView_Previews: PreviewProvider {
    static var previews: some View {
        RollView(store: Store(
            initialState: Roll.State(),
            reducer: Roll()
        ))
    }
}
