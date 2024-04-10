import SwiftUI

struct MindMapNodeView: View {
    
    @ObservedObject var rootNode: Node
    @Binding var selectedNode: Node?
    
    let rootNodeText : String
    let rootNodeTextSize : Int
    let isFirstNode: Bool
    
    @State private var isBlinking = false
    @State private var topSpace:CGFloat = .zero
    @State private var downSpace:CGFloat = .zero
    
    var body: some View {
        
        VStack {
            
            Spacer().frame(height: downSpace)
            
            HStack {
                ForEach(rootNode.children.indices, id: \.self) { index in
                    let childNode = rootNode.children[index]
                    if index % 2 == 0 {
                        NodeView_Top(node: childNode, selectedNode: $selectedNode)
                            .padding()
                    }
                }
            }
            .overlay(
                GeometryReader(content: { geo in
                    Color.clear
                        .onAppear() {
                            topSpace = geo.frame(in: .named("Mind Map View")).height
                        }
                        .onChange(of: geo.frame(in: .named("Mind Map View"))) {
                            topSpace = geo.frame(in: .named("Mind Map View")).height
                        }
                })
            )
            
            
            
            ZStack {
                Rectangle()
                    .frame(width: min(120, Double(rootNodeTextSize)*20), height: max(50, Double(rootNodeTextSize/6)*50))
                    .cornerRadius(20)
                    .foregroundColor(.yellow)
                    .overlay(
                        GeometryReader(content: { geo in
                            Color.clear
                            
                                .onAppear() {
                                    rootNode.point = CGPoint(x: geo.frame(in: .named("Mind Map View")).origin.x + geo.frame(in: .named("Mind Map View")).width/2, y: geo.frame(in: .named("Mind Map View")).origin.y + geo.frame(in: .named("Mind Map View")).height/2)
                                }
                                .onChange(of: geo.frame(in: .named("Mind Map View")).origin) {
                                    rootNode.point = CGPoint(x: geo.frame(in: .named("Mind Map View")).origin.x + geo.frame(in: .named("Mind Map View")).width/2, y: geo.frame(in: .named("Mind Map View")).origin.y + geo.frame(in: .named("Mind Map View")).height/2)
                                }
                        })
                    )
                
                Text(rootNodeText)
                    .frame(width: 100)
                    .lineLimit(3)
                    .bold()
                    .opacity(isBlinking && isFirstNode ? 0.0 : 1.0)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 0.5).repeatForever()) {
                            self.isBlinking.toggle()
                        }
                    }
                    .onTapGesture {
                        selectedNode = rootNode
                    }
            }
            
            HStack {
                ForEach(rootNode.children.indices, id: \.self) { index in
                    let childNode = rootNode.children[index]
                    if index % 2 == 1 {
                        NodeView_Down(node: childNode, selectedNode: $selectedNode)
                            .padding()
                    }
                }
            }
            .overlay(
                GeometryReader(content: { geo in
                    Color.clear
                        .onAppear() {
                            downSpace = geo.frame(in: .named("Mind Map View")).height
                            print(topSpace, downSpace)
                        }
                        .onChange(of: geo.frame(in: .named("Mind Map View"))) {
                            downSpace = geo.frame(in: .named("Mind Map View")).height
                        }
                })
            )
            
            Spacer().frame(height: topSpace)
        }
    }
}

struct NodeLineView: View {
    @ObservedObject var node: Node
    
    var body: some View {
        
        ForEach(node.children) { childNode in
            LineView(startNode: node, endNode: childNode)
            NodeLineView(node: childNode)
        }
    }
}

struct LineView: View {
    @ObservedObject var startNode: Node
    @ObservedObject var endNode: Node
    
    var body: some View {
        Path { path in
            path.move(to: startNode.point)
            path.addLine(to: endNode.point)
        }
        .stroke(Color.black, lineWidth: 1)
    }
}

struct NodeView_Top: View {
    @ObservedObject var node: Node
    @Binding var selectedNode: Node?
    
