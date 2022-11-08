//
//  ViewModelProtocol.swift
//  Chatting
//
//  Created by changgyo seo on 2022/09/28.
//

import Foundation
import Combine

protocol ViewModelType {
    
    associatedtype Dependency
    associatedtype Input
    associatedtype Output

    var dependency: Dependency { get }
    var disposeBag: Set<AnyCancellable> { get set }
    
    var input: Input { get }
    var output: Output { get }
    
    init(dependency: Dependency)
}
