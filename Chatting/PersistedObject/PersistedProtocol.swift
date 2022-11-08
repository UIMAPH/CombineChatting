//
//  PersistedProtocol.swift
//  Chatting
//
//  Created by changgyo seo on 2022/09/28.
//

import RealmSwift
import Realm

protocol Persistable: RealmSwiftObject {
    
    associatedtype EntityType
    init(_ pk: String, entity: EntityType)
    
    var pk: String { get set }
    var entity: EntityType { get }
}

extension Persistable {
    
    func listToRealmList<T>(_ list: [T]) -> RealmSwift.List<T> {
        let dummy = RealmSwift.List<T>()
        list.forEach{ dummy.append($0) }
        return dummy
    }
    
    func realmListToList<T>(_ list: RealmSwift.List<T>) -> [T] {
        var dummy = [T]()
        list.forEach{ dummy.append($0) }
        return dummy
    }
}
