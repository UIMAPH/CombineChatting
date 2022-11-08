//
//  Fetcher.swift
//  Chatting
//
//  Created by changgyo seo on 2022/09/27.
//

import Combine
import UIKit

class Fetcher<T, Id: Equatable> {
    
    private var allCancellable = Set<AnyCancellable>()
    
    var callLocal: ((Id) -> T?)?
    var writeLocal: ((T) -> Void)?
    var callLocalStream: (() -> AnyPublisher<T,Never>)?
    var callRemote: ((Id) -> AnyPublisher<T, Never>)?
    
    @discardableResult
    func fetch(id: Id,_ action: @escaping (Status, T) -> Void) -> Set<AnyCancellable> {
        guard let callLocal = callLocal,
              let writeLocal = writeLocal,
              let callLocalStream = callLocalStream,
              let callRemote = callRemote else { return allCancellable }
        
        
        if let localData = callLocal(id) { action(.loading, localData) }

        callRemote(id).sink { data in
            writeLocal(data)
            callLocalStream().sink { action(.success, $0) }
                .store(in: &self.allCancellable)
            
        }.store(in: &self.allCancellable)
        
        return allCancellable
    }
}


enum Status: String {
    
    case loading = "Loading....."
    case error = "occur Error"
    case success = "Success!!!!"
}
