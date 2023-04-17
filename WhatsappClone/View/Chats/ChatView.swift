//
//  ChatsView.swift
//  WhatsappClone
//
//  Created by Ömür Şenocak on 28.01.2023.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    @ObservedObject var viewModel: ChatViewModel
    private let user : User
    
    init(user: User){
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    var body: some View {
        
        VStack{
            //Messages
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading, spacing: 12){
                ForEach(viewModel.messages) {message  in
                    
                    MessageView(viewModel: MessageViewModel(message))
                    
                }
            }
        }
         //Input View
            CustomInputView(text: $messageText, action: sendMessage)
        }
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.vertical)
    }
    func sendMessage(){
        viewModel.sendMessage(messageText)
        
        messageText=""
    }
}



