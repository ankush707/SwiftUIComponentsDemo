//
//  LazyStacksGridsVw.swift
//  demo
//
//  Created by Ankush on 07/02/23.
//

import SwiftUI

struct ColorsConstants {
    static let hStackColor = Color.cyan
}


struct LazyStacksGridsVw: View {
    
    @State private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    
    private var colors: [Color] = [.yellow, .purple, .green]
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                
                Section {
                    Text("Different Designs")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    ProgressView(value: 0.3)
                }
                
                
                HStack {
                    Text("Lazy H stack")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.all)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    Spacer()
                }.background(ColorsConstants.hStackColor)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        
                        ForEach($symbols, id: \.self) { data in
                            NavigationLink(destination: DetailVw(imageName: data)) {
                                CollectionViewCell(image: data, name: data, bgColor: .gray, imgBgColor: ColorsConstants.hStackColor, textColor: .white)
                            }
                            
                        }
                    }
                    
                }
                .frame(height: 120)
                
                
                HStack {
                    Text("Lazy V Grid")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.all)
                        .foregroundColor(.white)
                    Spacer()
                }.background(.yellow)
                
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: gridItemLayout) {
                        ForEach($symbols, id: \.self) { data in
                            NavigationLink(destination: DetailVw(imageName: data)) {
                                CollectionViewCell(image: data, name: data, bgColor: .gray, imgBgColor: .yellow, textColor: .white)
                            }
                        }
                    }
                }
                
                HStack {
                    Text("Lazy V Stack")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.all)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    Spacer()
                }.background(.purple)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        ForEach($symbols, id: \.self) { data in
                            NavigationLink(destination: DetailVw(imageName: data)) {
                                TableCell(image: data, name: data, bgColor: .gray, imgBgColor: .purple, textColor: .white)
                            }
                        }
                    }
                }
                
                
                HStack {
                    Text("Lazy H Grid")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.all)
                        .foregroundColor(.white)
                    Spacer()
                }.background(.pink)
                
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: gridItemLayout) {
                        ForEach($symbols, id: \.self) { data in
                            NavigationLink(destination: DetailVw(imageName: data)) {
                                CollectionViewCell(image: data, name: data, bgColor: .gray, imgBgColor: .pink, textColor: .white)
                            }
                        }
                    }
                }.frame(height: 500)
                
                
            }
        }
        
    }
}

struct LazyStacksGridsVw_Previews: PreviewProvider {
    static var previews: some View {
        LazyStacksGridsVw()
    }
}
