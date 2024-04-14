//
//  PreChatRoomView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/4/5.
//

import SwiftUI

struct PreChatRoomView: View {
    var user: UserInfo
    @StateObject var CrossFieldUserListModle = crossFieldUserListModle()
    @StateObject var UserListModle = userListModle()
    @State var curPage: ContentView.PageController = .chat
    @EnvironmentObject var coordinator: Coordinator
    var body: some View {
        
        VStack{
            MindMapView(curPage: $curPage, isPreview: true, rootNode: Node(text: "森林咖啡廳", children: [Node(text: "肉桂捲", children: [Node(text: "肉桂拿鐵"), Node(text: "花香")]), Node(text: "悠閒的山林度假村", children: [Node(text: "家人朋友"), Node(text: "觀光小山的觀景區")]), Node(text: "鄉村田園風")]))
                .disabled(true)
            Spacer()
            VStack(alignment: .leading){
                Text("森林咖啡廳")
                    .font(.system(size: 25, weight: .semibold))
                Text("okok")
                    .font(.system(size: 18, weight: .regular))
                    .padding(.vertical, 1)
                    .foregroundStyle(Color.gray)
            }
            .padding()
            .frame(width: 300, alignment: .leading)
            Button{
                coordinator.push(.chatRoom(user: user))
                print("chatRoom")
            }label:{
                Text("開始討論")
                    .font(.system(size: 26, weight: .semibold))
                    .padding(68)
                    .foregroundStyle(Color.black)
                    .background(Color("Yellow2Color"))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            .onAppear(){
                appendUser()
            }
            
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.1),  Color.gray.opacity(0.3)]), startPoint: .center, endPoint: .bottom)
        )
        
    }
    func appendUser() {
        if user.isCrossField {
            CrossFieldUserListModle.usersListData.append(user)
        } else {
            UserListModle.usersListData.append(user)
        }
        print(CrossFieldUserListModle.usersListData)
        print(UserListModle.usersListData)
    }
}

