//
//  CrossFieldChatView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/28.
//

import SwiftUI

class crossFieldUserListModle: ObservableObject {
    @Published var usersListData = [
       userInfo(UserId: "123", userName: "好帥", photo: "abc", haveNewMessage: true),
       userInfo(UserId: "123", userName: "飛天狗", photo: "abc", haveNewMessage: true),
       userInfo(UserId: "123", userName: "八爪博士的晚餐", photo: "abc", haveNewMessage: true),
       userInfo(UserId: "123", userName: "無話可說", photo: "abc", haveNewMessage: false),
       userInfo(UserId: "123", userName: "猜猜我是誰", photo: "abc", haveNewMessage: false)
    ]
}

struct CrossFieldChatView: View {
    @StateObject var CrossFieldUserListModle = crossFieldUserListModle()
    var body: some View {
        VStack{
            ScrollView{
                VStack{
                    ForEach(CrossFieldUserListModle.usersListData){ user in
                        UserChatViewBar(user: user)
                    }
                }
            }.padding()
        }.background(Color("YellowColor"))
    }
}

#Preview {
    CrossFieldChatView()
}
