//
//  FriendListViewModel.swift
//  Chatting
//
//  Created by changgyo seo on 2022/09/28.
//

import Combine

final class FriendListViewModel: ObservableObject {
    
    //input
    @Published var isRefresh: Bool = true
    
    //output
    @Published var friendList = [Person]()
    @Published var chatRoomList = [ChatRoom]()
    
    var dependency: Person
    var cancellalbeBag = Set<AnyCancellable>()
    let friendFetcher = Fetcher<PersonObject, String>()
    let friendLocal = Local(publisher: CurrentValueSubject<PersonObject, Never>(PersonObject()), dummy: PersonObject())
    
    func bind(completion: @escaping (Status) -> Void) {
        $isRefresh
            .sink {[weak self] _ in
                guard let self = self else { return }
            
                self.friendFetcher.fetch(id: self.dependency.id) { status, data in
                    if(status == .success) {
                        completion(status)
                        var personArray = [Person]()
                        data.entity.friendList.forEach { personArray.append(NetworkModule.shared.getPerson($0)) }
                        self.friendList = personArray
                        
                        Task {
                            self.chatRoomList = await NetworkModule.shared.getChatRoom(id: data.entity.chatRoomList)
                        }
                    }
                    else {
                        completion(status)
                    }
                }
            }
    }
    
    
    init(dependency: Person = Person(id: "", name: "", profileImage: "", friendList: [""], chatRoomList: [""])){
        
        self.dependency = dependency
        
        friendFetcher.callLocal = friendLocal.callLocal
        friendFetcher.callLocalStream = friendLocal.callLocalStream
        friendFetcher.writeLocal = friendLocal.writeLocal
        friendFetcher.callRemote = Remote.shared.callPersonRemote
    }
}
