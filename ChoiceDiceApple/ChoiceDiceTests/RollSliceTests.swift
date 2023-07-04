import ComposableArchitecture
import SnapshotTesting
import XCTest
import SwiftUI
@testable import ChoiceDice

@MainActor
final class RollSliceTests: XCTestCase {

    func testNavigateToDice() async {
        // Action -> State Chances!
        // Effect -> Action

        // 1. Set up environment
        // 1.1. Start store with initial state

        let store = TestStore(
            initialState: RollSlice.State(),
            reducer: RollSlice()
        )

        // 1.2. Mock dependencies
        // ?

        let dice = Dice(name: "Prueba", options: ["1", "2", "3"])

        // 2. Run action
        await store.send(.navigateToDice(dice: dice)) { state in
            // 3. Assert (expect) results
            state.destination = .rollDetail(.init(dice: dice))
        }
    }

    func testUserTappedRegenerate() async {
        // 1. Set up environment
        // 1.1. Start store with initial state

        let randomPick = "8"
        let dice = Dice(name: "Prueba", options: ["1", "2", "3"])

        let store = TestStore(
            initialState: RollDetailSlice.State(dice: dice),
            reducer: RollDetailSlice()
        )

        // 1.2. Mock dependencies
        // ?
        store.dependencies.getRandomOption = { _ in randomPick }

        // 2. Run action
        await store.send(.userTappedRegenerate) { state in
            // 3. Assert (expect) results
            state.randomPick = randomPick
        }
    }

    func testStarted() async {
        //Enviroment
        let dice = Dice(name: "Anime", options: ["ROK", "AOT", "SNK"])
        let starterValue = "SNK"

        let store = TestStore(
            initialState: RollDetailSlice.State(dice: dice),
            reducer: RollDetailSlice()
        )

        //Mock Dependencies

        store.dependencies.getRandomOption = { _ in starterValue }

        //Run action

        await store.send(.started) { state in
            state.randomPick = starterValue
        }
    }

    func testRollView() {
        assert(view: NavigationStack {
            RollView(store: Store(
                initialState: RollSlice.State(),
                reducer: RollSlice()
            ))
        }, record: true)
    }

}

func assert(view: any View,
            record recording: Bool = false,
            timeout: TimeInterval = 5,
            file: StaticString = #file,
            testName: String = #function,
            line: UInt = #line) {
    assertSnapshot(
        matching: UIHostingController(rootView: AnyView(view)),
        as: .image,
        timeout: timeout,
        file: file,
        testName: testName,
        line: line
    )
}
