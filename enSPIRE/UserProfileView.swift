import SwiftUI

struct UserProfileView: View {
    
    let userInfo:UserInfo
    @State var tabIndex : Int
    @ObservedObject var mindmapProj : MindmapProjs
    @State private var selectedNode: Node? = nil
    
    var body: some View {
        NavigationStack {
            
            VStack {
                VStack{
                    if userInfo.photo.count == 0 {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height:80)
                    }
                    else {
                        Image(userInfo.photo)
                            .resizable()
                            .scaledToFit()
                            .frame(height:80)
                    }
                        
                    
                    VStack(alignment: .leading){
                        
                        HStack{
                            Image("PersonIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                            Text("暱稱：").bold()
                            Text(userInfo.userName)
                        }
                        .padding(.horizontal, 20)
                        
                        Spacer().frame(height: 0)
                        
                        HStack{
                            Image("SuitcaseIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            Text("職業：").bold()
                            Text(userInfo.job.joined(separator:" "))
                                .lineLimit(1)
                        }
                        .padding(.horizontal, 20)
                        
                        Spacer().frame(height: 0)
                        
                        HStack{
                            Image("StarIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            Text("興趣：").bold()
                            Text(userInfo.habit.joined(separator: " "))
                                .lineLimit(1)
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .padding(.top, 50)
                
                Spacer().frame(height: 0)
                
                CustomTopTabBar2(tabIndex: $tabIndex)
                
                if tabIndex == 0 {
//                    ScrollView(.vertical) {
//                        VStack {
//                            
//                            ForEach(mindmapProj.nodes.indices, id: \.self) { index in
//                                HStack {
//                                    Spacer()
//                                    
//                                    if index % 2 == 0 {
//                                        MindMapView(isPreview: true, rootNode: mindmapProj.nodes[index])
//                                            .frame(width: 180, height: 180)
//                                            .clipped()
//                                            .padding(.vertical, 40)
//                                        
//                                        if index + 1 < mindmapProj.nodes.count {
//                                            MindMapView(isPreview: true, rootNode: mindmapProj.nodes[index+1])
//                                                .frame(width: 180, height: 180)
//                                                .clipped()
//                                                .padding(.vertical, 40)
//                                        }
//                                        else {
//                                            Spacer().frame(width: 180, height: 180)
//                                        }
//                                    }
//                                    
//                                    Spacer()
//                                }
//                            }
//                                
//                        }
//                    }
//                    .background(Color("YellowColor"))
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(mindmapProj.nodes, id:\.id) { node in
                                MindMapView(isPreview: true, rootNode: node)
                                    .frame(width: 150)
                                    .clipped()
                                    .padding(.horizontal, 20)
                            }
                        }
                    }
                    .background(Color("YellowColor"))
                }
                else {
                    
                }
                
            }
            .navigationTitle(userInfo.userName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    
    UserProfileView(userInfo: UserInfo(UserId: "1", userName: "桂林仔", photo: "", job: ["通緝犯", "黑道"], habit: ["擲筊", "請示", "開槍"]), tabIndex: 0, mindmapProj: MindmapProjs(nodes: [
            Node(text: "影像藝術論期中主題", children: [Node(text: "1A"),Node(text: "1AA"),Node(text: "1AAA")]),
            Node(text: "小說劇情", children: [Node(text: "2A"),Node(text: "2AA"),Node(text: "2AA")]),
            Node(text: "推薦的晚餐", children: [Node(text: "3A"),Node(text: "3AAA")]),
            Node(text: "女朋友的生日禮物", children: [Node(text: "4A")]),
            Node(text: "音樂比賽主題", children: [Node(text: "5A"),Node(text: "5AA"),Node(text: "5AAA"),Node(text: "5AAAA")])
        ]))
}

struct CustomTopTabBar2: View {
    @Binding var tabIndex: Int
    private func onButtonTapped(index: Int) {
        withAnimation(.easeInOut) {
            tabIndex = index
        }
    }
    @Namespace private var menuItemTransition
    
    var body: some View {
        HStack(alignment: .center) {
            TabBarButton(text: "你的專案", isSelected: .constant(tabIndex == 0), namespace: menuItemTransition)
                .onTapGesture { onButtonTapped(index: 0) }
            TabBarButton(text: "你的作品", isSelected: .constant(tabIndex == 1), namespace: menuItemTransition)
                .onTapGesture { onButtonTapped(index: 1) }
        }
    }
}
