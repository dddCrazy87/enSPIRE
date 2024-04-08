//
//  UserInfo.swift
//  enSPIRE
//
//  Created by 劉丞恩 on 2024/3/29.
//

import Foundation

struct UserInfo:Identifiable {
    let id = UUID()
    let UserId: String
    let userName: String
    let photo:  String
    var isCrossField: Bool = false
    var job: [String] = []
    var habit: [String] = []
}

class MindmapProjs: ObservableObject {
    @Published var nodes: [Node]
    
    init(nodes: [Node]) {
        self.nodes = nodes
    }
}

class PiecesProjs: ObservableObject {
    @Published var pieces: [Pieces]
    
    init(pieces: [Pieces]) {
        self.pieces = pieces
    }
}
