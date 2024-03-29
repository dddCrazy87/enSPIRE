//
//  NormalChatView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/28.
//

import SwiftUI

class userListModle: ObservableObject {
    @Published var usersListData = [
       userInfo(UserId: "123", userName: "安安", photo: "abc", haveNewMessage: true),
       userInfo(UserId: "123", userName: "好好", photo: "abc", haveNewMessage: true),
       userInfo(UserId: "123", userName: "大帥哥", photo: "abc", haveNewMessage: true),
       userInfo(UserId: "123", userName: "小美女", photo: "abc", haveNewMessage: false),
       userInfo(UserId: "123", userName: "熱血戰士", photo: "abc", haveNewMessage: false)
    ]
}

struct NormalChatView: View {
    @State private var haveNewMessage: Bool = true
    @StateObject var UserListModle = userListModle()
    var body: some View {
        VStack{
            ScrollView{
                VStack{
                    ForEach(UserListModle.usersListData){ user in
                        UserChatViewBar(user: user)
                    }
                }
            }
            .padding()
            
        }
        .background(Color("YellowColor"))
    }
}

#Preview {
    NormalChatView()
}
