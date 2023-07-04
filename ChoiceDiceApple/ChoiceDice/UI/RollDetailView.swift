import ComposableArchitecture
import SwiftUI

struct RollDetailView: View {
    let store: StoreOf<RollDetailSlice>

    var body: some View {
        Text("RollDetail")
    }
}

struct RollDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RollDetailView(store: Store(
            initialState: RollDetailSlice.State(
                dice: .init(name: "Coworking Café", options: ["Pergamino", "Urbania", "Juan Valdez"])
            ),
            reducer: RollDetailSlice()
        ))
    }
}
