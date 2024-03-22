import SwiftUI

struct MindMapNodeView: View {
    @State private var rootNode: Node = Node(text: "Root")
    @State private var selectedNode: Node? = nil

    var body: some View {
        VStack {
            Spacer()
            NodeView(node: rootNode, selectedNode: $selectedNode)
                .padding()
            Spacer()
            HStack {
                Button {
                    let child1 = Node(text: "Child 1")
                    let child2 = Node(text: "Child 2")
                    let child3 = Node(text: "Child 3")
                    let child4 = Node(text: "Child 4")
                    let child5 = Node(text: "Child 5")
                    
                    var rootChild1 = Node(text: "Root Child 1")
                    rootChild1.children.append(child1)
                    rootChild1.children.append(child2)
                    var rootChild2 = Node(text: "Root Child 2")
                    
                    
                    rootNode.children.append(rootChild1)
                    rootNode.children.append(rootChild2)
                    
                } label: {
                    Text("add node")
                }
                
                Button {
                    print(selectedNode?.text)
                } label: {
                    Text("show selectedNode")
                }
                
                Button {
                    if let selectedNode = self.selectedNode {
                        let newNode = Node(text: "New Child")
                        self.addChildNode(to: selectedNode, nodeToAdd: newNode, in: &self.rootNode)
                    }
                } label: {
                    Text("modify node")
                }
                
            }
        }
    }
    
    private func addChildNode(to parentNode: Node, nodeToAdd: Node, in rootNode: inout Node) {
        if parentNode == rootNode {
            rootNode.children.append(nodeToAdd)
            return
        }
        
        for i in 0..<rootNode.children.count {
            var child = rootNode.children[i]
            if child == parentNode {
                child.children.append(nodeToAdd)
                rootNode.children[i] = child
                return
            } else {
                addChildNode(to: parentNode, nodeToAdd: nodeToAdd, in: &rootNode.children[i])
            }
        }
    }
    
}

struct NodeView: View {
    var node: Node
    @Binding var selectedNode: Node?
    @State var isBlinking = true

    var body: some View {
        VStack {
            
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 16, height: Double(node.text.count)*14.5)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    .padding(0)

                VStack {
                    ForEach(Array(node.text), id: \.self) { char in
                        Text(String(char))
                            .font(.system(size: 12))
                            .foregroundColor(.black)
                        Spacer().frame(height: 0)
                    }
                }
            }
            .onTapGesture {
                self.selectedNode = self.node
                print(self.selectedNode?.text)
            }
            
            ForEach(node.children) { childNode in
                NodeView(node: childNode, selectedNode: self.$selectedNode)
                    .padding(.leading, 20)
            }
        }
    }
}

#Preview {
    MindMapNodeView()
}
