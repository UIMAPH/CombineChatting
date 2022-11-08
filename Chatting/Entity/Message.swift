//
//  Message.swift
//  Chatting
//
//  Created by changgyo seo on 2022/09/27.
//

import RealmSwift

struct Message {
    
    var id: String
    var roomId: String
    var content: String
    var sender: String
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case roomId = "Room_ID"
        case content
        case sender
    }
}

