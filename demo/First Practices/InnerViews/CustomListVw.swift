//
//  CustomListVw.swift
//  demo
//
//  Created by Ankush on 06/02/23.
//

import SwiftUI

typealias CompletionHandler = (IndexSet) -> ()

struct CustomListVw: View {
    @Binding var deletedIndex:  Int
    
    @Binding var title: String
    @Binding var color: Color
    @Binding var deleteToggle: Bool
    
    @State var indexSet: IndexSet
    
    //var completionHandler: CompletionHandler
    
    var body: some View {
        
        ZStack {
            color
                .shadow(color: .black, radius: 4)
                .frame(maxHeight: 64.0)
            HStack {
                
                Image("login").resizable().frame(width: 26.0, height: 26).padding(.all)
                
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .frame(maxHeight: 34.0)
                    .foregroundColor(.white)
                Spacer()
                
                Button {
                    if self.deleteToggle {
                        //self.completionHandler(indexSet)
                    }
                    
                } label: {
                    if !self.deleteToggle {
                        Image("trash").resizable().frame(width: 36.0, height: 36).padding(.all).hidden()
                    } else {
                        Image("trash").resizable().frame(width: 36.0, height: 36).padding(.all)
                    }
                }
                
            }
            .background(color)
            .frame(maxWidth: .infinity)
            .ignoresSafeArea()
        }
        
    }
}

struct CustomListVw_Previews: PreviewProvider {
    static var previews: some View {
        CustomListVw(deletedIndex: .constant(1), title: .constant("Ankush Sharma"), color: .constant(.green), deleteToggle: .constant(false), indexSet: IndexSet(integer: 1))
    }
}
