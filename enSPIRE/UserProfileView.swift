import SwiftUI

struct UserProfileView: View {
    
    let userInfo:userInfo
    @State var showProj: Bool
    
    var body: some View {
        NavigationStack {
            
            VStack {
                VStack{
                    if userInfo.photo.count == 0 {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height:80)
                    }
                    else {
                        Image(userInfo.photo)
                            .resizable()
                            .scaledToFit()
                            .frame(height:80)
                    }
                        
                    
                    VStack(alignment: .leading){
                        
                        HStack{
                            Image("PersonIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 30)
                            Text("暱稱：").bold()
                            Text(userInfo.userName)
                        }
                        .padding(.horizontal, 20)
                        
                        Spacer().frame(height: 0)
                        
                        HStack{
                            Image("SuitcaseIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            Text("職業：").bold()
                            Text(userInfo.job.joined(separator:" "))
                                .lineLimit(1)
                        }
                        .padding(.horizontal, 20)
                        
                        Spacer().frame(height: 0)
                        
                        HStack{
                            Image("StarIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            Text("興趣：").bold()
                            Text(userInfo.habit.joined(separator: " "))
                                .lineLimit(1)
                        }
                        .padding(.horizontal, 20)
                    }
                }
                .padding()
                
                
                
            }
            .navigationTitle(userInfo.userName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    UserProfileView(userInfo: userInfo(UserId: "1", userName: "桂林仔", photo: "", job: ["通緝犯", "黑道"], habit: ["擲筊", "請示", "開槍"]), showProj: true)
}
