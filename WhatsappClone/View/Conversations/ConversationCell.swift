//
//  UserCell.swift
//  WhatsappClone
//
//  Created by Ömür Şenocak on 8.02.2023.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    @ObservedObject var viewModel: ConversationCellViewModel
 //   let viewModel: MessageViewModel
    var body: some View {
        if let user = viewModel.message.user{
            NavigationLink(destination: ChatView(user: user)){
                VStack {
                    HStack{
                        KFImage(viewModel.chatPartnerProfileImageUrl)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                        
                        VStack(alignment:.leading){
                  
                                Text(viewModel.fullname)
                                    .font(.system(size: 20, weight: .semibold))
                            
                            
                            Text(viewModel.message.text)
                                .font(.system(size: 16))
                            
                        }
                        .foregroundColor(.black)
                        Spacer()
                        
                    }
                    .padding(.horizontal)
                    Divider()
                }
                .padding(.top)
            }
        }
   
    }
}


