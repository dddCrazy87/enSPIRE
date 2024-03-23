//
//  ChatView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/23.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        VStack {
            Text("討論室")
                .padding()
                .font(.title)
            ScrollView{
                HStack{
                    Spacer()
                    Button{
                        print("add")
                    } label: {
                        Text("新增討論")
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                    }
                    .font(.system(size: 16))
                    .foregroundStyle(Color.black)
                    .background(Color.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Button{
                        print("add")
                    } label: {
                        Text("跨領域討論")
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                    }
                    .font(.system(size: 16))
                    .foregroundStyle(Color.black)
                    .background(Color.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }
                .padding(.vertical)
                VStack{
                    HStack{
                        AnyShape(Circle())
                            .frame(width: 50)
                            .foregroundStyle(Color.yellow)
                            .padding(.trailing)
                        Text("使用者名稱")
                        Spacer()
                        AnyShape(Circle())
                            .frame(width: 10)
                            .foregroundStyle(Color.orange)
                    }
                    .padding()
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    HStack{
                        AnyShape(Circle())
                            .frame(width: 50)
                            .foregroundStyle(Color.yellow)
                            .padding(.trailing)
                        Text("使用者名稱")
                        Spacer()
                        AnyShape(Circle())
                            .frame(width: 10)
                            .foregroundStyle(Color.orange)
                    }
                    .padding()
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    HStack{
                        AnyShape(Circle())
                            .frame(width: 50)
                            .foregroundStyle(Color.yellow)
                            .padding(.trailing)
                        Text("使用者名稱")
                        Spacer()
                    }
                    .padding()
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    HStack{
                        AnyShape(Circle())
                            .frame(width: 50)
                            .foregroundStyle(Color.yellow)
                            .padding(.trailing)
                        Text("使用者名稱")
                        Spacer()
                    }
                    .padding()
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                }
            }
            .padding()
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    ChatView()
}
