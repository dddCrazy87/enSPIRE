//
//  UserInfo.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/29.
//

import Foundation

struct userInfo:Identifiable {
    let id = UUID()
    let UserId: String
    let userName: String
    let photo:  String
    let job: [String] = []
    let habit: [String] = []
}
