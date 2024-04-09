//
//  UserChatViewBar.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/29.
//

import SwiftUI

struct UserChatViewBar: View {
    var user: UserInfo
    @EnvironmentObject var coordinator: Coordinator
    var body: some View {
        Button {
            coordinator.push(.chatRoom(user: user))
            print("chatRoom")
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


