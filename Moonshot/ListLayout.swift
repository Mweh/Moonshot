//
//  ListLayout.swift
//  Moonshot
//
//  Created by Muhammad Fahmi on 24/09/23.
//

import SwiftUI

struct ListLayout: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView{
            ForEach(missions) { mission in
                NavigationLink{
                    MissionView(mission: mission, astronaut: astronauts)
                } label: {
                    HStack{
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .padding(10)
                            .background(.darkBackground)
                        VStack(){
                            Text(mission.displayName)
                                .font(.title2)
                                .foregroundColor(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.title3)
                                .foregroundColor(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1.5)
                            .stroke(.lightBackground)
                    )
                    .background(.lightBackground)
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

struct ListLayout_Previews: PreviewProvider {
    static var previews: some View {
        ListLayout()
            .preferredColorScheme(.dark)
    }
}
