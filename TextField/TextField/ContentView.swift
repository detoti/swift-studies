//
//  ContentView.swift
//  TextField
//
//  Created by André Toti on 10/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var nome: String = ""
    @State var telefone: String = ""
    
    var body: some View {
        VStack {
            TextField("Nome Completo", text: $nome)
            TextField("Telefone", text: $telefone)
                .keyboardType(.numberPad)
                

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
