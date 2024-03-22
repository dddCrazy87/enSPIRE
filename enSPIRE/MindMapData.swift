import Foundation

struct Node: Identifiable, Equatable {
    let id = UUID()
    var text: String
    var hintText: String
    var children: [Node] = []
    
    init(text: String) {
        self.text = text
        self.hintText = generateHint(text: text)
    }
}

func generateHint(text: String) -> String {
    return "你對 \(text) 有什麼感想"
}
