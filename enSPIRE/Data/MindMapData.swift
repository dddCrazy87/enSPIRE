import Foundation

func generateHint(text: String) -> [String] {
    switch text {
    case "小孩的點心食譜":
        return ["點心會在什麼時候享用？", "點心的味道如何？"]
    case "下午放學後":
        return ["你放學後的心情通常是怎樣的？"]
    case "甜甜的":
        return ["你認為有什麼食物是甜的？"]
    case "巧克力":
        return ["你最喜歡的巧克力是什麼品牌或款式？", "你有吃過什麼巧克力製品？"]
    case "蛋糕":
        return ["你會在什麼時候選擇吃蛋糕？"]
    default:
        return ["你對 \(text) 有什麼感想"]
    }
}

class Node: Identifiable, ObservableObject {
    let id = UUID()
    @Published var text: String
    @Published var point = CGPoint.zero
    @Published var children: [Node] = []
    @Published var hintText: [String]
    
    init(text: String) {
        self.text = text
        self.hintText = generateHint(text: text)
    }
    
    init(text: String, children: [Node]) {
        self.text = text
        self.children = children
        self.hintText = generateHint(text: text)
    }
    
    init(node: Node) {
        self.text = node.text
        self.children = node.children
        self.hintText = generateHint(text: node.text)
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
