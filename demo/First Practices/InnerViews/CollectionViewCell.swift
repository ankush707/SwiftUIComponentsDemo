//
//  CollectionViewCell.swift
//  demo
//
//  Created by Ankush on 07/02/23.
//

import SwiftUI

struct CollectionViewCell: View {
    
    @Binding var image: String
    @Binding var name: String
    
    @State var bgColor: Color
    @State var imgBgColor: Color
    @State var textColor: Color
    
    
    
    var body: some View {
        VStack {
            
            Image(systemName: image)
                .resizable()
                .padding(.all)
                .frame(width: 60, height: 60)
                .background(imgBgColor)
                .cornerRadius(60.0)
                .foregroundColor(.white)
            
            Text(name)
                .font(.subheadline)
                .foregroundColor(textColor)
        }
            .frame(width: 100, height: 100)
            .background(bgColor)
            .cornerRadius(10.0)
            .padding(.all)
        
    }
}

struct CollectionViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CollectionViewCell(image: .constant("hare.fill"), name: .constant("hare.fill"), bgColor: .gray, imgBgColor: .cyan, textColor: .white)
    }
}
