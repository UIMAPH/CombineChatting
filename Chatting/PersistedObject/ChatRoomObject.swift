//
//  ChatObject.swift
//  Chatting
//
//  Created by changgyo seo on 2022/09/28.
//

import RealmSwift

final class ChatRoomObject: Object, Persistable {

    @Persisted(primaryKey: true) var pk: String
    @Persisted var roomId: String
    @Persisted var roomTitle: String
    @Persisted var roomPersons: RealmSwift.List<String>
    @Persisted var chats: RealmSwift.List<String>
    
    var entity: ChatRoom {
        ChatRoom(roomId: roomId,
                 roomTitle: roomTitle,
                 roomPersons: realmListToList(roomPersons),
                 chats: realmListToList(chats))
    }
    
    override init() {
        super.init()
    }
    
    init(_ pk: String, entity: ChatRoom) {
        super.init()
        
        self.pk = pk
        roomId = entity.roomId
        roomTitle = entity.roomTitle
        roomPersons = listToRealmList(entity.roomPersons)
        chats = listToRealmList(entity.chats)
    }
}
