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
    @State private var showMessageTemplates: Bool = false

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
                        .onChange(of: chatRoomViewModel.messagesData, initial: true){ oldvalue, newvalue in
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
            .padding(.top)
            
            ScrollView(.horizontal){
                HStack{
                    Button{
                        showMessageTemplates.toggle()
                    }label: {
                        Text("+ 新增訊息模板")
                            .font(.system(size: 13))
                            .foregroundStyle(Color.black)
                            .frame(alignment: .topTrailing)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 14)
                            .background(Color("YellowColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                            .shadow(radius: 1.5)
                    }
                    .sheet(isPresented: $showMessageTemplates){
                        VStack{
                            
                        }
                        .presentationDetents([ .medium, .large])
                    }
                    Button{
                        message = "嗨，您好！我想要討論一個有關 [主題] 的議題。我們可以一起探討 [主題] 的各個方面，分享想法和經驗。希望能夠在這裡找到一些新的靈感和解決方案。"
                    }label: {
                        Text("嗨，您好！我想要討論一個有關 [主題] 的議題...")
                            .font(.system(size: 13))
                            .foregroundStyle(Color.black)
                            .frame(alignment: .topTrailing)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 14)
                            .background(Color(uiColor: .systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                            .shadow(radius: 1.5)
                    }
                    Button{
                        message = "我想和您一起討論一個 [目標] 的目標，探討如何實現它、遇到的挑戰以及可能的解決方案。希望我們可以共同努力，實現這個目標"
                    }label: {
                        Text("我想和您一起討論一個 [目標] 的目標，探討...")
                            .font(.system(size: 13))
                            .foregroundStyle(Color.black)
                            .frame(alignment: .topTrailing)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 14)
                            .background(Color(uiColor: .systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                            .shadow(radius: 1.5)
                    }
                    Button{
                        message = "能給我一些建議嗎？"
                    }label: {
                        Text("能給我一些建議嗎？")
                            .font(.system(size: 13))
                            .foregroundStyle(Color.black)
                            .frame(alignment: .topTrailing)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 14)
                            .background(Color(uiColor: .systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                            .shadow(radius: 1.5)
                    }
                }
                .padding(.horizontal)
                
            }
            Divider()
            HStack{
                TextField(
                    "Message",
                    text: $message,
                    axis: .vertical
                )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .padding(.top)
                .focused($isMessageFocus)
                
                
                Button {
                    print("send")
                    if message != "" {
                        chatRoomViewModel.messagesData.append(Message(UserId: "123", text: message, photoURL: "", creatAt: Data(), isCrossField: false, isFromCurrentUser: true))
                        message = ""
                    }
                    
                } label: {
                    Image(systemName: "paperplane")
                        .foregroundStyle(Color.black)
                }
            }
            .padding(.horizontal)
//            .background(Color(uiColor: .systemGray5))
        }
    }
}

#Preview {
    NavigationStack {
        ChatRoomMessageView()
    }
}

