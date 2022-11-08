//
//  Remote.swift
//  Chatting
//
//  Created by changgyo seo on 2022/09/30.
//

import FirebaseFirestore
import FirebaseFirestoreCombineSwift
import Combine

struct Remote {
    
    static var shared = Remote()
    
    func callPersonRemote(_ id: String) -> AnyPublisher<PersonObject, Never> {
        
        Future<PersonObject, Never> { promise in
            FirebaseStore.db.collection("user").whereField("id", isEqualTo: id).getDocuments { data, error in
              
                guard error == nil else { return }
                let person = Person(id: data?.documents.first?.data()["id"] as! String,
                                    name: data?.documents.first?.data()["name"] as! String,
                                    profileImage: data?.documents.first?.data()["profileImage"] as! String,
                                    friendList: data?.documents.first?.data()["friendList"] as! [String],
                                    chatRoomList: data?.documents.first?.data()["chatRoomList"] as! [String])
                let personObject = PersonObject(person.id, entity: person)
                promise(.success(personObject))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func callRoomChatRemote(_ id: String) -> AnyPublisher<ChatRoomObject, Never> {
        
        Future<ChatRoomObject, Never> { promise in
            
            FirebaseStore.db.collection("chatRoom").getDocuments() { data, error in
                guard error == nil,
                let data = data else { return }
                
                for room in data.documents {
                    if let roomPersons = room.data()["roomPersons"] as? [String],
                       roomPersons.contains(id) {
                        let chatRoom = ChatRoom(roomId: room.data()["roomId"] as! String,
                                                 roomTitle: room.data()["roomTitle"] as! String,
                                                 roomPersons: room.data()["roomPersons"] as! [String],
                                                 chats: room.data()["chats"] as! [String])
                        let chatRoomObject = ChatRoomObject(chatRoom.roomId, entity: chatRoom)
                        promise(.success(chatRoomObject))
                    }
                }
               
            }
        }
        .eraseToAnyPublisher()
    }
    
    
    
}
