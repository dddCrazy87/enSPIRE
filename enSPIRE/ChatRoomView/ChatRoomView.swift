//
//  ChatRoomView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/23.
//

import SwiftUI

struct ChatRoomView: View {
    var user: userInfo
    @State private var backtoChatHomeView: Bool = false
    var body: some View {
        if backtoChatHomeView {
            ContentView()
        } else {
            NavigationStack {
                ChatRoomMessageView()
            }
            .navigationTitle(user.userName)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        backtoChatHomeView.toggle()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.black)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ChatRoomView(user: userInfo(UserId: "123", userName: "okok", photo: ""))
    }
}
