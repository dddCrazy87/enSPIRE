import SwiftUI

struct UserProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                    Text("使用者名稱")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(height: 50)
                    Text("APP設計師")
                        .font(.system(size: 20))
                        .frame(height: 20)
                    HStack {
                        Text("看電影")
                            .font(.system(size: 20))
                        Text("聽音樂")
                            .font(.system(size: 20))
                    }
                }
                .frame(height: 270)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                
                VStack {
                    HStack {
                        Button {
                            
                        } label: {
                            Text("你的專案")
                                .frame(width:150, height: 40)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.black)
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        }
                        Button {
                            
                        } label: {
                            Text("你的創作")
                                .frame(width:150, height: 40)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.black)
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        }
                    }
                    
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(Color.black)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        HStack {
                            ZStack {
                                Rectangle()
                                    .frame(width:90, height: 120)
                                    .foregroundColor(Color.gray)
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 35, height: 35)
                            }
                            Rectangle()
                                .frame(width:90, height: 120)
                                .foregroundColor(Color.gray)
                            Rectangle()
                                .frame(width:90, height: 120)
                                .foregroundColor(Color.gray)
                        }
                        HStack {
                            Rectangle()
                                .frame(width:90, height: 120)
                                .foregroundColor(Color.gray)
                            Rectangle()
                                .frame(width:90, height: 120)
                                .foregroundColor(Color.gray)
                            Rectangle()
                                .frame(width:90, height: 120)
                                .foregroundColor(Color.gray)
                        }
                        HStack {
                            Rectangle()
                                .frame(width:90, height: 120)
                                .foregroundColor(Color.gray)
                            Rectangle()
                                .frame(width:90, height: 120)
                                .foregroundColor(Color.gray)
                            Rectangle()
                                .frame(width:90, height: 120)
                                .foregroundColor(Color.gray)
                        }
                        HStack {
                            Rectangle()
                                .frame(width:90, height: 120)
                                .foregroundColor(Color.gray)
                            Rectangle()
                                .frame(width:90, height: 120)
                                .foregroundColor(Color.gray)
                            Rectangle()
                                .frame(width:90, height: 120)
                                .foregroundColor(Color.gray)
                        }
                    }
                    .frame(height: 350)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                }
            }
            .navigationTitle("使用者名稱")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    UserProfileView()
}
