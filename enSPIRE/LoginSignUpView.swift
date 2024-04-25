//
//  LoginSignUpView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/4/11.
//

import SwiftUI

struct LoginSignUpView: View {
//    sign up
    @State private var SUemailMessage: String = ""
    @State private var SUpassword: String = ""
    @State private var SUjobMessage: String = ""
    @State private var SUhabitMessage: String = ""
    @FocusState var isEmailFocus: Bool
    @FocusState var isPasswordFocus: Bool
    @FocusState var isSUjobFocus: Bool
    @FocusState var isSUhabitFocus: Bool
    @State private var isSUSecured: Bool = true
    @State private var pageOffset = UIScreen.main.bounds.width
    @State private var pageLimit: Int = 0
    @State private var isCurFPage: Bool = false
    @State private var isCurSPage: Bool = false
    @State private var isCurTPage: Bool = false
    
    @State private var toLoginPage: Bool = false

//    login
    @State private var emailMessage: String = ""
    @State private var password: String = ""
    @State private var isSecured: Bool = true
    
    
    var body: some View {
        VStack{
            if toLoginPage {
                loginpage()
            }
            else {
                signuppage()
            }
        }
        
    }
    func signuppage() -> some View {
        VStack(alignment: .center){
        
            HStack(alignment: .center) {
                Image("enSPIRELogo")
                    .resizable()
                    .scaledToFit()
                .frame(width: 100, height: 100)
                .offset(y: -20)
                Text("註冊")
                    .font(.system(size: CGFloat(30), weight: .bold))
            }
            .offset(x: -20)
            
            getStep()
            HStack{
                
                Circle()
                    .frame(width: 8)
                    .foregroundStyle( self.isCurFPage ? Color("Yellow2Color") : Color("YellowColor"))
                Circle()
                    .frame(width: 8)
                    .foregroundStyle(self.isCurSPage ? Color("Yellow2Color") : Color("YellowColor"))
                Circle()
                    .frame(width: 8)
                    .foregroundStyle(self.isCurTPage ? Color("Yellow2Color") : Color("YellowColor"))
                
            }
            .padding()
            HStack{
                Button{
                    if pageLimit > 0 {
                        withAnimation(){
                            pageOffset += UIScreen.main.bounds.width
                        }
                        pageLimit = pageLimit - 1
                    }
                    else {
                        print("Sign up")
                    }
                    if pageLimit == 0 {
                        isCurFPage = true
                        isCurSPage = false
                        isCurTPage = false
                    }
                    else if pageLimit == 1 {
                        isCurFPage = false
                        isCurSPage = true
                        isCurTPage = false
                    }
                    else if pageLimit == 2 {
                        isCurFPage = false
                        isCurSPage = false
                        isCurTPage = true
                    }
                }label:{
                    if pageLimit > 0 {
                        Text("上一步")
                            .font(.system(size: 26,weight: .bold))
                            .foregroundStyle(Color.black)
                            .padding()
                            .padding(.horizontal, 20)
                            .background(Color("YellowColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 100))
                            
                    }
                }
                Button{
                    if pageLimit < 2 {
                        withAnimation(){
                            pageOffset -= UIScreen.main.bounds.width
                        }
                        pageLimit = pageLimit + 1
                    }
                    else {
                        print("Sign up")
                    }
                    if pageLimit == 0 {
                        isCurFPage = true
                        isCurSPage = false
                        isCurTPage = false
                    }
                    else if pageLimit == 1 {
                        isCurFPage = false
                        isCurSPage = true
                        isCurTPage = false
                    }
                    else if pageLimit == 2 {
                        isCurFPage = false
                        isCurSPage = false
                        isCurTPage = true
                    }
                }label:{
                    if pageLimit >= 2 {
                        Text("註冊")
                            .font(.system(size: 26,weight: .bold))
                            .foregroundStyle(Color.black)
                            .padding()
                            .padding(.horizontal, 20)
                            .background(Color("YellowColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 100))
                    }
                    else{
                        Text("下一步")
                            .font(.system(size: 26,weight: .bold))
                            .foregroundStyle(Color.black)
                            .padding()
                            .padding(.horizontal, 20)
                            .background(Color("YellowColor"))
                            .clipShape(RoundedRectangle(cornerRadius: 100))
                    }
                }
                
            }
            HStack{
                Text("我已經有帳號，前往")
                Button{
                    toLoginPage.toggle()
                }
                label:{
                    Text("登入")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(Color.black)
                        .underline()
                        
                }
                
            }
            .padding()
            
        }
        .padding()
        .frame(height: 550)
    }
    
    func loginpage() -> some View {
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
            .background(Color(uiColor: .systemGray4))
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
            .background(Color(uiColor: .systemGray4))
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
                    toLoginPage.toggle()
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
    
    func first() -> some View {
        VStack {
            HStack{
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(.horizontal)
                TextField(
                    "暱稱",
                    text: $SUemailMessage
                )
                .focused($isEmailFocus)
            }
            .padding()
            .frame(width: 280)
            .background(Color(uiColor: .systemGray4))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            
            HStack{
                Image(systemName: "envelope.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding(.horizontal)
                TextField(
                    "電子郵件",
                    text: $SUemailMessage
                )
                .focused($isEmailFocus)
            }
            .padding()
            .frame(width: 280)
            .background(Color(uiColor: .systemGray4))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            HStack {
                Image(systemName: "lock.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 20)
                    .padding(.horizontal)
                if isSUSecured {
                    SecureField("密碼", text: $SUpassword)
                        .focused($isPasswordFocus)
                } else {
                    TextField("密碼", text: $SUpassword)
                        .focused($isPasswordFocus)
                }
                
                Button(action: {
                    isSUSecured.toggle()
                }) {
                    Image(systemName: self.isSUSecured ? "eye.slash" : "eye")
                        .accentColor(.black)
                }
                
                
            }
            .padding()
            .frame(width: 280)
            .background(Color(uiColor: .systemGray4))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            
            Spacer()
            
            

        }
        .frame(width: UIScreen.main.bounds.width)
    }
    
    func second() -> some View {
        VStack {
            Spacer()
            HStack{
                Image(systemName: "briefcase.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(.horizontal)
                TextField(
                    "職業",
                    text: $SUjobMessage
                )
                .focused($isSUjobFocus)
            }
            .padding()
            .frame(width: 280)
            .background(Color(uiColor: .systemGray4))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            
            Spacer()
            
        }
        .frame(width: UIScreen.main.bounds.width)
    }
    
    func third() -> some View {
        VStack {
            Spacer()
            HStack(alignment: .center){
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .padding(.horizontal)
                TextField(
                    "興趣",
                    text: $SUhabitMessage
                )
                .focused($isSUhabitFocus)
            }
            .padding()
            .frame(width: 280)
            .background(Color(uiColor: .systemGray4))
            .clipShape(RoundedRectangle(cornerRadius: 30))
            
            Spacer()
            
        }
        .frame(width: UIScreen.main.bounds.width)
    }
    
    func getStep() -> some View{
        HStack{
            first()
            second()
            third()
        }
        .offset(x: pageOffset)
    }
}

#Preview {
    LoginSignUpView()
}
