//
//  Extensions.swift
//  WhatsappClone
//
//  Created by Ömür Şenocak on 8.02.2023.
//

import UIKit


extension UIApplication{
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
