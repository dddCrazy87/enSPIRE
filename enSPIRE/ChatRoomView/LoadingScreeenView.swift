//
//  LoadingScreeenView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/4/2.
//

import SwiftUI

struct LoadingScreeenView: View {
    var user: UserInfo
    @State private var opacity = 1.0
    @State private var isLoading = false
    @State private var isActive = false
    @EnvironmentObject var coordinator: Coordinator
        var body: some View {
            if isActive {
                ChatRoomSheetCardView(user: user)
            } else{
                VStack{
                    Spacer()
                    ZStack {
                        Circle()
                            .fill()
                            .frame(width: 150, height: 150)
                            .foregroundStyle(Color.white)

                        Circle()
                            .trim(from: 0, to: 0.2)
                            .stroke(Color("Yellow2Color"), lineWidth: 10)
                            .frame(width: 150, height: 150)
                            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                            .onAppear() {
                                self.isLoading = true
                            }
                        Text("尋找中...")
                            .font(.system(size: 20))
                            .font(.system(.body, design: .rounded))
                    }
                    .opacity(opacity)
                    .onAppear(){
                        withAnimation(.easeInOut(duration: 1).delay(3)){
                            self.opacity = 0.0
                        }
                    }
                    Spacer()
                }
                .frame(width: 450)
                .background(Color("YellowColor"))
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4){
                        self.isActive = true
                    }
                }
            }
            
        }
}
