//
//  LoginView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/4/11.
//

import SwiftUI

struct LoginView: View {
    @State private var emailMessage: String = ""
    @State private var password: String = ""
    @FocusState var isEmailFocus: Bool
    @FocusState var isPasswordFocus: Bool
    @State private var isSecured: Bool = true
    
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            Image("enSPIRELogo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text("enSPIRE")
                .font(.system(size: CGFloat(30), weight: .bold))
                .padding(.bottom, 50)
            
            HStack{
                Image(systemName: "envelope.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding(.horizontal)
                TextField(
                        "電子郵件",
                        text: $emailMessage
                )
                .focused($isEmailFocus)
            }
            .padding()
            .frame(width: 280)
            .background(.gray)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            
            HStack {
                Image(systemName: "lock.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 20)
                    .padding(.horizontal)
                if isSecured {
                    SecureField("密碼", text: $password)
                        .focused($isPasswordFocus)
                } else {
                    TextField("密碼", text: $password)
                        .focused($isPasswordFocus)
                }
                
                Button(action: {
                    isSecured.toggle()
                }) {
                    Image(systemName: self.isSecured ? "eye.slash" : "eye")
                        .accentColor(.black)
                }
                    
            }
            .padding()
            .frame(width: 280)
            .background(.gray)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            Spacer()
            Button("登入"){
                
            }
            .font(.system(size: 30,weight: .bold))
            .foregroundStyle(Color.black)
            .padding()
            .padding(.horizontal, 30)
            .background(Color("YellowColor"))
            .clipShape(RoundedRectangle(cornerRadius: 100))
            
            HStack{
                Text("我還沒有帳號，前往")
                Button{
                    
                }
                label:{
                    Text("註冊")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(Color.black)
                        .underline()
                        
                }
                
            }
            .padding()
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    
    LoginView()
}
