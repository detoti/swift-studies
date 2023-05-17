//
//  ContentView.swift
//  PigNose
//
//  Created by André Toti on 06/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var ligado = false
    var body: some View {
        Toggle(isOn: $ligado) {
            Label("Tomada", systemImage: "triangle")
        }
        .padding()
        .background( ligado ? .green : .red)
    }
       
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
