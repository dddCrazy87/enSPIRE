//
//  MessageView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/23.
//

import SwiftUI

struct MessageView: View {
    private var isFromCurrentUser: Bool = true
    
    var body: some View {
        if isFromCurrentUser {
            VStack(alignment: .trailing){
                HStack(alignment: .top)
                {
                    Text("Thank you!")
                        .font(.system(size: 14))
                        .foregroundStyle(Color.black)
                        .frame(alignment: .topTrailing)
                        .padding()
                        .background(Color.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    Image(systemName: "person.fill")
                        .font(.system(size: 15))
                        .foregroundStyle(Color.black)
                        .padding(10)
                        .background(Color.yellow)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                .frame(maxWidth: 260, alignment: .trailing)
                .padding(.vertical, 10)
                .padding(.leading, 100)
            }
            .frame(maxWidth: .infinity)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .padding()
        }
        else{
            VStack(alignment: .leading){
                HStack
                {
                    Image(systemName: "person.fill")
                        .font(.system(size: 15))
                        .foregroundStyle(Color.yellow)
                        .padding(10)
                        .background(Color.black)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    Text("Hello! How are You today. If there is any troubles just Text me. I will help you!")
                        .font(.system(size: 14))
                        .foregroundStyle(Color.white)
                        .frame(alignment: .topLeading)
                        .padding()
                        .background(Color.black)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                }
                .frame(maxWidth: 260, alignment: .leading)
                .padding(.vertical, 10)
                .padding(.trailing, 100)
                .border(Color.black)
            }
        }
    }
}

#Preview {
    MessageView()
}
