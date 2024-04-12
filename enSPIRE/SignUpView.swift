//
//  SignUpView.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/4/11.
//

import SwiftUI

struct SignUpView: View {
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

    var body: some View {
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
                
                Button{
                    if pageLimit < 3 {
                        withAnimation(){
                            pageOffset -= UIScreen.main.bounds.width
                        }
                        pageLimit = pageLimit + 1
                    }
                    else if pageLimit >= 3 {
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
                    }
                    else{
                        Text("下一步")
                    }
                }
                .font(.system(size: 26,weight: .bold))
                .foregroundStyle(Color.black)
                .padding()
                .padding(.horizontal, 20)
                .background(Color("YellowColor"))
                .clipShape(RoundedRectangle(cornerRadius: 100))
                HStack{
                    Text("我已經有帳號，前往")
                    Button{
                        
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
            .frame(height: 520)
            .border(Color.black)
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
            .background(.gray)
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
            .background(.gray)
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
            .background(.gray)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            
            Spacer()
            
            

        }
        .frame(width: UIScreen.main.bounds.width)
        .border(.black)
    }
    
    func second() -> some View {
        VStack {
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
            .background(.gray)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            
            Spacer()
            
        }
        .frame(width: UIScreen.main.bounds.width)
        .border(.black)
        
        
    }
    
    func third() -> some View {
        VStack {
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
            .background(.gray)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            
            Spacer()
            
        }
        .frame(width: UIScreen.main.bounds.width)
        .border(.black)
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
    SignUpView()
}
