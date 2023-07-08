import ComposableArchitecture
import Foundation

extension UserDefaults {

    func setCodableObject<T: Codable>(_ data: T?, forKey defaultName: String) {
        let encoded = try? JSONEncoder().encode(data)
        set(encoded, forKey: defaultName)
    }

    func codableObject<T : Codable>(dataType: T.Type, key: String) -> T? {
        guard let userDefaultData = data(forKey: key) else {
            return nil
        }

        return try? JSONDecoder().decode(T.self, from: userDefaultData)
    }

}

struct KeyValueStorage {
    var saveDices: (String, [Dice]) -> Void
    var readDices: (String) -> [Dice]?
}

enum KeyValueStorageKey: DependencyKey {
    static var liveValue: KeyValueStorage = .init(
        saveDices: { key, value in
            UserDefaults.standard.setCodableObject(value, forKey: key)
        },
        readDices: { key in
            UserDefaults.standard.codableObject(dataType: [Dice].self, key: key)
        }
    )

    static var testValue: KeyValueStorage = .init(
        saveDices: { print("Saving value(\($0) for key(\($1)") },
        readDices: { _ in nil })
}

extension DependencyValues {
    var keyValueStorage: KeyValueStorage {
        get { self[KeyValueStorageKey.self] }
        set { self[KeyValueStorageKey.self] = newValue }
    }
}
