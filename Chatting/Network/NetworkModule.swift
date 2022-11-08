//
//  NetworkModule.swift
//  Chatting
//
//  Created by changgyo seo on 2022/09/29.
//

import Combine
import FirebaseFirestore

struct NetworkModule {
    
    static var shared = NetworkModule()
    
    func getPersonObject(id: String) -> PersonObject {
        LocalDataBase.realm.objects(PersonObject.self).filter("id == '\(id)'").first!
    }
    
    func getPerson(_ id: String) -> Person {
        LocalDataBase.realm.objects(PersonObject.self).filter("id == '\(id)'").first?.entity ?? Person(id: "", name: "", profileImage: "", friendList: [""], chatRoomList: [""])
    }
    
    func getPerson(id: String, completion: @escaping (Person) -> Void ) {
        FirebaseStore.db.collection("user").whereField("id", isEqualTo: id).getDocuments { data, error in
            guard error == nil else { return }
            let person = Person(id: data?.documents.first?.data()["id"] as! String,
                                name: data?.documents.first?.data()["name"] as! String,
                                profileImage: data?.documents.first?.data()["profileImage"] as! String,
                                friendList: data?.documents.first?.data()["friendList"] as! [String],
                                chatRoomList: data?.documents.first?.data()["chatRoomList"] as! [String])
            completion(person)
        }
    }
    
    func getChatRoom(id: [String]) async -> [ChatRoom] {
        var chatRoom = [ChatRoom]()
       
        for item in id {

            if let data = LocalDataBase.realm.objects(ChatRoomObject.self).filter("roomId == '\(item)'").first {
                chatRoom.append(data.entity)
                print(chatRoom)
            }
            else {
                let querySnapShot = try? await FirebaseStore.db.collection("chatRoom").whereField("roomId", isEqualTo: item).getDocuments()
                chatRoom.append(ChatRoom(roomId: querySnapShot?.documents.first?.data()["roomId"] as! String,
                                         roomTitle: querySnapShot?.documents.first?.data()["roomTitle"] as! String,
                                         roomPersons: querySnapShot?.documents.first?.data()["roomPersons"] as! [String],
                                         chats: querySnapShot?.documents.first?.data()["chats"] as! [String]))
                print(chatRoom)
            }
        }
        return chatRoom
    }
}
