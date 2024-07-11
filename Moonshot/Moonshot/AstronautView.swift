//
//  astronautView.swift
//  Moonshot
//
//  Created by Sagar Jangra on 27/06/2024.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        
        ScrollView {
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
            
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    // Safely unwrap the astronaut dictionary value
    if let aldrin = astronauts["aldrin"] {
        return AstronautView(astronaut: aldrin)
            .preferredColorScheme(.dark)
    } else {
        return Text("Astronaut not found")
    }
}
