//
//  OverView_Of_JSON.swift
//  Moonshot
//
//  Created by Sagar Jangra on 23/06/2024.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct OverView_Of_JSON: View {
    var body: some View {
        Button("Decode JSON"){
            let input = """
            {
            "name" : "Sagar",
            
            "address" : {
                "street":"3",
                "city" : "Gurgaon"
                }
            }
            """
            
            let data = Data(input.utf8)
            // converts string to data object as decoder only works with data objects
            let decoder = JSONDecoder()
            
            if let user = try? decoder.decode(User.self, from: data){
                print(user.address.city)
            }
            
            
        }
    }
}

#Preview {
    OverView_Of_JSON()
}
