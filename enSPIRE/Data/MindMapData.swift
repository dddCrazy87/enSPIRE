import Foundation

func generateHint(text: String) -> String {
    return "你對 \(text) 有什麼感想"
}

class Node: Identifiable, ObservableObject {
    let id = UUID()
    @Published var text: String
    @Published var point = CGPoint.zero
    @Published var hintText: String
    @Published var children: [Node] = []
    
    init(text: String) {
        self.text = text
        self.hintText = generateHint(text: text)
    }
    
    init(text: String, children: [Node]) {
        self.text = text
        self.children = children
        self.hintText = generateHint(text: text)
    }
    
    func addChild(childText: String) {
        let childNode = Node(text: childText)
        children.append(childNode)
    }
}

extension Node: Equatable {
    static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.id == rhs.id
    }
}
