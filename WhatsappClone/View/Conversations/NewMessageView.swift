//
//  NewMessageView.swift
//  WhatsappClone
//
//  Created by Ömür Şenocak on 8.02.2023.
//

import SwiftUI

struct NewMessageView: View {
    @Binding var showChatView: Bool
    @State private var searchText = ""
    @State private var isEditing = false
    @Environment(\.presentationMode) var mode
    @Binding var user: User?
    @ObservedObject var viewModel = NewMessageViewModel()
    var body: some View {
        ScrollView(showsIndicators: false){
            
            SearchBar(text: $searchText, isEditing: $isEditing)
                .onTapGesture {
                    isEditing.toggle()
                }
                .padding()
            VStack(alignment: .leading){
      
                ForEach(viewModel.users) { user in
                    Button(action: {
                        showChatView.toggle()
                        self.user = user
                        mode.wrappedValue.dismiss()
                    }, label: {
                        UserCell(user: user)
                    })
                        .padding(.horizontal)
                }
              //  .padding(.leading,15)
                .padding(.vertical,7)
            }
        }
     
    }
}
