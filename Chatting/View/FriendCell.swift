//
//  FriendCell.swift
//  Chatting
//
//  Created by changgyo seo on 2022/09/27.
//

import SwiftUI

struct FriendCell: View {
    
    var profileImage: String
    var name: String
    
    var body: some View {
        
        HStack {
            Image(profileImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            Text(name)
                .font(.system(size: 36))
            Spacer()
        }
    }
}
