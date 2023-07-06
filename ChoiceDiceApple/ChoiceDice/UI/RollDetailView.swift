import ComposableArchitecture
import SwiftUI

struct RollDetailView: View {
    let store: StoreOf<RollDetail>

    var body: some View {
        WithViewStore(store, observe: \.dice) { viewStore in
            VStack {
                WithViewStore(store, observe: \.randomPick) { viewStore in
                    Text(viewStore.state ?? "Nothing Picked")
                        .bold()
                        .font(.title2)
                }
                Button {
                    viewStore.send(.userTappedRegenerate)
                } label: {
                    Text("Regenerate")
                }
                .buttonStyle(BorderedProminentButtonStyle())
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
                initialState: RollDetail.State(
                    dice: .init(name: "Coworking Café", options: ["Pergamino", "Urbania", "Juan Valdez"])
                ),
                reducer: RollDetail()
            ))
        }
    }
}
