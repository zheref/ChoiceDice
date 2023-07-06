import ComposableArchitecture
import SwiftUI

struct AddRollView: View {

    struct NameViewState: Equatable {
        @BindingViewState var name: String

        init(store: BindingViewStore<AddRoll.State>) {
            _name = store.$name
        }
    }

    struct OptionsViewState: Equatable {
        var options: [AddRoll.RollOption]
        @BindingViewState var newOption: String

        init(store: BindingViewStore<AddRoll.State>) {
            options = store.options
            _newOption = store.$newOption
        }
    }

    let store: StoreOf<AddRoll>

    var body: some View {
        NavigationStack {
            List {
                WithViewStore(store, observe: NameViewState.init) { viewStore in
                    Section {
                        TextField("Name", text: viewStore.$name)
                    }
                }
                WithViewStore(store, observe: OptionsViewState.init) { viewStore in
                    Section("Options") {
                        ForEach(viewStore.options) { option in
                            Text(option.name)
                        }
                        HStack {
                            TextField("Add option...", text: viewStore.$newOption)
                            Spacer()
                            Button {

                            } label: {
                                Image(systemName: "plus.circle")
                            }
                        }
                    }
                }
            }
            .navigationTitle("New dice")
        }
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
