import SwiftUI

class ChatRoomViewModle: ObservableObject {
    @Published var messages = [Message]()
    
    @Published var messagesData = [
        Message(UserId: "123", text: "您好～", photoURL: "", creatAt: Data(),isCrossField: false, isFromCurrentUser: false),
        Message(UserId: "123", text: "我有看到您的心智圖，內容提及小孩子這點讓我很感興趣因為我是幼稚園老師，現在也要教小朋友們做食物與勞作，不知道能不能和你一起討論關於能給小孩子一起參與的食譜，讓孩子可以樂在其中，也願意參與。", photoURL: "", creatAt: Data(),isCrossField: false, isFromCurrentUser: false),
        Message(UserId: "123", text: "謝謝你願意和我討論，我這邊有幾個想發供你參考看看：\n1.水果沙拉：這是一個簡單的點心，小孩可以參與挑選、清洗和切割各種水果。你可以提供不同種類的水果給他們選擇，如蘋果、香蕉、草莓、藍莓等。這不僅可以培養他們的食材認識，還能享受健康的點心。\n2.米果：這是一種簡單又有趣的點心，小孩可以參與包裝的過程。你可以提前準備好米果的內餡，然後讓小孩協助包裝成小巧的米果，並且在表面撒上一些可可粉或花生碎增加趣味。\n3.鬆餅：鬆餅是一個適合小孩參與的烘焙活動，可以讓他們參與攪拌麵糊和擺放鬆餅在烤盤上的過程。你可以提供各種類型的鬆餅配料，如水果、巧克力碎片或堅果，讓他們根據自己的口味加入。\n4.果凍杯：這是一個適合小孩參與並且可以客製化的點心。你可以提供各種果汁或果泥，然後讓小孩將其倒入杯子中，再加入一些水果丁或果凍粉，待其凝固後即可享用。", photoURL: "", creatAt: Data(),isCrossField: false, isFromCurrentUser: true),
        Message(UserId: "123", text: "另外我也有其他相關的疑惑想和你討論", photoURL: "", creatAt: Data(),isCrossField: false, isFromCurrentUser: true),
        Message(UserId: "123", text: "想請問有關大部分幼稚園小朋友，在這種手作活動中相處上該如何與他們更親密，然後應該要注意什麼？", photoURL: "", creatAt: Data(),isCrossField: false, isFromCurrentUser: true),
        Message(UserId: "123", text: "謝謝你～", photoURL: "", creatAt: Data(),isCrossField: false, isFromCurrentUser: false),
        Message(UserId: "123", text: "這邊是應該注意的事：\n1.安全優先：在廚房中，安全永遠是首要考慮因素。確保小孩參與時，他們能夠安全地使用廚具和器具，並遠離熱源和尖銳的物品。\n2.注重營養均衡：選擇食材和食譜時，請確保能夠提供均衡的營養，包括蛋白質、碳水化合物、蔬菜和水果等。\n3.提供積極的回饋和鼓勵：無論小孩的表現如何，都要給予積極的回饋和鼓勵，讓他們感受到參與廚房活動的樂趣和成就感。\n4.創造美好的回憶：廚房活動不僅是學習和培養技能的過程，也是家庭共享美好時光的機會。確保在參與食譜時創造出愉快的氛圍和美好的回憶。\n5.選擇簡單的食譜：確保食譜足夠簡單，易於理解和執行，避免使用太多複雜的步驟或難度過高的食材。", photoURL: "", creatAt: Data(),isCrossField: false, isFromCurrentUser: false),
        Message(UserId: "123", text: "我覺得你提供的點子都很適合耶！不虧是專業的師傅！", photoURL: "", creatAt: Data(),isCrossField: false, isFromCurrentUser: false),
        Message(UserId: "123", text: "我後來決定做鬆餅，感覺比較簡單而且小朋友會比較喜歡甜甜的食物，但我擔心影營養會不太夠", photoURL: "", creatAt: Data(),isCrossField: false, isFromCurrentUser: false)
        
    ]
//    @Published var messagesData = [
//        Message(UserId: "123", text: "您好～", photoURL: "", creatAt: Data(),isCrossField: false, isFromCurrentUser: false),
//    ]
}

