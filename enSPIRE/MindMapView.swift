//
//  MindMap.swift
//  enSPIRE
//
//  Created by 許昀韋 on 2024/3/22.
//

import SwiftUI

struct MindMapView: View {
    var body: some View {
        // main view
        VStack {
            Text("hello world!")
        }
        .navigationTitle("title")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        MindMapView()
    }
}
