//
//  ChatRoomSheetCardView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/4/2.
//

import SwiftUI

struct ChatRoomSheetCardView: View {
    var user: userInfo
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                    Rectangle()
                        .frame(height: 250)
                        .foregroundStyle(Color("YellowColor"))
                        
                }
                ScrollView{
                    VStack(alignment: .leading){
                        HStack{
                            Image("PersonIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40)
                            
                            Text(user.userName)
                        }
                        .padding(.horizontal)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.bottom, 4)
                        HStack{
                            Image("SuitcaseIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40)
                            
                            Text(user.job.joined(separator: ", "))
                               .multilineTextAlignment(.trailing)
                            
                        }
                        .padding(.horizontal)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.bottom, 4)
                        HStack{
                            Image("StarIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40)
                            
                            Text(user.habit.joined(separator: ", "))
                               .multilineTextAlignment(.trailing)
                        
                        }
                        .padding(.horizontal)
                        .font(.system(size: 16, weight: .regular))
                        .padding(.bottom, 4)
                        Text("心智圖標題")
                            .padding(.vertical)
                            .font(.system(size: 20, weight: .semibold))
                        Text("為我新創作的音樂響新的靈感，目前訂的主題是森林，透過不斷臉想與發想來思考音樂的故事。")
                            .padding()
                            .font(.system(size: 15))
                    }
                    .padding(.horizontal, 25)
                    .padding(.vertical)
                }
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(radius: 5)
            Spacer()
         
        }
        .padding()
        .padding(.top, 30)
        .background(Color("YellowColor"))
        
    }
}

#Preview {
    ChatRoomSheetCardView(user: userInfo(UserId: "123", userName: "okok", photo: "", job: ["老師", "商品設計師"], habit: ["看書", "釣魚"] ))
}
