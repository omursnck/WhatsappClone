//
//  RegistrationView.swift
//  WhatsappClone
//
//  Created by Ömür Şenocak on 27.01.2023.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var fullname = ""
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView{
            
        VStack{
            NavigationLink(
                destination: ProfilePhotoSelectorView(),
                isActive: $viewModel.didAuthenticateUser,
                label: { })
           
            VStack(alignment: .leading, spacing: 12){
                
                HStack{ Spacer() }
                
                Text("Get started")
                    .font(.largeTitle)
                    .bold()
                Text("Create your account")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                
                VStack(spacing: 25){
                    
                    CustomTextField(imageName: "envelope", placeholderText: "Email", isSecureField: false, text: $email)
                    
                    CustomTextField(imageName: "person", placeholderText: "Username", isSecureField: false, text: $username)
                
                    CustomTextField(imageName: "person.fill", placeholderText: "Fullname", isSecureField: false, text: $fullname)
                    
                    CustomTextField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
                    
                }.padding([.top, .horizontal], 32)
         
                
                
            }
            .padding(.leading)
            
            Button{
                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
            }label:{
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width:340 ,height: 50)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .shadow(color: .gray, radius: 10)
                    .padding()
            }.padding(.top,24)
            
            Spacer()
            
            
            Button(action: {mode.wrappedValue.dismiss() }, label: {
                HStack{
                    
                    Text("Do you have an account?")
                        .font(.system(size: 14))
                    Text("Sign In!")
                        .font(.system(size: 14, weight: .semibold))
                    
                    
                }
                
            }).padding(.bottom,32)
        }
            
        }.navigationBarBackButtonHidden(true)
        
    }
    
}
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
