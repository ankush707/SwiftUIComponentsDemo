//
//  CustomTxtFld.swift
//  demo
//
//  Created by Ankush on 06/02/23.
//

import SwiftUI

struct CustomTxtFld: View {
    
    @State var title: String
    @State var placeHolder: String
    @Binding var txtVal: String
    @State var radius: Double
    @State var textColor: Color
    @State var bgColor: Color
    @State var image: String
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(title)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 30.0)
                    .frame(height: 12)
                    
                HStack {
                    Image(image).resizable().frame(width: 24, height: 24)
                    
                    TextField(placeHolder, text: $txtVal)
                }.frame(height: 30)
                
            }.frame(width: 280, height: 34)
                .padding(20)
                .foregroundColor(textColor)
                .background(bgColor)
            .cornerRadius(radius)
            
        }
    }
}

struct CustomTxtFld_Previews: PreviewProvider {
    static var previews: some View {
        CustomTxtFld(title: "Username", placeHolder: "My name is ankush", txtVal: .constant("Ankush"), radius: 10.0, textColor: .white, bgColor: .green, image: "user")
    }
}
