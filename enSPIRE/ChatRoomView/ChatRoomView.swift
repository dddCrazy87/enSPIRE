//
//  ChatRoomView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/23.
//

import SwiftUI

struct ChatRoomView: View {
    var user: userInfo

    var body: some View {
        NavigationStack {
            ChatRoomMessageView()
        }
        .navigationTitle(user.userName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ChatRoomView(user: userInfo(UserId: "123", userName: "okok", photo: "", haveNewMessage: true))
    }
}
