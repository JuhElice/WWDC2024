//
//  MainScreenView.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 31/01/24.
//

import SwiftUI

struct MainScreenView: View {

    var body: some View {
        NavigationStack {
            ZStack {
                Color("lightBlue")
                
                VStack (alignment: .leading) {
                    Text("Select the poem to practice writing").bold()
                        .font(.system(size: 48, design: .rounded))
                        .foregroundColor(Color("black"))
                        .padding(48)
                    
                    ScrollView {
                        LazyVGrid (columns: [GridItem(),GridItem()]) {
                            ForEach(PoemOption.listOfPoems) { poem in
                                NavigationLink {
                                    CanvaScreenView(poem: poem)
                                } label: {
                                    PoemOptionsView(poem: poem)
                                }
                            }
                        }
                        .padding(.horizontal, 40)
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    MainScreenView()
}
