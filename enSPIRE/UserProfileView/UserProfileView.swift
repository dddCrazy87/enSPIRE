import SwiftUI

struct UserProfileView: View {
    
//    let userInfo:UserInfo
//    @State var tabIndex : Int
//    @ObservedObject var mindmapProj : MindmapProjs
//    @ObservedObject var piecesProj : PiecesProjs
//    @ObservedObject var mindMap_editing : Node
//    @State private var selectedNode: Node? = nil
    
//    @Binding var curPage : ContentView.PageController
    
    var body: some View {
        Text("user")
//        NavigationStack {
//            
//            VStack {
//                VStack{
//                    if userInfo.photo.count == 0 {
//                        Image(systemName: "person.fill")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(height:80)
//                    }
//                    else {
//                        Image(userInfo.photo)
//                            .resizable()
//                            .scaledToFit()
//                            .frame(height:80)
//                    }
//                    
//                    VStack(alignment: .leading){
//                        
//                        HStack{
//                            Image("PersonIcon")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(height: 30)
//                            Text("暱稱：").bold()
//                            Text(userInfo.userName)
//                        }
//                        .padding(.horizontal, 20)
//                        
//                        Spacer().frame(height: 0)
//                        
//                        HStack{
//                            Image("SuitcaseIcon")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 30)
//                            Text("職業：").bold()
//                            Text(userInfo.job.joined(separator:" "))
//                                .lineLimit(1)
//                        }
//                        .padding(.horizontal, 20)
//                        
//                        Spacer().frame(height: 0)
//                        
//                        HStack{
//                            Image("StarIcon")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 30)
//                            Text("興趣：").bold()
//                            Text(userInfo.habit.joined(separator: " "))
//                                .lineLimit(1)
//                        }
//                        .padding(.horizontal, 20)
//                    }
//                }
//                .padding(.top, 50)
//                
//                Spacer().frame(height: 0)
//                
//            }
//            .navigationTitle(userInfo.userName)
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    if isLogin {
//                        Button {
//                            curPage = .logout
//                        } label: {
//                            Text("登出")
//                        }
//                    }
//                    else {
//                        Button {
//                            curPage = .login
//                        } label: {
//                            Text("登入")
//                        }
//                    }
//                }
//            }
//        }
    }
}

//#Preview {
//    
//    struct CustomTopTabBar2: View {
//        @Binding var tabIndex: Int
//        private func onButtonTapped(index: Int) {
//            withAnimation(.easeInOut) {
//                tabIndex = index
//            }
//        }
//        @Namespace private var menuItemTransition
//        
//        var body: some View {
//            HStack(alignment: .center) {
//                Text("專案")
//            }
//        }
//    }
//    
//    
//    
//}
