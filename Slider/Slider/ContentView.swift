//
//  ContentView.swift
//  Slider
//
//  Created by André Toti on 10/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var valor: Double = 0
    @State var sliderEditando = false
    
    var body: some View {
        Slider(value: $valor, in: 0...10, step: 0.5) {
            Text("Slider")
        } minimumValueLabel: {
            Text("0")
        } maximumValueLabel: {
            Text("\(valor)")
                .foregroundColor(sliderEditando ? .red : .black)
        } onEditingChanged: { editing in
            sliderEditando = editing
        }
        .padding()
            
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
