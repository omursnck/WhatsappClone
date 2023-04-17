//
//  Constants.swift
//  WhatsappClone
//
//  Created by Ömür Şenocak on 23.02.2023.
//

import Foundation
import Firebase
import FirebaseFirestore

let COLLECTION_USERS =  Firestore.firestore().collection("users")
let COLLECTION_MESSAGES =  Firestore.firestore().collection("messages ")
let COLLECTION_RECENT_MESSAGES =  Firestore.firestore().collection("messages ")