    var body: some View {
        
        VStack {
            
            HStack {
                ForEach(node.children) { childNode in
                    NodeView_Top(node: childNode, selectedNode: $selectedNode)
                        .padding(5)
                }
            }

            VStack {
                
                ForEach(Array(node.text).indices, id: \.self) { index in
                    
                    if index == 0 && index == node.text.count-1 {
                        Text(String(Array(node.text)[index]))
                                .frame(width: 20, height: 20)
                                .background(Color.yellow)
                                .foregroundColor(.black)
                                .cornerRadius(8)
                    }
                    
                    else if index == 0 {
                        ZStack {
                            UnevenRoundedRectangle(cornerRadii: .init(
                                topLeading: 8.0,
                                bottomLeading: 0.0,
                                bottomTrailing: 0.0,
                                topTrailing: 8.0),
                                style: .continuous)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.yellow)
                            
                            Text(String(Array(node.text)[index]))
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                        }
                        
                    }
                    
                    else if index == node.text.count-1 {
                        ZStack {
                            UnevenRoundedRectangle(cornerRadii: .init(
                                topLeading: 0.0,
                                bottomLeading: 8.0,
                                bottomTrailing: 8.0,
                                topTrailing: 0.0),
                                style: .continuous)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.yellow)
                            
                            Text(String(Array(node.text)[index]))
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                        }
                    }
                    
                    else {
                        Text(String(Array(node.text)[index]))
                                .frame(width: 20, height: 20)
                                .background(Color.yellow)
                                .foregroundColor(.black)
                    }
                    
                    Spacer().frame(height: 0)
                }
                
            }
            .onTapGesture {
                selectedNode = node
            }
            .overlay(
                GeometryReader(content: { geo in
                    Color.clear
                        .onAppear() {
                            node.point = CGPoint(x: geo.frame(in: .named("Mind Map View")).origin.x + geo.frame(in: .named("Mind Map View")).width/2, y: geo.frame(in: .named("Mind Map View")).origin.y + geo.frame(in: .named("Mind Map View")).height/2)
                        }
                        .onChange(of: geo.frame(in: .named("Mind Map View")).origin) {
                            node.point = CGPoint(x: geo.frame(in: .named("Mind Map View")).origin.x + geo.frame(in: .named("Mind Map View")).width/2, y: geo.frame(in: .named("Mind Map View")).origin.y + geo.frame(in: .named("Mind Map View")).height/2)
                        }
                })
            )
        }
    }
}

struct NodeView_Down: View {
    @ObservedObject var node: Node
    @Binding var selectedNode: Node?
    
    var body: some View {
        
        VStack {
            
            VStack {
                
                ForEach(Array(node.text).indices, id: \.self) { index in
                    
                    if index == 0 && index == node.text.count-1 {
                        Text(String(Array(node.text)[index]))
                                .frame(width: 20, height: 20)
                                .background(Color.yellow)
                                .foregroundColor(.black)
                                .cornerRadius(8)
                    }
                    
                    else if index == 0 {
                        ZStack {
                            UnevenRoundedRectangle(cornerRadii: .init(
                                topLeading: 8.0,
                                bottomLeading: 0.0,
                                bottomTrailing: 0.0,
                                topTrailing: 8.0),
                                style: .continuous)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.yellow)
                            
                            Text(String(Array(node.text)[index]))
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                        }
                        
                    }
                    
                    else if index == node.text.count-1 {
                        ZStack {
                            UnevenRoundedRectangle(cornerRadii: .init(
                                topLeading: 0.0,
                                bottomLeading: 8.0,
                                bottomTrailing: 8.0,
                                topTrailing: 0.0),
                                style: .continuous)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.yellow)
                            
                            Text(String(Array(node.text)[index]))
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                        }
                    }
                    
                    else {
                        Text(String(Array(node.text)[index]))
                                .frame(width: 20, height: 20)
                                .background(Color.yellow)
                                .foregroundColor(.black)
                    }
                    
                    Spacer().frame(height: 0)
                }
            }
            .onTapGesture {
                selectedNode = node
            }
            .overlay(
                GeometryReader(content: { geo in
                    Color.clear
                        .onAppear() {
                            node.point = CGPoint(x: geo.frame(in: .named("Mind Map View")).origin.x + geo.frame(in: .named("Mind Map View")).width/2, y: geo.frame(in: .named("Mind Map View")).origin.y + geo.frame(in: .named("Mind Map View")).height/2)
                        }
                        .onChange(of: geo.frame(in: .named("Mind Map View")).origin) {
                            node.point = CGPoint(x: geo.frame(in: .named("Mind Map View")).origin.x + geo.frame(in: .named("Mind Map View")).width/2, y: geo.frame(in: .named("Mind Map View")).origin.y + geo.frame(in: .named("Mind Map View")).height/2)
                        }
                })
            )
            
