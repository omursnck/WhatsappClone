//
//  CustomTextField.swift
//  WhatsappClone
//
//  Created by Ömür Şenocak on 27.01.2023.
//

import SwiftUI

struct CustomTextField: View {
    let imageName: String
    let placeholderText: String
    let isSecureField: Bool
    @Binding var text: String
    var body: some View {
        VStack(spacing: 16){
            HStack{
                
                
                Image(systemName: imageName)
                    .foregroundColor(.gray)
                
                if isSecureField{
                    SecureField(placeholderText, text: $text)
                }else{
                    
                TextField(placeholderText, text: $text)
                    
                }
            }
            Rectangle()
                .frame(width: 320, height: 1)
                .foregroundColor(.gray)
        }
    }
}
