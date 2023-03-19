//
//  CustomV.swift
//  macSchem
//
//  Created by Ankush on 10/02/23.
//

import SwiftUI

struct CustomV: View {
    
    @State var title: String
    @Binding var isClicked: Bool
    @Binding var dynamicTitle: String
    
    var body: some View {
        Text(dynamicTitle.isEmpty ? title : "\(dynamicTitle)")
            .padding(.all)
            .background(CustomColor.purple)
            .foregroundColor(CustomColor.white)
            .font(.title3)
            .onTapGesture {
                isClicked.toggle()
            }
    }
}

struct CustomV_Previews: PreviewProvider {
    static var previews: some View {
        CustomV(title: "Ankush", isClicked: .constant(true), dynamicTitle: .constant(""))
    }
}
