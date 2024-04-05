//
//  CrossFieldChatView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/28.
//

import SwiftUI

class crossFieldUserListModle: ObservableObject {
    @Published var usersListData = [
       UserInfo(UserId: "123", userName: "好帥", photo: "abc"),
       UserInfo(UserId: "123", userName: "飛天狗", photo: "abc"),
       UserInfo(UserId: "123", userName: "八爪博士的晚餐", photo: "abc"),
       UserInfo(UserId: "123", userName: "無話可說", photo: "abc"),
       UserInfo(UserId: "123", userName: "猜猜我是誰", photo: "abc")
    ]
}

struct CrossFieldChatView: View {
    @StateObject var CrossFieldUserListModle = crossFieldUserListModle()
    var body: some View {
        ScrollView{
            VStack{
                ForEach(CrossFieldUserListModle.usersListData, id: \.id){ user in
                    UserChatViewBar(user: user)
                }
            }
        }
        .padding()
        .background(Color("YellowColor"))
    }
}

#Preview {
    CrossFieldChatView()
}
