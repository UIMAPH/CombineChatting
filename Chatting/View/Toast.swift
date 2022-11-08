//
//  Toast.swift
//  Chatting
//
//  Created by changgyo seo on 2022/10/02.
//

import SwiftUI

struct Toast: View {
    
    @Binding var isOn: Bool
    
    var body: some View {
        if isOn {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.accentColor)
                    .frame(width: 300, height: 80)
                Text("로딩중입니다~~~")
                    .foregroundColor(.white)
            }
        }
    }
}
