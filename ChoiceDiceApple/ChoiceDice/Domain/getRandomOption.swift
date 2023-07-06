import ComposableArchitecture
import Foundation

private func getRandomOption(from options: [String]) -> String? {
    guard !options.isEmpty else {
        return nil
    }

    let randomIndex = Int.random(in: 0..<options.count)
    return options[randomIndex]
}

enum GetRandonOptionKey: DependencyKey {
    static var liveValue: ([String]) -> String? = { getRandomOption(from: $0) }
    static var testValue: ([String]) -> String? = { $0.last }
}

extension DependencyValues {
    var getRandomOption: ([String]) -> String? {
        get { self[GetRandonOptionKey.self] }
        set { self[GetRandonOptionKey.self] = newValue }
    }
}
