//
//  Local.swift
//  Chatting
//
//  Created by changgyo seo on 2022/09/28.
//

import Combine
import Realm
import RealmSwift

class Local<T: Persistable> {
    
    var cancellableBag = Set<AnyCancellable>()
    
    init(publisher: CurrentValueSubject<T, Never>, dummy: T){
        self.objectPublisher = publisher
        self.dummy = dummy
    }
    
    var objectPublisher: CurrentValueSubject<T, Never>
    var dummy: T
    
    func callLocal(_ pk: String) -> T? {
        LocalDataBase.realm.objects(T.self).filter("id == '\(pk)'").first
    }
    
    func callLocals() -> [T] {
        var arrayT = [T]()
        LocalDataBase.realm.objects(T.self).forEach { arrayT.append($0) }
        
        return arrayT
    }
    
    func callLocalStream() -> AnyPublisher<T, Never> {
        return objectPublisher.eraseToAnyPublisher()
    }
    
    func writeLocal(_ data: T) -> Void {
        if LocalDataBase.realm.objects(T.self).filter("pk == '\(data.pk)'").first == nil {
            print("이것봐")
            try! LocalDataBase.realm.write {
                LocalDataBase.realm.add(data)
            }
        }
        else {
           
            try! LocalDataBase.realm.write {
                LocalDataBase.realm.add(data, update: .modified)
            }
        }
        objectPublisher.send(data)
    }
}
