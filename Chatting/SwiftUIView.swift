//
//  SwiftUIView.swift
//  Chatting
//
//  Created by changgyo seo on 2022/10/03.
//

import SwiftUI
import RealmSwift

struct SwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                print("realm 위치: \(Realm.Configuration.defaultConfiguration.fileURL!)")
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
