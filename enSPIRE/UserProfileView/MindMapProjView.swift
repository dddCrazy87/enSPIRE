//
//  MindMapProjView.swift
//  enSPIRE
//
//  Created by 許昀韋 on 2024/4/11.
//

import SwiftUI

struct MindMapProjView: View {
    
    @ObservedObject var mindmapProj:MindmapProjs
    @ObservedObject var mindMap_editing:Node
    @Binding var curPage : ContentView.PageController
    
    var body: some View {
        
        ScrollView(.vertical) {
            VStack {
                
                ForEach(mindmapProj.nodes.indices, id: \.self) { index in
                    
                    HStack {
                        Spacer()
                        
                        if index == 0 {
                            
                            Button {
                                mindMap_editing.text = "root"
                                mindMap_editing.hintText = ["root"]
                                mindMap_editing.children = []
                                curPage = .mindmap
                            } label: {
                                Image(systemName: "plus")
                                    .resizable()
                                    .foregroundColor(.black)
                                    .frame(width: 50, height: 50)
                            }
                            .frame(width: 180, height: 260)
                            .background(Color.white)
                            .cornerRadius(10)
                            
                            MindMapProj(node: mindmapProj.nodes[index], mindMap_editing: mindMap_editing, curPage: $curPage)
                        }
                        
                        else if index % 2 == 1 {
                            MindMapProj(node: mindmapProj.nodes[index], mindMap_editing: mindMap_editing, curPage: $curPage)
                            
                            if index + 1 < mindmapProj.nodes.count {
                                MindMapProj(node: mindmapProj.nodes[index+1], mindMap_editing: mindMap_editing, curPage: $curPage)
                            }
                            else {
                                Rectangle()
                                    .frame(width: 180)
                                    .foregroundColor(Color("YellowColor"))
                                
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
            .padding()
        }
        .background(Color("YellowColor"))
    }
}

struct MindMapProj: View {
    
    let node:Node
    @ObservedObject var mindMap_editing:Node
    @Binding var curPage : ContentView.PageController
    
    var body: some View {
        
        Button {
            mindMap_editing.text = node.text
            mindMap_editing.hintText = node.hintText
            mindMap_editing.children = node.children
            curPage = .mindmap
        } label: {
            MindMapView(curPage: $curPage, isPreview: true, rootNode: node)
                .frame(width: 180, height: 240)
                .clipped()
                .padding(.vertical, 10)
                .background(Color.white)
                .cornerRadius(10)
                .foregroundColor(.black)
                .disabled(true)
        }
    }
}

struct MindMapProjTestView: View {
    @State var curPage = ContentView.PageController.profile
    var body: some View {
        UserProfileView(userInfo: UserInfo(UserId: "1", userName: "桂林仔", photo: "", job: ["通緝犯", "黑道"], habit: ["擲筊", "請示", "開槍"]), tabIndex: 0, mindmapProj: MindmapProjs(nodes: [
                Node(text: "影像藝術論期中主題", children: [Node(text: "1A"),Node(text: "1AA"),Node(text: "1AAA", children: [Node(text: "a", children: [Node(text: "a", children: [Node(text: "a", children: [Node(text: "a", children: [Node(text: "a")])])])])])]),
                Node(text: "小說劇情", children: [Node(text: "2A"),Node(text: "2AA"),Node(text: "2AA")]),
                Node(text: "推薦的晚餐", children: [Node(text: "3A"),Node(text: "3AAA")]),
                Node(text: "女朋友的生日禮物", children: [Node(text: "4A")]),
                Node(text: "音樂比賽主題", children: [Node(text: "5A"),Node(text: "5AA"),Node(text: "5AAA"),Node(text: "5AAAA")]),
                Node(text: "影像藝術論期中主題", children: [Node(text: "1A"),Node(text: "1AA"),Node(text: "1AAA", children: [Node(text: "a", children: [Node(text: "a", children: [Node(text: "a", children: [Node(text: "a", children: [Node(text: "a")])])])])])])
            ]), piecesProj: PiecesProjs(pieces: [Pieces(title: "萬有引力", auther: "牛頓", image: "image", description: "牛頓的萬有引力定律（英語：Newton's law of universal gravitation），通稱萬有引力定律，定律指出，兩個質點彼此之間相互吸引的作用力，是與它們的質量乘積成正比，並與它們之間的距離成平方反比。\n\n萬有引力定律是由艾薩克·牛頓稱之為歸納推理的經驗觀察得出的一般物理規律。它是古典力學的一部分，是在1687年於《自然哲學的數學原理》中首次發表的，並於1687年7月5日首次出版。當牛頓的書在1686年被提交給英國皇家學會時，羅伯特·虎克宣稱牛頓從他那裡得到了距離平方反比律。", link: "https://github.com/dddCrazy87/enSPIRE"), Pieces(title: "a", auther: "a", image: "a", description: "a", link: "a"), Pieces(title: "b", auther: "b", image: "b", description: "b", link: "b"), Pieces(title: "c", auther: "c", image: "c", description: "c", link: "c")]), mindMap_editing: Node(text: "root"), curPage: $curPage)
    }
}

#Preview {
    MindMapProjTestView()
}

