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
    @State private var width: CGFloat = 330.0
    @GestureState private var gestureOffset: CGSize = .zero
    @GestureState private var gestureScale: CGFloat = 1.0
    
    var body: some View {
        
        ZStack {
            ZStack{
                Image("TextField")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width)
                    .offset(y: -260)
                
                    .onAppear(){
                        withAnimation(.bouncy(duration: 1.5, extraBounce: 0.05)){
                            self.width = 350
                        }
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
                    Image("sendButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220)
                        
                }
                .offset(x: 160,y: -320)
                VStack{
                    if !isPreview {
                        if isFirstNode {
                            Text("首先，寫下一個主題吧！")
                                .foregroundColor(.white)
                                .offset(y: 10)
                        }
                        else {
                            Text(selectedNode?.hintText ?? "選擇一個節點吧！")
                                .foregroundColor(.white)
                                .offset(y: 10)
                        }
                            
                        
                        Spacer().frame(height: 0)
                        
                        HStack {
                            TextField("", text: $input, prompt: Text("寫下你的想法...").foregroundStyle(Color.gray))
                                .foregroundStyle(.white)
                                .padding(.horizontal)
                                .frame(width: 200, height: 60)
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
                            
                        }
                        .frame(height: 70)
//                        .border(.white)
                        .offset(y: 25)
                    }
                }
                .offset(y: -250)
            }
            
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
            
            
        }
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
        .background(LinearGradient(gradient: Gradient(colors: [Color("BgNight"), Color.black]),startPoint: .top, endPoint: .bottom))
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
        ContentView()
    }
}
