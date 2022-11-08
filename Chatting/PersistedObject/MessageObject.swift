//
//  MessageObject.swift
//  Chatting
//
//  Created by changgyo seo on 2022/09/28.
//

import RealmSwift

final class MessageObject: Object, Persistable {
    
    @Persisted(primaryKey: true) var pk: String
    @Persisted var id: String
    @Persisted var roomId: String
    @Persisted var content: String
    @Persisted var sender: String
    
    var entity: Message {
        Message(id: id,
                roomId: roomId,
                content: content,
                sender: sender)
    }
    
    override init() {
        super.init()
    }
    
    init(_ pk: String, entity: Message) {
        super.init()
        
        self.pk = pk
        id = entity.id
        roomId = entity.roomId
        content = entity.content
        sender = entity.sender
    }
}


