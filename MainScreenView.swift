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
                VStack {
                    Text("Select a poem").bold()
                        .font(.system(size: 52, design: .rounded))
                        .foregroundColor(Color("darkBlue"))
                        .padding(.horizontal, 12)
                        .padding(.horizontal, 48)
                        
                    
                    Text("and start practicing your writing!")
                        .font(.system(size: 24, design: .rounded))
                        .foregroundColor(Color("darkBlue"))
                        .padding(.horizontal, 12)
                        .padding(.horizontal, 48)
                        .padding(.bottom, 48)
                       
                    
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
                        .padding(.horizontal, 24)
                        .padding(.top, 24)
                    }
                    .background(.white)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 72,
                            topTrailingRadius: 72
                        ))
                }
                .padding(.top, 64)
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MainScreenView()
}
