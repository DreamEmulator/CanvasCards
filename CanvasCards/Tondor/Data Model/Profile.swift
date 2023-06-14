import Foundation

struct Profile: Identifiable, Equatable {
    var id: String { name }
    let name: String
    let age: String
    let location: String?
    let distanceKilometers: Int?
    let isVerified: Bool
    let images: [String]
}

extension Profile {
    static let gorby = Profile(name: "Gorby", age: "8", location: "Seattle, Washington", distanceKilometers: 7821, isVerified: true, images: ["gorby"])
    static let grumpy = Profile(name: "Grumpy", age: "7", location: "Morristown, Arizona", distanceKilometers: 8675, isVerified: true, images: ["grumpy"])
    static let keyboard = Profile(name: "Keyboard Cat", age: "17", location: nil, distanceKilometers: nil, isVerified: true, images: ["keyboard"])
    static let maru = Profile(name: "Maru", age: "15", location: "Japan", distanceKilometers: 9282, isVerified: true, images: ["maru"])
    static let sockington = Profile(name: "Sockington", age: "18", location: "Waltham, Massachusetts", distanceKilometers: nil, isVerified: true, images: ["sockington"])
    static let joep = Profile(name: "Joep", age: "3", location: "Leiden, Netherlands", distanceKilometers: 15, isVerified: false, images: ["joep"])

    static let all: [Profile] = [.maru, .sockington, .gorby, .grumpy, .keyboard, .joep]
}
