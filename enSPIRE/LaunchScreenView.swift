//
//  SwiftUIView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/26.
//

import SwiftUI

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct LaunchScreenView: View {
    @State private var size = 1.0
    @State private var opacity = 0.0
    @State private var easeOutOpacity = 1.0
    @State private var isActive = false
    @State private var offset = 0.0
    @State private var GrassOffsetY = 700
    @State private var WizardOffsetY = 600
    @State private var fontOffsetX = -300
    @State private var fontOffsetY = 500
    @State private var fontSize = 25
    
    var body: some View {
        if isActive {
            ContentView()
        } else{
            ZStack{
                ZStack{
                    Circle()
                        .frame(width: 20)
                        .offset(x: 100, y: -300)
                    Circle()
                        .frame(width: 10)
                        .offset(x: -50, y: -190)
                    Circle()
                        .frame(width: 10)
                        .offset(x: 10, y: 30)
                    Circle()
                        .frame(width: 15)
                        .offset(x: 130, y: -70)
                    Circle()
                        .frame(width: 20)
                        .offset(x: -130, y: -150)
                    Circle()
                        .frame(width: 15)
                        .offset(x: -80, y: 0)
                    Circle()
                        .frame(width: 15)
                        .offset(x: -90, y: -310)
                    Circle()
                        .frame(width: 10)
                        .offset(x: -170, y: 100)
                    Circle()
                        .frame(width: 15)
                        .offset(x: 85, y: -210)
                    Circle()
                        .frame(width: 10)
                        .offset(x: 165, y: 190)
                    Circle()
                        .frame(width: 10)
                        .offset(x: 120, y: 130)
                }
                .foregroundStyle(Color("YellowStar"))
                .opacity(Double(opacity))
                .onAppear(){
                    withAnimation(.easeIn(duration: 2).delay(3).speed(1)){
                        self.opacity = 0.9
                    }
                    withAnimation(.easeIn(duration: 1).delay(5)){
                        self.opacity = 0.3
                    }
                    withAnimation(.easeIn(duration: 1).delay(6)){
                        self.opacity = 0.9
                    }
                    withAnimation(.easeIn(duration: 2).delay(7)){
                        self.opacity = 0
                    }
                        
                }
                
                Circle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color("LightGrass"), Color("NightGrass")]),startPoint: .top, endPoint: .init(x: 0.5, y: 0.4)))
                    .frame(width: 500)
                    .offset(x: 0, y: CGFloat(GrassOffsetY))
                    .opacity(easeOutOpacity)
                    .onAppear(){
                        withAnimation(.bouncy(duration: 1.5, extraBounce: 0.05).delay(1).speed(2)){
                            self.GrassOffsetY = 500
                        }
                        withAnimation(.easeIn(duration: 2).delay(7)){
                            self.easeOutOpacity = 0
                        }
                    }
                Image("Wizard")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .offset(y: CGFloat(WizardOffsetY))
                    .opacity(easeOutOpacity)
                    .onAppear(){
                        withAnimation(.bouncy(duration: 1.5, extraBounce: 0.05).delay(2).speed(2)){
                            self.WizardOffsetY = 180
                        }
                        
                    }
                Text("Stella")
                    .foregroundStyle(.white)
                    .offset(x: CGFloat(0), y: CGFloat(fontOffsetY))
                    .font(.system(size: CGFloat(fontSize), weight: .bold))
                    .opacity(easeOutOpacity)
                    .onAppear(){
                        withAnimation(.bouncy(duration: 2, extraBounce: 0.05).delay(3).speed(2)){
                            self.fontOffsetY = -70
                            self.fontSize = 50
                        }
                    }
                
        
                
            }
            .frame(height: UIScreen.screenHeight)
            .background(LinearGradient(gradient: Gradient(colors: [Color("BgNight"), Color.black]),startPoint: .top, endPoint: .bottom))
            .onAppear{
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 9){
                    self.isActive = true
                }
            }
        }
        
    }
}



#Preview {
    LaunchScreenView()
}


