import SwiftUI

struct MindMapView: View {
    
    // rootNode style
    @State private var rootNodeTextSize = 6
    @State private var rootNodeText = "寫下主題吧！"
    @State private var isBlinking = false
    
    // node
    @State private var isFirstNode = true
    @State private var input = ""
    @State private var nodeText = ""
    @State private var rootNode: Node = Node(text: "Root")
    @State private var selectedNode: Node? = nil
    
    // drag & magnification
    @State private var curPos: CGSize = .zero
    @State private var curScale: CGFloat = 1.0
    @GestureState private var gestureOffset: CGSize = .zero
    @GestureState private var gestureScale: CGFloat = 1.0
    
    var body: some View {
        
        ZStack {
            
            VStack {
                HStack {
                    ForEach(rootNode.children.indices, id: \.self) { index in
                        let childNode = self.rootNode.children[index]
                        if index % 2 == 0 {
                            NodeView_Top(node: childNode, selectedNode: $selectedNode)
                                .padding()
                        }
                    }
                }
                
                ZStack {
                    Circle()
                        .frame(width: Double(rootNodeTextSize)*20)
                        .foregroundColor(.yellow)
                    
                    Text(rootNodeText)
                        .opacity(isBlinking && isFirstNode ? 0.0 : 1.0)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 0.5).repeatForever()) {
                                self.isBlinking.toggle()
                            }
                        }
                        .onTapGesture {
                            self.selectedNode = self.rootNode
                            print(self.selectedNode?.text)
                        }
                }
                HStack {
                    ForEach(rootNode.children.indices, id: \.self) { index in
                        let childNode = self.rootNode.children[index]
                        if index % 2 == 1 {
                            NodeView_Down(node: childNode, selectedNode: $selectedNode)
                                .padding()
                        }
                    }
                }
            }
            .padding()
            .frame(width: 380 * curScale, height: 720 * curScale)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .offset(x: curPos.width + gestureOffset.width, y: curPos.height + gestureOffset.height)
            .scaleEffect(gestureScale * curScale)
            .gesture(
                SimultaneousGesture(
                    DragGesture()
                        .updating($gestureOffset, body: { (value, state, _) in
                            state = value.translation
                        })
                        .onEnded({ (value) in
                            self.curPos.height += value.translation.height
                            self.curPos.width += value.translation.width
                        }),
                    MagnificationGesture()
                        .updating($gestureScale, body: { (value, state, _) in
                            state = value
                        })
                        .onEnded({ (value) in
                            self.curScale *= value
                        })
                )
            )
            
            
            VStack {
                Spacer()
                if isFirstNode {
                    Text("首先，寫下一個主題吧！")
                }
                else {
                    Text(selectedNode?.hintText ?? "選擇一個節點吧！")
                }
                Spacer().frame(height: 0)
                HStack {
                    TextField("寫下你的想法...", text: $input)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 250, height: 60)
                        .onSubmit {
                            nodeText = input
                            if nodeText != "" {
                                if isFirstNode {
                                    isFirstNode = false
                                    rootNode.text = nodeText
                                    rootNode.hintText = generateHint(text: nodeText)
                                    rootNodeTextSize = rootNode.text.count
                                    rootNodeText = rootNode.text
                                }
                                else {
                                    if let selectedNode = self.selectedNode {
                                        let newNode = Node(text: nodeText)
                                        self.addChildNode(to: selectedNode, nodeToAdd: newNode, in: &self.rootNode)
                                    }
                                }
                            }
                            input = ""
                            self.selectedNode = nil
                        }
                    Button {
                        nodeText = input
                        if nodeText != "" {
                            if isFirstNode {
                                isFirstNode = false
                                rootNode.text = nodeText
                                rootNode.hintText = generateHint(text: nodeText)
                                rootNodeTextSize = rootNode.text.count
                                rootNodeText = rootNode.text
                            }
                            else {
                                if let selectedNode = self.selectedNode {
                                    let newNode = Node(text: nodeText)
                                    self.addChildNode(to: selectedNode, nodeToAdd: newNode, in: &self.rootNode)
                                }
                            }
                        }
                        input = ""
                        self.selectedNode = nil
                    } label: {
                        Image(systemName: "paperplane")
                    }
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




#Preview {
    MindMapView()
}




