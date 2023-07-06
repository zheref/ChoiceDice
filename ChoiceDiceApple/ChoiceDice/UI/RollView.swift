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
                    Button {
                        viewStore.send(.navigateToDice(dice: dice))
                    } label: {
                        HStack {
                            Image(systemName: "dice.fill")
                                .foregroundColor(Color.red)
                            Text(dice.name)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.gray)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                    }
                    .buttonStyle(.plain)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .navigationDestination(
            store: store.scope(state: \.$destination, action: { .destination($0) }),
            state: /Roll.Destination.State.rollDetail,
            action: Roll.Destination.Action.rollDetail
        ) { store in
            RollDetailView(store: store)
        }
        .navigationTitle("Roll a dice")
        .task {
            store.send(.started)
        }
        
    }
}

struct RollView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RollView(store: Store(
                initialState: Roll.State(),
                reducer: Roll()
            ))
        }
    }
}
