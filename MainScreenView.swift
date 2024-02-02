//
//  MainScreenView.swift
//  WWDC2024
//
//  Created by Julia Elice Jurczyszyn on 31/01/24.
//

import SwiftUI

struct MainScreenView: View {

    var body: some View {
        VStack {
            Text("dgdsydgysetds")
            
            ScrollView {
                LazyVGrid (columns: [GridItem(),GridItem()]) {
                    ForEach(PoemOption.listOfPoems) { poem in
                        NavigationLink {
                            
                        } label: {
                            PoemOptionsView(poem: poem)
                        }
                    }
                }
            }
        }
        
        
    }
}

#Preview {
    MainScreenView()
}
