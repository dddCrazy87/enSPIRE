import SwiftUI
import PhotosUI

struct UploadPiecesView: View {
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedPhotoData: Data?
    
    @State private var name = ""
    @State private var auther = ""
    @State private var description = ""
    @State private var link = ""
    
    var body: some View {
        
        VStack {
            
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){

                Rectangle()
                    .frame(height: 250)
                    .foregroundStyle(Color("YellowColor"))
                
                if let selectedPhotoData,
                   let image = UIImage(data: selectedPhotoData) {
                    Image(uiImage: image)
                        .resizable()
                        .frame(height: 250)
                }
                
                PhotosPicker(selection: $selectedItem, matching: .any(of:[ .images, .not(.livePhotos)])) {
                    Label("上傳作品封面", systemImage: "photo")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                }
                .tint(Color("Yellow2Color"))
                .buttonStyle(.borderedProminent)
                .cornerRadius(8)
                .padding(10)
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedPhotoData = data
                        }
                    }
                }
                
            }
            
            
            HStack {
                Text("作品名稱：")
                    .bold()
                TextField("作品名稱", text: $name)
            }
            .padding(.leading, 30)
            .padding(.top, 20)
            
            HStack {
                Text("作者：")
                TextField("作者", text: $auther)
            }
            .padding(.leading, 50)
            
            HStack {
                Text("作品連結")
                    .bold()
                Spacer()
            }
            .padding(.top, 10)
            .padding(.leading, 30)
            
            TextField("在這裡貼上作品連結", text: $link)
                .padding(.leading, 50)
            
            HStack {
                Text("作品概述")
                    .bold()
                Spacer()
            }
            .padding(.top, 10)
            .padding(.leading, 30)

            TextField(
                "簡單介紹一下這個作品吧",
                text: $description,
                axis: .vertical
            )
            .frame(minHeight: 100, alignment: .top)
            .multilineTextAlignment(.leading)
            .foregroundStyle(.gray)
            .padding(10)
            .overlay{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("YellowColor"), lineWidth: 2)
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
            
            Spacer()
            
            Button{
                    
            }label: {
                Text("上傳")
                    .frame(width: 360, height: 30)
                    .foregroundColor(.black)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("Yellow2Color"))
        }
        .navigationTitle(name.count == 0 ? "未命名作品" : name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        UploadPiecesView()
    }
}
