//
//  SecondVw.swift
//  demo
//
//  Created by Ankush on 07/02/23.
//

import SwiftUI

protocol New {
    func abc(_ str: String)
}

struct SecondVw: View {
    
    
    @State var isFormClicked: Bool = false
    @State var isSlidderClicked: Bool = false
    @State private var celsius = 34.00
    
    var body: some View {
        //MARK: - Slider
        VStack {
            
            Spacer()
            Text("Slider")
                .frame(maxWidth: .infinity)
                .background(CustomColor.white)
                .foregroundColor(CustomColor.cyan)
                .font(.title)
                .fontWeight(.bold)
                .padding(.all)
                .onTapGesture {
                    isSlidderClicked.toggle()
                }
            if self.isSlidderClicked {
                Slider(value: $celsius, in: -100...100)
                Text("\(celsius, specifier: "%.1f") Celsius is \(celsius * 9 / 5 + 32, specifier: "%.1f") Fahrenheit")
            }
            //                //MARK: - Form
            Text("Form")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .background(CustomColor.white)
                .foregroundColor(CustomColor.cyan)
                .font(.title)
                .padding(.all)
                .onTapGesture {
                    isFormClicked.toggle()
                }
            if self.isFormClicked {
                Form {
                    Text("FormText1")
                    Text("FormText2")
                    Text("FormText3")
                }
            }
            Text("Image Picker")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .background(CustomColor.white)
                .foregroundColor(CustomColor.cyan)
                .font(.title)
                .padding(.all)
                .onTapGesture {
                    isFormClicked.toggle()
                }
            Spacer()
        } //V Stack
        .frame(maxWidth: .infinity)
        .background(.cyan)
        .padding(.all)
        
    }
}

struct SecondVw_Previews: PreviewProvider {
    static var previews: some View {
        SecondVw()
    }
}
