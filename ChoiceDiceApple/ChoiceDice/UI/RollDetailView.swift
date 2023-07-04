import ComposableArchitecture
import SwiftUI

struct RollDetailView: View {
    let store: StoreOf<RollDetailSlice>

    var body: some View {
        WithViewStore(store, observe: \.dice) { viewStore in
            VStack {
                WithViewStore(store, observe: \.randomPick) { viewStore in
                    Text(viewStore.state ?? "Nothing Picked")
                }
            }
            .navigationTitle(viewStore.state.name)
        }
        .task {
            store.send(.started)
        }
    }
}

struct RollDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RollDetailView(store: Store(
                initialState: RollDetailSlice.State(
                    dice: .init(name: "Coworking Café", options: ["Pergamino", "Urbania", "Juan Valdez"])
                ),
                reducer: RollDetailSlice()
            ))
        }
    }
}
