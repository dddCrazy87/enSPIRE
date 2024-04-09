//
//  ChatRoomSheetCardView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/4/2.
//

import SwiftUI

struct ChatRoomSheetCardView: View {
    var user: UserInfo
    @State private var showDetials: Bool = false
    @State private var offset: CGSize = .zero
    @State private var check: Bool = false
    @EnvironmentObject var coordinator: Coordinator
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
                    Rectangle()
                        .frame(height: 250)
                        .foregroundStyle(Color("YellowColor"))
                        
                }
                VStack(alignment: .leading){
                    Text("森林咖啡廳")
                        .padding(.vertical)
                        .font(.system(size: 20, weight: .semibold))
                    Text("為我新創作的音樂響新的靈感，目前訂的主題是森林，透過不斷臉想與發想來思考音樂的故事。")
                        .lineLimit(1)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .font(.system(size: 15))
                    HStack{
                        Spacer()
                        Button("更多..."){
                            showDetials.toggle()
                        }
                        .padding()
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(Color.black)
                        .background(Color("Yellow2Color"))
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        .offset(x: 20, y: 15)
                        .sheet(isPresented: $showDetials){
                            VStack(alignment: .leading){
                                Text("森林咖啡廳")
                                    .padding(.vertical)
                                    .font(.system(size: 20, weight: .semibold))
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
                                
                                Text("為我新創作的音樂響新的靈感，目前訂的主題是森林，透過不斷臉想與發想來思考音樂的故事。")
                                    .padding()
                                    .font(.system(size: 15))
                            }
                            .padding(.horizontal, 25)
                            .padding(.vertical)
                            .presentationDetents([ .medium, .large])
                            
                        }
                        
                    }
                    
                }
                .padding()
            }
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(radius: 5)
            .offset(offset)
            .scaleEffect(getScaleAmount())
            .gesture(
                DragGesture()
                    .onChanged{ value in
                        withAnimation(.spring()){
                            offset = value.translation
                        }
                        
                    }
                    .onEnded{ value in
                        withAnimation(.spring()){
                            offset = .zero
                        }
                        
                    }
            )
            Spacer()
            HStack{
                Button{
                    print("x")
                }label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 30, weight: .bold))
                        .padding()
                        .foregroundStyle(Color.white)
                        .background(Color("OrangeColor"))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                .padding()
                Button{
                    coordinator.push(.preChat(user: user))
                }label: {
                    Image(systemName: "checkmark")
                        .font(.system(size: 30, weight: .bold))
                        .padding()
                        .foregroundStyle(Color.white)
                        .background(Color.green)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                .padding()
            }
        }
        .padding()
        .padding(.top, 30)
        .background(Color("YellowColor"))
        
    }
    func getScaleAmount() -> CGFloat  {
        let maxAmount = UIScreen.main.bounds.width / 2
        let currentAmount =  abs(offset.width)
        let persenctage = currentAmount / maxAmount
        return 1.0 - min(persenctage, 0.8) * 0.6
    }
}
