//
//  Room.swift
//  Chatting
//
//  Created by changgyo seo on 2022/09/27.
//

struct ChatRoom {
    
    var roomId: String
    var roomTitle: String
    var roomPersons: [String]
    var chats: [String]
    
    enum CodingKeys: String, CodingKey {
        case roomId = "Rood_ID"
        case roomTitle = "Room_Title"
        case roomPersons = "Room_Persons"
        case chats = "Chats"
    }
}
