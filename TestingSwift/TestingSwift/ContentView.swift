//
//  ContentView.swift
//  TestingSwift
//
//  Created by André Toti on 26/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var rotationValue = -0.1
        
        var body: some View {
            VStack {
                ZStack {
                            Text("Volume \(String(format: "%.0f", rotationValue))")
                                .font(.system(size: 50 * CGFloat(rotationValue / 100.0)))
                                .animation(.easeInOut(duration: 0.1))
                            }
                            .rotationEffect(.radians(.pi * rotationValue))
                        Slider(value: $rotationValue, in: 0.0...100.0)
                    }
            }
        }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
