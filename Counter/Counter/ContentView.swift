//
//  ContentView.swift
//  Counter
//
//  Created by André Toti on 10/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var valor = 1
    
    var body: some View {
        Stepper("Contador \(valor)", value: $valor, in: 0...10)
            .padding()
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
