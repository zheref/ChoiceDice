import Foundation

struct Dice: Equatable, Identifiable, Codable {
    let id = UUID()
    let name: String
    let options: [String]
}
