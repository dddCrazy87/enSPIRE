import SwiftUI

struct ContentView: View {
    
    enum PageController {
        case login
        case logout
        case signin
        case mindmap
        case chat
        case gallery
        case profile
    }
    
    @State var curPage = PageController.mindmap
    
    // editing mind map proj
    private var mindMap_editing = Node(text: "root")
    
    // user data
    private var userInfo = UserInfo(UserId: "111", userName: "Wayne", photo: "", job: ["job1", "job2"], habit: ["看電影", "看書"])
    
    private var mindMapProj = MindmapProjs(nodes: [
        Node(text: "影像藝術論期中主題", children: [Node(text: "1A"),Node(text: "1AA"),Node(text: "1AAA")]),
        Node(text: "女朋友的生日禮物", children: [Node(text: "2A"),Node(text: "2AA"),Node(text: "2AA")]),
        Node(text: "推薦的晚餐", children: [Node(text: "3A"),Node(text: "3AAA")]),
        Node(text: "小說劇情", children: [Node(text: "4A")]),
        Node(text: "音樂比賽主題", children: [Node(text: "5A"),Node(text: "5AA"),Node(text: "5AAA"),Node(text: "5AAAA")])])
    
    private var piecesPjoj = PiecesProjs(pieces: [Pieces(title: "萬有引力", auther: "牛頓", image: "image", description: "牛頓的萬有引力定律（英語：Newton's law of universal gravitation），通稱萬有引力定律，定律指出，兩個質點彼此之間相互吸引的作用力，是與它們的質量乘積成正比，並與它們之間的距離成平方反比。\n\n萬有引力定律是由艾薩克·牛頓稱之為歸納推理的經驗觀察得出的一般物理規律。它是古典力學的一部分，是在1687年於《自然哲學的數學原理》中首次發表的，並於1687年7月5日首次出版。當牛頓的書在1686年被提交給英國皇家學會時，羅伯特·虎克宣稱牛頓從他那裡得到了距離平方反比律。", link: "https://github.com/dddCrazy87/enSPIRE"), Pieces(title: "a", auther: "a", image: "a", description: "a", link: "a"), Pieces(title: "b", auther: "b", image: "b", description: "b", link: "b"), Pieces(title: "c", auther: "c", image: "c", description: "c", link: "c")])
    
    var body: some View {
        NavigationStack {
                
            VStack {
                
                switch curPage {
                case .login:
                    Text("login page")
                case .logout:
                    Text("logout page")
                case .mindmap:
                    MindMapView(curPage: $curPage, isPreview: false, rootNode: mindMap_editing)
                        .toolbarBackground(.visible, for: .bottomBar)
                        .toolbarColorScheme(.light, for: .bottomBar)
                case .chat:
                    CoordinatorChatView()
                        .toolbarBackground(.visible, for: .bottomBar)
                        .toolbarColorScheme(.light, for: .bottomBar)
                case .gallery:
                    GalleryView()
                        .toolbarBackground(.visible, for: .bottomBar)
                        .toolbarColorScheme(.light, for: .bottomBar)
                case .profile:
                    UserProfileView(userInfo: userInfo, tabIndex: 0, mindmapProj: mindMapProj, piecesProj: piecesPjoj, mindMap_editing: mindMap_editing, curPage: $curPage)
                        .toolbarBackground(.visible, for: .bottomBar)
                        .toolbarColorScheme(.light, for: .bottomBar)
                default:
                    Text("error")
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Button {
                        curPage = PageController.mindmap
                    } label: {
                        Image("MindmapIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                    }
                    Spacer()
                    Button {
                        curPage = PageController.chat
                    } label: {
                        Image("ChatIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                    }
                    Spacer()
                    Button {
                        curPage = PageController.gallery
                    } label: {
                        Image("GalleryIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                    }
                    Spacer()
                    Button {
                        curPage = PageController.profile
                    } label: {
                        Image("PersonIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 45, height: 45)
                    }
                    Spacer()
                }
            }
        }
        .environmentObject(Coordinator())
    }
}

#Preview {
    ContentView()
}
