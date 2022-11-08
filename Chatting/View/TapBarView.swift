//
//  TapBarView.swift
//  Chatting
//
//  Created by changgyo seo on 2022/10/03.
//

import SwiftUI

struct TapBarView: View {
    
    var viewModel: FriendListViewModel
    
    var body: some View {
        TabView {
            FriendList(id: viewModel.dependency.id, viewModel: viewModel)
                .tabItem {
                  Label("FriendList", systemImage: "person")
                }
            ChatRoomList(id: viewModel.dependency.id, viewModel: viewModel)
                .tabItem {
                  Label("ChatRoomList", systemImage: "chart.bar.doc.horizontal")
                }
        }
    }
}

