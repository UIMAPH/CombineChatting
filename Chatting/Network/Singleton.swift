//
//  Realm.swift
//  Chatting
//
//  Created by changgyo seo on 2022/09/28.
//

import Foundation
import RealmSwift
import FirebaseFirestore

struct LocalDataBase {
    static var temp = Realm.Configuration.defaultConfiguration.fileURL!
    static var realm = try! Realm()
}

struct FirebaseStore {
    static let db = Firestore.firestore()
}


struct user {
    static var userID = 1
}
