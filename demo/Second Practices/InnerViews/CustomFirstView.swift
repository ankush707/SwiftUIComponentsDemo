//
//  CustomTextView.swift
//  demo
//
//  Created by Ankush on 08/02/23.
//

import SwiftUI

struct CustomTextView: View {
    
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

struct CustomTextView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextView(title: "Ankush", isClicked: .constant(true), dynamicTitle: .constant(""))
    }
}
