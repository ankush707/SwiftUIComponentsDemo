//
//  CustomPickerView.swift
//  demo
//
//  Created by Ankush on 08/02/23.
//

import SwiftUI

struct CustomPickerView: View {
    
    @Binding var selectedColor: String
    
    @State var colors: Array<String>
    
    var body: some View {
        VStack {
            Picker("Please choose a color", selection: $selectedColor) {
                            ForEach(colors, id: \.self) {
                                Text($0)
                            }
                        }
            .frame(width: 132.0, height: 32.0)
        }
    }
}

struct CustomPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomPickerView(selectedColor: .constant("Red"), colors: ["Red", "Green", "Blue", "Tartan"])
    }
}
