//
//  EditProfileView.swift
//  WhatsappClone
//
//  Created by Ömür Şenocak on 28.01.2023.
//

import SwiftUI
import Kingfisher
struct EditProfileView: View {
    private let user: User
    init(user: User){
        self.user = user
    }
    @State private var username = "Steve Jobs"
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    var body: some View {

        ZStack{
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 30){
                //Header
                
                // Photo edit button
                VStack{
                    
                    HStack{
                        
                        VStack{
                            if let profileImage = profileImage{
                                profileImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64, height: 64)
                                
                                    .clipShape(Circle())
                            }else{
                                KFImage(URL(string: user.profileImageUrl))                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 64, height: 64)
                                
                                    .clipShape(Circle())
                            }
                            
                            Button(action: {
                                showImagePicker.toggle()
                            }, label:{
                                Text("Edit")
                            })
                            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                                ImagePicker(image: $selectedImage)
                            }
                        }
                        .padding()
                        
                        Text("Enter your name here or change your profile picture.")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .padding([.bottom,.horizontal])
                        
                        
                    }
                    Divider()
                        .padding(.horizontal)
                    
                    TextField("", text: $username)
                        .padding(8)
                        .background(Color.white)
                }
         
                .background(Color.white)
                
                //Status
                VStack(alignment:.leading){
                    Text("Status")
                        .padding()
                        .foregroundColor(.gray)
                
                    NavigationLink(destination: StatusSelectorView(), label: {    HStack{
                        Text("At the movies")
                         Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    } .padding()
                        .background(Color.white)})
                   
                    
                }
                Spacer()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Edit Profile")
    }
    
    func loadImage(){
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

