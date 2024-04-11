//
//  ChatRoomMessageView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/4/1.
//
import SwiftUI

struct ChatRoomMessageView: View {
    @State private var message: String = ""
    private var sendMessage: String = ""
    @StateObject var chatRoomViewModel = ChatRoomViewModle()
    @FocusState var isMessageFocus: Bool

    var body: some View {
        VStack {
            ScrollViewReader { scrollView in
                ScrollView{
                    Spacer()
                    VStack(spacing: 10) {
                        ForEach(Array(chatRoomViewModel.messagesData.enumerated()), id: \.element){ idx, message in
                            MessageView(message: message)
                                .id(idx)
                        }
                        .onChange(of: chatRoomViewModel.messagesData){ newvalue in
                            withAnimation {
                                scrollView.scrollTo(chatRoomViewModel.messagesData.count - 1, anchor: .bottom)
                            }
                        }
                    }
                }
                .onTapGesture {
                    isMessageFocus = false
                }
                    
            }
            .padding()
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            HStack{
                TextField(
                    "Message",
                    text: $message,
                    axis: .vertical
                )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .focused($isMessageFocus)
                
                
                Button {
                    print("send")
                    chatRoomViewModel.messagesData.append(Message(UserId: "123", text: message, photoURL: "", creatAt: Data(), isCrossField: false, isFromCurrentUser: true))
                    message = ""
                    
                } label: {
                    Image(systemName: "paperplane")
                        .foregroundStyle(Color.black)
                }
            }
            .padding(.horizontal)
        }
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NavigationStack {
        ChatRoomMessageView()
    }
}

