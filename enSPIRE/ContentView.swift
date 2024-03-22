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
    //                case .chat:
    //                    <#code#>
                case .gallery:
                    GalleryView()
                case .profile:
                    UserProfileView()
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
                        Image(systemName: "plus")
                    }
                    Spacer()
                    Button {
                        curPage = PageController.chat
                    } label: {
                        Image(systemName: "plus")
                    }
                    Spacer()
                    Button {
                        curPage = PageController.gallery
                    } label: {
                        Image(systemName: "plus")
                    }
                    Spacer()
                    Button {
                        curPage = PageController.profile
                    } label: {
                        Image(systemName: "plus")
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
