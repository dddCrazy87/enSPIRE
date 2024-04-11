import SwiftUI

struct UserProfileView: View {
    
    let userInfo:UserInfo
    @State var tabIndex : Int
    @ObservedObject var mindmapProj : MindmapProjs
    @ObservedObject var piecesProj : PiecesProjs
    @ObservedObject var mindMap_editing : Node
    @State private var selectedNode: Node? = nil
    
    @Binding var curPage : ContentView.PageController
    
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
                    
                    MindMapProjView(mindmapProj: mindmapProj, mindMap_editing: mindMap_editing, curPage: $curPage)
                }
                else {
                    PiecesProjView(piecesProj: piecesProj)
                }
                
            }
            .navigationTitle(userInfo.userName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    
//    UserProfileView(userInfo: UserInfo(UserId: "1", userName: "桂林仔", photo: "", job: ["通緝犯", "黑道"], habit: ["擲筊", "請示", "開槍"]), tabIndex: 0, mindmapProj: MindmapProjs(nodes: [
//            Node(text: "影像藝術論期中主題", children: [Node(text: "1A"),Node(text: "1AA"),Node(text: "1AAA", children: [Node(text: "a", children: [Node(text: "a", children: [Node(text: "a", children: [Node(text: "a", children: [Node(text: "a")])])])])])]),
//            Node(text: "小說劇情", children: [Node(text: "2A"),Node(text: "2AA"),Node(text: "2AA")]),
//            Node(text: "推薦的晚餐", children: [Node(text: "3A"),Node(text: "3AAA")]),
//            Node(text: "女朋友的生日禮物", children: [Node(text: "4A")]),
//            Node(text: "音樂比賽主題", children: [Node(text: "5A"),Node(text: "5AA"),Node(text: "5AAA"),Node(text: "5AAAA")])
//        ]), piecesProj: PiecesProjs(pieces: [Pieces(title: "萬有引力", auther: "牛頓", image: "image", description: "牛頓的萬有引力定律（英語：Newton's law of universal gravitation），通稱萬有引力定律，定律指出，兩個質點彼此之間相互吸引的作用力，是與它們的質量乘積成正比，並與它們之間的距離成平方反比。\n\n萬有引力定律是由艾薩克·牛頓稱之為歸納推理的經驗觀察得出的一般物理規律。它是古典力學的一部分，是在1687年於《自然哲學的數學原理》中首次發表的，並於1687年7月5日首次出版。當牛頓的書在1686年被提交給英國皇家學會時，羅伯特·虎克宣稱牛頓從他那裡得到了距離平方反比律。", link: "https://github.com/dddCrazy87/enSPIRE"), Pieces(title: "a", auther: "a", image: "a", description: "a", link: "a"), Pieces(title: "b", auther: "b", image: "b", description: "b", link: "b"), Pieces(title: "c", auther: "c", image: "c", description: "c", link: "c")]))
    
    ContentView()
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



