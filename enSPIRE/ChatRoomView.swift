//
//  ChatRoomView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/23.
//

import SwiftUI

struct ChatRoomView: View {
    @State private var message: String = ""
    @FocusState private var isFocused: Bool
    private var sendMessage: String = ""
    
    var body: some View {
        VStack {
            Text("使用者名稱")
                .padding()
                .font(.title)
            ScrollView{
                MessageView()
            }
            HStack{
                TextField(
                        "Message",
                        text: $message
                )
                .textFieldStyle(.roundedBorder)
                .padding()
                .focused($isFocused)
                
                    
                Button {
                    isFocused = false
                    print("send")
                    
                } label: {
                    Image(systemName: "paperplane")
                }
            }
            .padding()
        }
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        
    }
}

#Preview {
    ChatRoomView()
}
