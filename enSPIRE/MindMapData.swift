import Foundation

struct Node: Identifiable {
    let id = UUID()
    var text: String
    var children: [Node] = []
}
