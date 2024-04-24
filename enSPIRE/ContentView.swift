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
    @State var title = ""
    
    // editing mind map proj
    private var mindMap_editing = Node(text: "root")
    
    // user data
    private var userInfo = UserInfo(UserId: "111", userName: "Wayne", photo: "", job: ["甜點師傅"], habit: ["品嚐甜點", "下廚"])
    
    private var mindMapProj = MindmapProjs(nodes: [Node(text: "下午茶點心", children: [Node(text: "甜的", children: [Node(text: "巧克力口味"), Node(text: "奶油口味")]), Node(text: "鹹的", children: [Node(text: "三明治"), Node(text: "沙拉")]), Node(text: "苦的")]), Node(text: "旅遊行程", children: [Node(text: "戶外"), Node(text: "室內", children: [Node(text: "動態活動"), Node(text: "靜態活動")])])])
    
    private var piecesPjoj = PiecesProjs(pieces: [Pieces(title: "減醣提拉米蘇", auther: "Wayne", image: "demo", description: "這款減醣巧克力蛋糕絕對是任何巧克力愛好者的夢幻之選！每一口都充滿了濃郁的巧克力風味，但卻不含多餘的糖分。這個食譜結合了傳統的巧克力蛋糕與健康意識，是一個完美的選擇，無論是作為特別場合的甜點還是日常享用。", link: "https://cookidoo.tw/recipes/recipe/zh-Hant/r713201")])
    
    var user:UserInfo = UserInfo(UserId: "111", userName: "Wayne", photo: "")
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                switch curPage {
                case .login:
                    Text("login page")
                case .logout:
                    Text("logout page")
                case .mindmap:
                    ZStack {
                        GalleryView()
                            .toolbarBackground(.visible, for: .bottomBar)
                            .toolbarColorScheme(.light, for: .bottomBar)
                        
                        Rectangle()
                            .frame(width: .infinity, height: .infinity)
                            .foregroundColor(Color.white)

                    
                        MindMapView(curPage: $curPage, isPreview: false, mindMapProjs: mindMapProj, rootNode: mindMap_editing)
                            .onAppear(){
                                title = "聯想室"
                            }
                    }
                case .chat:
                    ZStack {
                        GalleryView()
                            .toolbarBackground(.visible, for: .bottomBar)
                            .toolbarColorScheme(.light, for: .bottomBar)
                        
                        Rectangle()
                            .frame(width: .infinity, height: .infinity)
                            .foregroundColor(Color.white)

                    
                        CoordinatorChatView(user: user)
                            .toolbarBackground(.visible, for: .bottomBar)
                            .toolbarColorScheme(.light, for: .bottomBar)
                            .onAppear(){
                                title = "討論室"
                            }
                    }
                    
                case .gallery:
                    GalleryView()
                        .toolbarBackground(.visible, for: .bottomBar)
                        .toolbarColorScheme(.light, for: .bottomBar)
                        .onAppear(){
                            title = "展覽室"
                        }
                case .profile:
                    ZStack {
                        GalleryView()
                            .toolbarBackground(.visible, for: .bottomBar)
                            .toolbarColorScheme(.light, for: .bottomBar)
                        
                        Rectangle()
                            .frame(width: .infinity, height: .infinity)
                            .foregroundColor(Color.white)

                    
                        UserProfileView(userInfo: userInfo, tabIndex: 0, mindmapProj: mindMapProj, piecesProj: piecesPjoj, mindMap_editing: mindMap_editing, curPage: $curPage)
                            .toolbarBackground(.visible, for: .bottomBar)
                            .toolbarColorScheme(.light, for: .bottomBar)
                            .onAppear(){
                                title = userInfo.userName
                            }
                    }
                    
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
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
        }
        .environmentObject(Coordinator())
    }
}

#Preview {
    ContentView()
}
