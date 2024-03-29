import SwiftUI

struct MindMapView: View {
    
    // rootNode style
    @State private var rootNodeTextSize = 6
    @State private var rootNodeText = "寫下主題吧！"
    
    // node
    @State private var isFirstNode = true
    @State private var input = ""
    @State private var nodeText = ""
    @StateObject var rootNode = Node(text: "Root Node")
    @State private var selectedNode: Node? = nil
    
    // drag & magnification
    @State private var curPos: CGSize = .zero
    @State private var curScale: CGFloat = 1.0
    @GestureState private var gestureOffset: CGSize = .zero
    @GestureState private var gestureScale: CGFloat = 1.0
    
    var body: some View {
        
        ZStack {
            
            ZStack {
                
                
                MindMapNodeView(rootNode: rootNode, selectedNode: $selectedNode, rootNodeText: rootNodeText, rootNodeTextSize: rootNodeTextSize, isFirstNode: isFirstNode)
                    .coordinateSpace(name: "Mind Map View")
                    .offset(x: curPos.width + gestureOffset.width, y: curPos.height + gestureOffset.height)
                    .scaleEffect(gestureScale * curScale)
                    .gesture(
                        SimultaneousGesture(
                            DragGesture()
                                .updating($gestureOffset, body: { (value, state, _) in
                                    state = value.translation
                                })
                                .onEnded({ (value) in
                                    curPos.height += value.translation.height
                                    curPos.width += value.translation.width
                                }),
                            MagnificationGesture()
                                .updating($gestureScale, body: { (value, state, _) in
                                    state = max(0.5, min(value, 2.5))
                                })
                                .onEnded({ (value) in
                                    curScale *= max(0.5, min(value, 2.5))
                                    print(curScale)
                                })
                        )
                    )
                
                ForEach(rootNode.children) { childNode in
                    LineView(startNode: rootNode, endNode: childNode)
                    NodeLineView(node: childNode)
                }
            }
            

            
            
            
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
                                        selectedNode.addChild(childText: nodeText)
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
                                    selectedNode.addChild(childText: nodeText)
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
            .frame(width: 300, height: 720)
        }
    }
}




#Preview {
    MindMapView()
}
