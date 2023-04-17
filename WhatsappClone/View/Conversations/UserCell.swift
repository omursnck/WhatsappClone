//
//  UserCell.swift
//  WhatsappClone
//
//  Created by Ömür Şenocak on 8.02.2023.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    var body: some View {
        VStack {
            HStack{
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                VStack(alignment:.leading){
                    Text(user.username)
                        .foregroundColor(.black)

                        .font(.system(size: 20, weight: .semibold))
                    
                    Text(user.fullname)
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                    
                }
                Spacer()
                
            }
            .padding(.horizontal)
          
        }
        .padding(.top)
    }
}


