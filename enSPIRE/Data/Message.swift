//
//  Message.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/23.
//

import Foundation

struct Message:Identifiable {
    let id = UUID()
    let UserId: String
    let text: String
    let photoURL:  String
    let creatAt: Data
    let isCrossField: Bool
    let isFromCurrentUser:Bool
}
