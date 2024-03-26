//
//  SwiftUIView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/26.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var size = 1.0
    @State private var opacity = 0.9
    @State private var isActive = false
    @State private var color = Color("YellowColor")
    @State private var backgroundColor = Color("DefaultColor")
    @State private var offset = 0.0
    @State private var fontOffsetX = -300
    @State private var fontOffsetY = 140
    @State private var fontSize = 25
    
    var body: some View {
        if isActive {
            ContentView()
        } else{
            ZStack{
                ZStack{
                    Circle()
                        .fill()
                        .frame(width: 160)
                        .foregroundStyle(color)
                        .scaleEffect(size)
                        .offset(y: offset)
                        .onAppear(){
                            withAnimation(.easeIn(duration: 2.0).delay(0.3)){
                                self.color = Color("YellowColor")
                            }
                            withAnimation(.spring(duration: 1.0).delay(1.3).speed(1.3)){
                                self.color = Color("Yellow2Color")
                                self.size = 1.2
                                self.offset = -50
                            }
                        }
                    ZStack{
                        MyShape()
                    }
                    .opacity(opacity)
                    .scaleEffect(size)
                    .offset(y: offset)
                    .onAppear(){
                        withAnimation(.easeOut(duration: 3.6).delay(1.8).speed(1.3)){
                            self.opacity = 1
                            self.size = 1.5
                            self.offset = -100
                        }
                        withAnimation(.easeOut(duration: 2.5).delay(3.8).speed(1.3)){
                            self.opacity = 0
                            self.size = 1.5
                            self.offset = -100
                        }
                    }
                }
                .scaleEffect(size)
                .offset(y: offset)
                .onAppear(){
                    withAnimation(.easeOut(duration: 5).delay(0.1)){
                        self.offset = -13
                        self.size = 0.85
                    }
                }
                Text("enSPIRE")
                    .offset(x: CGFloat(fontOffsetX), y: CGFloat(fontOffsetY))
                    .font(.system(size: CGFloat(fontSize), weight: .bold))
                    .opacity(opacity)
                    .onAppear(){
                        withAnimation(.bouncy(duration: 1.5, extraBounce: 0.05).delay(1).speed(2)){
                            self.fontOffsetX = 15
                            self.fontSize = 35
                        }
                        withAnimation(.linear(duration: 3).delay(1.4).speed(0.8)){
                            self.opacity = 0.3
                            self.fontOffsetX = -3
                            self.fontOffsetY = -20
                            self.fontSize = 12
                        }
                    }
        
                
            }
            .background(backgroundColor)
            .onAppear{
                withAnimation(.easeInOut(duration: 2).delay(3).speed(1.3)){
                    self.backgroundColor = Color.white.opacity(0)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 6.2){
                    self.isActive = true
                }
            }
        }
    }
}

struct MyShape : Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        p.move(to: CGPoint(x: 130, y: 435))
        p.addQuadCurve(to: CGPoint(x: 170, y: 410), control: CGPoint(x: 155, y: 440))
        p.move(to: CGPoint(x: 170, y: 410))
        p.addQuadCurve(to: CGPoint(x: 171, y: 365), control: CGPoint(x: 150, y: 370))
        p.move(to: CGPoint(x: 170, y: 410))
        p.addQuadCurve(to: CGPoint(x: 170, y: 365), control: CGPoint(x: 190, y: 370))
        p.move(to: CGPoint(x: 170, y: 410))
        p.addQuadCurve(to: CGPoint(x: 210, y: 420), control: CGPoint(x: 185, y: 430))
        p.move(to: CGPoint(x: 210, y: 420))
        p.addQuadCurve(to: CGPoint(x: 221, y: 365), control: CGPoint(x: 200, y: 370))
        p.move(to: CGPoint(x: 210, y: 420))
        p.addQuadCurve(to: CGPoint(x: 220, y: 365), control: CGPoint(x: 250, y: 370))
        p.move(to: CGPoint(x: 210, y: 420))
        p.addQuadCurve(to: CGPoint(x: 280, y: 470), control: CGPoint(x: 220, y: 450))

        return p.strokedPath(.init(lineWidth: 6))
    }



}

#Preview {
    LaunchScreenView()
}


