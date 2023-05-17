//
//  ContentView.swift
//  MagicLamp
//
//  Created by André Toti on 10/04/23.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: State Var
    
    @State var ligado: Bool = false
    @State var potencia: Double = 1.0
    
    //MARK: Body
    
    var body: some View {
        VStack {
            
            Text("Lâmpada Mágica")
                .font(.largeTitle)
                .padding()
            Image(systemName: "lightbulb")
                .font(.system(size: 350))
            
            Spacer()
            
        HStack {
                
            Text("Lâmpada: ")
                
            Toggle(ligado ? "Desligar" : "Ligar", isOn: $ligado)
            }
            
            HStack {
                
                Text("Potência: ")
                
                Slider(value: ligado ? $potencia : .constant(0))
                
                Text("\(ligado ? potencia * 100 : 0.0, specifier: "%.0f")%")
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
        ligado ?
            .yellow.opacity(potencia) : .white
        )

    }
    
        
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
