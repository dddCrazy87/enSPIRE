import Foundation
import SwiftUI

struct GalleryView: View {
    
    let gridItems = [
        Pieces(title:"Ice Beer", auther: "Bing Image Creator", image: "img2", description: "realistic image of a cold glass of lemonade chilling in a pile of snow, polar bears in the background", link: ""),
        Pieces(title:"", auther: "", image: "img7", description: "", link: ""),
        Pieces(title:"", auther: "", image: "img6", description: "", link: ""),
        Pieces(title:"Diamonds Bouquet", auther: "Bing Image Creator", image: "img4", description: "realistic image of a bouquet of flowers made of diamonds", link: "https://www.bing.com/images/create/realistic-image-of-a-bouquet-of-flowers-made-of-diamonds/1-410A7C6CCD7E4DD29D118B81BDF21C92?id=ofsZj%2FNICocjxNigLHOhWA%3D%3D&view=detailv2&idpp=genimg&FORM=GLPIDP&idpview=singleimage"),
        Pieces(title:"野餐", auther: "劉丞恩", image: "img5", description: "晴空萬里的夏天午後，一起在花花草草的綠地上，享用野餐的悠閒日子", link: ""),
        Pieces(title:"", auther: "", image: "img11", description: "", link: ""),
        Pieces(title:"Fruits and Flowers", auther: "Bing Image Creator", image: "img3", description: "A picnic on a green meadow with a basket of fruits and flowers", link: "https://www.bing.com/images/create/A-picnic-on-a-green-meadow-with-a-basket-of-fruits-and-flowers/1-E66D534B73074E6DBB064EB19FC531AA?id=E393RMe6bjteIAMIYIE2jg%3D%3D&view=detailv2&idpp=genimg&FORM=GLPIDP&idpview=singleimage"),
        Pieces(title:"", auther: "", image: "img10", description: "", link: ""),
        Pieces(title:"", auther: "", image: "img8", description: "", link: ""),
        Pieces(title:"積水的馬路", auther: "小恩", image: "img9", description: "雨後放晴的下午我與米子坐在馬路邊等待紅綠燈，踢著水、泡著腳、玩著水", link: ""),
        Pieces(title:"Paper Animals", auther: "Bing Image Creator", image: "img1", description: "A nature reserve showing an elephant, zebra, and lion made of origami paper that have come to life", link: "https://www.bing.com/images/create/A-nature-reserve-showing-an-elephant%2C-zebra%2C-and-lion-made-of-origami-paper-that-have-come-to-life/1-737FD1EA2B1B4FB7872F219E7A8D859E?id=qgL23lMt2be3%2BD%2FSaB3h9A%3D%3D&view=detailv2&idpp=genimg&FORM=GLPIDP&idpview=singleimage"),
        Pieces(title:"", auther: "", image: "img12", description: "", link: "")
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                GridView(gridItems: gridItems, numberOfColumns: 2)
            }
            .padding()
        }
        
    }
}
    

#Preview {
    NavigationStack {
        GalleryView()
    }
}
