import SwiftUI

struct MindMapNodeView: View {
    
    @ObservedObject var rootNode: Node
    @Binding var selectedNode: Node?
    
    let rootNodeText : String
    let rootNodeTextSize : Int
    let isFirstNode: Bool
    
    @State private var isBlinking = false
    
    var body: some View {
        VStack {
            HStack {
                ForEach(rootNode.children.indices, id: \.self) { index in
                    let childNode = rootNode.children[index]
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
                    .opacity(isBlinking && isFirstNode ? 0.0 : 1.0)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 0.5).repeatForever()) {
                            self.isBlinking.toggle()
                        }
                    }
                    .onTapGesture {
                        selectedNode = rootNode
                        print(selectedNode?.text)
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
            
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 16, height: Double(node.text.count)*14.5)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .padding(0)
                .overlay (
                    VStack {
                        ForEach(Array(node.text), id: \.self) { char in
                            Text(String(char))
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                            Spacer().frame(height: 0)
                        }
                    }
                    .padding(0)
                )
                .onTapGesture {
                    selectedNode = node
                    print(selectedNode?.text)
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
            
            
            
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 16, height: Double(node.text.count)*14.5)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .padding(0)
                .overlay (
                    VStack {
                        ForEach(Array(node.text), id: \.self) { char in
                            Text(String(char))
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                            Spacer().frame(height: 0)
                        }
                    }
                )
                .onTapGesture {
                    selectedNode = node
                    print(selectedNode?.text)
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
    MindMapView()
}
