//
//  AuthViewModel.swift
//  WhatsappClone
//
//  Created by Ömür Şenocak on 16.02.2023.
//

import Firebase
import FirebaseFirestore
import UIKit

class AuthViewModel: NSObject, ObservableObject{
    @Published var didAuthenticateUser = false
    @Published var userSession: Firebase.User?
    @Published var currentUser: User?
    private var tempCurrentUser: Firebase.User?
    
    static let shared = AuthViewModel()
    
    override init(){
      
        super.init()
        userSession = Auth.auth().currentUser
        fetchUser()
        
      //  print("User session is: \(userSession)")
    }
    func login(withEmail email: String, password: String){
        
        Auth.auth().signIn(withEmail: email, password: password) {result ,error in
            
            if let error = error {
                print("Failed to login \(error.localizedDescription)")
                return
            }
           // guard let user = result?.user else { return }
            self.userSession = result?.user
            self.fetchUser()
        }
    //    print("login user from viewmodel..")

    }
    func register(withEmail email: String, password: String, fullname: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("Failed to register \(error.localizedDescription)")
                return
            }
           // print("Succesfully registered")
            
            guard let user = result?.user else { return }
            self.tempCurrentUser = user

            let data: [String: Any] = ["email" : email,
                                       "password" : password,
                                       "username" : username,
                                       "fullname" : fullname]
            
           COLLECTION_USERS.document(user.uid).setData(data) { _ in
                //print("Succesfully updated user info in firestore")
                self.didAuthenticateUser = true
            }
            
        }
    }
    func signOut(){
        
        self.userSession = nil
        try? Auth.auth().signOut()
    //    print("Auth viewmodel sign out")
    }
    

    func uploadProfileImage(_ image: UIImage){
        guard let uid = tempCurrentUser?.uid else {
           // print("Failed to set temp current user...")
            return
            
        }
        
        ImageUploader.uploadImage(image: image){ imageUrl in
           COLLECTION_USERS.document(uid).updateData(["profileImageUrl" : imageUrl]){_ in
                self.userSession = self.tempCurrentUser

             //   print("Succesfully updated user data...")
            }
            
        }
    }
    
    func fetchUser(){
        guard let uid = userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid).getDocument{ snapshot, _ in
            
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
          //  print("User object is \(user)")
            
        }
    }
}
