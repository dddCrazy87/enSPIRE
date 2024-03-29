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
    
    @State private var curPage = PageController.mindmap
    
    var body: some View {
        NavigationStack {
                
            VStack {
                
                switch curPage {
    //                case .login:
    //                    <#code#>
    //                case .signin:
    //                    <#code#>
                case .mindmap:
                    MindMapView()
                        .toolbarBackground(.visible, for: .bottomBar)
                        .toolbarColorScheme(.light, for: .bottomBar)
                case .chat:
                    ChatView()
                        .toolbarBackground(.visible, for: .bottomBar)
                        .toolbarColorScheme(.light, for: .bottomBar)
                case .gallery:
                    GalleryView()
                        .toolbarBackground(.visible, for: .bottomBar)
                        .toolbarColorScheme(.light, for: .bottomBar)
                case .profile:
                    UserProfileView()
                        .toolbarBackground(.visible, for: .bottomBar)
                        .toolbarColorScheme(.light, for: .bottomBar)
                default:
                    Text("error")
                }
            }
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
