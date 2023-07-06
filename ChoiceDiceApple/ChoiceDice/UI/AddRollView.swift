import ComposableArchitecture
import SwiftUI

struct AddRollView: View {
    let store: StoreOf<AddRoll>

    var body: some View {
        Text("AddRollView")
    }
}

struct AddRollView_Previews: PreviewProvider {
    static var previews: some View {
        AddRollView(
            store: Store(
                initialState: AddRoll.State(),
                reducer: AddRoll()
            )
        )
    }
}
