import ComposableArchitecture
import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        NavigationStack {
            RollView(store: Store(
                initialState: Roll.State(),
                reducer: Roll()
            ))
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
