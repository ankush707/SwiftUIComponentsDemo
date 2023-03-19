//
//  DetailListingView.swift
//  demo
//
//  Created by Ankush on 06/02/23.
//

import SwiftUI

class UserInput: ObservableObject {
    @Published var deletedIndex: Int = 0
}

struct DetailListingView: View {
    @ObservedObject var input = UserInput()
    
    @State var contacts : [String] = ["Ankush", "Karan", "Nishtha", "Ankita"]
    @State var customColor: Color = .cyan
    
    @State var deleteState: Bool = false
    @State var addState: Bool = false
    @State var alertInput: String = ""
    
    @State var showAlert = false
    
    var body: some View {
        
        
        ZStack {
            
            VStack {
                Section {
                    Text("Items")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    ProgressView(value: 0.1)
                }
                HStack {
                    
                    Text("Employees")
                        .font(.title3)
                        .fontWeight(.regular).padding(.leading)
                    Spacer()
                    Button {
                        
                        
                    } label: {
                        EditButton()
                    }
                    Spacer()
                    
                    Button {
                        addState.toggle()
                        
                    } label: {
                        Text("Add")
                    }.alert("Login", isPresented: $addState, actions: {
                        TextField("Username", text: $alertInput)
                        
                        Button("Add", action: {addItem(str: alertInput)})
                        Button("Cancel", role: .cancel, action: {})
                    }, message: {
                        Text("Please enter your username.")
                    })
                    Spacer()
                    
                    Button {
                        deleteState.toggle()
                        
                    } label: {
                        Image("trash").resizable().frame(width: 32, height: 32)
                    }
                    
                }//MARK: - HStack
                .padding()
                
                
                List {
                    
                    ForEach(Array($contacts.enumerated()), id: \.offset) { index, element in
                        
                        CustomListVw(deletedIndex: self.$input.deletedIndex, title: element, color: $customColor, deleteToggle: $deleteState, indexSet: IndexSet(integer: index)
                               
                        )
                        
                    }
                    .onDelete(perform: deleteItem)
                }//MARK: - List
                
            }//MARK: - VSTACK
        }//MARK: - ZSTACK
        
        
    } //MARK: - Main body
    
    private func deleteItem(index: IndexSet) {
        contacts.remove(atOffsets: index)
    }
    
    private func addItem(str: String) {
        contacts.append(str)
    }
}

struct DetailListingView_Previews: PreviewProvider {
    static var previews: some View {
        DetailListingView()
    }
}
