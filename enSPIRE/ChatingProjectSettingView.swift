//
//  ChatingProjectSettingView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/29.
//

import SwiftUI

struct ChatingProjectSettingView: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: 20)
                .foregroundStyle(Color.yellow)
            Text("使用者名稱")
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
            VStack(alignment: .leading){
                Text("心智圖標題")
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.bottom, 8)
                Text("描述你的心智圖內容描述你的心智圖內容描述你的心智圖內容描述你的心智圖內容")
                    .font(.system(size: 14))
                    .lineLimit(2)
            }
            Spacer()
        }
        .padding()
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ChatingProjectSettingView()
}
