//
//  LoadingScreeenView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/4/2.
//

import SwiftUI

struct LoadingScreeenView: View {
    @State private var size = 1.0
    @State private var opacity = 0.9
    @State private var isActive = false
    @State private var color = Color("YellowColor")
    @State private var backgroundColor = Color("DefaultColor")
    var body: some View {
        ZStack{
            ZStack{
                Circle()
                    .fill()
                    .frame(width: 160)
                    .foregroundStyle(color)
                    .scaleEffect(size)
                    .onAppear(){
                        withAnimation(.easeIn(duration: 2.0).delay(0.3)){
                            self.color = Color("YellowColor")
                        }
                        withAnimation(.spring(duration: 1.0).delay(1.3).speed(1.3)){
                            self.color = Color("Yellow2Color")
                            self.size = 1.2
                        }
                    }
                ZStack{
                    MyShape()
                }
                .opacity(opacity)
                .scaleEffect(size)
                .onAppear(){
                    withAnimation(.easeOut(duration: 3.6).delay(1.8).speed(1.3)){
                        self.opacity = 1
                        self.size = 1.5
                    }
                }
            }
            .scaleEffect(size)
            .onAppear(){
                withAnimation(.easeOut(duration: 5).delay(0.1)){
                    self.size = 0.85
                }
            }
            
        }
        .background(backgroundColor)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 6.2){
                self.isActive = true
            }
        }

    }
}

#Preview {
    LoadingScreeenView()
}
