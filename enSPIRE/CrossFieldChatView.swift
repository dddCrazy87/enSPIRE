//
//  CrossFieldChatView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/28.
//

import SwiftUI

struct CrossFieldChatView: View {
    var body: some View {
        VStack{
            ScrollView{
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
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
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
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    HStack{
                        AnyShape(Circle())
                            .frame(width: 50)
                            .foregroundStyle(Color.yellow)
                            .padding(.trailing)
                        Text("使用者名稱")
                        Spacer()
                    }
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    HStack{
                        AnyShape(Circle())
                            .frame(width: 50)
                            .foregroundStyle(Color.yellow)
                            .padding(.trailing)
                        Text("使用者名稱")
                        Spacer()
                    }
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                }
            }
            .padding()
            .background(Color("YellowColor"))
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

#Preview {
    CrossFieldChatView()
}
