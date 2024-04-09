//
//  NormalChatView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/28.
//

import SwiftUI

class userListModle: ObservableObject {
    @Published var usersListData = [
       UserInfo(UserId: "123", userName: "安安", photo: "abc"),
       UserInfo(UserId: "123", userName: "好好", photo: "abc"),
       UserInfo(UserId: "123", userName: "大帥哥", photo: "abc"),
       UserInfo(UserId: "123", userName: "小美女", photo: "abc"),
       UserInfo(UserId: "123", userName: "熱血戰士", photo: "abc")
    ]
}

struct NormalChatView: View {
    @State private var haveNewMessage: Bool = true
    @StateObject var UserListModle = userListModle()
    @EnvironmentObject var coordinator: Coordinator
    var body: some View {
        ScrollView{
            VStack{
                ForEach(UserListModle.usersListData, id: \.id){ user in
                    UserChatViewBar(user: user)
                }
            }
        }
        .padding()
        .background(Color("YellowColor"))
       
    }
}
