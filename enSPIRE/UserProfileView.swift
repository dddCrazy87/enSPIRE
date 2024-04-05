import SwiftUI

struct UserProfileView: View {
    
    let userInfo:userInfo
    @State var tabIndex : Int
    @ObservedObject var mindmapProj : MindmapProjs
    
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
    
    UserProfileView(userInfo: userInfo(UserId: "1", userName: "桂林仔", photo: "", job: ["通緝犯", "黑道"], habit: ["擲筊", "請示", "開槍"]), tabIndex: 0, mindmapProj: MindmapProjs(nodes: [
            Node(text: "root1", children: [Node(text: "1A"),Node(text: "1AA"),Node(text: "1AAA")]),
            Node(text: "root2", children: [Node(text: "2A"),Node(text: "2AA")]),
            Node(text: "root3", children: [Node(text: "3A"),Node(text: "3AAA")]),
            Node(text: "root4", children: [Node(text: "4A")]),
            Node(text: "root5", children: [Node(text: "5A"),Node(text: "5AA"),Node(text: "5AAA"),Node(text: "5AAAA")]),
            Node(text: "root6", children: [Node(text: "6AAA")])
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
