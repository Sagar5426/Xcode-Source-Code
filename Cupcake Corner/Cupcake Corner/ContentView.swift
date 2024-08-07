//
//  ContentView.swift
//  Cupcake Corner
//
//  Created by Sagar Jangra on 27/07/2024.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
    @State private var order = Order()
    
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section {
                    Picker("Select your cake type", selection: $order.type){
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra Sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Delivery details") {
                        AddressView(order: order)
                    }
                }
                .navigationTitle("Cupcake Corner")
                
                
            }
        }
    }
    
    
    
}

#Preview {
    ContentView()
}
