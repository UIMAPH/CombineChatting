//
//  PerSon.swift
//  Chatting
//
//  Created by changgyo seo on 2022/09/27.
//
import RealmSwift

struct Person: Equatable {
    
    var id: String
    var name: String
    var profileImage: String
    var friendList: [String]
    var chatRoomList: [String]
    
    enum CodingKeys : String, CodingKey {
        case id = "ID"
        case name = "Name"
        case profileImage = "Profile_Image"
        case friendList = "Friend_List"
        case chatRoomList = "ChatRoom_List"
    }
}
