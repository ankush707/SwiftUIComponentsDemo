//
//  TableCell.swift
//  demo
//
//  Created by Ankush on 07/02/23.
//

import SwiftUI

struct TableCell: View {
    
    @Binding var image: String
    @Binding var name: String
    
    @State var bgColor: Color
    @State var imgBgColor: Color
    @State var textColor: Color
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable()
                .padding(.all)
                .frame(width: 60, height: 60)
                .background(imgBgColor)
                .cornerRadius(60.0)
                .foregroundColor(.white)
                .padding(.leading)
            
            Text(name)
                .font(.title3)
                .foregroundColor(textColor)
                .padding(.all)
            Spacer()
        }.frame(height: 80)
            .background(bgColor)
            .cornerRadius(10.0)
            .padding(.all)
    }
}

struct TableCell_Previews: PreviewProvider {
    static var previews: some View {
        TableCell(image: .constant("hare.fill"), name: .constant("hare.fill"), bgColor: .gray, imgBgColor: .cyan, textColor: .white)
    }
}
