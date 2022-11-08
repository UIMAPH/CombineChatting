//
//  ContentView.swift
//  Chatting
//
//  Created by changgyo seo on 2022/09/27.
//

import SwiftUI
import RealmSwift

struct LoginView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Choose One!!!")
                    .font(.system(size: 50))
                    .onAppear{
                        print(Realm.Configuration.defaultConfiguration.fileURL!)
                    }
                
                HStack {
                    profile(person: Person(id: "1", name: "ChangGyo", profileImage: "ChangGyo", friendList: [""], chatRoomList: [""]))
                    profile(person: Person(id: "2", name: "NaGt", profileImage: "NaGyeong", friendList: [""], chatRoomList: [""]))
                    profile(person: Person(id: "3", name: "Jenny", profileImage: "Jenny", friendList: [""], chatRoomList: [""]))
                }
            }
        }
    }
    
    private func profile(person: Person) -> some View {
        
        let viewModel = FriendListViewModel(dependency: person)
        
        return NavigationLink(destination: TapBarView(viewModel: viewModel)) {
            Image(viewModel.dependency.profileImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.black, lineWidth: 1)
                }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

