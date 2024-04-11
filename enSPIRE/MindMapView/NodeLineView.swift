//
//  NodeLineView.swift
//  enSPIRE
//
//  Created by 許昀韋 on 2024/4/11.
//

import SwiftUI

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
