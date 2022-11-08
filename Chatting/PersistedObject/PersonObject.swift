//
//  PersonObject.swift
//  Chatting
//
//  Created by changgyo seo on 2022/09/28.
//

import RealmSwift

final class PersonObject: Object, Persistable {
    
    @Persisted(primaryKey: true) var pk: String
    @Persisted var id: String
    @Persisted var name: String
    @Persisted var profileImage: String
    @Persisted var friendList: RealmSwift.List<String>
    @Persisted var chatRoomList: RealmSwift.List<String>
    
    var entity: Person {
        Person(id: id,
               name: name,
               profileImage: profileImage,
               friendList: realmListToList(friendList),
               chatRoomList: realmListToList(chatRoomList))
    }
    
    override init() {
        super.init()
    }
    
    required init(_ pk: String, entity: Person) {
        super.init()
        
        self.pk = pk
        id = entity.id
        name = entity.name
        profileImage = entity.profileImage
        friendList = listToRealmList(entity.friendList)
        chatRoomList = listToRealmList(entity.chatRoomList)
    }
}
