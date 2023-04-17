//
//  StatusSelectorView.swift
//  WhatsappClone
//
//  Created by Ömür Şenocak on 30.01.2023.
//

import SwiftUI

struct StatusSelectorView: View {
    @ObservedObject var viewModel = StatusViewModel()
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView{
                VStack(alignment: .leading){
                    Text("CURRENTLY SET TO")
                        .foregroundColor(.gray)
                        .padding()

                    
                    StatusCell(status: viewModel.status)
                    
                    //Status cell
                    
                    Text("SELECT YOUR STATUS")
                        .foregroundColor(.gray)
                        .padding()
                    
                    ForEach(UserStatus.allCases.filter({ $0 != .notConfigured}), id: \.self){status in
                        
                        Button{
                            viewModel.updateStatus(status)
                        }label:{
                            StatusCell(status: status)
                                .foregroundColor(.black)
                        }
                         
                    }
                }.padding()
            }
        }
    }
}

struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
    }
}

struct StatusCell: View {
    let status: UserStatus
    var body: some View {
        HStack{
            Text(status.title)
            
            Spacer()
        }
        .frame(height: 56)
        .padding(.horizontal)
            .background(Color.white)
    }
}
