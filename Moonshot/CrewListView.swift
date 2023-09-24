//
//  CrewListView.swift
//  Moonshot
//
//  Created by Muhammad Fahmi on 24/09/23.
//

import SwiftUI

struct CrewListView: View {
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Crew")
                .font(.title.bold())
                .padding(.bottom, 5)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(crew, id: \.role) { crewMember in
                        NavigationLink{
                            AstronautView(astronaut: crewMember.astronaut)
                        } label: {
                            HStack{
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 100, height: 70)
                                    .clipShape(Capsule())
                                    .overlay(
                                        Capsule()
                                            .strokeBorder(.white, lineWidth: 1)
                                    )
                                VStack(alignment: .leading){
                                    Text(crewMember.astronaut.name)
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
