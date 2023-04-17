//
//  WhatsappCloneApp.swift
//  WhatsappClone
//
//  Created by Ömür Şenocak on 27.01.2023.
//

import SwiftUI
import Firebase

@main
struct WhatsappCloneApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
