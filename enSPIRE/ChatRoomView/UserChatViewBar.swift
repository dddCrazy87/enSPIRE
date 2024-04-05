//
//  UserChatViewBar.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/29.
//

import SwiftUI

struct UserChatViewBar: View {
    var user: userInfo
    var body: some View {
        NavigationLink {
            ChatRoomView(user: user)
        }label: {
            HStack{
                AnyShape(Circle())
                    .frame(width: 50)
                    .foregroundStyle(Color.yellow)
                    .padding(.trailing)
                Text(user.userName)
                    .foregroundStyle(Color.black)
                Spacer()
                
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

#Preview {
    UserChatViewBar(user: userInfo(UserId: "123", userName: "okok", photo: ""))
}
