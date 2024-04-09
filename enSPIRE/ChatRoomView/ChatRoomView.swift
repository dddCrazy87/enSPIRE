//
//  ChatRoomView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/23.
//

import SwiftUI

struct ChatRoomView: View {
    var user: UserInfo
    @State private var backtoChatHomeView: Bool = false
    @EnvironmentObject var coordinator: Coordinator
    var body: some View {
        ZStack {
            ChatRoomMessageView()
        }
        .navigationTitle(user.userName)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button{
                    coordinator.popToRoot()
                    print("home")
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

#Preview {
    NavigationStack {
        ChatView()
    }
}
