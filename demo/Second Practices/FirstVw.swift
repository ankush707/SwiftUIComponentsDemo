//
//  FirstVw.swift
//  demo
//
//  Created by Ankush on 07/02/23.
//

import SwiftUI

struct CustomColor {
    static let purple = Color.purple
    static let cyan = Color.cyan
    static let white = Color.white
}


struct FirstVw: View {
    
    var obj1: Int = 223
    var obj2: Int = 34
    
    let buttonTitlesArr = ["Action Sheet", "Alert", "Popover", "Color Picker", "Picker", "Google Static link", "Toggle", "Date Picker", "Stepper"]
    
    let colorsArr = ["Green", "Yellow", "Red", "Green", "Blue", "Tartan"]
    
    @State var pickedColor: String = "Picker"
    @State var isPickerClicked: Bool = false
    
    @State var isSheetClicked: Bool = false
    @State var isAlertClicked: Bool = false
    @State var isColorPickerClicked: Bool = false
    @State var isDatePickerClicked: Bool = false
    @State var isPopoverClicked: Bool = false
    @State var isToggleClicked: Bool = false
    @State var isStepperClicked: Bool = false
    
    @State var btnClicked: Bool = false
    @State var moveToNextVw: Bool = false
    
    @State private var buttonBgColor = Color.green
    @State private var valueCustom = 34
    
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Image("bg")
                    .resizable()
                    .ignoresSafeArea()
                
                
                VStack {
                    
                    //MARK: - Action Sheet
                    HStack {
                        CustomTextView(title: buttonTitlesArr[0], isClicked: $isSheetClicked, dynamicTitle: .constant(""))
                            .actionSheet(isPresented: $isSheetClicked) {
                                ActionSheet(title:Text("Hello Sheet"))
                            }
                        //MARK: - Action Alert
                        CustomTextView(title: buttonTitlesArr[1], isClicked: $isAlertClicked, dynamicTitle: .constant(""))
                            .alert(isPresented: $isAlertClicked) {
                                
                                Alert(title: Text("Hello Alert"))
                                
                            }
                        //MARK: - Pop over
                        CustomTextView(title: buttonTitlesArr[2], isClicked: $isPopoverClicked, dynamicTitle: .constant(""))
                            .popover(isPresented: $isPopoverClicked) {
                                VStack {
                                    Text("Sharma1")
                                    Text("Sharma2")
                                    Text("Sharma3")
                                }
                            }
                    }
                    
                    
                    
                    //MARK: - Color Picker
                    HStack {
                        CustomTextView(title: buttonTitlesArr[3], isClicked: $isColorPickerClicked, dynamicTitle: .constant(""))
                        
                        if isColorPickerClicked {
                            
                            ColorPicker("Title", selection: $buttonBgColor)
                                .padding(.all)
                        }
                        
                        //MARK: - Picker
                        
                        CustomTextView(title: pickedColor, isClicked: $isPickerClicked, dynamicTitle: $pickedColor)
                        
                        if self.isPickerClicked {
                            CustomPickerView(selectedColor: $pickedColor, colors: colorsArr)
                            
                        }
                        
                    }
                    
                    
                    
                    //MARK: - PopOver and Toggle
                    
                    HStack {
                        
                        Link(destination: URL.init(string: "www.google.com")!) {
                            Text("Google Static Link")
                        }.padding(.all)
                            .background(CustomColor.purple)
                            .foregroundColor(CustomColor.white)
                            .font(.title3)
                        
                        CustomTextView(title: buttonTitlesArr[6], isClicked: $isToggleClicked, dynamicTitle: .constant(""))
                        
                        Toggle(isOn: $isToggleClicked) {
                            
                        }.frame(width: 30.0)
                    }
                    
                    //MARK: - Date Picker
                    CustomTextView(title: buttonTitlesArr[7], isClicked: $isDatePickerClicked, dynamicTitle: .constant(""))
                    if self.isDatePickerClicked {
                        DatePicker(selection: .constant(Date()), label: { Text("Date") })
                            .padding(.all)
                            .font(.title)
                    }
                    
                    //MARK: - Stepper
                    CustomTextView(title: buttonTitlesArr[8], isClicked: $isStepperClicked, dynamicTitle: .constant(""))
                    if self.isStepperClicked {
                        Stepper(value: $valueCustom, in: 0...10) {
                            Text("Stepper")
                                .font(.headline)
                        }
                        .padding(.all)
                    }
                    
                    NavigationLink(destination: SecondVw(), isActive: $moveToNextVw) {
                        Text("Next Page")
                            .padding(.all)
                            .background(buttonBgColor)
                            .foregroundColor(CustomColor.white)
                            .font(.title)
                            .cornerRadius(20.0)
                    }
                   
                }// V Stack
                .padding(.all)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(40)
            }// Z Stack
        }
        
    }// Body
} // FirstVw

extension FirstVw {
    func sum(_ val1: Int, _ val2: Int) -> Int {
        return val1 + val2
    }
}


struct FirstVw_Previews: PreviewProvider {
    static var previews: some View {
        FirstVw()
    }
}
