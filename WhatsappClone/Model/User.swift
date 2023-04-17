//
//  User.swift
//  WhatsappClone
//
//  Created by Ömür Şenocak on 22.02.2023.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable{
    
    @DocumentID var id : String?
    let username : String
    let fullname  : String
    let email : String
    let profileImageUrl : String
    
}

let MOCK_USER = User(id: "123234",
                     username:"Test",
                     fullname: "Test",
                     email: "Test",
                     profileImageUrl: "www.google.com")
