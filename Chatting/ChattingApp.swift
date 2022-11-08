//
//  ChattingApp.swift
//  Chatting
//
//  Created by changgyo seo on 2022/09/27.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

@main
struct ChattingApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
