//
//  ChatingProjectSettingView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/29.
//

import SwiftUI

struct ChatingProjectSettingView: View {
    var user: UserInfo
    @Binding var showEditSheet: Bool
    var body: some View {
        Button {
            showEditSheet.toggle()
        } label: {
            VStack{
                HStack{
                    Circle()
                        .frame(width: 20)
                        .foregroundStyle(Color.yellow)
                    Text(user.userName)
                        .foregroundStyle(Color.black)
                        .font(.system(size: 15))
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 20)
                HStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 120, height: 80)
                        .foregroundStyle(Color.yellow)
                        .padding(.trailing)
                    //                    MindMapView(curPage: $curPage, isPreview: true, rootNode: mindMap.node)
                    //                        .frame(width: 120, height: 80)
                    //                        .clipped()
                    //                        .padding(.trailing)
                    //                        .cornerRadius(10)
                    //                        .foregroundColor(.black)
                    //                        .disabled(true)
                    
                    VStack(alignment: .leading){
                        Text("心智圖標題")
                            .foregroundStyle(Color.black)
                            .font(.system(size: 20, weight: .semibold))
                            .padding(.bottom, 8)
                        Text("心智圖內容")
                            .foregroundStyle(Color.black)
                            .font(.system(size: 14))
                            .lineLimit(2)
                    }
                    Spacer()
                }
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
    }
}
