//
//  DetailVw.swift
//  demo
//
//  Created by Ankush on 07/02/23.
//

import SwiftUI

struct DetailVw: View {
    
    @Binding var imageName: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 100, height: 100)
            Text(imageName)
                .font(.largeTitle)
        }
        .frame(width: 300, height: 300)
        .background(.red)
    }
}

struct DetailVw_Previews: PreviewProvider {
    static var previews: some View {
        DetailVw(imageName: .constant("hare.fill"))
    }
}
