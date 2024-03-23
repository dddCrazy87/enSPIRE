import SwiftUI

struct NodeView_Down: View {
    let node: Node
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
                    self.selectedNode = self.node
                    print(self.selectedNode?.text)
                }
            
            HStack {
                ForEach(node.children) { childNode in
                    NodeView_Top(node: childNode,  selectedNode: self.$selectedNode)
                        .padding(5)
                }
            }
        }
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        .padding(0)
    }
}

struct NodeView_Top: View {
    let node: Node
    @Binding var selectedNode: Node?

    var body: some View {
        
        VStack {
            
            HStack {
                ForEach(node.children) { childNode in
                    NodeView_Down(node: childNode,  selectedNode: self.$selectedNode)
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
                )
                .onTapGesture {
                    self.selectedNode = self.node
                    print(self.selectedNode?.text)
                }
        }
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
}
