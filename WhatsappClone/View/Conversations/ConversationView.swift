//
//  ConversationView.swift
//  WhatsappClone
//
//  Created by Ömür Şenocak on 28.01.2023.
//

import SwiftUI

struct ConversationView: View {
    private let user: User
    init(user: User){
        self.user = user
    }
    @State private var showNewMessageView = false
    @State private var showChatView = false
    @State var selectedUser: User?
    @ObservedObject var viewModel = ConversationsViewModel()
    var body: some View {
        
        
            
        ZStack(alignment: .bottomTrailing){
            
            if let user = selectedUser{
                
                    NavigationLink(
                        destination: ChatView(user: user),
                        isActive: $showChatView,
                        label: { })
            }
               
            
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading){
          
                    ForEach(viewModel.recentMessages) { message in
                        ConversationCell(viewModel: ConversationCellViewModel(message))
                    }
                  //  .padding(.leading,15)
                   // .padding(.vertical,7)
                }
            }   // .offset(y: 70)
            
            //Floating button
            
            Button(action:{
                showNewMessageView.toggle()
            }, label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding()
                    .sheet(isPresented: $showNewMessageView, content: {
                        NewMessageView(showChatView: $showChatView, user: $selectedUser)
                    })
                
            })
          
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding(.bottom,25)
            .padding(.trailing,5)
        }.onAppear{
            viewModel.fetchRecentMessages()
        }
    
     //   .ignoresSafeArea()
     
           

    }
}


