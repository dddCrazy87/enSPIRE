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
                            isBlinking.toggle()
                        }
                    }
                    .onChange(of: rootNodeText) {
                        withAnimation(Animation.easeInOut(duration: 0.5).repeatForever()) {
                            isBlinking.toggle()
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

        ContentView()
    }
}
