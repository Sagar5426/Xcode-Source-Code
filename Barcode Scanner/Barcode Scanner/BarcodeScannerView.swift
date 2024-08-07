//
//  ContentView.swift
//  Barcode Scanner
//
//  Created by Sagar Jangra on 21/05/2024.
//

import SwiftUI

struct BarcodeScannerView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Rectangle()
                    .frame(maxWidth : .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text("Not Yet Scanned")
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(.green)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
        }
        
    }
}

#Preview {
    BarcodeScannerView()
}