            HStack {
                ForEach(node.children) { childNode in
                    NodeView_Down(node: childNode, selectedNode: $selectedNode)
                        .padding(5)
                }
            }
        }
    }
}


#Preview {
    NavigationStack {
//        MindMapView(isPreview: false, rootNode: Node(text: "a"))
//        MindMapView(isPreview: false, rootNode: Node(text: "Root", children: [Node(text: "aaa"),Node(text: "aa", children: [Node(text: "aaaa"),Node(text: "a",children: [Node(text: "aaa"),Node(text: "a", children: [Node(text: "aaa")])])])]))
//        MindMapView(isPreview: false, rootNode: Node(text: "Root", children: [Node(text: "a"),Node(text: "a", children: [Node(text: "a"),Node(text: "a", children: [Node(text: "a", children: [Node(text: "aa", children: [Node(text: "aaa", children: [Node(text: "a", children: [Node(text: "aa", children: [Node(text: "a", children: [Node(text: "a")])])])])])])])]),Node(text: "a")]))
        
//        UserProfileView(userInfo: UserInfo(UserId: "1", userName: "桂林仔", photo: "", job: ["通緝犯", "黑道"], habit: ["擲筊", "請示", "開槍"]), tabIndex: 0, mindmapProj: MindmapProjs(nodes: [
//                Node(text: "影像藝術論期中主題", children: [Node(text: "1A"),Node(text: "1AA"),Node(text: "1AAA", children: [Node(text: "a", children: [Node(text: "a", children: [Node(text: "a", children: [Node(text: "a", children: [Node(text: "a")])])])])])]),
//                Node(text: "小說劇情", children: [Node(text: "2A"),Node(text: "2AA"),Node(text: "2AA")]),
//                Node(text: "推薦的晚餐", children: [Node(text: "3A"),Node(text: "3AAA")]),
//                Node(text: "女朋友的生日禮物", children: [Node(text: "4A")]),
//                Node(text: "音樂比賽主題", children: [Node(text: "5A"),Node(text: "5AA"),Node(text: "5AAA"),Node(text: "5AAAA")])
//            ]), piecesProj: PiecesProjs(pieces: [Pieces(title: "萬有引力", auther: "牛頓", image: "image", description: "牛頓的萬有引力定律（英語：Newton's law of universal gravitation），通稱萬有引力定律，定律指出，兩個質點彼此之間相互吸引的作用力，是與它們的質量乘積成正比，並與它們之間的距離成平方反比。\n\n萬有引力定律是由艾薩克·牛頓稱之為歸納推理的經驗觀察得出的一般物理規律。它是古典力學的一部分，是在1687年於《自然哲學的數學原理》中首次發表的，並於1687年7月5日首次出版。當牛頓的書在1686年被提交給英國皇家學會時，羅伯特·虎克宣稱牛頓從他那裡得到了距離平方反比律。", link: "https://github.com/dddCrazy87/enSPIRE"), Pieces(title: "a", auther: "a", image: "a", description: "a", link: "a"), Pieces(title: "b", auther: "b", image: "b", description: "b", link: "b"), Pieces(title: "c", auther: "c", image: "c", description: "c", link: "c")]))
        
        MindMapView(isPreview: true, rootNode: Node(text: "影像藝術論期中主題", children: [Node(text: "1A"),Node(text: "1AA"),Node(text: "1AAA", children: [Node(text: "a", children: [Node(text: "a", children: [Node(text: "a", children: [Node(text: "a", children: [Node(text: "a")])])])])])]))
    }
}
