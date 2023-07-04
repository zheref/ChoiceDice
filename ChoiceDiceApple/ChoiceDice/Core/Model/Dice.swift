import Foundation

struct Dice: Equatable, Identifiable {
    let id = UUID()
    let name: String
    let options: [String]
}
