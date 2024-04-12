import SwiftUI

struct MindMapView: View {
    @FocusState var isMessageFocus: Bool
    @Binding var curPage: ContentView.PageController
    @State var isPreview: Bool
    
    // rootNode style
    @State private var rootNodeTextSize = 6
    @State private var rootNodeText = "寫下主題吧！"
    
    // node
    @ObservedObject var rootNode:Node
    @State private var selectedNode: Node? = nil
    @State private var isFirstNode = true
    @State private var input = ""
    @State private var nodeText = ""
    
    // drag & magnification
    @State private var curPos: CGSize = .zero
    @State private var curScale: CGFloat = 1.0
    @GestureState private var gestureOffset: CGSize = .zero
    @GestureState private var gestureScale: CGFloat = 1.0
    
    var body: some View {
        
        VStack {
            
            ZStack {
                
                ForEach(rootNode.children) { childNode in
                    LineView(startNode: rootNode, endNode: childNode)
                    NodeLineView(node: childNode)
                }
                
                if isPreview {
                    MindMapNodeView(rootNode: rootNode, selectedNode: $selectedNode, rootNodeText: rootNode.text, rootNodeTextSize: rootNode.text.count, isFirstNode: false)
                        .frame(maxHeight: 10)
                }
                else {
                    VStack {
                        if rootNode.children.count == 0 {
                            Spacer()
                        }
                        MindMapNodeView(rootNode: rootNode, selectedNode: $selectedNode, rootNodeText: rootNodeText, rootNodeTextSize: rootNodeTextSize, isFirstNode: isFirstNode)
                            .frame(maxHeight: 10)
                            .offset(x: curPos.width + gestureOffset.width,
                                    y: curPos.height + gestureOffset.height)
                            .scaleEffect(max(0.5, min(gestureScale * curScale, 2.5)))
                            .gesture(
                                SimultaneousGesture(
                                    DragGesture()
                                        .updating($gestureOffset, body: { (value, state, _) in
                                            state.height = max(min(value.translation.height,260-curPos.height), -270-curPos.height)
                                            // -270 < (curPos.height + value.translation.height) < 260
                                            state.width = max(min(value.translation.width,130-curPos.width), -130-curPos.width)
                                        })
                                        .onEnded({ (value) in
                                            curPos.height += value.translation.height
                                            curPos.width += value.translation.width
                                            curPos.height = max(min(curPos.height, 260), -270)
                                            curPos.width = max(min(curPos.width, 130), -130)
                                        }),
                                    MagnificationGesture()
                                        .updating($gestureScale, body: { (value, state, _) in
                                            state = max(0.5, min(value, 2.5))
                                        })
                                        .onEnded({ (value) in
                                            curScale *= max(0.5, min(value, 2.5))
                                        })
                                )
                            )
                        if rootNode.children.count == 0 {
                            Spacer()
                        }
                    }
                }
            }
            .coordinateSpace(name: "Mind Map View")
            
            Spacer()
            
            if !isPreview {
                if isFirstNode {
                    Text("首先，寫下一個主題吧！")
                        .foregroundColor(.black)
                        .background(Color.white)
                }
                else {
                    Text(selectedNode?.hintText ?? "選擇一個節點吧！")
                        .foregroundColor(.black)
                        .background(Color.white)
                }
                
                Spacer().frame(height: 0)
                
                HStack {
                    TextField("寫下你的想法...", text: $input)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 250, height: 60)
                        .focused($isMessageFocus)
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
                .navigationTitle("聯想室")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            
                            Button {
                                curPage = .profile
                            } label: {
                                Text("選擇現有專案")
                            }
                            Button {
                                rootNode.children = []
                                isFirstNode = true
                                rootNodeTextSize = 6
                                rootNodeText = "寫下主題吧！"
                            } label: {
                                Text("新增空白專案")
                            }
                            Button {
                                
                            } label: {
                                Text("儲存專案")
                            }
                            Button {
                                
                            } label: {
                                Text("另存為PNG")
                            }
                            
                        } label: {
                            Image(systemName: "ellipsis.circle")
                        }
                    }
                }
            }
        }
        .onAppear() {
            if rootNode.children.count != 0 {
                isFirstNode = false
                rootNodeText = rootNode.text
                rootNodeTextSize = rootNodeText.count
            }
        }
        .onTapGesture {
            isMessageFocus = false
        }
    }
}




#Preview {
    NavigationStack {
//        MindMapView(isPreview: false, rootNode: Node(text: "a"))
//        MindMapView(isPreview: false, rootNode: Node(text: "Root", children: [Node(text: "aaa"),Node(text: "aa", children: [Node(text: "aaaa"),Node(text: "a",children: [Node(text: "aaa"),Node(text: "a", children: [Node(text: "aaa")])])])]))
//        MindMapView(isPreview: false, rootNode: Node(text: "Root", children: [Node(text: "a"),Node(text: "a", children: [Node(text: "a"),Node(text: "a", children: [Node(text: "a", children: [Node(text: "aaaaaa", children: [Node(text: "aaaaa", children: [Node(text: "aaaaaa", children: [Node(text: "aaaaaa", children: [Node(text: "aaaaaaaa", children: [Node(text: "aaaaaaaaaaa")])])])])])])])]),Node(text: "a")]))
        ContentView()
    }
}
