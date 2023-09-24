//
//  ContentView.swift
//  Moonshot
//
//  Created by Muhammad Fahmi on 17/09/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var showingGrid = true
    
    var body: some View{
        NavigationView{
            Group{
                if showingGrid{
                    GridLayout()
                } else {
                    ListLayout()
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .toolbar{
                ToolbarItem{
                    withAnimation(.default){
                        Button(showingGrid ? "List" : "Grid"){
                            showingGrid.toggle()
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
