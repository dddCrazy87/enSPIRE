import SwiftUI

struct ContentView: View {
    
    enum PageController {
        case login
        case signin
        case mindmap
        case chat
        case gallery
        case profile
    }
    
    @State var curPage = PageController.mindmap
    
    // editing mind map proj
    @State private var mindMap_editing = Node(text: "root")
    
    // user data
    @State private var userInfo = UserInfo(UserId: "111", userName: "Wayne", photo: "", job: ["job1", "job2"], habit: ["看電影", "看書"])
    
    @State private var mindMapProj = MindmapProjs(nodes: [
        Node(text: "影像藝術論期中主題", children: [Node(text: "1A"),Node(text: "1AA"),Node(text: "1AAA")]),
        Node(text: "女朋友的生日禮物", children: [Node(text: "2A"),Node(text: "2AA"),Node(text: "2AA")]),
        Node(text: "推薦的晚餐", children: [Node(text: "3A"),Node(text: "3AAA")]),
        Node(text: "小說劇情", children: [Node(text: "4A")]),
        Node(text: "音樂比賽主題", children: [Node(text: "5A"),Node(text: "5AA"),Node(text: "5AAA"),Node(text: "5AAAA")])])
    
    var body: some View {
        NavigationStack {
                
            VStack {
                
                switch curPage {
    //                case .login:
    //                    <#code#>
    //                case .signin:
    //                    <#code#>
                case .mindmap:
                    MindMapView(isPreview: false, rootNode: mindMap_editing)
                        .toolbarBackground(.visible, for: .bottomBar)
                        .toolbarColorScheme(.light, for: .bottomBar)
                case .chat:
                    ChatView(curPage: $curPage)
                        .toolbarBackground(.visible, for: .bottomBar)
                        .toolbarColorScheme(.light, for: .bottomBar)
                case .gallery:
                    GalleryView()
                        .toolbarBackground(.visible, for: .bottomBar)
                        .toolbarColorScheme(.light, for: .bottomBar)
                case .profile:
                    UserProfileView(userInfo: userInfo, tabIndex: 0, mindmapProj: mindMapProj)
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
    }
}

#Preview {
    ContentView()
}
