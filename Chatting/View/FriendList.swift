//
//  FriendList.swift
//  Chatting
//
//  Created by changgyo seo on 2022/09/27.
//

import SwiftUI
import Combine

struct FriendList: View {
    
    var id: String
    @ObservedObject var viewModel: FriendListViewModel
    var cancellableBag = Set<AnyCancellable>()
    @State var isLoading = true
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [GridItem()]) {
                        ForEach(viewModel.friendList, id: \.id) { data in
                            FriendCell(profileImage: data.profileImage, name: data.name)
                        }
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14))
            }
            .onAppear{
                viewModel.bind { status in
                    if status == .loading { isLoading = true}
                    else if status == .success { isLoading = false }
                }
            }
            
            Toast(isOn: $isLoading)
        }
    }
}
